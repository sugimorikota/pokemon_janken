class BoxPokemonsController < ApplicationController
  skip_before_action :check_current_user_box_pokemons, only: %i[select]

  def select
    mainpokemon = BoxPokemon.find_by(user_id: current_user.id, main_flg: true)
    if mainpokemon.present?
      mainpokemon.update(main_flg: false)
    end
    pokemon_id = params[:pokemon_id]
    @select_pokemon = BoxPokemon.new(user_id: current_user.id, pokemon_id: pokemon_id, main_flg: true)
    if @select_pokemon.save
      redirect_to root_path
      flash[:notice] = 'ユーザーの作成に成功しました'
    else
      flash.now[:alert] = 'ユーザーの作成に失敗しました'
      render :pokemons_path
    end
  end
end
