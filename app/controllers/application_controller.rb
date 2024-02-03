class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :check_current_user_box_pokemons

  private
  
  def not_authenticated
    redirect_to login_path, danger: "ログインしてください"
  end

  def check_current_user_box_pokemons
    if current_user && BoxPokemon.where(user_id: current_user.id).empty?
      redirect_to pokemons_path
    end
  end
end
