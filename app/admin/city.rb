ActiveAdmin.register City do
  
  
  permit_params :name, :currency_unit, :latitude, :longitude,
    :max_price_per_month
  
  index do
    selectable_column
    id_column
    column :name
    column :currency_unit
    column :max_price_per_month
    column :latitude
    column :longitude
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :currency_unit
      f.input :max_price_per_month
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
