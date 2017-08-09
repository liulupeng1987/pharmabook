class AddIsInspectorToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_inspector, :boolean, default: false
  end
end
