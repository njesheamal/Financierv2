class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by_email(params[:email])
        #if the user exists AND the password is correct:
        if @user && user.authenticate(params[:password])
            #save the user id in the browsers cookies
            #this keeps the user logged in as they navigate the app
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:error] = "Something went wrong"
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
    
end
