GOOGLE = require('GOOGLE')
Map = require('./map.js')

#=========

module.exports = class Marker

  constructor: (options)->
    @event = GOOGLE.maps.event
    @latLng = options.latLng
    @map = options.map
    @_init()


  _attachEvents: ->
    @event.addListener @instance, 'mousedown', =>
      @_deleteMarker()
    @event.addListener @instance, 'mouseup', =>
      @_clearDeleteTimeout()
    @event.addListener @instance, 'dragstart', =>
      @_clearDeleteTimeout()


  _clearDeleteTimeout: ->
    clearTimeout(@deleteTimeout)


  _deleteMarker: ->
    killMarker = =>
      @instance.setMap(null)
      @instance = null #todo : update multiton
    @deleteTimeout = setTimeout(killMarker, 650)


  _init: ->
    @instance = new GOOGLE.maps.Marker {
      position: @latLng
      draggable: true
      map: @map}
    @_attachEvents()
    @_makeReference()


  #multiton-ize
  _makeReference: ->
    if ! @constructor[0] then index = 0
    else index = @constructor.length
    @constructor[index] = @instance
    console.log @constructor
