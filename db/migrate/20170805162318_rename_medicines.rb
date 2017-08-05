class RenameMedicines < ActiveRecord::Migration[5.0]
  def change
    rename_column :medicines, :manufacturer_id, :manufacturer_name
    add_column :medicines, :manufacturer_id, :integer
    
  end
end
