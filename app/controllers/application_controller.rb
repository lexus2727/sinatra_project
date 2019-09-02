require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "socrates"
  end

  get "/" do
		erb :index
  end


  # get '/treks/index' do
  #   erb :"/treks/index"
  # end

  
   helpers do
    def is_logged_in?
      !!session[:user_id]
    end

	 	def current_user
	 		User.find(session[:user_id])
	 	end
	 
  end
end

  



  
  


  


  



