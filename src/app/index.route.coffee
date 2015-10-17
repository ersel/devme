angular.module 'devme'
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'MainCtrl'

    $urlRouterProvider.otherwise '/'
    $locationProvider.html5Mode true
