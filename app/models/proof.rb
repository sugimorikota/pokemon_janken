class Proof < ApplicationRecord
  mount_uploader :proof_image, ProofImageUploader

  has_many :users, through: :user_proofs
  has_many :user_proofs
end
