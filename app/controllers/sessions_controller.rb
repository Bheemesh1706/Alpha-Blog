class SessionsController < ApplicationController

    def new
    end

    def create 
        
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] =  user.id
            flash[:notice] = "Logged in Sucessfully"
            redirect_to user

        else
            flash.now[:alert] = "There Was Something Worng With Your Crendentials" #The now fn display as it happes so that it doesn't persist  till the next http request
            render 'new'
        end

    end
 
    def destroy
        session[:user_id]= nil
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end

end