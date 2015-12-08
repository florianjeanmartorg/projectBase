myApp.directive 'headerBarCtrl', ($rootScope, languageService, $location, accountService, facebookService, modalService) ->
    restrict: 'E'
    scope: {}
    templateUrl: '/assets/js/directive/web/headerBar/template.html'
    replace: true
    compile: ->
        post: (scope) ->

            #params
            scope.currentLang = languageService.currentLang
            scope.languageService = languageService

            #use the model
            scope.myself = accountService.getMyself()
            scope.accountService = accountService

            scope.goTo = (url) ->
                $location.path url

            scope.navigateTo = (target) ->
                $location.path target

            #login open modal
            scope.login = ->
                modalService.openLoginModal()

            #registration open modal
            scope.registration = ->
                modalService.openRegistrationModal()

            #edit profile
            scope.editProfile = ->
                modalService.openEditProfileModal()

            #log out
            scope.logout = ->
                $rootScope.$broadcast 'LOGOUT'
                accountService.logout ->
                    $location.path '/'

            #
            # change lang
            #
            scope.$watch 'lang', ->
                if !angular.isUndefined(scope.lang)
                    languageService.changeLanguage scope.lang
