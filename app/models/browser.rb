class Browser < ActiveRecord::Base
  has_and_belongs_to_many :partition_platforms

  belongs_to :datacenter

  validates_uniqueness_of :hostname


  accepts_nested_attributes_for :partition_platforms
  accepts_nested_attributes_for :datacenter

end
