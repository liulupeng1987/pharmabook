class AddMobileToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile, :string
  end
end
