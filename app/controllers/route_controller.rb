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
        @browser.add :inbound
        log_event :action=>"add",:asset=>@browser.hostname,:zone=>'inbound'
        render :json => {:browser=>@browser.hostname,:zone=>"inbound",:action=>"add"}
      when 'outbound'
        @browser.add :outbound
        log_event :action=>"add",:asset=>@browser.hostname,:zone=>'outbound'
        render :json => {:browser=>@browser.hostname,:zone=>"outbound",:action=>"add"}
      when 'phono'
        @gateway = Phono.find_by_hostname(params[:host])
        @gateway.add
        log_event :action=>"add",:asset=>@browser.hostname,:zone=>'phono'
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
      @browser.remove :inbound
      log_event :action=>"remove",:asset=>@browser.hostname,:zone=>'inbound'
      render :json => {:browser=>@browser.hostname,:zone=>"inbound",:action=>"remove"}
    when 'outbound'
      @browser.remove :outbound
      log_event :action=>"remove",:asset=>@browser.hostname,:zone=>'outbound'
      render :json => {:browser=>@browser.hostname,:zone=>"outbound",:action=>"remove"}
    when 'phono'
      @gateway = Phono.find_by_hostname(params[:host])
      @gateway.remove
      log_event :action=>"remove",:asset=>@browser.hostname,:zone=>'phono'

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
