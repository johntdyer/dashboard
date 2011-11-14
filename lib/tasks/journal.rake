namespace :journal do
  require 'awesome_print'
  task :purge => :environment do
    Journal.find(:all, :conditions => "created_at<='#{3.months.ago}'") do |r|
      puts "Deleting #{r.inspect}"
      r.destroy
    end
  end
  task :list => :environment do
    ap Journal.find(:all, :conditions => "created_at<='#{3.months.ago}'")
  end
end
