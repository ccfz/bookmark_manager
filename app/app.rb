ENV['RACK_ENV'] ||= 'development'
require 'pry'
require 'sinatra/flash'
require 'sinatra/partial'
require 'sinatra/base'

require_relative 'models/data_mapper_setup'

require_relative 'server'
require_relative 'controller/links'
require_relative 'controller/tags'
require_relative 'controller/sessions'
require_relative 'controller/users'
