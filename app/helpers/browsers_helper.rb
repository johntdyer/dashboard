module BrowsersHelper
  def shorten_hostname(host)
    h = host.split(".")
    "#{h[0]}.#{h[1]}"
  end


  def button_helper(zone)
    require 'ostruct'
    button = OpenStruct.new
    if zone.in?
      button.in_css    = "cb-enable selected"
      button.out_css    = "cb-disable"
      button.active = "checked"
      button.inactive = ""
      button.status = "checked"
    else
      button.in_css    = "cb-disable"
      button.out_css    = "cb-enable selected"
      button.active = ""
      button.inactive = ""
    end
    return button
  end
  
  def get_status(browser)
    {:routing=>{
      :outbound=>LabsRouting::Outbound.new({:browser=>browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).in?,
      :inbound=>LabsRouting::Romeo.new({:browser=>browser.hostname,:tsig_key=>$config.dns.romeo.send(browser.datacenter.short_name).tsig_key}).in?
    }
  }
  end
end
