module ApplicationHelper


  def is_admin?
    session[:current_user][:roles].include?('PLATFORM_OPS') || session[:current_user][:roles].include?('NOC') || session[:current_user][:roles].include?('BIZBLOG_SUPER_ADMIN')
  end

  def is_super_admin?
    session[:current_user][:roles].include?('BIZBLOG_SUPER_ADMIN')
  end


end
