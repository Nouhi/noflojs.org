module.exports = ->
  # Project configuration
  @initConfig
    pkg: @file.readJSON 'package.json'

    connect:
      dev:
        options:
          hostname: '*'
          port: 4000
          base: '_site'

    sass:
      dev:
        options:
          # sourcemap: true
          style: 'expanded'
        files:
          'css/main.css': 'css/main.scss'

    jekyll:
      dev:
        options: {}

    docco:
      noflo:
        src: ['_src/src/lib/*.coffee']
        options:
          output: 'api/'
          template: '_docco/docco.jst'

    shell:
      gitclone:
        command: 'git clone git://github.com/noflo/noflo.git _src'

    watch:
      noflo:
        files: [
          '_docco/*.jst'
          '_src/**'
        ]
        tasks: ['docco']
      jekyll:
        files: [
          '_config.yml'
          'index.html'
          '**/*.html'
          '**/*.md'
          '**/*.js'
          '**/*.css'
          '**/_posts/*.md'
          # Ignore the generated files
          '!_site/**'
          '!_src/**'
        ]
        tasks: ['jekyll']
      sass:
        files: [
          'css/*.scss'
        ]
        tasks: ['sass']

  @loadNpmTasks 'grunt-jekyll'
  @loadNpmTasks 'grunt-shell'
  @loadNpmTasks 'grunt-docco'
  @loadNpmTasks 'grunt-contrib-connect'
  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-contrib-sass'

  @registerTask 'dev', [
    'connect:dev'
    'build'
    'watch'
  ]
  @registerTask 'build', [
    'sass'
    'shell:gitclone'
    'docco'
    'jekyll'
  ]
  @registerTask 'default', ['dev']