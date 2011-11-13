class Route
  # include ActiveModel::Validations
  #   include ActiveModel::Serialization
  # 
  #   validates_presence_of :target
  # 
  #   attr_accessor :target, :zone, :inbound, :outbound,:type,:browser
  # 
  #   def initialize(opts)
  #     @target = opts
  # 
  #     case @target.downcase
  #     when /tropo/
  #       @type = 'tropo'
  #       @browser = Browser.find_by_hostname(self.target)
  #       @inbound = LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key})
  #       @outbound = LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key})
  #     when /rayo/
  #       @type = 'rayo'
  #       # when /phono/
  #       #        @type = 'phono'
  #       #        @phono = LabsRouting::Phono.new({:tsig_key=>$config.dns.phono.d.tsig_key,:host=>self.hostname})
  #       #      else
  #       #        if @target.downcase =~ (/atl|las|orl|vegas/)
  #       #          @type = 'site'
  #       #          if target == 'las'
  #       #            @route = Datacenter.find_by_name('vegas')
  #       #          else
  #       #            @route = Datacenter.where("name like ?", "%#{target}%").first
  #       #          end
  #       #        else
  #       #          raise "Unknown target"
  #       #        end
  #     end
  #   end
  # 
  #   def remove
  #     if self.type == 'site'
  #       puts "site"
  #       self.send("remove_#{self.target}")
  #     elsif self.type == 'tropo'
  #       puts 'tropo'
  #     end
  # 
  #     #   self.inbound.in?
  #     #if self.is_site?
  #     #    phono.in?
  # 
  #     #    LabsRouting::Romeo.new({:browser=>self.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).remove
  #     #   LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).remove
  #   end
  # 
  # 
  #   def show
  #     if self.type == 'site'
  #       puts "site"
  #       self.send("")
  #     elsif self.type == 'tropo'
  #       @browser = Browser.find_by_hostname(self.browser.hostname)
  #       {
  #         :routing=>{
  #           :outbound=>LabsRouting::Outbound.new({:browser=>self.browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).in?,
  #           :inbound=>LabsRouting::Romeo.new({:browser=>self.browser.hostname,:tsig_key=>$config.dns.romeo.send(self.browser.datacenter.short_name).tsig_key}).in?
  #         }
  #       }
  #     end
  #   end
  # 
  #   private
  # 
  #   def method_missing(meth, *args, &block)
  #     if meth.to_s =~ /^is_(.+)$/
  #       find_my_type($1, *args, &block)
  #     else
  #       super
  #     end
  #   end
  # 
  #   def find_my_type(attrs, *args, &block)
  #     attrs.delete('?').eql?(self.type)
  #   end
  end

# Route.new('tropo204.orl.voxeo.net').in?
# Route.new('tropo204.orl.voxeo.net').status?
# Route.new('tropo204.orl.voxeo.net').show?
# Route.new('atl').in?
# Route.new('phono121.atl.voxeo.net').in?

# # Creating a Phono Routing object
#
#
#   # Adding / Removing a site from routing
#
#   @phono.add_atl
#   @phono.add_orl
#   @phono.add_las
#
#   @phono.remove_atl
#   @phono.remove_orl
#   @phono.remove_las
#
#   # Adding / Removing a browser from routing
#
#   @phono.add :host=>"phonogw121.atl.voxeo.net"
#   @phono.add :host=>"phonogw122.atl.voxeo.net"
#
#   @phono.delete :host=>"phonogw121.atl.voxeo.net"
#   @phono.delete :host=>"phonogw122.atl.voxeo.net"
