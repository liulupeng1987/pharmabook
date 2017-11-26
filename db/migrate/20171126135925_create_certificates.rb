class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :fda
      t.string :eu
      t.string :who
      t.string :pics
      t.integer :medicine_manufacturer_id, :index => true
      t.string :manufacturer

      t.timestamps
    end
  end
end
