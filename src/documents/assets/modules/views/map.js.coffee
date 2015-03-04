GOOGLE = require('GOOGLE')
Mixin = require('../mixins/mixin')
Singleton = require('../mixins/singleton')
Marker = require('./marker')
config = require('../configs/map')

#=========

module.exports = class Map extends Mixin

  # access via 'Map.singleton()'
  @use(Singleton)


  constructor: ->
    @config = config
    @event = GOOGLE.maps.event
    @parent = document.getElementById('plm-map')
    @Marker = Marker
    @_init()


  _add: (e)->
    makeMarker = =>
      @Marker.multiton {
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
    @map = new GOOGLE.maps.Map(@parent, @config)
    @_attachEvents()
