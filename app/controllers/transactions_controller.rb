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
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
            flash[:success] = "You successfully added a transaction!"
            redirect_to account_transactions_path(@account)
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    def edit
    end

    def update
        if @transaction.update(transaction_params)
            redirect_to account_transaction_path(@account)
        else
            render 'edit'
        end    
    end

    def destroy
        @transaction.destroy
        redirect_to account_transactions_path(@account)
    end

    # def big_spend
        # @transaction = transaction.biggest_purchase
    # end
    

    private
    def get_account
        @account = Account.find(params[:account_id])
    end

    def find_transaction
        @transaction = @account.transactions.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:amount, :description, :account_id, :category_id)
    end
end
