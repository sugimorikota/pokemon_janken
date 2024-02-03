class CreatePokemonTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_types do |t|
      t.string :type_image, null: false

      t.timestamps
    end
    add_index :pokemon_types, :type_image, unique: true
  end
end
