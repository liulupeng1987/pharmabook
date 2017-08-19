class Article < ApplicationRecord
  include RankedModel
  ranks :row_order
  has_many :images, dependent: :destroy
end
