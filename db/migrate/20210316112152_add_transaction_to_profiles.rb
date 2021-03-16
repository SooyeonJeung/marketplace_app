class AddTransactionToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :transaction, :integer
  end
end
