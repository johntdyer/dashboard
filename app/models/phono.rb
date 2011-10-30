class Phono < ActiveRecord::Base
  extend FriendlyId
  friendly_id :hostname , :use => :slugged

   belongs_to :datacenter

   validates :hostname, :presence => true, :uniqueness => true

   accepts_nested_attributes_for :datacenter
end
