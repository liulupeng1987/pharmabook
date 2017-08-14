class AddColumnsToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :author, :string
    add_column :articles, :is_hidden, :boolean
    add_column :articles, :summary, :text
    add_column :articles, :row_order, :integer

  end
end
