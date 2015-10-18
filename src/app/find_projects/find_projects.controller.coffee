class FindProjectsCtrl

  constructor: (@$state, @$http, @$scope, @$modal) ->
    @showProjectMessage  = false
    @showProjectsList    = false
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

    @projects = ['My awesome project!', 'Call me maybe']

    'ngInject'

  refreshResults: ($select) ->
    search = $select.search
    list = angular.copy($select.items)
    FLAG = -1
    #remove last user input
    list = list.filter((item) ->
      item.id != FLAG
    )
    if !search
      #use the predefined list
      $select.items = list
    else
      #manually add user input and set selection
      userInputItem = search
      if list.filter((elem) -> elem == search).length is 0
        $select.items = [ userInputItem ].concat(list)
    return

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

  showProjectsList: -> @showProjectsList
  listProjects:     -> @showProjectsList = true

  devMe: ->
    @showProjectMessage = true
    @$modal.open
      animation:    true,
      templateUrl: 'app/message/message.html',
      size:        'lg'
angular.module('devme').controller 'FindProjectsController', ['$state', '$http', '$scope', '$modal', FindProjectsCtrl]
