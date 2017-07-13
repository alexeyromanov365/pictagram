ActiveAdmin.register Photo do
  permit_params :title, :description, :picture, :album_id
end
