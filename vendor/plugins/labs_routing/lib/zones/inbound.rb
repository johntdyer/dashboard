module LabsRouting
  class Inbound
    include Helpers

    attr_reader :browser,:hostname,:datacenter,:zone_name,:nameserver,:port,:customer

    def initialize(args)
      IPSocket.getaddress(args[:browser]) unless args[:force]   # Make browser is resolvable

      @browser  = find_browser(args[:browser])
      @hostname = @browser.hostname
      @datacenter = @browser.datacenter

      if args[:tsig_key]
        @tsig_key = args[:tsig_key]
      else
        raise "key and key name required"
      end

      if args[:customer]
        @customer = args[:customer]
      else
        raise "inbound zone is for BYOS, customer name required"
      end

      @zone_name = args[:zone_name]   || "inbound.tropo.com"
      @key_name = args[:key_name]     || "ddns-#{args[:zone_name]}"
      @nameserver= args[:nameserver]  || 'master.dns.voxeo.net'
      @ttl = args[:ttl]               || 120
      @port = args[:port]             || 5060

    rescue SocketError
      raise "Error: Not a valid browser"
    end

    # Method to add a box to inbound carrier routing
    #
    def add
      modify_host(:method=>'delete')
    end
    # Method to remove a box from inbound carrier routing
    #

    def remove
      modify_host(:method=>'delete')
    end

    alias :delete :remove

    # Show romeo routing
    #
    # ====Examples
    # self.show

    def show
      `dig @#{@nameserver} axfr #{@zone_name}. | grep SRV`
    end
    # Simple method for determining the inbound routing status
    #
    def in?
      !check
    end

    def out?
      check
    end

    alias :in_routing? :in?

    private
    def check
      `dig @#{@nameserver} axfr #{@zone_name} | grep SRV | grep '#{@hostname}'`.empty?
    end

    def modify_host(args)
      `printf "update #{args[:method]} _sip._udp.#{@customer}.#{@zone_name}. #{@ttl} IN SRV 0 0 #{@port} #{@hostname}.\nsend\nquit" | nsupdate -y #{@key_name}:#{@tsig_key}`
    end

  end
end
