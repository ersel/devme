class MainCtrl

  constructor: (@$state) ->
    'ngInject'

  goToDevelopers: -> @$state.go 'findDevs'
  goToProjects:   -> @$state.go 'findProjects'

angular.module('devme').controller 'MainController', ['$state', MainCtrl]
