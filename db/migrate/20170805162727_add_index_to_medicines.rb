class AddIndexToMedicines < ActiveRecord::Migration[5.0]
  def change
    add_index :medicines, :name
    add_index :medicines, :number
    add_index :medicines, :manufacturer_name
  end
end
