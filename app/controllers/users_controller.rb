class UsersController < ApplicationController

   
          get "/signup" do
            if is_logged_in?
               redirect "/treks"
            else
		          erb :"/users/signup"
            end
          end
    


        get '/users/:id' do
          if is_logged_in?
            @user = User.find_by_id(params[:id])
            erb :"/users/show"
          end
        end



        
        post "/signup" do
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])

           if @user.save
             session[:user_id] = @user.id
             redirect "/users/#{@user.id}"
           else
             erb :"/users/signup"
           end
        end
       
    
      get '/login' do
          if !is_logged_in?
            erb :'/users/login'
          else
            redirect "/treks"
          end
        end
    
       
      post "/login" do
        user = User.find_by(username: params[:username])
         if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/treks"
         else
           erb :"/users/login"
          end
        end
        
       
        get "/logout" do
          session.clear
          redirect  "/login"
       end
   end