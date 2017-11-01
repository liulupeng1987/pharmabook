class AddManufacturerToAnda < ActiveRecord::Migration[5.0]
  def change
    add_column :andas, :manufacturer, :string
  end
end
