class Anda < ApplicationRecord
  belongs_to :medicine_manufacturer
  searchkick word_start: [:product, :number, :manufacturer]

  def search_data
    {
      product: product,
      number: number,
      manufacturer: manufacturer
    }
  end
end
