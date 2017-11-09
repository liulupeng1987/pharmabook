class Medsearch < ApplicationRecord
  belongs_to :user
  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |medsearch|
      csv << medsearch.attributes.values_at(*column_names)
    end
  end
end
end
