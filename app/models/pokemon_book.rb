class PokemonBook < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
end
