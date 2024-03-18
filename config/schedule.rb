# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# Rails.rootを使用
require File.expand_path(File.dirname(__FILE__) + "/environment")

# cronを実行する環境変数(RAILS_ENVが指定されていないときはdevelopmentを使用)
rails_env = ENV['RAILS_ENV'] || :development

# cronの実行環境を指定(上記で作成した変数を指定)
set :environment, rails_env

# cronのログファイルの出力先指定
set :output, "#{Rails.root}/log/cron.log"

# パスを通すコマンド
job_type :rake, "source /Users/sugimorikouta/.zshrc; export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

#every 1.day, at: '9:00 am' do
every 1.minutes do
  rake "update_match_limit:reset_match_limit"
end
