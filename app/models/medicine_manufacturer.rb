class MedicineManufacturer < ApplicationRecord
  has_many :medicines
  searchkick word_start: [:name, :number, :manufacturer_name]
  validates :name, :website, :contact_info, presence: true

    def search_data
      {
        name: name,
        contact_info: contact_info
      }
    end
end
