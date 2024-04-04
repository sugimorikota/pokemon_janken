class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :check_current_user_box_pokemons
  before_action :session_present

  add_flash_types :success, :info, :warning, :danger

  private
  
  def not_authenticated
    flash[:danger] = t('defaults.message.require_login')
    redirect_to login_path
  end

  def check_current_user_box_pokemons
    if current_user && BoxPokemon.where(user_id: current_user.id).empty?
      redirect_to pokemons_path
    end
  end

  def session_present
    if session[:match_pokemon_id].present?
      flash[:danger] = t('defaults.message.no_escape')
      redirect_to user_pokemon_matches_battle_path
    end
  end
end
