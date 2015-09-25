ActiveAdmin.register Company do
  
  permit_params :city_id, :company_name, :contact_name, :email, :stay_anonymous, :where, :how_many,
  :is_private, :is_open_office, :is_co_working, :is_shared_office, 
  :how_much, :how_long, :when, :is_verified
  
  index do
    selectable_column
    id_column
    column :city
    column :company_name
    column :contact_name
    column :email
    column :where
    column :how_many
    column :how_much
    column :how_long
    column :is_verified
    column :created_at
    actions
  end
  
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :city
      f.input :company_name
      f.input :contact_name
      f.input :email
      f.input :stay_anonymous
      f.input :where
      f.input :how_many
      f.input :is_private
      f.input :is_open_office
      f.input :is_co_working
      f.input :is_shared_office
      f.input :how_much
      f.input :how_long
      f.input :when
      f.input :is_verified
    end
    f.actions
  end
  
  
end

