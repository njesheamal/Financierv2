class PaymentsController < ApplicationController
    before_action :get_account
    before_action :find_payment, only: [:show, :edit, :update, :destroy]
    
    def index
        @payments = @account.payments
    end 

    def show
        # @transaction = Transaction.find_by(id: params[:transaction_id])
    end
    
    def new
        # @transaction = Transaction.find_by(id: params[:transaction_id])
        @payment = @account.payments.build
    end

    def create
        #? What happens if a users payment, exceeds the transaction amount?
        #? What happens if the payment date is wrong?
        # @transaction = Transaction.find_by(id: params[:transaction_id])
        @payment = Payment.new(payment_params)
        
        if @payment.save
            @transaction.payments << @payment
            flash[:success] = "You successfully made a payment!"
            redirect_to account__payment_path(@account, @payment)
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    def edit
    end

    def update
        if @payment.update(payment_params)
          flash[:success] = "Your payment was successfully updated"
          redirect_to account_payment_path(@account, @payment)
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @payment.destroy
            flash[:success] = 'Refund was successfully made.'
            redirect_to account_payments_path(@account)
        else
            flash[:error] = 'Something went wrong'
            render 'edit'
        end
    end
    
    private

    def get_account
        @account = Account.find(params[:account_id])
    end

    def find_payment
        @payment = @account.payments.find(params[:id])
    end

    def payment_params
        params.require(:payment).permit(:account_id, :date, :amount, :description)
    end
    
end



