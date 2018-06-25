json.extract! payment, :id, :value, :state, :due_date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
