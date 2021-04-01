module PaymentsHelper

    # def set_due_date(payment)
    #     payment.due_date = 30.days.from_now
    # end

    def track_payment(payment)
        if payment.amount == Transaction.amount
            payment.due_date = nil
            payment.status = "Complete"
        else
            payment.due_date = 30.days.from_now
            payment.status = "Incomplete"
        end
    end
end
