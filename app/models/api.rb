class Api < ApplicationRecord
  validates :name, :number, :manufacturer, presence: true
end
