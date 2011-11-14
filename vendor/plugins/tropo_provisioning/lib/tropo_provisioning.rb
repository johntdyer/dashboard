module TropoProvisioningConfig
  def self.new(params={})
    username = params[:username] || ENV['PROV_API_UNAME']
    password = params[:password] || ENV['PROV_API_PASSWD']
    base_uri = params[:base_uri] || ENV['PROV_API_BASE_URI']
  end
end
