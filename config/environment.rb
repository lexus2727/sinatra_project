ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])




require './app/controllers/application_controller'
require './app/controllers/users_controller'
require './app/controllers/treks_controller'
require_all 'app'
