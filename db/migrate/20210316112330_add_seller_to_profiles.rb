class AddSellerToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :seller, :boolean
  end
end
