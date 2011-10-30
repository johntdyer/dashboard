class AddPhonoIdsToDatacenter < ActiveRecord::Migration
  def change
    add_column :datacenters, :phono_id, :integer
  end
end
