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

  ignoreCustomPatterns: /\.sass/

  #===========================================

  environments:

    development: #------------------------DEV

      plugins:

        #grunt
        #no uglification of scripts
        grunt:
          writeAfter: ['concat', 'react', 'browserify', 'sass', 'clean']

    ###
      templateData:

        env: 'development'
        #local images
        site:
          assetsRoot: '/assets'
    ###


    production: #------------------------PROD

      plugins:

        #natural htmlmin (via docpad, apparently)
        grunt:
          writeAfter: false
          generateAfter: ['concat', 'react', 'browserify', 'sass', 'clean', 'uglify', 'cssmin']

      templateData:

        env: 'production'
        #cdn images
        site:
          assetsRoot: '' #cloudfront or other

}

# Export the DocPad Configuration
module.exports = docpadConfig
