namespace :update_match_limit do
  desc "紐付けされなかったアップロード(active_storage_blobs)を削除する"
  # タスク名(purge)を指定
  task reset_match_limit: :environment do
    UserPokemonMatch.update_match_limit
  end
end
