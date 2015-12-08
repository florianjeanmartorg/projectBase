myApp.directive 'dirFieldSelect', (directiveService, $timeout, modalService) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/field/dirFieldSelect/template.html'
    replace: true
    transclude: true
    compile: ->
        pre: (scope) ->
            directiveService.autoScopeImpl scope
        post: (scope) ->
            directiveService.autoScopeImpl scope
            if scope.getInfo().autoCompleteValue == undefined
                scope.getInfo().autoCompleteValue = []

            scope.isActive = ->
                return !(scope.getInfo().active? and scope.getInfo().active() == false)

            scope.errorMessage = ''
            scope.hideIsValidIcon = ! !scope.getInfo().hideIsValidIcon
            scope.fieldType = if scope.getInfo().fieldType? then scope.getInfo().fieldType else 'text'

            # is the field is valid ?
            scope.isValid = ->
                isValid = undefined
                if scope.getInfo().disabled == true or scope.isActive() == false
                    scope.getInfo().isValid = true
                    return
                isValid = scope.getInfo().optional? and scope.getInfo().optional() == true or scope.getInfo().field[scope.getInfo().fieldName]?
                scope.getInfo().isValid = isValid


            #watch option
            scope.$watch 'getInfo().options', (n, o) ->
                scope.computeResult()
                scope.isValid()

            #watch value
            scope.$watch 'getInfo().field[getInfo().fieldName]', (n, o) ->
                if n != o
                    scope.computeResult()
                scope.isValid()

            #compute result
            scope.computeResult = ->
                if scope.getInfo().comparableFct? and scope.getInfo().field[scope.getInfo().fieldName]?
                    for key of scope.getInfo().options
                        if scope.getInfo().comparableFct(scope.getInfo().options[key].key, scope.getInfo().field[scope.getInfo().fieldName])
                            scope.getInfo().field[scope.getInfo().fieldName] = scope.getInfo().options[key].key

            # set error message
            scope.setErrorMessage = (errorMessage) ->
                scope.errorMessage = errorMessage
                if scope.lastTimeOut?
                    $timeout.cancel scope.lastTimeOut
                scope.lastTimeOut = $timeout ->
                    scope.errorMessage = ''
                    scope.lastTimeOut = null
                , 2000

            #display error
            scope.displayError = ->
                return scope.getInfo().isValid == false and scope.getInfo().firstAttempt == false

            #initialization
            scope.isValid()