class User
  require 'httparty'
  attr_reader :roles,:user_data

  include HTTParty

  def initialize(u,p)
    @user_data = User.get("#{$config.provisioning.api_endpoint}/user",:basic_auth => {:username => u, :password => p}).parsed_response

    if @user_data
      @user_data.merge!(:roles=>get_roles)
    end
  end

  def is_admin
    self.roles.include?('PLATFORM_OPS')
  end

  private

  def get_roles
    auth = {:username => $config.provisioning.username, :password => $config.provisioning.password}
    User.get("#{$config.provisioning.api_endpoint}/users/#{@user_data['username']}/roles",:basic_auth => auth).parsed_response.collect{|x| x["roleName"]}
  end

end
