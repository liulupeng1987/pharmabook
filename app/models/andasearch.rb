class Andasearch < ApplicationRecord
  belongs_to :user
  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |andasearch|
      csv << andasearch.attributes.values_at(*column_names)
    end
  end
end
end
