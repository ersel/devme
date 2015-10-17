class FindProjects

  constructor: (@$state) ->
    'ngInject'

angular.module('devme').controller 'FindProjectsController', ['$state', FindProjectsCtrl]
