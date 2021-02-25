class PaymentsController < ApplicationController
    before_action :get_account
    before_action :find_payment, only: [:show, :edit, :update, :destroy]
    
    def index
        @payments = @account.payments
    end

    def show
    end
    
    def new
        @payment = @account.payments.build
    end

    def create
        @payment = @account.payments.build(payment_params)
        if @payment.save
          flash[:success] = "You successfully made a payment!"
          redirect_to account_payments_path(@account)
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
          redirect_to account_payment_path(@account)
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
