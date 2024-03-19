# Rails.rootを使用
require File.expand_path(File.dirname(__FILE__) + "/environment")

# cronを実行する環境変数(RAILS_ENVが指定されていないときはdevelopmentを使用)
rails_env = ENV['RAILS_ENV'] || :development

# cronの実行環境を指定(上記で作成した変数を指定)
set :environment, rails_env

# .zshrcとrbenvのパスを指定するrakeを定義
job_type :rake, "source $HOME/.zshrc && cd :path && export PATH=\"$HOME/.rbenv/bin:$PATH\" && eval \"$(rbenv init - zsh)\" && RAILS_ENV=:environment bundle exec rake :task :output"

# cronのログファイルの出力先指定
set :output, "#{Rails.root}/log/cron.log"

#every 1.day, at: '9:00 am' do
every 1.minutes do
  rake "update_match_limit:reset_match_limit"
end
