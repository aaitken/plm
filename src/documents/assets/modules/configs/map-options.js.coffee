---
browserify: true
---

GOOGLE = require('GOOGLE')

#========

maps = GOOGLE.maps

module.exports = {
  center:
    lat: 39.7391667
    lng: -104.9841667
  panControl: false,
  zoomControl: true,
  zoomControlOptions:
    style: maps.ZoomControlStyle.DEFAULT
    position: maps.ControlPosition.LEFT_CENTER
  mapTypeControl: true,
  scaleControl: true,
  streetViewControl: true,
  overviewMapControl: true
  zoom: 10}
