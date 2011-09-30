class CreateBrowsersPartitionPlatformsJoinTable < ActiveRecord::Migration
  def up
    create_table :browsers_partition_platforms, :id => false do |t|
      t.belongs_to :browser
      t.belongs_to :partition_platform
    end
  end

  def down
    drop_table :browsers_partition_platforms
    
  end
end
