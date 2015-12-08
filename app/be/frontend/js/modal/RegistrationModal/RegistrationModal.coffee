myApp.controller 'RegistrationModalCtrl', ($scope, $flash, $modal, $modalInstance, translationService, accountService, facebookService, modalService, fctToExecute, fctToExecuteParams) ->

    #params
    $scope.accountParam = {}

    $scope.close = ->
        $modalInstance.close()

    $scope.toBusinessRegistration = ->
        $scope.close()
        modalService.openBusinessRegistrationModal()

    #loading
    $scope.setLoading = (b)->
        $scope.loading=b
        $scope.accountParam.disabled = b

    #
    # facebook connection
    #
    $scope.fb_login = ->
        $scope.setLoading true
        facebookService.login ((data) ->
            accountService.setMyself data
            if data.type == 'BUSINESS'
                $location.path '/business/' + accountService.getMyself().businessId
            $scope.setLoading false
            $scope.close()
        ), (data) ->
            $flash.error data.message

    $scope.save = ->
        if !$scope.accountParam.isValid
            $scope.accountParam.displayErrorMessage = true
            $flash.error translationService.get('--.generic.error.complete.fields')
        else
            $scope.setLoading true
            accountService.registration $scope.accountParam.dto, (->
                $scope.setLoading false
                $flash.success translationService.get('--.login.flash.success')
                if fctToExecute?
                    fctToExecute fctToExecuteParams
                $scope.close()
            ), ->
                $scope.setLoading false