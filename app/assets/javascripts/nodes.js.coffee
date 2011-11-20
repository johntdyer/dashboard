# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
  oTable = $("#nodes_table").dataTable(
    bJQueryUI: true
    bScrollCollapse: true
    bPaginate: false
    bAutoWidth: false
    aoColumns: [
      {"sWidth":"20%"},
      {"sWidth":"20%"},
      {"sWidth":"20%"},
      {"sWidth":"12%"},
      {"sWidth":"12%"},
      {"sWidth":"16%","bSortable": false},
    ]
  )
