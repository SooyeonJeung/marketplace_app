class AddSoldToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sold, :boolean
  end
end
