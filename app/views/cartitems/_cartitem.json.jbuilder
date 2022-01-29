json.extract! cartitem, :id, :article_id, :cart_id, :fulfilled, :price_ordered, :quantity_ordered, :quantity_prepared, :created_at, :updated_at
json.url cartitem_url(cartitem, format: :json)
