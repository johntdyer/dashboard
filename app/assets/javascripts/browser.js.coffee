$(document).ready -> 
  $('#example').dataTable()
  #$("select, input:checkbox, input:radio, input:file").uniform()#{'checkboxClass':'routingCheckbox'})
  #current_status=""
  if Boolean($('#romeo_routing_div').attr('data_in_routing'))
    console.log "Inbound: out routing"
    
    $("#romeo_routing_div").css("background-color","green")
  else 
    console.log "Inbound: in routing"
    $("#romeo_routing_div").css("background-color","red")

  if Boolean($('#outbound_routing_div').attr('data_in_routing'))
    console.log "Outbound: out routing"
    $("#outbound_routing_div").css("background","green")
  else 
    console.log "Outbound: in routing"
    $("#outbound_routing_div").css("background","red")
    
   updateRoute = (route_type,route_target,route_action) ->
     $.ajax {
       type: 'PUT'
       url: '/routing'
       dataType: "json"
       success: (xhr, textStatus, errorThrown) ->
         console.log xhr.code
         console.log xhr.response
       complete: (xhr, textStatus, errorThrown) ->
       error: (xhr, textStatus, errorThrown) ->
         console.warn textStatus
         console.warn xhr
       data: route_type: route_type, route_target: route_target, route_action: route_action
     }

   $(".routingButton").click ->
    route_action ="" 
    if $(this).css("background-color") == 'rgb(0, 128, 0)'
      route_action = "remove"
    else
      route_action = "add"
     
     console.log route_action
    #console.log $(this).attr('data_in_routing')
     route_type = $(this).attr('id');
     route_target = $(this).attr('data_browser_hostname')
     if ($(this).css("background-color") == 'rgb(0, 128, 0)')
       $("##{this.id}").css("background","red")
       updateRoute(route_type,route_target,route_action)
     else
       $("##{this.id}").css("background","green") 
       updateRoute(route_type,route_target,route_action)
