class Pokemon < ApplicationRecord

  has_many :box_pokemons
  has_many :users, through: :box_pokemons

  has_many :individual_pokemon_types
  has_many :pokemon_types, through: :individual_pokemon_types

  validates :no, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["no", "name", "created_at", "updated_at", "pokemon_image"]
  end
end
