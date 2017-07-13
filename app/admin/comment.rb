ActiveAdmin.register Comment, :as => "PhotoComment" do
  permit_params :photo_id, :content, :user_id
  index do
    selectable_column
    column :id
    column :photo
    column "Album" do |comment|
      comment.photo.album
    end
    column :user
    column :created_at
    column :updated_at
    actions
  end
end