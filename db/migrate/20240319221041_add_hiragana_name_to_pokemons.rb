class AddHiraganaNameToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :hiragana_name, :string
  end
end
