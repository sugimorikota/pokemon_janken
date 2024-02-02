class Pokemon < ApplicationRecord

  has_many :box_pokemons
  has_many :users, through: :box_pokemons

  validates :no, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
end
