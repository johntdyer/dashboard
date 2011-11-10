class Phono < ActiveRecord::Base
  extend FriendlyId
  friendly_id :hostname , :use => :slugged

  belongs_to :datacenter

  validates :hostname, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :datacenter

  def in?
    !check
  end

  def out?
    check
  end

  def add
    modify_host(:method=>'add')
  end

  def remove
    modify_host(:method=>'delete')
  end

  private

  def modify_host(args)
    Kernel.system "printf \"update #{args[:method]} _xmpp-client._tcp.gw.#{self.datacenter.short_name}-internal.d.phono.com. 120 IN SRV 10 0 5222 #{self.hostname}.\nsend\nquit\" | nsupdate -y ddns-d.phono.com:#{$config.dns.phono.d.tsig_key}"
  end

  def check
    `dig @10.6.3.1 axfr d.phono.com | grep SRV | grep '#{self.hostname}'`.empty?
  end

end
