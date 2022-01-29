json.extract! cart, :id, :accepted, :fulfilled, :paid, :created_at, :updated_at
json.url cart_url(cart, format: :json)
