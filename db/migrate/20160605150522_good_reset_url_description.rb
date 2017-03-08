class GoodResetUrlDescription < ActiveRecord::Migration
  def change
    remove_column :goods, :url, :text
    remove_column :goods, :description, :string
  end
end
