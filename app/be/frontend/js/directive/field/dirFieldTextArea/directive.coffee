myApp.directive 'dirFieldTextArea', (directiveService, $timeout, modalService) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/field/dirFieldTextArea/template.html'
    replace: true
    transclude: true
    compile: ->
        post: (scope) ->
            directiveService.autoScopeImpl scope

            #params
            scope.errorMessage = ''
            scope.isValidationDefined = scope.getInfo().validationRegex? or scope.getInfo().validationFct?
            scope.hideIsValidIcon = !!scope.getInfo().hideIsValidIcon
            scope.fieldType = if scope.getInfo().fieldType? then scope.getInfo().fieldType else 'text'

            # the field is active ?
            scope.isActive = ->
                return !(scope.getInfo().active? and scope.getInfo().active() == false)

            #test is valid ?
            scope.isValid = ->
                isValid = undefined
                if scope.getInfo().disabled == true or scope.isActive() == false
                    scope.getInfo().isValid = true
                    return
                if !scope.getInfo().field[scope.getInfo().fieldName]?
                    scope.getInfo().field[scope.getInfo().fieldName] = ''
                isValid = true
                if typeof scope.getInfo().field[scope.getInfo().fieldName] != 'string'
                    scope.getInfo().field[scope.getInfo().fieldName] += ''
                if scope.getInfo().validationRegex?
                    isValid = scope.getInfo().field[scope.getInfo().fieldName].match(scope.getInfo().validationRegex)?
                if scope.getInfo().validationFct?
                    isValid = isValid and scope.getInfo().validationFct()
                scope.getInfo().isValid = isValid


            #set error message
            scope.setErrorMessage = (errorMessage) ->
                scope.errorMessage = errorMessage
                if scope.lastTimeOut?
                    $timeout.cancel scope.lastTimeOut
                scope.lastTimeOut = $timeout ->
                    scope.errorMessage = ''
                    scope.lastTimeOut = null
                , 2000

            #display error message
            scope.displayError = ->
                return scope.getInfo().isValid == false and scope.getInfo().firstAttempt == false

            #open calculator
            scope.openCalculator = ->
                modalService.openCalculatorModal new (result) ->
                    scope.getInfo().field[scope.getInfo().fieldName] = result

            #initialize
            if scope.getInfo().autoCompleteValue?
                scope.getInfo().autoCompleteValue = []
            if !scope.getInfo().field[scope.getInfo().fieldName]?
                scope.getInfo().field[scope.getInfo().fieldName] = ''
            if !scope.getInfo().isValid?
                scope.getInfo().isValid = !scope.isValidationDefined
            if scope.isValidationDefined
                scope.$watch 'getInfo().field[getInfo().fieldName]', (n, o) ->
                    scope.isValid()
            scope.$watch 'getInfo().active()', (o, n) ->
                if o != n
                    scope.isValid()
            , true
            scope.isValid()