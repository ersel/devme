class FindDevelopersCtrl

  constructor: (@$state, @$http, @$scope, @mapLocation) ->
    @mapLocation = null
    @skills = []
    @availableSkills = ['JavaScript', 'Java', 'Python', 'CSS', 'PHP', 'Ruby', 'C++', 'C']
    newSkills = ['Shell', 'C#', 'Objective-C', 'R', 'VimL', 'Go', 'Perl', 'CoffeeScript']
    @availableSkills.push newSkills...
    newSkills = ['TeX', 'Swift', 'Scala', 'Emacs Lisp', 'Haskell', 'Lua', 'Clojure', 'Matlab', 'Arduino', 'Groovy']
    @availableSkills.push newSkills...
    newSkills = ['Puppet', 'Rust', 'PowerShell', 'Erlang', 'Visual Basic', 'Processing', 'Assembly', 'TypeScript', 'XSLT']
    @availableSkills.push newSkills...
    newSkills = ['ActionScript', 'ASP', 'OCaml', 'D', 'Scheme', 'Dart', 'Common Lisp', 'Julia', 'F#', 'Elixir']
    @availableSkills.push newSkills...
    newSkills = ['FORTRAN', 'Haxe', 'Racket', 'Logos']
    @availableSkills.push newSkills...

    'ngInject'

  updateMap: ->
    if (typeof @mapLocation) is 'object'
      @$scope.map.setCenter @mapLocation.geometry.location

  listDevelopers: -> @$state.go 'findDevs.listDevelopers'

angular.module('devme').controller 'FindDevelopersController', ['$state', '$http', '$scope',   FindDevelopersCtrl]
