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

  def remove
    modify_site(:method=>'delete')

  end

  def add
    modify_site(:method=>'add')
  end

  def in?
    !check
  end

  def out?
    check
  end
  private

  def check
    Kernel.system "dig @master.dns.voxeo.net axfr d.phono.com | grep lb.d.phono.com | grep \"lb_address(self.short_name)\""
  end

  def modify_site(args)
    Kernel.system "printf \"update #{args[:method]} lb.d.phono.com.  120 A #{lb_address(self.short_name)}\nsend\nquit\" | nsupdate -y ddns-d.phono.com:#{$config.dns.phono.d.tsig_key}"
  end

  def lb_address(dc)
    case dc
    when 'orl' then ''
    when 'las' then '199.230.60.63'
    when 'atl' then '199.230.58.63'
    else
      raise "Unknown Datacenter"
    end
  end
end
