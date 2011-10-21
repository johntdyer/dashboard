# module LabsRouting
# 
#   orlando = [
#               {
#                 :hostname=>'tropo98.orl.voxeo.net',
#                 :datacenter=>'orl',
#                 :network=>"beta",
#                 :description=>"Tropo alpha browser"
#               },
#               {
#                 :hostname=>'tropo99.orl.voxeo.net',
#                 :datacenter=>'orl',
#                 :network=>"beta",
#                 :description=>"Tropo alpha browser"
#                },
#               {:hostname=>'tropo203.orl.voxeo.net',:datacenter=>'orl',:network=>"staging"},
#               {:hostname=>'tropo204.orl.voxeo.net',:datacenter=>'orl',:network=>"staging"},
#               {:hostname=>'tropo101.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo101.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo102.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo103.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo104.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo105.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo106.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo108.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo109.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {:hostname=>'tropo110.orl.voxeo.net',:datacenter=>'orl',:network=>"production"},
#               {
#                 :hostname=>'groupme142.orl.voxeo.net',
#                 :datacenter=>'orl',
#                 :network=>"production",
#                 :description=>"Dedicated GroupMe Browser",
#                 :customer=>"groupme",
#                 :dedicated=>true
#               },
#               {
#                 :hostname=>'groupme143.orl.voxeo.net',
#                 :datacenter=>'orl',
#                 :description=>"Dedicated GroupMe Browser",
#                 :network=>"production",
#                 :customer=>"groupme",
#                 :dedicated=>true
#               }
#   ]
#   vegas = [
#               {:hostname=>'tropo185.las.voxeo.net',:datacenter=>'las',:network=>"production"},
#               {:hostname=>'tropo186.las.voxeo.net',:datacenter=>'las',:network=>"production"}
#   ]
#   atlanta = [
#               {:hostname=>'tropo185.atl.voxeo.net',:datacenter=>'atl',:network=>"production"},
#               {:hostname=>'tropo186.atl.voxeo.net',:datacenter=>'atl',:network=>"production"}
#   ]
# 
#   #Seed browser data
#   orlando.concat(vegas).concat(atlanta).each{ |e| Browser.create(e) }
# 
#   # Seed Phono Gateways
#   orando_phono = []
#   atlanta_phono = [
#       {
#         :hostname=>'phonogw121.atl.voxeo.net',
#         :datacenter=>'atl',
#         :description=>"Phono Gateway"
#       },
#       {
#         :hostname=>'phonogw122.atl.voxeo.net',
#         :datacenter=>'atl',
#         :description=>"Phono Gateway"
#       }
#   ]
# 
#   vegas_phono = [
#        {
#         :hostname=>'phonogw121.las.voxeo.net',
#         :datacenter=>'las',
#         :description=>"Phono Gateway"
#       },
#        {
#         :hostname=>'phonogw122.las.voxeo.net',
#         :datacenter=>'las',
#         :description=>"Phono Gateway"
#       }
#     ]
# 
#   orando_phono.concat(atlanta_phono).concat(vegas_phono).each{ |e| Gateway.create(e) }
# 
#   # Create partitions and map to browsers
#   Browser.production.each do |browser|
#     Partition.create({:ppid=>461,:datacenter=>'all',:channel=>'voice',:browser=>browser})
#     Partition.create({:ppid=>462,:datacenter=>'all',:channel=>'messaging',:browser=>browser})
#   end
# 
#   Browser.atlanta.production.each do |browser|
#     Partition.create({:ppid=>651,:datacenter=>'atl',:channel=>'voice',:browser=>browser})
#     Partition.create({:ppid=>652,:datacenter=>'atl',:channel=>'messaging',:browser=>browser})
#   end
# 
#   Browser.orlando.production.each do |browser|
#     Partition.create({:ppid=>653,:datacenter=>'orl',:channel=>'voice',:browser=>browser})
#     Partition.create({:ppid=>654,:datacenter=>'orl',:channel=>'messaging',:browser=>browser})
#   end
# 
#   Browser.vegas.production.each do |browser|
#     Partition.create({:ppid=>655,:datacenter=>'las',:channel=>'voice',:browser=>browser})
#     Partition.create({:ppid=>656,:datacenter=>'las',:channel=>'messaging',:browser=>browser})
#   end
# 
#   Browser.orlando.staging.each do |browser|
#     Partition.create({:ppid=>410,:datacenter=>'orl',:channel=>'voice',:browser=>browser})
#     Partition.create({:ppid=>445,:datacenter=>'orl',:channel=>'messaging',:browser=>browser})
#   end
# 
#   Browser.orlando.beta.each do |browser|
#     Partition.create({:ppid=>502,:datacenter=>'orl',:channel=>'voice',:browser=>browser})
#   end
# 
#   Browser.groupme.each do |browser|
#     Partition.create({:ppid=>627,:datacenter=>'orl',:channel=>'voice',:browser=>browser})
#   end
# 
# end