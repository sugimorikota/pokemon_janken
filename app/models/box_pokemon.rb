class BoxPokemon < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :pokemon, dependent: :destroy

  validates :main_flg, inclusion: { in: [true, false] }
end
