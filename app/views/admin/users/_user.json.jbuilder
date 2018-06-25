json.extract! user, :id, :first_name, :last_name, :dni, :cuit, :phone_number, :mobile_number, :address_1, :address_2, :created_at, :updated_at
json.url user_url(user, format: :json)
