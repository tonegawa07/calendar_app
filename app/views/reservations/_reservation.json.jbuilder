json.extract! reservation, :id, :lab, :name, :number_of_samples, :start_time, :end_time, :information, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
