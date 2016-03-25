class Bookmark < Sinatra::Base
  get '/' do
    'Welcome to Bookmark'
  end

get '/links' do
    @links = Link.all
    @user = User.all
    
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
end