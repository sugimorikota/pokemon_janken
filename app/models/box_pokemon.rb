class BoxPokemon < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :main_flg, inclusion: { in: [true, false] }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "user_id", "pokemon_id", "created_at", "updated_at"]  # nameを追加
  end

  def self.ransackable_associations(auth_object = nil)
    ["pokemon", "user"]
  end

  def self.destroy_boxpokemon
    BoxPokemon.includes(:user, :pokemon).destroy_all

    users = User.all
    notification_body = "ボックスがリセットされました。"
    users.each do |user|
      user.notifications.create(body: notification_body)
    end
  end
end
