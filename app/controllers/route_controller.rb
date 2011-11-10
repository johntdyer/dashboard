class RouteController < ApplicationController
  before_filter :authenticate_user!, :except=>[:index,:show]

  def update
    if params[:hostname]
      @browser = Browser.find_by_hostname(params[:hostname])
    elsif params[:host]
      @browser = Browser.find_by_hostname(params[:host])
    elsif params[:browser]
      @browser = Browser.find_by_hostname(params[:browser])
    end

    case params[:zone].split("_")[0]
    when 'romeo'
      Rails.logger.debug "#{@browser.hostname} added to romeo"
      @browser.add :inbound
      render :json => {:browser=>@browser.hostname,:zone=>"inbound",:action=>"add"}
    when 'outbound'
      @browser.add :outbound
      Rails.logger.debug "#{@browser.hostname} added to outbound"
      render :json => {:browser=>@browser.hostname,:zone=>"outbound",:action=>"add"}
    else
      render :json => "error"
    end
  end

  def destroy

    if params[:hostname]
      @browser = Browser.find_by_hostname(params[:hostname])
    elsif params[:host]
      @browser = Browser.find_by_hostname(params[:host])
    elsif params[:browser]
      @browser = Browser.find_by_hostname(params[:browser])
    end

    case params[:zone]
    when 'romeo'
      Rails.logger.debug "#{@browser.hostname} removed from romeo"
      @browser.remove :inbound
      render :json => {:browser=>@browser.hostname,:zone=>"inbound",:action=>"remove"}
    when 'outbound'
      @browser.remove :outbound
      Rails.logger.debug "#{@browser.hostname} removed from outbound"
      render :json => {:browser=>@browser.hostname,:zone=>"outbound",:action=>"remove"}
    else
      render :json =>"error"
    end
  end

  def show
    @browser = Browser.find_by_hostname(params[:id])

    case params[:zone]
    when 'romeo'
      render :json => {:routing=>{:inbound=>in_romeo?}}
    when 'outbound'
      render :json => {:routing=>{:outbound=>in_outbound?}}
    else
      render :json => @browser.status
    end
  end
end



# -d  '{"method":"user_find","params":[[""],{}],"id":0}' \
#
# #  curl -X DELETE "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"
#curl -X DELETE "http://127.0.0.1:3000/routing/romeo/tropo185.las.voxeo.net" -H "Content-Type: application/json"
#curl -X POST "http://127.0.0.1:3000/routing/romeo/tropo203.orl.voxeo.net" -H "Content-Type: application/json"
