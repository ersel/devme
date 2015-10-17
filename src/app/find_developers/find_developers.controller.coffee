class FindDevelopers

  constructor: (@$state) ->
    'ngInject'

angular.module('devme').controller 'FindDevelopersController', ['$state', FindDevelopersCtrl]
