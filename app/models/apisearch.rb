class Apisearch < ApplicationRecord
  belongs_to :user
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |api|
        csv << api.attributes.values_at(*column_names)
      end
    end
  end
end
