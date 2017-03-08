class Type < ActiveRecord::Base
  has_one :photo
  has_many :product
  accepts_nested_attributes_for :photo
end
