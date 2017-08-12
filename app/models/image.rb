class Image < ApplicationRecord
  attachment :image
  belongs_to :article
end
