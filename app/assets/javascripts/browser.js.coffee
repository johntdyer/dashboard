$(document).ready -> 
  $('#example').dataTable({
    "iDisplayLength": 25
  })

  $(".cb-enable").click ->
    parent = $(this).parents(".switch")
    hostname = $(parent).attr('data_hostname')
    route_type = $(parent).attr('data_type')
   
    button = $(this)
    
    request = updateRoute(route_type,hostname,"PUT")
    request.success (data) ->
      $(".cb-disable", parent).removeClass "selected"
      $(button).addClass "selected"
      $(".checkbox", parent).attr "checked", true
     
  
  $(".cb-disable").click ->
    parent = $(this).parents(".switch") 
    hostname=$(parent).attr('data_hostname')
    route_type = $(parent).attr('data_type')
    button = $(this)
    
    request = updateRoute(route_type,hostname,"DELETE")
    request.success (data) -> 
      $(".cb-enable", parent).removeClass "selected"
      $(button).addClass "selected"
      $(".checkbox", parent).attr "checked", false
  
   updateRoute = (route_type,route_target,route_action) ->
     $.ajax {
       type: route_action
       url: '/routing/' + route_type
       dataType: "json"
       success: (xhr, textStatus, errorThrown) ->
         #console.log xhr
         #console.log textStatus
       complete: (xhr, textStatus, errorThrown) ->
         console.log textStatus + ' => ' + xhr.responseText
       error: (xhr, textStatus, errorThrown) ->
         console.warn textStatus
         console.warn xhr
       data: host: route_target #, route_target: route_target, route_action: route_action
     }

  