ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Recent Photos" do
      table_for Photo.order("created_at desc").limit(10) do
        column :title
        column :description
        column :user do |photo|
          photo.album.user
        end
        column :album do |photo|
          photo.album
        end
        column :created_at
        column :updated_at
      end
    end
  end
end
