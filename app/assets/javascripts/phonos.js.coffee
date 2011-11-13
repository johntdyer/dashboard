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
