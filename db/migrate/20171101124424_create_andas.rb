class CreateAndas < ActiveRecord::Migration[5.0]
  def change
    create_table :andas do |t|
      t.string :product
      t.integer :medicine_manufacturer_id
      t.string :strength
      t.string :number

      t.timestamps
    end
  end
end
