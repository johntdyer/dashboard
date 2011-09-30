class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.integer :platform_partition_ids

      t.timestamps
    end
  end
end
