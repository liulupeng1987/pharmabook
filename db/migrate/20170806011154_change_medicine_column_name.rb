class ChangeMedicineColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :medicines, :manufacturer_id, :medicine_manufacturer_id
  end
end
