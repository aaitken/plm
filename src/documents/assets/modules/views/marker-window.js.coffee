GOOGLE = require('GOOGLE')
config = require('../configs/marker-form')

#=========

module.exports = class MarkerWindow

  constructor: ->
    @event = GOOGLE.maps.event
    @config = config
    @_init()


  _attachEvents: ->
    @event.addListener @markerWindow, 'closeclick', =>


  _init: ->
    @markerWindow = new GOOGLE.maps.InfoWindow(@config)
    @_attachEvents()
