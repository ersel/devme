class FindDevelopersCtrl

  constructor: (@$state, @$http, @$scope, @mapLocation) ->
    @mapLocation = null
    @skills = []
    'ngInject'

  updateMap: ->
    if (typeof @mapLocation) is 'object'
      @$scope.map.setCenter @mapLocation.geometry.location

###
  funcAsync: (query) ->
    console.log query
    reqStr = "https://api.stackexchange.com/2.2/tags?order=desc&sort=popular&site=stackoverflow&inname=" + query
    console.log query
    @$http.get(reqStr).then ((response) =>
      @availableSkills = response.data.items.map (item) -> item.name
      console.log response
      return
    ), ->
      console.log 'something seems to go slightly wrong'
      return
    return
###



angular.module('devme').controller 'FindDevelopersController', ['$state', '$http', '$scope',   FindDevelopersCtrl]
