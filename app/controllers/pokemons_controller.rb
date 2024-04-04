class PokemonsController < ApplicationController
  skip_before_action :check_current_user_box_pokemons, only: %i[index search]
  before_action :box_pokemon_present, only: %i[index]

  def index
    @q = Pokemon.where(id: 1..149).ransack(params[:q])
    @pokemons = @q.result.page(params[:page]).per(25)
    #end
  end



  def search
    @pokemons = Pokemon.where("name LIKE :query OR hiragana_name LIKE :query", query: "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:no, :name, :hiragana_name, :pokemon_image, :pokemon_back_image)
  end

  def box_pokemon_present
    if current_user && BoxPokemon.where(user_id: current_user.id).present?
      redirect_to root_path
    end
  end
end
  