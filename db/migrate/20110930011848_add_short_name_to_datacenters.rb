class AddShortNameToDatacenters < ActiveRecord::Migration
  def change
    add_column :datacenters, :short_name, :string
  end
end
