class CreateIndividualPokemonTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :individual_pokemon_types do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :pokemon_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
