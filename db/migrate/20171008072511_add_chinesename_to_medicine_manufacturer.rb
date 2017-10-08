class AddChinesenameToMedicineManufacturer < ActiveRecord::Migration[5.0]
  def change
    add_column :medicine_manufacturers, :chinesename, :string
  end
end
