class AddNewFieldsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :desk_type, :string
    add_column :spaces, :meeting_room, :boolean
    add_column :spaces, :twitter, :string
    add_column :spaces, :has_full_access, :boolean, default: false
    add_column :spaces, :description, :text
  end
end
