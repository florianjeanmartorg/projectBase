myApp.controller 'ProfileCtrl', ($scope, modalService, accountService, $rootScope, $window, facebookService,translationService,$flash) ->

    #params
    $scope.model = accountService.model
    $scope.accountParam =
        updateMode: true
        dto: angular.copy(accountService.getMyself())
        disabled: true

    $scope.editPassword = ->
        modalService.openEditPasswordModal()

    $scope.personalEdit = ->
        $scope.oldLang = angular.copy($scope.accountParam.dto.lang)
        $scope.accountParam.disabled = false

    $scope.personalSave = ->
        $scope.accountParam.disabled = true
        accountService.editAccount $scope.accountParam.dto, ->
            if $scope.oldLang.code != $scope.accountParam.dto.lang.code
                $window.location.reload()

    $scope.personalCancel = ->
        $scope.accountParam.dto.firstname = accountService.getMyself().firstname
        $scope.accountParam.dto.lastname = accountService.getMyself().lastname
        $scope.accountParam.dto.email = accountService.getMyself().email
        $scope.accountParam.dto.gender = accountService.getMyself().gender
        $scope.accountParam.disabled = true


    #facebook link success
    $scope.facebookSuccess = (data)->
        accountService.setMyself data
        $flash.success translationService.get('--.profile.linkFacebook.success')

    #link to facebook
    $scope.fb_login = ->
        $scope.loading = true
        facebookService.linkToAccount null,(data) ->
            $scope.facebookSuccess data
            $scope.loading = false
        , (data) ->
            $scope.loading = false
            failed data

    #initialization
    $rootScope.$broadcast 'PROGRESS_BAR_STOP'

    #initialization
    $(window).scrollTop 0
    $rootScope.$broadcast 'PROGRESS_BAR_STOP'