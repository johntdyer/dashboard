class Partition < ActiveRecord::Base
  belongs_to :browser
  
  validates :ppid, :channel, :presence => true
  validates_format_of :datacenter, :with => /^(orl|las|atl|all)$/, :message => "Invalid datacenter"

end