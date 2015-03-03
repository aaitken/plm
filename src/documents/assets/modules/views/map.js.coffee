GOOGLE = require('GOOGLE')
$ = require('JQUERY')
Marker = require('./marker')
mapOptions = require('../configs/map-options.js')

#=========

module.exports = class Map

  @singleton: ->
    @instance ?= new this()


  constructor: ->
    @event = GOOGLE.maps.event
    @parent = document.getElementById('plm-map')
    @Marker = Marker
    @_init()


  _add: (e)->
    makeMarker = =>
      new @Marker {
        latLng: e.latLng
        map: @map}
    @addTimeout = setTimeout(makeMarker, 650)


  _attachEvents: ->
    @event.addListener @map, 'mousedown', (event)=>
      @_add(event)
    @event.addListener @map, 'dragstart', =>
      @_clearAddTimeout()
    @event.addListener @map, 'mouseup', =>
      @_clearAddTimeout()


  _clearAddTimeout: ->
    clearTimeout(@addTimeout)


  _init: ->
    @map = new GOOGLE.maps.Map(@parent, mapOptions)
    @_attachEvents()
