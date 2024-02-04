class AddUserIdToUserPokemonMatches < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_pokemon_matches, :user, null: false, foreign_key: true
  end
end
