module LabsRouting

  BASE_PATH = "#{Dir.home()}/.lab_routing"
  Dir.mkdir(BASE_PATH) unless Dir.exist?(BASE_PATH)
  ROUTING_DB = "#{BASE_PATH}/routing.db"

 #  DB = SQLite3::Database.new(ROUTING_DB)
 # 
 #   ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ROUTING_DB, :pool => 20)
 #   ActiveRecord::Base.logger = Logger.new("#{BASE_PATH}/debug.log", 10, 1024000)
 # 
 # #  require File.join File.dirname(__FILE__), 'initilize.rb'
 # 
 # if !Browser.table_exists?
 # 
 #    ActiveRecord::Base.connection.create_table(:browsers) do |t|
 #     t.column :hostname, :string
 #     t.column :network, :string
 #     t.column :datacenter, :string
 #     t.column :dedicated, :boolean, :default => false
 #     t.column :description, :string
 #     t.column :updated_at, :timestamp
 #     t.column :created_at, :timestamp
 #     t.column :customer, :string
 #     t.column :partitions, :string
 #   end
 # 
 #   ActiveRecord::Base.connection.create_table(:partitions) do |t|
 #     t.column :ppid, :integer
 #     t.column :channel, :string
 #     t.column :datacenter, :string
 #     t.column :description, :string
 #     t.column :updated_at, :timestamp
 #     t.column :created_at, :timestamp
 #     t.column :browser_id, :integer
 #   end
 #    
 #   ActiveRecord::Base.connection.create_table(:gateways) do |t|
 #     t.column :hostname, :string
 #     t.column :datacenter, :string
 #     t.column :description, :string
 #     t.column :updated_at, :timestamp
 #     t.column :created_at, :timestamp
 #   end 
 #   
 #   
 # end
 # 
 # 
 #   require File.join File.dirname(__FILE__), 'seed.rb'           
end