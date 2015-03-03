module.exports = class Multiton

  @multiton = (options = null)->
    @instances ?= []
    if options
      @instances.push new this(options)
    return @instances


  _removeInstance: (instance)->
    instances = @constructor.instances
    for item in instances
      if item is instance
        i = instances.indexOf(item)
        instances.splice(i, 1)
        return

    

