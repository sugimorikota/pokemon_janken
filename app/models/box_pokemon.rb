class BoxPokemon < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates main_flg, inclusion: [true, false]
end
