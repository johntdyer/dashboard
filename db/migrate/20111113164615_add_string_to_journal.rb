class AddStringToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :zone, :string
  end
end
