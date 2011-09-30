class Network < ActiveRecord::Base
  has_many :partition_platforms

  validates_uniqueness_of :name

  def self.staging
    self.find_by_name("staging")
  end

  def self.production
    self.find_by_name("production")
  end

  def self.beta
    self.find_by_name("beta")
  end



end
