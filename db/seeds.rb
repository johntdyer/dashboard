# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Network.create([{:name=>"beta"},{:name=>"development"},{:name=>"production"}])

Datacenter.create([{:name=>"orlando",:short_name=>"orl"},{:name=>"vegas",:short_name=>"las"},{:name=>"atlanta",:short_name=>"atl"}])

Browser.create([
   {:hostname=>"tropo98.orl.voxeo.net",:description=>"Beta Tropo Browser"},
   {:hostname=>"tropo99.orl.voxeo.net",:description=>"Beta Tropo Browser"},
   {:hostname=>"tropo203.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo204.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo101.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo102.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo103.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo104.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo105.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo106.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo108.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo109.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo110.orl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo185.atl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo186.atl.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo185.las.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"tropo186.las.voxeo.net",:description=>"Production Tropo browser"},
   {:hostname=>"groupme142.orl.voxeo.net",:description=>"Dedicated GroupMe box"},
   {:hostname=>"groupme143.orl.voxeo.net",:description=>"Dedicated GroupMe box"}
  ])


PartitionPlatform.create({
      :ppid=>410,
      :description=>"Orlando Staging Voice",
      :network=>Network.find_by_name("development")
}).browsers << Browser.where("hostname like ?","tropo2%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>445,
      :description=>"Orlando Staging Messaging",
      :network=>Network.find_by_name("development")
}).browsers << Browser.where("hostname like ?","tropo2%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>502,
      :description=>"Orlando Beta",
      :network=>Network.find_by_name("beta"),
}).browsers << Browser.where("hostname like ?","tropo9%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>461,
      :description=>'Production Voice (OLD)',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>462,
      :description=>'Production Messaging (OLD)',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>651,
      :description=>'Atlanta Production Voice',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.atl.voxeo.net")

PartitionPlatform.create({
      :ppid=>652,
      :description=>'Atlanta Production Messaging',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.atl.voxeo.net")

PartitionPlatform.create({
      :ppid=>653,
      :description=>'Orlando Production Voice',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>654,
      :description=>'Orlando Production Messaging',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>655,
      :description=>'Vegas Production Voice',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.las.voxeo.net")

PartitionPlatform.create({
      :ppid=>656,
      :description=>'Vegas Production Messaging',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.las.voxeo.net")

PartitionPlatform.create({
      :ppid=>627,
      :description=>'GroupMe',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","groupme1%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>663,
      :description=>'Multisite - Tropo',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.%.voxeo.net")

PartitionPlatform.create({
      :ppid=>664,
      :description=>'Multisite - Tropo w/ SMS',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.%.voxeo.net")

# PartitionPlatform.create({
#       :ppid=>659,
#       :description=>'ORL - Rayo',
#       :network=>Network.find_by_name("development")
# }).browsers << Browser.where("hostname like ?","groupme1%.orl.voxeo.net")
# 
# PartitionPlatform.create({
#       :ppid=>660,
#       :description=>'ORL - Rayo',
#       :network=>Network.find_by_name("production")
# }).browsers << Browser.where("hostname like ?","groupme1%.orl.voxeo.net")
# 
# PartitionPlatform.create({
#       :ppid=>661,
#       :description=>'ORL - Rayo (messaging)',
#       :network=>Network.find_by_name("development")
# }).browsers << Browser.where("hostname like ?","groupme1%.orl.voxeo.net")
# 
# PartitionPlatform.create({
#       :ppid=>662,
#       :description=>'ORL - Rayo (messaging)',
#       :network=>Network.find_by_name("production")
# }).browsers << Browser.where("hostname like ?","rayo-node%.orl.voxeo.net")    





#Datacenter.find(1).browsers.create(:hostname => "tester185.orl.voxeo.net")
Datacenter.find_by_name("orlando").browsers << Browser.where("hostname like ?","tropo%.orl.voxeo.net")
Datacenter.find_by_name("orlando").browsers << Browser.where("hostname like ?","group%.orl.voxeo.net")
Datacenter.find_by_name("atlanta").browsers << Browser.where("hostname like ?","tropo%.atl.voxeo.net")
Datacenter.find_by_name("vegas").browsers << Browser.where("hostname like ?","tropo%.las.voxeo.net")
