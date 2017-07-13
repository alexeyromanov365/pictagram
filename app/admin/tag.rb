ActiveAdmin.register Tag do
  permit_params :name
  index do
    selectable_column
    column :id
    column :name
    column :created_at
    column :updated_at
    actions
  end
end
