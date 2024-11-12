json.extract! user_transaction, :id, :category_id, :owner_id, :category_id, :amount, :description, :created_at, :updated_at
json.url user_transaction_url(user_transaction, format: :json)
