class TransactionsPaymentsController < ApplicationController
    def index
        @ = .all
    end
    
    def new
        @ = .new
    end
    
    def create
        @object = Object.new(params[:object])
        if @object.save
          flash[:success] = "Object successfully created"
          redirect_to @object
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
        @ = .find()
    end
    
    private

    def get_transaction
        
    end
    
    def get_payment
        
    end

    def find_transactions_payments

    end

    def transactions_payments_params
        params.require(:transactions_payments).permit(:transaction_id, :payment_id,)
    end
end
