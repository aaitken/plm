GOOGLE = require('GOOGLE')
Map = require('./map.js')

#========

module.exports = class Marker

  constructor: (options)->
    @latLng = options.latLng
    @map = options.map
    @_init()


  _init: ->
    @marker = new GOOGLE.maps.Marker {
      position: @latLng
      draggable: true
      map: @map}
