$LOAD_PATH.unshift(File.dirname(__FILE__))



%w(
    cgi 
    yaml
    socket
    active_record
    sqlite3
    logger
    time
    date
    awesome_print
  ).each { |lib| require lib }

%w(
    helpers/helpers
    helpers/config
    helpers/status
    helpers/phono_helpers
  ).each {|lib| require lib }


%w(
    zones/romeo
    zones/inbound
    zones/outbound
    zones/phono
    db/database
  ).each { |lib| require lib }

# %w(
#     models/browser
#     models/partition
#     models/gateway
#     
#   ).each { |lib| require lib }    
