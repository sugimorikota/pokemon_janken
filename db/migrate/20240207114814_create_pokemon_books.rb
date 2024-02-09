class CreatePokemonBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.boolean :get_flg, default: false

      t.timestamps
    end
  end
end
