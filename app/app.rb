require 'pry'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class Bookmark < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'


  get '/' do
    'Welcome to Bookmark'
  end

  get '/links' do
    @links = Link.all
    @user = User.first
    
    erb :'links/index'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
        
    params[:tag].split.each do |tag_name|
    link.tag << Tag.first_or_create(name: tag_name)
    end
    
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end

  get '/links/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.link : []
    erb(:'links/index')
  end


  get '/users/signup' do
    @user = User.new
    erb(:'users/signup')
  end

  post '/users/signup' do
    @user = User.new(name: params[:name],
      email: params[:email], 
      password: params[:password],
      password_confirmation: params[:password_confirmation]
     )

    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/signup'
    end
  end

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
     end
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
