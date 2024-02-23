class PokemonsController < ApplicationController
  skip_before_action :check_current_user_box_pokemons, only: %i[index search]
  #before_action :box_pokemon_present, only: %i[index]

  def index
=begin
    response = Faraday.get 'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0'
    pokemon_list = JSON.parse(response.body)['results']
    
    # 各ポケモンの詳細情報を取得してDBに保存
    pokemon_list.each do |pokemon|
      response = Faraday.get(pokemon['url'])
      pokemon_data = JSON.parse(response.body)
      
      no = pokemon_data['id']
      name = pokemon_data['name']
      pokemon_image = pokemon_data['sprites']['front_default']
      pokemon_back_image = pokemon_data['sprites']['back_default']
      
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
                    name: name,
                    pokemon_image: pokemon_image,
                    pokemon_back_image: pokemon_back_image
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
=end
    @q = Pokemon.ransack(params[:q])
    @pokemons = @q.result.page(params[:page]).per(25)
    #end
  end



  def search
    @pokemons = Pokemon.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:no, :name, :pokemon_image, :pokemon_back_image)
  end

  def box_pokemon_present
    if current_user && BoxPokemon.where(user_id: current_user.id).present?
      redirect_to root_path
    end
  end
end
  