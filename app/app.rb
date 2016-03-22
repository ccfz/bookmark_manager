ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/link.rb'

class Bookmark < Sinatra::Base
  get '/' do
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    erb(:link)
  end

  get '/link/new' do
    erb(:add_link)
  end

  post '/links' do
    Link.create(title:params[:name], url: params[:url])
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
