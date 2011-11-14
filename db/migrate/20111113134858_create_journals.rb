class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :account_id
      t.string :account_name
      t.string :action
      t.string :ip

      t.timestamps
    end
  end
end
