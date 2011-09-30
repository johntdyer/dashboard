class Datacenter < ActiveRecord::Base
  has_many :browsers

  validates_uniqueness_of :name

  def self.orlando
    self.find_by_name("orlando")
  end

  def self.las
    self.find_by_name("vegas")
  end

  def self.atlanta
    self.find_by_name("atlanta")
  end
end
