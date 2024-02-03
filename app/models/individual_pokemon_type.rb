class IndividualPokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :pokemon_type
end
