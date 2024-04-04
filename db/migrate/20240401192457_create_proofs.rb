class CreateProofs < ActiveRecord::Migration[7.1]
  def change
    create_table :proofs do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :proof_image, null: false
      t.timestamps
    end
    add_index :proofs, :name, unique: true
  end
end
