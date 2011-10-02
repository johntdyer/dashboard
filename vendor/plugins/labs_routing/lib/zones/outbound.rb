module LabsRouting
  class Outbound
    include Helpers
    attr_reader :browser

      def initialize(args)
        IPSocket.getaddress(args[:browser]) unless args[:force]   # Make browser is resolvable

        @browser  = find_browser(args[:browser])    
        
        @hostname  = @browser.hostname
        @datacenter = @browser.datacenter

        if args[:tsig_key]
          @tsig_key = args[:tsig_key]
        else
          raise "key and key name required"
        end

        @zone_name   = args[:zone_name]  || "outbound.tropo.com"
        @key_name    = args[:key_name]   || "ddns-#{@zone_name}"
        @nameserver  = args[:nameserver] || 'master.dns.voxeo.net'
        @ttl         = args[:ttl]        || 60

        rescue SocketError
          raise "Error: Not a valid browser"
      end

    # Method to add a box to outbound 'token' routing
    def add
      modify_host(:method=>'add')
    end

    # Method to remove a box from outbound 'token' routing
    def remove
      modify_host(:method=>'delete')
    end

    alias :delete :remove

    def show
      `dig @#{@nameserver} axfr #{@zone_name}. | grep NAPTR`
    end

    # Simple method for determining the routing status of the tropo cluster
    def in?
      !check
    end

    def out?
      check
    end

    alias :in_routing? :in?

    private

    def modify_host(args)
      @browser.partitions.each.collect(&:ppid).each do |ppid|
        `printf "update #{args[:method]} #{ppid}.#{@zone_name}.  #{@ttl}  IN  NAPTR 0 0 \\"u\\" \\"server+E2U\\" \\"\x21\x5e\x2e\x2A\\x24\x21#{IPSocket.getaddress(@hostname)}\x21\\" .\nsend\nquit" | nsupdate -y #{@key_name}:#{@tsig_key}`
      end
    end

    def check
      `dig @#{@nameserver} axfr #{@zone_name}. | grep NAPTR | grep '#{IPSocket.getaddress(@hostname)}'`.empty?
    end
  end
end
