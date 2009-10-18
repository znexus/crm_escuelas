# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
#ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION
# Bootstrap the Rails environment, frameworks, and default configuration
#ENV['GEM_PATH'] = '/home5/casadeli/ruby/gems:/home5/casadeli/.gem:/usr/lib/ruby/gems/1.8'


require File.join(File.dirname(__FILE__), 'boot')

#require File.join(File.dirname(__FILE__), '../vendor/plugins/engines/boot')


# require "inline_attachment"


Rails::Initializer.run do |config|
  
  config.gem 'spreadsheet'
  config.gem 'JasonKing-inline_attachment', :lib => 'inline_attachment'
  config.gem 'htmlentities'
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use (only works if using vendor/rails).
  # To use Rails without a database, you must remove the Active Record framework
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_crm_session',
    :secret      => '53a6fb57157efa6afc34473d0ab710aca7fff7386a301018c368fe85b57606706fa1196022504f2d6413e94d38e6d6d72be0938e39712f84d44b6010dd32512e'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  config.time_zone = 'Lima'
  config.i18n.default_locale = 'es-PE'
end


#ENV['GEM_PATH'] = "/home5/casadeli/ruby/gems:/usr/lib/ruby/gems/1.8"
#$:.push("/home5/casadeli/ruby/gems")


ActionMailer::Base.smtp_settings = {
  :address  => "localhost",
  :port  => 25, 
  :domain  => "crm.znexus.net",
#  :user_name  => "ccastillo@znexus.net",
#  :password  => "dificil11",
#  :authentication  => :plain
  } 
HOST = "escuelasunidas.cristiancastillo.com"

