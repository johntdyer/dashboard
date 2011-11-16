class ApplicationController < ActionController::Base
  before_filter :auth
  before_filter :routing_admin?, :only =>  [:new,:edit,:create,:destroy,:show]

  protect_from_forgery

  def log_event(opts={})
    opts={
      :username =>  (session[:current_user]['username'] if session[:current_user]),
      :asset    =>  opts[:asset],
      :ip       =>  request.remote_ip,
      :action   =>  opts[:action],
      :zone     =>  opts[:zone]
    }.merge!(opts)
    Journal.create(opts)
    Rails.logger.debug "[log_event] ==> #{opts}"
  end

  def auth
    unless session[:current_user]
      authenticate_or_request_with_http_basic { |u, p|
        @user = User.new(u,p)
        Rails.logger.debug { @user }
        if @user
          session[:current_user] ||= @user.user_data
        else
          log_event :action=>"Failed Auth",:asset=>"Authentication",:username=>u, :zone=>"-----"
          request_http_basic_authentication
        end
      }
    end
  end

  def super_admin?
    unless session[:current_user][:roles].include?('BIZBLOG_SUPER_ADMIN')
      redirect_to root_url
    end
  end

  def routing_admin?
    unless session[:current_user][:roles].include?('PLATFORM_OPS') || session[:current_user][:roles].include?('NOC') || session[:current_user][:roles].include?('BIZBLOG_SUPER_ADMIN')
      redirect_to root_url
    end
  end

  private

  helper_method :routing_admin?,:super_admin?

end
