class UsersController < ApplicationController

   
    
      get "/signup" do
        if is_logged_in?
            	redirect '/treks'
            else
                erb :"/users/signup"
            end
        end


        get '/users/:id' do
            @user = User.find_by_id(params[:id])
            @treks =  @user.treks
            erb :"/users/show"
          end



        
        post "/signup" do
            @user = User.new(:username => params[:username],:email => [:email], :password => params[:password])
            if @user.save
              session[:user_id] = @user_id
              redirect "/treks"
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
          @user = User.find_by(:username => params[:username])
          
        
             if @user && @user.authenticate(params[:password])
                
               session[:user_id] = @user.id
               redirect "/treks"
             else
               erb :"/users/login"
             end
         end
        
        get "/logout" do
            session.clear
            redirect "/index"
      end
end