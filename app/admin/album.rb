ActiveAdmin.register Album do
  permit_params :title, :description, :user_id
end
