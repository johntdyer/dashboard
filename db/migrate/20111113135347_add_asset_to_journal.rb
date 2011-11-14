class AddAssetToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :asset, :string
  end
end
