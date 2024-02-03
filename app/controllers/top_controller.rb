class TopController < ApplicationController
  def index
    @main_pokemon = BoxPokemon.find_by(user_id: current_user.id, main_flg: true)
  end
end
