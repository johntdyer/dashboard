class RouteController < ApplicationController
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
    when 'phono'
      @gateway = Phono.find_by_hostname(params[:host])
      @gateway.add
      Rails.logger.debug "#{@gateway.hostname} added"
      render :json => {:browser=>@gateway.hostname,:zone=>"phono",:action=>"add"}

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
    when 'phono'
      @gateway = Phono.find_by_hostname(params[:host])
      @gateway.remove
      Rails.logger.debug "#{@gateway.hostname} removed"
      render :json => {:browser=>@gateway.hostname,:zone=>"phono",:action=>"remove"}

    else
      render :json =>"error"
    end
  end

  def show

    @browser = Browser.find_by_hostname(params[:id])
    @gateway = Phono.find_by_hostname(params[:id])
    if @browser
      render :json => {:routing=>{:inbound=>in_romeo?,:outbound=>in_outbound?}}
    elsif @gateway
      render :json => {:routing=>{:inbound=>@gateway.in?}}
    else
      render :text => {:routing=>"UnknownHost"}
    end
  end
end
