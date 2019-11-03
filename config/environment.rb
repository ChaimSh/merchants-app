# key to Ruby's ENV hash and defines deployment environment
# if it doesn’t already have a value, its value will be set equal to "development"

ENV['SINATRA_ENV'] ||= "development"
#finds gemfile and requires all gems available to Ruby
#by adding them load path
require 'bundler/setup'
#requires all gems (:default) and deployment hash to be used 
#activerecord gem
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
