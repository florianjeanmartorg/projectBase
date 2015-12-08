myApp.directive 'compile', ($compile, $filter) ->
    (scope, element, attrs) ->
        scope.$watch ((scope) ->
            scope.$eval attrs.compile
        ), (value) ->
            value = $filter('translateText')(value)
            element.html value
            $compile(element.contents()) scope