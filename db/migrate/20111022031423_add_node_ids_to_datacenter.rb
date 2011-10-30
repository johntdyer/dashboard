class AddNodeIdsToDatacenter < ActiveRecord::Migration
  def change
    add_column :datacenters, :node_ids, :integer
  end
end
