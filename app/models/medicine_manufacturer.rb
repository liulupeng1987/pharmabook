class MedicineManufacturer < ApplicationRecord
  has_many :medicines, dependent: :destroy
  searchkick word_start: [:name, :number, :manufacturer_name]
  validates :name, :website, presence: true

    def search_data
      {
        name: name,
        contact_info: contact_info
      }
    end
end
