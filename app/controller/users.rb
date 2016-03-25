class Bookmark < Sinatra::Base
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
end