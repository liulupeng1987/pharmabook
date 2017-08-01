class AddIndexToApi < ActiveRecord::Migration[5.0]
  def change
    add_index :apis, :name
    add_index :apis, :manufacturer
  end
end
