angular.module 'devme'
  .controller 'FindDeveloperController', ($timeout, $http, webDevTec, toastr) ->
    'ngInject'
    vm = this
    vm.skills = []
    vm.availableSkills = []
    activate = ->
      getWebDevTec()
      $timeout (->
        vm.classAnimation = 'rubberBand'
        return
      ), 4000
      return

    showToastr = (balls) ->
      alert "sdasd"
      toastr.info 'Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'
      vm.classAnimation = ''
      return

    funcAsync = (query) ->
      console.log query
      reqStr = "https://api.stackexchange.com/2.2/tags?order=desc&sort=popular&site=stackoverflow&inname=" + query
      console.log query
      $http.get(reqStr).then ((response) ->
        vm.availableSkills = response.data.items.map (item) -> item.name
        console.log response
        return
      ), ->
        console.log 'ERROR!!!'
        return
      return

    getWebDevTec = ->
      vm.awesomeThings = webDevTec.getTec()
      angular.forEach vm.awesomeThings, (awesomeThing) ->
        awesomeThing.rank = Math.random()
        return
      return

    vm.awesomeThings = []
    vm.classAnimation = ''
    vm.creationDate = 1445100751937
    vm.funcAsync = funcAsync
    activate()
    return
