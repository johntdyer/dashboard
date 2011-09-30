class CreatePartitionPlatforms < ActiveRecord::Migration
  def change
    create_table :partition_platforms do |t|
      t.integer :ppid
      t.string :description
      t.integer :network_id

      t.timestamps
    end
  end
end
