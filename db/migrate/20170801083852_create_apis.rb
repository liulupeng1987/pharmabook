class CreateApis < ActiveRecord::Migration[5.0]
  def change
    create_table :apis do |t|
      t.string :name
      t.string :number
      t.string :manufacturer

      t.timestamps
    end
  end
end
