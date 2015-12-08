myApp.controller 'BasicModalCtrl', ($scope, $flash, $modalInstance, businessService, accountService, translationService, param, $compile, directiveName, save, $timeout, title) ->

    #params
    $scope.title = title
    directive = $compile('<' + directiveName + ' ng-info="param"/>')($scope)
    $scope.loading = false
    $scope.param = param

    $scope.close = ->
        $modalInstance.close()

    $scope.setLoading = (value) ->
        param.disabled = value
        $scope.loading = value

    $scope.save = ->
        isValid = true
        if param.callBackSave?
            param.callBackSave()
        console.log param.isValid
        if param.isValid != undefined
            isValid = param.isValid
            param.displayErrorMessage = true
        if isValid
            $scope.setLoading true
            save $scope.close, $scope.setLoading

    #initalization
    $timeout ->
        $('.inject-data:first').append directive
    , 1