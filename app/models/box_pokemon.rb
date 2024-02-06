class BoxPokemon < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :pokemon, dependent: :destroy

  validates :main_flg, inclusion: { in: [true, false] }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "user_id", "pokemon_id", "created_at", "updated_at"]  # nameを追加
  end

  def self.ransackable_associations(auth_object = nil)
    ["pokemon", "user"]
  end
end
