require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PokemonJanken
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # デフォルトの言語を日本語に設定
    config.i18n.default_locale = :ja

    # 複数のロケールファイルが読み込まれるようpathを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # タイムゾーンを日本に
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local  # DBのタイムゾーンを変更
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end

=begin sorceryコマンド実行用
  class ActiveRecord::Base
    singleton_class.attr_accessor :timestamped_migrations
    self.timestamped_migrations = true
  end
=end
end
