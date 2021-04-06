module TransactionsHelper
    def format_date(transaction)
        if transaction.date == nil
            transaction.date = transaction.created_at.to_date
        else
            transaction.date
        end
    end
end
