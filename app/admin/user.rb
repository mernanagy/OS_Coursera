ActiveAdmin.register User do
  permit_params :name , :bdate ,:gender ,:image, :email ,:password ,:current_sign_in_at

  index do
    selectable_column
    id_column
    column :name
    column :bdate
    column :image
    column :gender
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :bdate
      f.input :email
      f.input :image
      f.input :gender
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end