class Product < ApplicationRecord
  searchkick
  mount_uploader :image, ImageUploader
end
