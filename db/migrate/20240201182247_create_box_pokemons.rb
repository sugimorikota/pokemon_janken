class CreateBoxPokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :box_pokemons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.boolean :main_flg, null: false, default: false

      t.timestamps
    end
    add_index :box_pokemons, [:user_id, :pokemon_id], unique: true
  end
end
