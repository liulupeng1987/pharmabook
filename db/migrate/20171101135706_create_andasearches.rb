class CreateAndasearches < ActiveRecord::Migration[5.0]
  def change
    create_table :andasearches do |t|
      t.string :query
      t.string :user_email
      t.integer :user_id

      t.timestamps
    end
  end
end
