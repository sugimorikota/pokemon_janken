namespace :update_match_limit do
  desc "対戦制限回数をリセットする"
  # タスク名(purge)を指定
  task reset_match_limit: :environment do
    UserPokemonMatch.update_match_limit
  end
end
