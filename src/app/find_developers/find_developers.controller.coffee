class FindDevelopersCtrl

  constructor: (@$state, @$http, @$scope, @mapLocation) ->
    @mapLocation = null
    @skills = []
    @availableSkills = ['JavaScript', 'Java', 'Python', 'CSS', 'PHP', 'Ruby', 'C++', 'C', 'Shell', 'C#', 'Objective-C', 'R', 'VimL', 'Go', 'Perl', 'CoffeeScript', 'TeX', 'Swift', 'Scala', 'Emacs Lisp', 'Haskell', 'Lua', 'Clojure', 'Matlab', 'Arduino', 'Groovy', 'Puppet', 'Rust', 'PowerShell', 'Erlang', 'Visual Basic', 'Processing', 'Assembly', 'TypeScript', 'XSLT', 'ActionScript', 'ASP', 'OCaml', 'D', 'Scheme', 'Dart', 'Common Lisp', 'Julia', 'F#', 'Elixir', 'FORTRAN', 'Haxe', 'Racket', 'Logos']
    'ngInject'

  someStupidFnc: ->
    if (typeof @mapLocation) is 'object'
      console.log
      @$scope.map.setCenter @mapLocation.geometry.location

  listDevelopers: -> @$state.go 'findDevs.listDevelopers'

angular.module('devme').controller 'FindDevelopersController', ['$state', '$http', '$scope',   FindDevelopersCtrl]
