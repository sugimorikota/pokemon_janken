class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.integer :no, null: false
      t.string :name, null: false

      t.timestamps                null: false
    end
    add_index :pokemons, :no
    add_index :pokemons, :name
  end
end
