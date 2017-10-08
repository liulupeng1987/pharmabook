class Api < ApplicationRecord
  belongs_to :medicine_manufacturer
  searchkick word_start: [:name, :number, :manufacturer]
  validates :name, :number, :manufacturer, presence: true

  def search_data
    {
      name: name,
      number: number,
      manufacturer: manufacturer
    }
  end

end
