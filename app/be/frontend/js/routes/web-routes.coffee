test = (accountService) ->
    myself = accountService.getMyself()
    if myself == null
        'NOT_CONNECTED'
    else
        myself.type

initializeCommonRoutes = ->
    myApp.config ($routeProvider, $locationProvider) ->
        $routeProvider.when('/welcome',
            templateUrl: '/assets/js/view/web/welcome.html'
            controller: 'WelcomeCtrl'
            resolve: a: (accountService, $rootScope) ->
                $rootScope.$broadcast 'PROGRESS_BAR_START'
        ).when('/profile',
            templateUrl: '/assets/js/view/web/profile.html'
            controller: 'ProfileCtrl'
            resolve: a: (accountService, $location, $rootScope) ->
                $rootScope.$broadcast 'PROGRESS_BAR_START'
                if test(accountService) == 'NOT_CONNECTED'
                    $location.path '/'
        ).otherwise redirectTo: '/welcome/'
        # use the HTML5 History API
        $locationProvider.html5Mode true