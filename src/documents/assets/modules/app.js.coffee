GOOGLE = require('GOOGLE')
REACT = require('REACT')
HelloWorld = require('./views/hello-world.js')
mapOptions = require('./configs/map-options.js')

#========

#Render Top-Level Component
parent = document.getElementById('example')
REACT.render(HelloWorld(), parent)

#Render Map
maps = GOOGLE.maps
parent = document.getElementById('map')
maps.event.addDomListener(window, 'load', (->
  new maps.Map(parent, mapOptions)))
