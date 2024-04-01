
pokemon_images = [
  'normal.png',
  'fighting.png',
  'flying.png',
  'poison.png',
  'ground.png',
  'rock.png',
  'bug.png',
  'ghost.png',
  'steel.png',
  'fire.png',
  'water.png',
  'grass.png',
  'electric.png',
  'psychic.png',
  'ice.png',
  'dragon.png',
  'dark.png',
  'fairy.png'
]

pokemon_images.each do |image|
  PokemonType.create!(type_image: image)
end
response = Faraday.get 'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0'
pokemon_list = JSON.parse(response.body)['results']

# 各ポケモンの詳細情報を取得してDBに保存
pokemon_list.each do |pokemon|
  response = Faraday.get(pokemon['url'])
  pokemon_data = JSON.parse(response.body)
  
  no = pokemon_data['id']
  name = pokemon_data['name']
  hiragana_name = pokemon_data['name']
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
      hiragana_name = result[0]["hiragana_name"]
    end
  end
  
  existing_pokemon = Pokemon.find_by(no: no)
  unless existing_pokemon
    pokemon = Pokemon.create(
                no: no,
                name: name,
                hiragana_name: hiragana_name,
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
end

=begin
Pokemon.create(
                no: 888,
                name: 'ザシアン（けんのおう）',
                pokemon_image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10188.png',
                pokemon_back_image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/10188.png'
              )

IndividualPokemonType.create(
  pokemon_id: 11,
  pokemon_type_id: 18
)

IndividualPokemonType.create(
  pokemon_id: 11,
  pokemon_type_id: 9
)
=end

user = User.create!(email: "sample@example.com",
  password:  "123",
  password_confirmation: "123",
  name:  "ぎー",
  role: 1
)

UserPokemonMatch.create(user_id: user.id)