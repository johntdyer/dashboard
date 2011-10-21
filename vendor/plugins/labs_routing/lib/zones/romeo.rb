module LabsRouting
  class Romeo
    include Helpers

    attr_reader :browser

      def initialize(args)
        IPSocket.getaddress(args[:browser]) unless args[:force]   # Test to ensure browser is resolvable

        @browser  = Browser.find_by_hostname(args[:browser])
        @hostname  = @browser.hostname
        @datacenter = @browser.datacenter.short_name

        if args[:tsig_key]
           @tsig_key = args[:tsig_key]
        else
          raise "key and key name required"
        end

        @zone_name   = args[:zone_name]  || "romeo.#{@datacenter}.tropo.com"
        @key_name    = args[:key_name]   || "ddns-#{@zone_name}"
        @nameserver  = args[:nameserver] || 'master.dns.voxeo.net'
        @port        = args[:port]       || 5061
        @ttl         = args[:ttl]        || 120

        rescue SocketError
          raise "Error: Not a valid browser"
      end

    # Method to add a box to inbound 'romeo' routing
    def add
      modify_host(:method=>'add')
    end

    # Method to remove a box from inbound 'token' routing
    def remove
      modify_host(:method=>'delete')
    end


    # Show romeo routing
    def show
      `dig @#{@nameserver} axfr #{@zone_name}. | grep SRV`
    end

    # Simple method for determining the inbound routing status
    def in?
      !check
    end

    def out?
      check
    end

    alias :in_routing? :in?

    private

      def modify_host(args)
        @browser.partition_platforms.each.collect(&:ppid).each do |ppid|
          `printf "update #{args[:method]} _sip._udp.ppid#{ppid}.#{@zone_name}. #{@ttl} IN SRV 0 5 #{@port} #{@hostname}.\nsend\nquit" | nsupdate -y #{@key_name}:#{@tsig_key}`
        end
      end

      def check
        `dig @#{@nameserver} axfr #{@zone_name} | grep SRV | grep '#{@hostname}'`.empty?
      end

  end
end