class AddEmailToMedicineManufacturer < ActiveRecord::Migration[5.0]
  def change
    add_column :medicine_manufacturers, :email, :string
  end
end
