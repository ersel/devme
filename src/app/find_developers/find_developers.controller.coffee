class FindDevelopersCtrl

  constructor: (@$state, @$http, @$scope, @$modal) ->
    @showDeveloperMessage  = false
    @showDevelopersList    = false
    @mapLocation           = false
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
      google.maps.event.trigger(@$scope.map, 'resize')
      @$scope.map.setCenter @mapLocation.geometry.location

  showMap: -> (typeof @mapLocation) is 'object'

  addMarker: (location) =>
    new google.maps.Marker
      position: location,
      map: @$scope.map,
      draggable: false,
      animation: google.maps.Animation.DROP

  showDevelopersList: -> @showDevelopersList
  listDevelopers:     -> @showDevelopersList = true

  devMe: ->
    @showDeveloperMessage = true
    @$modal.open
      animation:    true,
      templateUrl: 'app/message/message.html',
      size:        'lg'
angular.module('devme').controller 'FindDevelopersController', ['$state', '$http', '$scope', '$modal', FindDevelopersCtrl]
