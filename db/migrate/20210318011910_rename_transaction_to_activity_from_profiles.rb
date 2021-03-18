class RenameTransactionToActivityFromProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :transaction, :activity
  end
end
