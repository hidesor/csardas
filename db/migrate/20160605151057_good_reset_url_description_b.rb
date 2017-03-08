class GoodResetUrlDescriptionB < ActiveRecord::Migration
  def change
    add_column :goods, :url, :string
    add_column :goods, :description, :text
  end
end
