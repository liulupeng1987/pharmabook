class AddColumnsToAndas < ActiveRecord::Migration[5.0]
  def change
    add_column :andas, :submission_status, :string
    add_column :andas, :approval_date, :date
  end
end
