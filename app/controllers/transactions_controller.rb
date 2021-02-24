class TransactionsController < ApplicationController
    before_action :get_account
    before_action :find_transaction, only: [:show, :edit, :update, :destroy]


    def index
        @transactions = @account.transactions
    end

    def show
    end

    def new
        @transaction = @account.transactions.build
    end

    def create
        @transaction = @account.transactions.build(transaction_params)
        if @transaction.save
            redirect_to account_transactions_path(@transaction)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @transaction.update(transaction_params)
            redirect_to account_transaction_path(@transaction)
        else
            render 'edit'
        end    
    end

    def destroy
        @transaction.destroy
        redirect_to account_transactions_path(@transaction)
    end

    private
    def get_account
        @account = Account.find(params[:account_id])
    end

    def find_transaction
        @transaction = @account.posts.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:amount, :description)
    end
end
