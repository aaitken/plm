module.exports = function(grunt) {

  //command availability
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-clean');

  //===========================================================================

  var config = {

    //files need to be in place for browserify watch...
    //this can only be run as a manual task
    clean: {
      files: [
        "out/assets/modules/*/", 
        "out/assets/modules/*.js", 
        "!out/assets/modules/*.bundle.js"]
    },
    
    concat: {
      options: {
        separator: ';'
      },
      dist: {
        files: {
          'out/assets/globals/vendors.js': [
            'bower_components/jquery/dist/jquery.js',
            'bower_components/fastclick/lib/fastclick.js',
            'bower_components/foundation/js/foundation/foundation.js',
            'bower_components/react/react.js']
        }
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      my_target: {
        files: [{
          expand: true,
          cwd: 'out/assets/',
          src: ['**/*.js'],
          dest: 'out/assets/'
        }]
      }
    },

    cssmin: {
      target: {
        files: [{
          expand: true,
          cwd: 'out/assets/styles',
          src: ['**/*.css'],
          dest: 'out/assets/styles'
        }]
      }
    },

  }

  //===========================================================================
  
  //Project configuration
  grunt.initConfig(config);
}
