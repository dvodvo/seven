json.extract! appointment, :id, :start_at, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
