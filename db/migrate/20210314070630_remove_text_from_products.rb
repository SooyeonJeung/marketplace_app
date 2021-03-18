class RemoveTextFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :text, :string
  end
end
