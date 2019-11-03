# key to Ruby's ENV hash and defines deployment environment
# if it doesn’t already have a value, its value will be set equal to "development"
ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'

# loads Rake tasks from the sinatra-activerecord gem
require 'sinatra/activerecord/rake'
