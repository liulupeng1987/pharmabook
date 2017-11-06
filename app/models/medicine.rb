class Medicine < ApplicationRecord
  belongs_to :medicine_manufacturer

  searchkick word_start: [:name, :number, :manufacturer_name]
  validates :name, :number, :medicine_manufacturer_id, :manufacturer_name, presence: true

  def search_data
    {
      name: name,
      number: number,
      manufacturer_name: manufacturer_name
    }
  end

  def self.import(file)
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        medicine = find_by_id(row["id"]) || new
        medicine.attributes = row.to_hash
        medicine.save!
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
