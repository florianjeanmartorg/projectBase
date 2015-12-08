myApp.controller 'ForgotPasswordModalCtrl', ($scope, $http, $flash, $modalInstance, $filter, email, accountService) ->

    $scope.loading = false
    $scope.dto = email: email
    $scope.fields = email:
        fieldType: 'email'
        name: 'email'
        fieldTitle: '--.changeEmailModal.email'
        validationRegex: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        validationMessage: '--.generic.validation.email'
        focus: ->
            true
        disabled: ->
            $scope.loading
        field: $scope.dto
        fieldName: 'email'

    $scope.close = ->
        $modalInstance.close()

    #
    # validation : watching on field
    #
    $scope.$watch 'fields', ->
        validation = true
        for key of $scope.fields
            obj = $scope.fields[key]
            if $scope.fields.hasOwnProperty(key) and (!obj.isValid? or obj.isValid == false)
                obj.firstAttempt = !$scope.displayErrorMessage
                validation = false
        $scope.isValid = validation
    , true

    #
    # display error watching
    #
    $scope.$watch 'displayErrorMessage', ->
        for key of $scope.fields
            obj = $scope.fields[key]
            obj.firstAttempt = !$scope.displayErrorMessage

    $scope.save = ->
        if $scope.isValid
            $scope.loading = true
            accountService.forgotPassword $scope.dto, ->
                $flash.success $filter('translateText')('--.forgotPassword.success')
                $scope.loading = false
                $scope.close()
            , ->
                $scope.loading = false
        else
            $scope.displayErrorMessage = true