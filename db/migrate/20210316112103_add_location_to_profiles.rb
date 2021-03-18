class AddLocationToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :location, :string
  end
end
