class CreateMedicineManufactuers < ActiveRecord::Migration[5.0]
  def change
    create_table :medicine_manufactuers do |t|
      t.string :name
      t.string :website
      t.string :contact_info
      t.string :text

      t.timestamps
    end
  end
end
