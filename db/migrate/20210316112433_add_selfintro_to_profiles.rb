class AddSelfintroToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :selfintro, :text
  end
end
