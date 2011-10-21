module BrowsersHelper
  def shorten_hostname(host)
    h = host.split(".")
    "#{h[0]}.#{h[1]}"
  end

end
