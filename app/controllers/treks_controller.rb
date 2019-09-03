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
        
        user = current_user
          @trek = Trek.create(:name => params[:name], :location => params[:location], :user_id => params[:user_id])
          redirect to "/treks/#{@trek.id}"
        
      end

      get '/treks/:id' do
       @trek = Trek.find_by_id(params[:id])
       @treks = current_user.treks
            
            erb :"/treks/show"
            
        end

    get '/treks/:id/edit' do
    @trek = Trek.find_by_id(params[:id])
    
     erb :"/treks/edit"
    end

    patch '/treks/:id' do
      @trek = Trek.find(params[:id])
      @trek.name = params[:name]
      @trek.location = params[:location]
      redirect to "/treks/#{@trek.id}"
    end
  
  
  end
    
    
    
      #   get '/treks/:id/edit' do
    #     if is_logged_in?
    #         @treks = current_user.treks
    #         if @treks = session[:user_id]
         
    #         erb :'/treks/edit'
    #       else
    #         erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
    #     end
    #   end
    # end
    
    
    # patch '/treks/:id' do
    #     if params[:name].empty? || params[:location].empty?
    #       @trek = Trek.find(params[:id])
    #       erb :'/treks/edit', locals: {message: "There seems to be an error. Please try again."}
    #     else
    #       @trek = Trek.find(params[:id])
    #       @trek.update(name: params[:name], location: params[:location])
    #       redirect "/trips/#{@trek.id}"
    #     end
    #   end 

