class AddNotNullConstraintToPokemonImageInPokemons < ActiveRecord::Migration[7.1]
  def change
    change_column :pokemons, :pokemon_image, :string, null: false
  end
end
