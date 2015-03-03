GOOGLE = require('GOOGLE')
Mixin = require('../mixins/mixin')
Multiton = require('../mixins/multiton')
Map = require('./map.js')

#=========

module.exports = class Marker extends Mixin

  # access via 'Marker.multiton'
  @use(Multiton)


  constructor: (options)->
    @event = GOOGLE.maps.event
    @latLng = options.latLng
    @map = options.map
    @_init()


  _attachEvents: ->
    @event.addListener @marker, 'mousedown', =>
      @_deleteMarker()
    @event.addListener @marker, 'mouseup', =>
      @_clearDeleteTimeout()
    @event.addListener @marker, 'dragstart', =>
      @_clearDeleteTimeout()


  _clearDeleteTimeout: ->
    clearTimeout(@deleteTimeout)


  _deleteMarker: ->
    killMarker = =>
      @_removeInstance(this)
      @marker.setMap(null)
      @marker = null
    @deleteTimeout = setTimeout(killMarker, 650)


  _init: ->
    @marker = new GOOGLE.maps.Marker {
      position: @latLng
      draggable: true
      map: @map}
    @_attachEvents()


  # _removeInstance = Multiton method
