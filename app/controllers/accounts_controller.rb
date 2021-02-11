class AccountsController < ApplicationController
    before_action :find_account, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def account_params
        params.require(:account).permit(:name, :description, :credit_limit, :account_number)
    end

    def find_account
        @account = Account.find(params[:id])
    end
end
