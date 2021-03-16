class AddBuyerToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :buyer, :boolean
  end
end
