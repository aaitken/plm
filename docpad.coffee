# DocPad Configuration File
# http://docpad.org/docs/config

Router = require('./local_modules/routes.coffee')

docpadConfig = {

  env: 'development'
  #env: 'production'
  outPath: 'out'

  #===========================================

  events:
    serverExtend: (options)->
      {server} = options
      docpad = @docpad
      router = new Router({server,docpad})
      router.route()

  #===========================================

}

# Export the DocPad Configuration
module.exports = docpadConfig
