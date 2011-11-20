$(document).ready -> 
  oTable = $("#browser_table").dataTable(
    bJQueryUI: true
    bScrollCollapse: true
    bPaginate: false
    bAutoWidth: false
    aoColumns: [
      {"sWidth":"30%"},
      {"sWidth":"30%"},
      {"sWidth":"25%","sClass": 'center'},
      {"sWidth":"10%","bSortable": false}
    ]
  )
    
  $('[class*=enable]').click ->
    parent = $(this).parent()
    hostname = $(parent).attr('data_hostname')
    route_type = $(parent).attr('data_type')
    button = $(this)
    
    request = updateRoute(route_type,hostname,"PUT")
    
    button.parent().ajaxLoader()
    
    request.success (data) ->  
      button.parent().ajaxLoaderRemove()
      $("[class*=disable]", parent).removeClass "selected"
      $(button).addClass "selected"
      $(".checkbox", parent).attr "checked", true

  $('[class*=disable]').click ->
    parent = $(this).parent()
    hostname = $(parent).attr('data_hostname')
    route_type = $(parent).attr('data_type')
    button = $(this)

    button.parent().ajaxLoader()

    request = updateRoute(route_type,hostname,"DELETE")
    
    request.success (data) ->
      button.parent().ajaxLoaderRemove()
      $("[class*=enable]", parent).removeClass "selected"
      $(button).addClass "selected"
      $(".checkbox", parent).attr "checked", false

  updateRoute = (route_type,route_target,route_action) ->
    $.ajax {
      type: route_action
      url: '/routing/' + route_type
      dataType: "json"
      complete: (xhr, textStatus, errorThrown) ->
        console.log textStatus + ' => ' + xhr.responseText
      error: (xhr, textStatus, errorThrown) ->
        console.warn textStatus
        console.warn xhr
      data: host: route_target
    }
  