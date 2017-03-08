class AddGoodUrl < ActiveRecord::Migration
  def change
    add_column :goods, :url, :text
  end
end
