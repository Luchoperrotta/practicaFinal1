json.extract! current_account, :id, :user_account_id, :date, :description, :debit, :credit, :balance, :created_at, :updated_at
json.url current_account_url(current_account, format: :json)
