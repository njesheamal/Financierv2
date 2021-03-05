class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:new, :create]

    def new
    end
    
    def create
        @user = User.find_by_email(params[:email])
        #if the user exists AND the password is correct:
        if @user && user.authenticate(params[:password])
            #save the user id in the browsers cookies
            #this keeps the user logged in as they navigate the app
            session[:user_id] = @user.id
            flash[:notice] = "Success!"
            redirect_to '/'
        else
            flash[:error] = "Something went wrong"
            redirect_to '/login'
        end
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to root_path, :notice => "You logged in successfully!"
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end

    def page_requires_login
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end
