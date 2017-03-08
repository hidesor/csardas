class Photo < ActiveRecord::Base
  belongs_to :product
  belongs_to :group
  mount_uploader :image, ImageUploader
end
