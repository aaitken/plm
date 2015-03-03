#http://elving.me/post/47457631121/mixins-in-coffeescript

module.exports = class Mixin
    @use = (mixins...) ->
        for mixin in mixins
          # static methods/properties from mixins
          @[key] = value for key, value of mixin
          # prototype methods/properties from mixins
          @::[key] = value for key, value of mixin::
        return this
