class CreateDatacenters < ActiveRecord::Migration
  def change
    create_table :datacenters do |t|
      t.string :name
      t.integer :browser_ids

      t.timestamps
    end
  end
end
