class AddManuIdToApi < ActiveRecord::Migration[5.0]
  def change
    add_column :apis, :medicine_manufacturer_id, :integer
  end
end
