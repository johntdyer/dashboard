class AddRoutingAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :routing_admin, :boolean, :default => false
   end

   def self.down
     remove_column :users, :routing_admin
   end

end
