class Datacenter < ActiveRecord::Base
  has_many :browsers
  has_many :phonos
  has_many :nodes

  validates :name, :presence => true, :uniqueness => true

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
