module.exports = function(grunt) {

  grunt.util.linefeed = '\n';

  RegExp.quote = function (string) {
	return string.replace(/[-\\^$*+?.()|[\]{}]/g, '\\$&');
  };

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    meta: {
      defaultPath: 'bootflat'
    },

    banner: '/*\n * <%= pkg.name %> <%= pkg.version %>\n' +
		    ' *\n' +
		    ' * Description: <%= pkg.description %>\n' +
		    ' *\n' +
		    ' * Homepage: <%= pkg.homepage %>\n' +
		    ' *\n' +
		    ' * By @<%= pkg.author %>\n' +
		    ' *\n' +
		    ' * Last modify time: <%= grunt.template.today("yyyy-mm-dd") %>\n' +
		    ' *\n' +
		    ' * Licensed under the MIT license. Please see LICENSE for more information.\n' +
		    ' *\n' +
		    ' */\n',

    uglify: {
      options: {
          banner: '<%= banner %>',
          sourceMap: true,
          sourceMapIncludeSources: true
      },
      dist: {
        files: {
          'js/bootstrap.min.js': 'js/bootstrap.js',
          'js/site.min.js': [
            'js/jquery-1.10.1.min.js',
            'js/bootstrap.min.js',
            'js/icheck.min.js',
            'js/jquery.fs.stepper.min.js',
            'js/jquery.fs.selecter.min.js',
            'js/application.js'
          ]
        }
      }
    },
    csscomb: {
      options: {
        config: 'scss/.csscomb.json'
      },
      dist: {
        files: {
          'css/<%= pkg.name %>.css': 'css/<%= pkg.name %>.css'
        }
      }
    },
    cssmin: {
      options: {
          keepSpecialComments: 0,
          banner: '<%= banner %>',
      },
      dist: {
        files: {
          'css/bootstrap.min.css': 'css/bootstrap.css',
          'css/bootstrap-theme.min.css': 'css/bootstrap-theme.css',
          'css/site.min.css': [
            'css/bootstrap.min.css',
            'css/<%= pkg.name %>.css',
            'css/site.css'
          ],
          'css/<%= pkg.name %>.min.css': 'css/<%= pkg.name %>.css'
        }
      }
    },
    sass: {
      dist: {
        files: {
          'css/<%= pkg.name %>.css': 'scss/<%= pkg.name %>.scss'
        },
        options: {
          banner: '<%= banner %>',
          style: 'expanded',
          sourcemap: 'true'
        }
      }
    },
    csslint: {
      options: {
        csslintrc: 'scss/.csslintrc'
      },
      src: [
          'css/<%= pkg.name %>.css'
      ]
    },
    validation: {
      options: {
        charset: 'utf-8',
        doctype: 'HTML5',
        failHard: true,
        reset: true,
        relaxerror: [
          'Bad value apple-mobile-web-app-title for attribute name on element meta: Keyword apple-mobile-web-app-title is not registered.',
          'Bad value apple-mobile-web-app-status-bar-style for attribute name on element meta: Keyword apple-mobile-web-app-status-bar-style is not registered.',
          'Bad value X-UA-Compatible for attribute http-equiv on element meta.',
          'Attribute ontouchstart not allowed on element body at this point.'
        ]
      },
      files: {
        src: '*.html'
      }
    },
    jshint: {
            /*
                Note:
                In case there is a /release/ directory found, we don't want to lint that
                so we use the ! (bang) operator to ignore the specified directory
            */
            files: ['Gruntfile.js', 'js/application.js'],
            options: {
                curly:   true,
                eqeqeq:  true,
                immed:   true,
                latedef: true,
                newcap:  true,
                noarg:   true,
                sub:     true,
                undef:   true,
                boss:    true,
                eqnull:  true,
                browser: true,

                globals: {
                    // AMD
                    module:     true,
                    require:    true,
                    requirejs:  true,
                    define:     true,

                    // Environments
                    console:    true,

                    // General Purpose Libraries
                    $:          true,
                    jQuery:     true,

                    // Testing
                    sinon:      true,
                    describe:   true,
                    it:         true,
                    expect:     true,
                    beforeEach: true,
                    afterEach:  true
                }
            }
    },
   sed: {
      versionNumber: {
        pattern: (function () {
          var old = grunt.option('oldver');
          return old ? RegExp.quote(old) : old;
        })(),
        replacement: grunt.option('newver'),
        recursive: true
      }
    }

  });

  require('load-grunt-tasks')(grunt);
  require('time-grunt')(grunt);

  grunt.registerTask('task-css', ['sass', 'csscomb', 'cssmin']);
  grunt.registerTask('task-js', ['uglify']);
  grunt.registerTask('task', ['task-css', 'task-js']);
  grunt.registerTask('build', ['task']);
  grunt.registerTask('default', ['task']);
  grunt.registerTask('check-call', ['csslint', 'validation', 'jshint']);
  grunt.registerTask('check-css', ['csslint']);
  grunt.registerTask('check-html', ['validation']);
  grunt.registerTask('check-js', ['jshint']);

  // Version numbering task.
  // grunt change-version-number --oldver=A.B.C --newver=X.Y.Z
  // This can be overzealous, so its changes should always be manually reviewed!
  grunt.registerTask('change-version-number', 'sed');
};
