json.extract! admin_receipt, :id, :value, :user_id, :note, :created_at, :updated_at
json.url admin_receipt_url(admin_receipt, format: :json)
