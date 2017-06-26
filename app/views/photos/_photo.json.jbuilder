json.extract! photo, :id, :description, :picture, :album_id, :photo_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
