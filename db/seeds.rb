# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Network.create([{:name=>"beta"},{:name=>"staging"},{:name=>"production"}])

Datacenter.create([{:name=>"orlando",:short_name=>"orl"},{:name=>"vegas",:short_name=>"las"},{:name=>"atlanta",:short_name=>"atl"}])

Browser.create([
   {:hostname=>"tropo98.orl.voxeo.net"},
   {:hostname=>"tropo99.orl.voxeo.net"},
   {:hostname=>"tropo203.orl.voxeo.net"},
   {:hostname=>"tropo204.orl.voxeo.net"},
   {:hostname=>"tropo101.orl.voxeo.net"},
   {:hostname=>"tropo102.orl.voxeo.net"},
   {:hostname=>"tropo103.orl.voxeo.net"},
   {:hostname=>"tropo104.orl.voxeo.net"},
   {:hostname=>"tropo105.orl.voxeo.net"},
   {:hostname=>"tropo106.orl.voxeo.net"},
   {:hostname=>"tropo108.orl.voxeo.net"},
   {:hostname=>"tropo109.orl.voxeo.net"},
   {:hostname=>"tropo110.orl.voxeo.net"},
   {:hostname=>"tropo185.atl.voxeo.net"},
   {:hostname=>"tropo186.atl.voxeo.net"},
   {:hostname=>"tropo185.las.voxeo.net"},
   {:hostname=>"tropo186.las.voxeo.net"},
   {:hostname=>"groupme142.orl.voxeo.net"},
   {:hostname=>"groupme143.orl.voxeo.net"}
  ])


PartitionPlatform.create({
      :ppid=>410,
      :description=>"Orlando Staging Voice",
      :network=>Network.find_by_name("staging")
}).browsers << Browser.where("hostname like ?","tropo2%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>445,
      :description=>"Orlando Staging Messaging",
      :network=>Network.find_by_name("staging")
}).browsers << Browser.where("hostname like ?","tropo2%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>502,
      :description=>"Orlando Beta",
      :network=>Network.find_by_name("beta"),
}).browsers << Browser.where("hostname like ?","tropo9%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>461,
      :description=>'Production Voice',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","tropo1%.orl.voxeo.net")

PartitionPlatform.create({
      :ppid=>462,
      :description=>'Production Messaging',
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
      :ppid=>627,:description=>'GroupMe',
      :network=>Network.find_by_name("production")
}).browsers << Browser.where("hostname like ?","groupme1%.orl.voxeo.net")

Datacenter.find_by_name("orlando").browsers << Browser.where("hostname like ?","tropo%.orl.voxeo.net")
Datacenter.find_by_name("orlando").browsers << Browser.where("hostname like ?","group%.orl.voxeo.net")
Datacenter.find_by_name("atlanta").browsers << Browser.where("hostname like ?","tropo%.atl.voxeo.net")
Datacenter.find_by_name("vegas").browsers << Browser.where("hostname like ?","tropo%.las.voxeo.net")
