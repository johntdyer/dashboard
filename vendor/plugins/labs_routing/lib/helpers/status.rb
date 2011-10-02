module LabsRouting
  module Status
    def self.method_missing(method_sym, *args, &block)
      result={}
      case method_sym.to_s
        when /^tropo.+/
          result={
            method_sym.to_sym=>{
                :inbound  =>  LabsRouting::Romeo.in?({:browser=>method_sym.to_s}),
                :outbound =>  LabsRouting::Outbound.in?({:browser=>method_sym.to_s}) 
              }
            }.merge!(result)
        when /^groupme.+/
          result={
            method_sym.to_sym=>{
                :inbound  =>  LabsRouting::Inbound.in?({:browser=>method_sym.to_s}),
                :outbound =>  LabsRouting::Outbound.in?({:browser=>method_sym.to_s}) 
              }
            }.merge!(result)
        else
          super
        end
      return result
    end
      
    def self.all      
      result = {}
         threads = []
         Browser.all.each{|b|
           threads << Thread.new(b) { |browser|
             if browser.hostname.start_with?('groupme')
               result={
                 browser.hostname=>{
                                 :inbound  =>  LabsRouting::Inbound.new({
                                                              :browser=>browser.hostname,
                                                              :tsig_key=>$config.dns.inbound.tsig_key,
                                                              :customer=>"groupme"
                                                            }).in?,
                                 :outbound =>  LabsRouting::Outbound.new({
                                                              :browser=>browser.hostname,
                                                              :tsig_key=>$config.dns.outbound.tsig_key
                                                            }).in?
                               }
                             }.merge!(result)
             else
               result={
                     browser.hostname=>{
                         :inbound  =>  LabsRouting::Romeo.new({
                                                       :browser=>browser.hostname,
                                                       :tsig_key=>$config.dns.romeo.send(browser.datacenter).tsig_key
                                                     }).in?,
                         :outbound =>  LabsRouting::Outbound.new({
                                                       :browser=>browser.hostname,
                                                       :tsig_key=>$config.dns.outbound.tsig_key
                                                     }).in?
                       }
                     }.merge!(result)
             end
           }
         }


         Gateway.all.each do |g|
           threads << Thread.new(g) do |phono|
             result={
               phono.hostname=>{
                 :inbound =>  LabsRouting::Phono.new({
                                              :host=>phono.hostname,
                                              :tsig_key=>$config.dns.phono.d.tsig_key
                                            }).in?
                 }
             }.merge!(result)
           end
         end

         threads.each { |aThread|  aThread.join }
         return result
    end
  end
end