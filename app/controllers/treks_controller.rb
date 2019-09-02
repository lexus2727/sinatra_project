class TreksController < ApplicationController
    get "/treks" do
        if is_logged_in?
        
            @treks = current_user.treks
            erb :'/treks/home'
         end
        
        
    end

    get "/treks/all" do
       @treks = Trek.all
        erb :"/treks/all"
    end

    get '/treks/new' do
        if is_logged_in?

        
          erb :"/treks/new"
        
          
        end
      end


      post '/treks' do
        if params[:name].empty? || params[:location].empty?
          erb :'/treks/new', locals: {message: "There seems to be an error. Please try again."}
        else
          user = current_user
          @trek = Trek.create(name: params[:name], location: params[:location], user_id: user.id)
          redirect "/treks/#{@trek.id}"
        end
      end

      get '/treks/:id' do
        if is_logged_in?
            
            
            @treks = current_user.treks
            
            erb :"/treks/show"
            
        else
          erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
        end
      end

      get '/treks/:id/edit' do
        if is_logged_in?
          @trek = Trek.find(params[:id])
          if @trek.user_id == session[:user_id]
            erb :'/treks/edit'
          else
            erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
        end
      end
    end
    

end