module LabsRouting
  module Helpers

    def find_browser(b)
       result = Browser.where("hostname like ?", "#{b}%")
       if result.count.eql?(0)
         result
       elsif result.count.eql?(1)
         result.first
       elsif result.count > 1
         raise "Multiple results returned, expected one"
       else
         raise "DB Error"
       end
     end

     def get_datacenters
       Partition.find(:all, :select => "DISTINCT datacenter").collect(&:datacenter).reject{|x|x=='all' }
     end
  end
end