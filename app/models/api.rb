class Api < ApplicationRecord
  searchkick
  validates :name, :number, :manufacturer, presence: true
end
