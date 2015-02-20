GOOGLE = require('GOOGLE')
REACT = require('REACT')
Search = require('./views/search.js')
mapOptions = require('./configs/map-options.js')

#========

#Render Top-Level Component
(->
  parent = document.getElementById('plm-search-parent')
  REACT.render(Search(), parent))()


#Render Map
(->
  maps = GOOGLE.maps
  parent = document.getElementById('plm-map')
  maps.event.addDomListener(window, 'load', (->
    new maps.Map(parent, mapOptions))))()
