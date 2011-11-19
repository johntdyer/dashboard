class Node < ActiveRecord::Base
  extend FriendlyId
  friendly_id :hostname , :use => :slugged

  has_and_belongs_to_many :partition_platforms, :uniq=>true
  belongs_to :datacenter

  validates :hostname, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :partition_platforms
  accepts_nested_attributes_for :datacenter


  def status
    {
      :routing=>{
        :outbound=>check_outbound,
        :inbound=>check_romeo
      }
    }
  end

  def add(opts="")
    case opts.downcase
    when :inbound,:romeo
      modify_inbound(:method=>'add')
    when :token,:outbound
      modify_outbound(:method=>'add')
    else
      modify_outbound(:method=>'add')
      modify_inbound(:method=>'add')
    end
  end

  def remove(opts="")
    case opts.downcase
    when :inbound,:romeo
      modify_inbound(:method=>'delete')
    when :token,:outbound
      modify_outbound(:method=>'delete')
    else
      modify_outbound(:method=>'delete')
      modify_inbound(:method=>'delete')
    end
  end

  def in_romeo?
    check_romeo
  end

  def in_outbound?
    check_outbound
  end

  private

  def modify_inbound(args={})
    args={
      :port=>5061
    }.merge!(args)
    self.partition_platforms.each.collect(&:ppid).each do |ppid|
      `printf "update #{args[:method]} _sip._udp.ppid#{ppid}.romeo.#{self.datacenter.short_name}.tropo.com. 120 IN SRV 0 5 #{args[:port]} #{self.hostname}.\nsend\nquit" | nsupdate -y ddns-romeo.#{self.datacenter.short_name}.tropo.com:#{$config.dns.romeo.send(self.datacenter.short_name).tsig_key}`
    end
  end

  def modify_outbound(args)
    self.partition_platforms.each.collect(&:ppid).each do |ppid|
      `printf "update #{args[:method]} #{ppid}.outbound.tropo.com.  60  IN  NAPTR 0 0 \\"u\\" \\"server+E2U\\" \\"\x21\x5e\x2e\x2A\\x24\x21#{IPSocket.getaddress(self.hostname)}\x21\\" .\nsend\nquit" | nsupdate -y ddns-outbound.tropo.com:#{$config.dns.outbound.tsig_key}`
    end
  end

  def check_romeo
    !`dig @10.6.3.1 axfr romeo.#{self.datacenter.short_name}.tropo.com | grep SRV | grep '#{self.hostname}'`.empty?
  end

  def check_outbound
    !`dig @10.6.3.1 axfr outbound.tropo.com | grep NAPTR | grep '#{IPSocket.getaddress(self.hostname)}'`.empty?
  end


end
