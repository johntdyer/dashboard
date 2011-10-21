class RouteController < ApplicationController
#  before_filter :authenticate_user!, :except=>[:index]

  def update
    @browser = Browser.find_by_hostname(params[:id])

    case params[:zone]
      when 'romeo'
        Rails.logger.debug "#{params[:id]} added to romeo"
        LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).add
      when 'outbound'
        LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).add
        Rails.logger.debug "#{params[:id]} added to outbound"
      end
    render :json => {:response=>"ok",:code=>200}
  end

  def destroy
    @browser = Browser.find_by_hostname(params[:id])

    case params[:zone]
      when 'romeo'
        Rails.logger.debug "#{params[:id]} removed from romeo"
        LabsRouting::Romeo.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.romeo.send(@browser.datacenter.short_name).tsig_key}).remove
      when 'outbound'
        LabsRouting::Outbound.new({:browser=>@browser.hostname,:tsig_key=>$config.dns.outbound.tsig_key}).remove
        Rails.logger.debug "#{params[:id]} removed from outbound"
    end
    render :json => {:response=>"ok",:code=>200}
  end
end


# -d  '{"method":"user_find","params":[[""],{}],"id":0}' \
# 
# #  curl -X DELETE "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"
#curl -X DELETE "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"
#curl -X POST "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"