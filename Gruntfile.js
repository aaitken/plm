module.exports = function(grunt) {

  //command availability
  grunt.loadNpmTasks('grunt-browserify');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-react');
  grunt.loadNpmTasks('grunt-contrib-clean');

  //===========================================================================

  var config = {

   //modules
    browserify: {
      dist: {
        files: [{
          expand: true,
          cwd: 'out/assets/modules/',
          src: ['**/*.js'],
          dest: 'out/assets/modules/'
        }]
      }
    },

    clean: {
      globals: [
        'out/assets/globals/*.js',
        '!out/assets/globals/vendors.js'],
      jsx: ['out/assets/modules/**/*.jsx']
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
            'bower_components/react/react.js',
            'src/files/assets/globals/*.js']
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

    react: {
      dynamic_mappings: {
        files: [{
          expand: true,
          cwd: 'out/assets/modules/',
          src: ['**/*.jsx'],
          dest: 'out/assets/modules/',
          ext: '.js'
        }]
      }
    },

    sass: {
      dist: {
        files: [{
          expand: true,
          cwd: 'src/documents/assets/styles/',
          src: ['**/*.sass'],
          dest: 'out/assets/styles/',
          ext: '.css'
        }]
      }
    }

    
  }

  //===========================================================================
  
  //Project configuration
  grunt.initConfig(config);
  grunt.registerTask('default', '');
}
