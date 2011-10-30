class RouteController < ApplicationController
  before_filter :authenticate_user!, :except=>[:index]

  def update
    @browser = Browser.find_by_hostname(params[:id])

    case params[:zone].split("_")[0]
      when 'romeo'
        Rails.logger.debug "#{params[:id]} added to romeo"
        LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).add
        render :json => {:browser=>@browser.hostname,:zone=>"inbound",:action=>"add"}
      when 'outbound'
        LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).add
        Rails.logger.debug "#{params[:id]} added to outbound"
        render :json => {:browser=>@browser.hostname,:zone=>"outbound",:action=>"add"}
      else
        render :json => "error"
      end
  end

  def destroy
    @browser = Browser.find_by_hostname(params[:id])

    case params[:zone]
      when 'romeo'
        Rails.logger.debug "#{params[:id]} removed from romeo"
        LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).remove
        render :json => {:browser=>@browser.hostname,:zone=>"inbound",:action=>"remove"}
      when 'outbound'
        LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).remove
        Rails.logger.debug "#{params[:id]} removed from outbound"
        render :json => {:browser=>@browser.hostname,:zone=>"outbound",:action=>"remove"}
      else
        render :json =>"error"
    end
  end

  def show
    @browser = Browser.find_by_hostname(params[:id])

    case params[:zone]
      when 'romeo'
        render :json => {:routing=>{:inbound=>LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).in?}}
      when 'outbound'
        render :json => {:routing=>{:outbound=>LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).in?}}
      else
        render :json => {
                        :routing=>{
                          :outbound=>LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).in?,
                          :inbound=>LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).in?
                        }
                      }
    end
  end
end



# -d  '{"method":"user_find","params":[[""],{}],"id":0}' \
# 
# #  curl -X DELETE "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"
#curl -X DELETE "http://127.0.0.1:3000/routing/romeo/tropo185.las.voxeo.net" -H "Content-Type: application/json"
#curl -X POST "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"