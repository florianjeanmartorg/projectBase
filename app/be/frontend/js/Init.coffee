myApp = angular.module('app', [
    'ngAnimate'
    'ui.bootstrap'
    'ui.bootstrap.datetimepicker'
    'angucomplete'
    'angularFileUpload'
    'ngRoute'
    'ngTable'
    'geolocation'
    'timer'
    'angular-flexslider'
])
app.config [
    '$locationProvider'
    ($locationProvider) ->
        $locationProvider.html5Mode
            enabled: true
            requireBase: false
        return
]
app.run [
    '$route'
    '$rootScope'
    '$location'
    ($route, $rootScope, $location) ->
        original = $location.path

        $location.path = (path, reload) ->
            if reload == false
                lastRoute = $route.current
                un = $rootScope.$on('$locationChangeSuccess', ->
                    $route.current = lastRoute
                    un()
                    return
                )
            original.apply $location, [ path ]

        return
]