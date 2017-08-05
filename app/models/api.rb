class Api < ApplicationRecord
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
