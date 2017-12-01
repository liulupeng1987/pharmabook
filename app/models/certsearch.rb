class Certsearch < ApplicationRecord

  belongs_to :user


    def self.to_csv(options = {})
      attributes1 = %w{id query user_id created_at}
      attributes2 = %w{email country company mobile}
      CSV.generate(options) do |csv|
        csv << attributes1 + attributes2
        all.each do |collection|
          csv << attributes1.map{ |attr| collection.send(attr)} + attributes2.map{ |attr| collection.user.send(attr)}
        end
      end
    end
end
