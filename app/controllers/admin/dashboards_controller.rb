class Admin::DashboardsController < Admin::BaseController
  def index
  end

  def reset_match_limit
    UserPokemonMatch.update_match_limit
    redirect_to admin_root_path, success: "対戦制限回数をリセットしました"
  end

  def reset_match_score
    UserPokemonMatch.update_match_score
    redirect_to admin_root_path, success: "レートをリセットしました"
  end

  def reset_boxpokemon
    BoxPokemon.destroy_boxpokemon
    redirect_to admin_root_path, success: "ボックスをリセットしました"
  end
end
