class Gateway < ActiveRecord::Base
   validates :hostname, :presence => true, :uniqueness => true
   validates_format_of :datacenter, :with => /^(orl|las|atl|all)$/, :message => "Invalid datacenter"
end