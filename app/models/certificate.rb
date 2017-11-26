class Certificate < ApplicationRecord
  belongs_to :medicine_manufacturer

  searchkick word_start: [:manufacturer, :fda, :eu, :who, :pics]

  def search_data
    {
      manufacturer: manufacturer,
      fad: fda,
      eu: eu,
      who: who,
      pics: pics
    }
  end


    def self.import(file)
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        certificate = find_by_id(row["id"]) || new
        certificate.attributes = row.to_hash
        certificate.save!
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
