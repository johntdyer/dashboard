class AddUsernameToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :username, :string
  end
end
