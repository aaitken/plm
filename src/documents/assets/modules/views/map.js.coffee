GOOGLE = require('GOOGLE')
$ = require('JQUERY')
mapOptions = require('../configs/map-options.js')

#========

class Map

  @singleton: ->
    @instance ?= new this()


  constructor: ->
    @event = GOOGLE.maps.event
    @parent = document.getElementById('plm-map')
    @init()


  init: ->
    @map = new GOOGLE.maps.Map(@parent, mapOptions)
    @event.addListener @map, 'mousedown', =>
      @add(event)
    @event.addListener @map, 'dragstart', =>
      @clearAddTimeout()


  add: (e)->
    @addTimeout = setTimeout (->
      console.log 'hey'), 650
    $(e.target).one 'mouseup', =>
      @clearAddTimeout()


  clearAddTimeout: ->
    clearTimeout(@addTimeout)


module.exports = Map
