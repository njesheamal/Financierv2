class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    #this line makes @current_user available in views
    helper_method :current_user

    #this forces users to log in before viewing certain pages
    def authorize
        redirect_to '/login' unless current_user
    end
end
