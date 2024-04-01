class AddPokemonImageToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :pokemon_image, :string
  end
end
