class BoxPokemon < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :main_flg, inclusion: { in: [true, false] }
end
