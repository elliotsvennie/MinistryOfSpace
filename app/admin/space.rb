ActiveAdmin.register Space do
  
  
  permit_params :name, :address, :latitude, :longitude, :price_in_pounds, 
    :desk_type, :has_full_access, :description, :phone_number, :email, 
    :twitter, :is_verified,
    photos_attributes: [:id, :photo, :photo_cache, :rank, :_destroy]
  
  index do
    selectable_column
    id_column
    column :name
    column :address
    column :price_in_pounds
    column :email
    column :phone_number
    column :is_verified
    column :created_at
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :desk_type, collection: { "Fixed / Permanent" => "fixed", "Hot desking" => "hotdesk" } 
      f.input :has_full_access, label: "has 24/7 access"
      f.input :price_in_pounds
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
        pf.input :photo, hint: pf.object.photo.present? ? image_tag(pf.object.photo.url(:thumb)) : content_tag(:span, "no image yet")
        pf.input :photo_cache, as: :hidden
      end
    end
    f.actions
  end
  
  controller do
    defaults :finder => :find_by_slug
  end
  
  batch_action :verify do |ids|
    batch_action_collection.find(ids).each do |space|
      space.update(is_verified: true)
    end
    redirect_to collection_path, alert: "The spaces have been verified."
  end
  
end
