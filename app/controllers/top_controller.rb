class TopController < ApplicationController
  skip_before_action :require_login
  def index
    if logged_in?
      @main_pokemon = BoxPokemon.find_by(user_id: current_user.id, main_flg: true)
    end
  end
end
