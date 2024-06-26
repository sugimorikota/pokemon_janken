source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# アプリケーション日本語化
gem 'rails-i18n'

# ログイン機能
gem 'sorcery'

gem 'bootstrap', '~> 5.0.2'
gem 'jquery-rails'

gem "sassc-rails"

gem 'carrierwave'

gem 'ransack'

gem 'draper'

gem 'config'

gem 'whenever', require: false

gem 'kaminari'

gem 'searchkick'
gem 'elasticsearch'
gem 'faker'

gem "font-awesome-sass"
gem 'font-awesome-rails'


gem 'pg'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # デバッグ用
  gem 'pry-rails'           # コンソールをirbからpryに置き換える。
  gem 'pry-byebug'          # ソースコードにブレークポイントを埋め込んで、所定のポイントでpryを起動

  # rspec
  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # デバッグ用
  gem 'annotate'            # 現状のスキーマの注釈をコメントとしてファイルの上部や下部に追記してくれる。
  gem 'better_errors'       # エラー画面をデバッグしやすい形に整形してくれる
  gem 'binding_of_caller'   # better-errorsのエラー画面でirbができる
  gem 'bullet'              # 「N+1 問題」を検出してくれる
  gem 'hirb'                # コンソールのModelの出力結果を表形式で分かりやすく表示する
  gem 'hirb-unicode'        # 日本語などマルチバイト文字の出力時の出力結果のずれに対応
  gem 'letter_opener_web'   # 送信したメールを確認できる
  #gem 'quiet_assets'        # developmentログへのアセットパイプライン関連のログ出力を抑制

end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
