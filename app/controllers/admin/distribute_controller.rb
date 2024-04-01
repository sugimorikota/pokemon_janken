class Admin::DistributeController < Admin::BaseController

  def index

  end

  def new
    @users = User.all
    @pokemons = Pokemon.all
  end

  def create
    @box_pokemon = BoxPokemon.new(box_pokemon_params)

    if @box_pokemon.save
      redirect_to admin_root_path, success: "ポケモンを配布しました"
    else
      flash.now[:danger] = "ポケモンの配布に失敗しました"
      render :new
    end
  end

  private

  def box_pokemon_params
    params.permit(:user_id, :pokemon_id)
  end
end
