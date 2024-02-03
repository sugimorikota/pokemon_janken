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