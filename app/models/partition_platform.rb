class PartitionPlatform < ActiveRecord::Base
  has_and_belongs_to_many :browsers #, :uniq=>true
  belongs_to :network

  validates :ppid, :presence => true, :uniqueness => true

  def to_label
    self.description
  end
end
