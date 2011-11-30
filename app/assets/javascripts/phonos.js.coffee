$(document).ready -> 
  (->
    all = $.event.props
    len = all.length
    res = []
    while len--
      el = all[len]
      res.push el  if el isnt "layerX" and el isnt "layerY"
    $.event.props = res
  )()

  oTable = $("#phonos_table").dataTable(
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