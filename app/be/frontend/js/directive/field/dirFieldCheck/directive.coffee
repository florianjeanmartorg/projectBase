myApp.directive 'dirFieldCheck', (directiveService, $timeout) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/field/dirFieldCheck/template.html'
    replace: true
    transclude: true
    compile: ->
        post: (scope) ->
            directiveService.autoScopeImpl scope

            #params
            scope.errorMessage = ''
            scope.hideIsValidIcon = ! !scope.getInfo().hideIsValidIcon

            #if the field is active ?
            scope.isActive = ->
                !(scope.getInfo().active? and scope.getInfo().active() == false)

            # if the field is valid ?
            scope.isValid = ->
                if scope.getInfo().valid?
                    scope.getInfo().isValid = scope.getInfo().valid()
                else
                    scope.getInfo().isValid = true

            # watch the value of the field to test the validity
            scope.$watch 'getInfo().field[getInfo().fieldName]', () ->
                scope.isValid()

            #return the error message
            scope.setErrorMessage = (errorMessage) ->
                scope.errorMessage = errorMessage

                if scope.lastTimeOut != null
                    $timeout.cancel scope.lastTimeOut

                scope.lastTimeOut = $timeout ->
                    scope.errorMessage = ''
                    scope.lastTimeOut = null
                , 2000

            # display the error message
            scope.displayError = ->
                return scope.getInfo().isValid == false and scope.getInfo().firstAttempt == false

            #initialization
            #intialize the value for regex validation
            if scope.getInfo().field[scope.getInfo().fieldName] == null
                scope.getInfo().field[scope.getInfo().fieldName] = ''

            #test the validation
            scope.isValid()