module LabsRouting
  class Phono
    include Helpers
    include PhonoHelpers
    attr_reader :zone_name

    def initialize(args)
      if args[:tsig_key]
        @tsig_key = args[:tsig_key]
      else
        raise ArgumentError, "tsig_key required"
      end

      @zone_name   = "d.phono.com"
      @hostname    =  args[:host]
      @key_name    = args[:key_name]   || "ddns-#{@zone_name}"
      @nameserver  = args[:nameserver] || 'master.dns.voxeo.net'
      @port        = args[:port]       || 5222
      @ttl         = args[:ttl]        || 60

    rescue Exception => e
      puts e
      puts e.backtrace.join("\n")
    end

    def method_missing(method_sym, *args, &block)
      if method_sym.to_s =~ /^(remove|delete|add)_(.+)/
        if Regexp.last_match[1].start_with?('remove','delete')
          modify_site(:site=>dc_short_name("#{Regexp.last_match[2]}"),:method=>'delete')
        elsif Regexp.last_match[1].start_with?('add')
          modify_site(:site=>dc_short_name("#{Regexp.last_match[2]}"),:method=>'add')
        end
      else
        super
      end
    end

    def add(args)
      modify_host(:host=>args[:host],:method=>'add')
    end

    def delete(args)
      modify_host(:host=>args[:host],:method=>'delete')
    end


    # Simple method for determining the inbound routing status
    def in?
      if @hostname
        !check
      else
        raise "Object not instantiated with host"
      end
    end

    def out?
      if @hostname
        check
      else
        raise  "Object not instantiated with host"
      end
    end

    private

    ## Add or remove a host from routing
    def modify_host(args)
      if args[:host]
        Kernel.system "printf \"update #{args[:method]} _xmpp-client._tcp.gw.#{find_datacenter(args[:host])}-internal.d.phono.com. #{@ttl} IN SRV 10 0 #{@port} #{args[:host]}.\nsend\nquit\" | nsupdate -y #{@key_name}:#{@tsig_key}"
      else
        raise "Browser required"
      end
    end

    ## Add or remove a datacenter from routing
    def modify_site(args)
      if args[:site] && args[:site] != 'orl'
        `printf "update #{args[:method]} lb.d.phono.com.  #{@ttl} A #{lb_address(args[:site])}\nsend\nquit" | nsupdate -y #{@key_name}:#{@tsig_key}`
      else
        raise "Site Required"
      end
    end

    def check
      `dig @#{@nameserver} axfr #{@zone_name} | grep SRV | grep '#{@hostname}'`.empty?
    end


  end
end
