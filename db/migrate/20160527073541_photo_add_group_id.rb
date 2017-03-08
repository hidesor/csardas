class PhotoAddGroupId < ActiveRecord::Migration
  def change
    add_column :photos, :group_id , :string
  end
end
