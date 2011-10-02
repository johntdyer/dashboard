module LabsRouting
  module PhonoHelpers
    def find_datacenter(host)
      host.index(/(orl|atl|las)/) ? host.split(".")[1] : nil
    end

    def dc_short_name(dc)
      case dc.downcase
        when 'orlando','orl' then 'orl'
        when 'vegas','las' then 'las'
        when 'atl','atlanta' then 'atl'
        else
          raise "Unknown Datacenter"
        end
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
end