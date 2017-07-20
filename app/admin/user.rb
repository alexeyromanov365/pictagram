ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :gender, :about_me, :adress, :avatar, :encrypted_password, :reset_password_token, :role
end
