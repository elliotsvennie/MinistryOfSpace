class AddPostcodeToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :postcode, :string
  end
end
