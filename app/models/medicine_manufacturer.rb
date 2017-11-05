class MedicineManufacturer < ApplicationRecord
  has_many :medicines, dependent: :destroy
  has_many :apis, dependent: :destroy
  has_many :andas, dependent: :destroy
  searchkick word_start: [:name, :number, :manufacturer_name]
  validates :name, :website, presence: true

    def search_data
      {
        name: name,
        contact_info: contact_info
      }
    end


    def self.import(file)
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        medicine_manufacturer = find_by_id(row["id"]) || new
        medicine_manufacturer.attributes = row.to_hash
        medicine_manufacturer.save!
      end
    end

    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
end
