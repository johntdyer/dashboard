class Browser < ActiveRecord::Base

  def self.customer(customer)
    where(:customer => customer)
  end

  scope :groupme, customer('groupme')

  has_many :partitions

  scope :atlanta, where(:datacenter => 'atl')
  scope :vegas, where(:datacenter => 'las')
  scope :orlando, where(:datacenter => 'orl')

  scope :production, where(:network=>'production',:dedicated=>false)
  scope :dedicated, where(:dedicated=>true)
  scope :beta, where(:network=>'beta')
  scope :staging, where(:network=>'staging')

  validates :hostname, :presence => true, :uniqueness => true
  validates :network, :presence => true
  validates_format_of :datacenter, :with => /^(orl|las|atl|all)$/, :message => "Invalid Datacenter"

end