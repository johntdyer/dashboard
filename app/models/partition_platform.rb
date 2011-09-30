class PartitionPlatform < ActiveRecord::Base
  has_and_belongs_to_many :browsers
  belongs_to :network

  validates_uniqueness_of :ppid
  validates_presence_of :ppid

  
end
