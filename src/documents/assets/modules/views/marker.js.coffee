GOOGLE = require('GOOGLE')
Mixin = require('../mixins/mixin')
Multiton = require('../mixins/multiton')
MarkerWindow = require('./marker-window')

#=========

module.exports = class Marker extends Mixin

  # access via 'Marker.multiton'
  @use(Multiton)


  constructor: (options)->
    @event = GOOGLE.maps.event
    @MarkerWindow = MarkerWindow
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
    @event.addListener @marker, 'click', =>
      @_openForm()
      

  _clearDeleteTimeout: ->
    clearTimeout(@deleteTimeout)


  _deleteMarker: ->
    killMarker = =>
      @_removeInstance(this) # splice the multiton array
      @marker.setMap(null) # per google doc
      @marker = null # per google doc
    @deleteTimeout = setTimeout(killMarker, 650)


  _init: ->
    @marker = new GOOGLE.maps.Marker {
      position: @latLng
      draggable: true
      map: @map}
    @_attachEvents()


  _openForm: ->
    @markerWindow ?= new @MarkerWindow().markerWindow
    @markerWindow.open(@map, @marker)


  # _removeInstance = Multiton method
