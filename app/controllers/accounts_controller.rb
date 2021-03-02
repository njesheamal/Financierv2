class AccountsController < ApplicationController
    before_action :find_account, only: [:show, :edit, :update, :destroy]

    def index
        @accounts = Account.where(user_id: current_user)
    end

    def show
    end

    def new
        @account = current_user.accounts.build
    end
    
    def create
        @account = current_user.accounts.build(account_params)
        if @account.save
            redirect_to @account, notice: "You have successfully created an Account!"
        else
            render 'new', notice: "Something went wrong"
        end
    end

    def edit
    end

    def update
        if @account.update(account_params)
            redirect_to @account, notice: "Success!"
        else
            render 'edit', notice: "Something went wrong"
        end
    end

    def destroy
        @account.destroy
        redirect_to accounts_path
    end

    private

    def account_params
        params.require(:account).permit(:name, :description, :credit_limit, :account_number)
    end

    def find_account
        @account = Account.find(params[:id])
    end
end
