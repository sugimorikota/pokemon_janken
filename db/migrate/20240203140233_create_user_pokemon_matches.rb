class CreateUserPokemonMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :user_pokemon_matches do |t|
      t.integer :match_score, null: false, default: 500
      t.integer :match_limit, null: false, default: 10

      t.timestamps
    end
  end
end
