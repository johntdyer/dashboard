class AddDataCenterIdToBrowsers < ActiveRecord::Migration
  def change
    add_column :browsers, :datacenter_id, :integer
  end
end
