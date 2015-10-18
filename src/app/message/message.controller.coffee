class MessageCtrl

  constructor: (@$modalInstance) ->

  sendMessage: ->
    @$modalInstance.dismiss 'cancel'

angular.module('devme').controller 'MessageController', ['$modalInstance', MessageCtrl]
