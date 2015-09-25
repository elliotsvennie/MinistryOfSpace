ActiveAdmin.register Space do
  
  permit_params :city_id, :name, :address, :latitude, :longitude, 
    :fixed_desk_price_in_full, :hot_desk_price_in_full,
    :desk_type, :has_full_access, :description, :phone_number, :email, 
    :twitter, :is_verified, :postcode,
    photos_attributes: [:id, :photo, :photo_cache, :rank, :_destroy]
  
  index do
    selectable_column
    id_column
    column :city
    column :name
    column :address
    column :fixed_desk_price_in_full
    column :hot_desk_price_in_full
    column :email
    column :phone_number
    column :is_verified
    column :created_at
    actions
  end
  
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :city
      f.input :name
      f.input :address
      f.input :postcode
      f.input :has_full_access, label: "has 24/7 access"
      f.input :fixed_desk_price_in_full, label: "Fixed desk price", hint: "no units, e.g. 450"
      f.input :hot_desk_price_in_full, label: "Hot desk price", hint: "no units, e.g. 250"
      f.input :description
      f.input :is_verified
    end
    f.inputs do 
      f.input :email
      f.input :phone_number
      f.input :twitter
    end
    f.inputs do
      f.has_many :photos, sortable: :rank do |pf|
        # photos
        pf.input :id, as: :hidden
        pf.input :photo, hint: pf.object.photo.present? ? image_tag(pf.object.photo.url(:thumb)) : content_tag(:span, "no image yet")
        pf.input :photo_cache, as: :hidden
        pf.input :_destroy, label: "Delete photo", as: :boolean
      end
    end
    f.actions
  end
  
  controller do
    defaults :finder => :find_by_slug
  end
  
end

