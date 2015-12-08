myApp.directive 'dirFocusMe', ->
    restrict: 'A'
    scope: dirFocusMe: '='
    link: (scope, element) ->
        scope.$watch 'dirFocusMe', ->
            if scope.dirFocusMe == true
                return element[0].focus()