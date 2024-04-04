class UserProof < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :proof, dependent: :destroy
end
