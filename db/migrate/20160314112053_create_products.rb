class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.text :text
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
