class FindProjectsCtrl

  constructor: (@$state, @$http, @$scope, @$modal) ->
    @showProjectMessage  = false
    @showProjectsList    = false
    @mapLocation           = false
    @lastInfoWindow        = false
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

    @projects = []

    @$http.get('app/data/projects.json').success (data) =>
      @projects = data
      @addMarker project for project in @projects
    , (error) ->
      console.log error


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

  addMarker: (project) =>
    if !!project?
      contentString = '<div class="map-project">' +
        '<h4 class="map-project-title">' + project.name + '</h4>' +
        '<h5 class="map-project-title">' + project.author.name + '</h5>' +
          '<div class="map-project-description">' +
              project.description +
          '</div>' +
        '</div>'

      infowindow = new google.maps.InfoWindow(
        content: contentString
      )

      newMarker = new MarkerWithLabel(
        position:
          lat: project.latitude
          lng: project.longitude
        draggable: false
        icon: ' '
        map: @$scope.map
        labelContent: '<i class="fa fa-desktop fa-2x" style="color:#E84A5F;"></i>'
        labelAnchor: new (google.maps.Point)(22, 50)
        labelClass: 'labels')

    newMarker.addListener 'click', =>
      @lastInfoWindow.close() if @lastInfoWindow
      @lastInfoWindow = infowindow
      infowindow.open @$scope.map, newMarker
      return

    newMarker.addListener 'click', =>
      infowindow.open @$scope.map, newMarker

    google.maps.event.addListener infowindow, 'domready', =>
      $('.dev-me-map-btn').click => @devMe()

  showProjectsList: -> @showProjectsList
  listProjects:     -> @showProjectsList = true

  getProjects:      -> @projects

  devMe: ->
    @showDeveloperMessage = true
    @$modal.open
      animation:    true,
      templateUrl:  'app/message/message.html',
      size:         'lg',
      controller:   'MessageController',
      controllerAs: 'MessageCtrl',

  clickBack: -> location.reload()

angular.module('devme').controller 'FindProjectsController', ['$state', '$http', '$scope', '$modal', FindProjectsCtrl]
