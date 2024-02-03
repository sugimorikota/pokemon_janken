class PokemonType < ApplicationRecord

  has_many :individual_pokemon_types
  has_many :pokemons, through: :individual_pokemon_types

end
