class AddPokemonBackImageToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :pokemon_back_image, :string, null: false
  end
end
