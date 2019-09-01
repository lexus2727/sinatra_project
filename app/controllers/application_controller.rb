require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "socrates"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    if is_logged_in?
      redirect to '/treks'
    erb :signup
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    @treks =  @user.treks
    erb :users_show

  end

  
  


  


  


end
