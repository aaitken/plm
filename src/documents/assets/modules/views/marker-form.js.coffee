GOOGLE = require('GOOGLE')
config = require('../configs/marker-form')

#=========

module.exports = class MarkerForm

  constructor: ->
    @config = config
    @_init()


  _init: ->
    @markerForm = new GOOGLE.maps.InfoWindow(@config)

