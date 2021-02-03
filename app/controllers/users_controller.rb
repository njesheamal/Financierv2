class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    # This isn't necessary right? Because there is only one user?
    def index
    end
    
    def show
        find_user
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "User successfully created"
            redirect_to '/'
        else
            flash[:error] = "Something went wrong"
            render 'signup'
        end
    end

    def edit
        find_user
    end

    def update
        if @user.update(user_params)
          flash[:success] = "User was successfully updated"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @user.destroy
            flash[:success] = 'User was successfully deleted.'
            redirect_to user_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to user_path
        end
    end
    
    private

    def find_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
