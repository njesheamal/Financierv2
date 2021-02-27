module PaymentsHelper

    def set_due_date
        Time.now + 30.days
    end
end
