class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :number
      t.string :strength
      t.string :manufacturer_id

      t.timestamps
    end
  end
end
