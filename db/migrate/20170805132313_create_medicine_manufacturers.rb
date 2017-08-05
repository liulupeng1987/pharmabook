class CreateMedicineManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :medicine_manufacturers do |t|
      t.string :name
      t.string :website
      t.text :contact_info

      t.timestamps
    end
  end
end
