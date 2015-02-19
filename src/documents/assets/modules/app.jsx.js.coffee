GOOGLE = require('GOOGLE')
REACT = require('REACT')
$ = require('JQUERY')
Test = require('./index.js')
mapOptions = require('./map-options.js')

#========

#Render Top-Level Component
REACT.render(
  `<Test />,
  $('#example')[0]
  `)

#Render Map
maps = GOOGLE.maps
maps.event.addDomListener(window, 'load', (->
  new maps.Map($('#alex-map')[0], mapOptions)))
  
