angular.module 'devme'
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'MainCtrl'
      .state 'findDev',
        url: '/developers'
        templateUrl: 'app/developers/developer.html'
        controller: 'FindDeveloperController'
        controllerAs: 'FindDeveloperCtrl'

    $urlRouterProvider.otherwise '/'
    $locationProvider.html5Mode true
