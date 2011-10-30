class CreateNodePartitionPlatformsJoinTable < ActiveRecord::Migration
  def up
    create_table :nodes_partition_platforms, :id => false do |t|
      t.belongs_to :node
      t.belongs_to :partition_platform
    end
  end

  def down
    drop_table :nodes_partition_platforms
    
  end
end
