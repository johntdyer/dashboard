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
    helpers/config
    db/database
  ).each { |lib| require lib }
