class Browser < ActiveRecord::Base
 extend FriendlyId
 friendly_id :hostname , :use => :slugged
  
  has_and_belongs_to_many :partition_platforms, :uniq=>true
  belongs_to :datacenter

  validates :hostname, :presence => true, :uniqueness => true


  accepts_nested_attributes_for :partition_platforms
  accepts_nested_attributes_for :datacenter

end
