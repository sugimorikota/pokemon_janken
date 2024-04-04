class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  authenticates_with_sorcery!

  has_one :user_pokemon_match

  has_many :box_pokemons
  has_many :pokemons, through: :box_pokemons
  has_many :notifications
  has_many :proofs, through: :user_proofs
  has_many :user_proofs

  enum role: { general: 0, admin: 1 }

  validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true
end
