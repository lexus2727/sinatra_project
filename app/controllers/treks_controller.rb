class TreksController < ApplicationController
    get "/treks" do
         if is_logged_in?
        
            @treks = current_user.treks
            erb :'/treks/index'
         else
            erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
         end
       end
        
        
    

     get "/treks/all" do
        @treks = Trek.all
        erb :"/treks/all"
    end

     get '/treks/new' do
         if is_logged_in?
           erb :"/treks/new"
       else
         erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
       end
     end

      post '/treks' do
        if params[:name].empty? || params[:location].empty?
          erb :'/treks/new', locals: {message: "There seems to be an error. Please try again."}
        else
        
          @trek = Trek.create(name: params[:name], location: params[:location], user_id: current_user.id)

          redirect to "/treks/#{@trek.id}"
              end
         end

       get '/treks/:id' do
        if is_logged_in? 
        @trek = Trek.find_by_id(params[:id])
       
          erb :"/treks/show"
        else
          erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
        end
       end

    get '/treks/:id/edit' do
      if is_logged_in?
         @trek = Trek.find_by_id(params[:id])
         if @trek.user.id == session[:user_id]
         erb :"/treks/edit"
    else
      erb :'/users/login', locals: {message: "Access denied. Please log-in to view."}
        end
      end
   end

     patch '/treks/:id' do
       @trek = Trek.find_by_id(params[:id])
       @trek.name = params[:name]
      @trek.location = params[:location]
       @trek.save
      redirect to "/treks/#{@trek.id}"
     end
  
   delete '/treks/:id/delete' do
    @trek = Trek.find(params[:id])
     @trek.delete
     redirect to "/treks"
   end
 end

    
    