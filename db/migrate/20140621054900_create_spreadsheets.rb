class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|
    	t.string :title
    	t.string :author
    	t.string :description
    	t.integer :edition
      t.integer :copyright_year
      t.integer :list_price
    end
  end
end
