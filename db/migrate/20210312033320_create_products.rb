class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :category
      t.string :description
      t.string :text
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
