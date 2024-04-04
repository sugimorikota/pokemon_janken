class CreateUserProofs < ActiveRecord::Migration[7.1]
  def change
    create_table :user_proofs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :proof, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_proofs, [:user_id, :proof_id], unique: true
  end
end
