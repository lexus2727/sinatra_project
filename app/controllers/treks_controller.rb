class TreksController < ApplicationController
    get "/treks" do
       if logged_in?
        @treks = current_user.treks
        erb :"/treks/index"
       else
        erb :"/users/login"
       end
    end
end