module.exports = class Singleton

  @singleton = ->
    @instance ?= new this()
