module LabsRouting

  if !Browser.table_exists?
    # do a quick pseudo migration.  This should only get executed on the first run
     ActiveRecord::Base.connection.create_table "browsers", :force => true do |t|
       t.string   "hostname"
       t.string   "description"
       t.datetime "created_at"
       t.datetime "updated_at"
       t.integer  "datacenter_id"
     end

     ActiveRecord::Base.connection.create_table "browsers_partition_platforms", :id => false, :force => true do |t|
       t.integer "browser_id"
       t.integer "partition_platform_id"
     end

     ActiveRecord::Base.connection.create_table "datacenters", :force => true do |t|
       t.string   "name"
       t.integer  "browser_ids"
       t.datetime "created_at"
       t.datetime "updated_at"
       t.string   "short_name"
     end

     ActiveRecord::Base.connection.create_table "networks", :force => true do |t|
       t.string   "name"
       t.integer  "platform_partition_ids"
       t.datetime "created_at"
       t.datetime "updated_at"
     end

     ActiveRecord::Base.connection.create_table "partition_platforms", :force => true do |t|
       t.integer  "ppid"
       t.string   "description"
       t.integer  "network_id"
       t.datetime "created_at"
       t.datetime "updated_at"
     end
   end
end