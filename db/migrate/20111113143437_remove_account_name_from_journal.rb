class RemoveAccountNameFromJournal < ActiveRecord::Migration
  def up
    remove_column :journals, :account_name
  end

  def down
    remove_column :journals, :account_name,:string
  end
end
