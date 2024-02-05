class PokemonsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  skip_before_action :check_current_user_box_pokemons, only: %i[index]
  def index
    response = Faraday.get 'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0'
    pokemon_list = JSON.parse(response.body)['results']
    
    # 各ポケモンの詳細情報を取得してDBに保存
    pokemon_list.each do |pokemon|
      response = Faraday.get(pokemon['url'])
      pokemon_data = JSON.parse(response.body)
      
      name = pokemon_data['name']
      #image_url = pokemon_data['sprites']['other']['official-artwork']['front_default']
      no = pokemon_data['id']
      #タイプの詳細URLを取得
      type1_url = pokemon_data["types"][0]["type"]["url"]
      #byebug
      type2_url = pokemon_data["types"][1]&.dig("type", "url")
      #byebug
      response_type1 = Faraday.get "#{type1_url}"
      #byebug
      type1_data = JSON.parse(response_type1.body)
      #byebug
      if type2_url
        response_type2 = Faraday.get "#{type2_url}"
        type2_data = JSON.parse(response_type2.body)
      end
      type1 = type1_data["id"]
      type2 = type2_data&.dig("id")
      #byebug
      File.open("#{Rails.public_path}/json/pokemon.json") do |file|
        json = JSON.load(file)
        result = json.select { |x| x["id"].to_s.include?(no.to_s) }
        if result.present?
          name = result[0]["name"]
        end
      end

      existing_pokemon = Pokemon.find_by(no: no)
      unless existing_pokemon
        pokemon = Pokemon.create(
                    no: no,
                    name: name
                  )
        IndividualPokemonType.create(
          pokemon_id: pokemon.id,
          pokemon_type_id: type1
        )
        if type2.present?
          IndividualPokemonType.create(
            pokemon_id: pokemon.id,
            pokemon_type_id: type2
          )
        end
      end
      
      @pokemons = Pokemon.all
    end
  end



  def search
    @search = params[:search]
    if @search.blank?
      @pokemon = nil
      return
    end
    File.open("#{Rails.public_path}/json/pokemon.json") do |file|
      json = JSON.load(file)
      result = json.select { |x| x["name"].include?(@search.to_s) }
      if result.present?
        val = result[0]["id"].to_s.downcase
        raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{val}"
        raw_response.status == 200
        response = JSON.parse(raw_response.body)
        type1_url = response["types"][0]["type"]["url"]
        type2_url = response["types"][1]&.dig("type", "url")
        raw_response_type1 = Faraday.get "#{type1_url}"
        type1_response = JSON.parse(raw_response_type1.body)
        if type2_url
          raw_response_type2 = Faraday.get "#{type2_url}"
          type2_response = JSON.parse(raw_response_type2.body)
        end

        @pokemon = Pokemon.new(
          order: response["id"], 
          name: @search, 
          image_url: response["sprites"]["other"]["official-artwork"]["front_default"], 
          type1: type1_response["names"][0]["name"], 
          type2: type2_response&.dig("names", 0, "name")
        )
      else
        redirect_to search_path
      end
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:no, :name)
  end
end
  