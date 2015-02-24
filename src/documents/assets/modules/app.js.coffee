---
browserify: true
---

GOOGLE = require('GOOGLE')
REACT = require('REACT')
Search = require('./views/search.js')
Map = require('./views/map.js')

#========

#Render Top-Level Component
(->
  parent = document.getElementById('plm-search-parent')
  REACT.render(Search(), parent))()

#Render Map
GOOGLE.maps.event.addDomListener(window, 'load', Map.singleton())
