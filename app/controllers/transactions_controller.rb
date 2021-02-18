class TransactionsController < ApplicationController
    before_action :find_transaction, only: [:show, :edit, :update, :destroy]

    def index
        @transactions = transaction.where(user_id: current_user)
    end

    def show
    end

    def new
        @transaction = current_user.transactions.build
    end

    def create
        @transaction = current_user.transactions.build(transaction_params)
        if @transaction.save
            redirect_to @transaction
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @transaction.update(transaction_params)
            redirect_to @transaction
        else
            render 'edit'
        end    
    end

    def destroy
        @transaction.destroy
        redirect_to transactions_path 
    end

    private

    def find_transaction
        @transaction = Transaction.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:amount, :description)
    end
end
