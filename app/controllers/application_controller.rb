class ApplicationController < ActionController::Base
  before_filter :auth

  before_filter :routing_admin, :only =>  [:new,:edit,:create,:destroy,:show]

  protect_from_forgery

  def auth
    authenticate_or_request_with_http_basic { |u, p|
      @user = User.new(u,p).user_data
      if @user
        session[:current_user] ||= @user
      else
        Rails.logger.debug { "Failed auth | #{u}" }
        request_http_basic_authentication
      end
    }
  end

  def super_admin
    unless super_admin?
      redirect_to root_url
    end
  end

  def routing_admin
    unless routing_admin?
      redirect_to root_url
    end
  end

  private

  def super_admin?
    session[:current_user][:roles].include?('BIZBLOG_SUPER_ADMIN')
  end

  def routing_admin?
    if super_admin?
      true
    else
      session[:current_user][:roles].include?('PLATFORM_OPS')
    end
  end

  helper_method :routing_admin?,:super_admin?


end
