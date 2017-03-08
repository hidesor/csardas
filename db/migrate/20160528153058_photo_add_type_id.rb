class PhotoAddTypeId < ActiveRecord::Migration
  def change
    add_column :photos, :type_id , :string
  end
end
