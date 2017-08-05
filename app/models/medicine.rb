class Medicine < ApplicationRecord
  belongs_to :medicine_manufacturer

  searchkick word_start: [:name, :number, :manufacturer_name]
  validates :name, :number, :manufacturer_id, :manufacturer_name, presence: true

  def search_data
    {
      name: name,
      number: number,
      manufacturer_name: manufacturer_name
    }
  end
end
