class CreatePtypes < ActiveRecord::Migration
  def change
    create_table :ptypes do |t|
      t.string :name
      t.text :description
      t.integer :order

      t.timestamps null: false
    end
  end
end
