#
# initialization external modules
#
#
# initialize routes
#
initializeCommonRoutes()
#
# main ctrl
#
myApp.controller 'MainCtrl', ($rootScope, $scope, $locale, translationService, $window, facebookService, languageService, $location, modalService, accountService, $timeout, constantService) ->

    $scope.navigateTo = (target) ->
        $location.path target

    #
    # initialize translations
    # load from data var and insert into into translationService
    #
    if 'data' of window and data != undefined and data != null
        translationService.set data.translations
        constantService.fileBucketUrl = data.fileBucketUrl
        constantService.urlBase = data.urlBase
        #add constants
        for key of data.constants
            constantService[key] = data.constants[key]
        constantService.isMobile = data.isMobile
    #import data
    #store the current user into the model
    accountService.setMyself data.mySelf
    facebookService.facebookAppId = data.appId
    languageService.setLanguages lang, languages
    #
    #facebook initialization
    #
    facebookService.ini()
    #catch url
    if $location.url().indexOf('registration') != -1 and accountService.getMyself() == null
        modalService.openRegistrationModal()
    else if $location.url().indexOf('login') != -1 and accountService.getMyself() == null
        modalService.openLoadingModal()
    #
    # help functionalities
    #
    $scope.helpDisplayed = false

    $scope.displayHelp = ->
        $scope.helpDisplayed = true

    $scope.maskHelp = ->
        $scope.helpDisplayed = false

    $scope.openHelp = (message) ->
        modalService.openHelpModal message

    #
    # progress bar
    #
    $scope.progressBarWidth = 0
    progressBarMultiplicator = 2
    $scope.progressBarCss = width: $scope.progressBarWidth + '%'
    $rootScope.$on 'PROGRESS_BAR_START', ->
        $scope.progress()

    $scope.progress = ->
        $scope.progressBarWidth++
        if $scope.progressBarWidth < 50 * progressBarMultiplicator
            $timeout (->
                $scope.progress()
            ), 1000 / 100 * progressBarMultiplicator
        else if $scope.progressBarWidth < 75 * progressBarMultiplicator
            $timeout (->
                $scope.progress()
            ), 3000 / 100 * progressBarMultiplicator
        else if $scope.progressBarWidth < 100 * progressBarMultiplicator
            $timeout (->
                $scope.progress()
            ), 10000 / 100 * progressBarMultiplicator

    $rootScope.$on 'PROGRESS_BAR_STOP', ->
        $scope.progressBarWidth = 100 * progressBarMultiplicator
        $timeout (->
            $scope.progressBarWidth = 0
        ), 500

    $scope.$watch 'progressBarWidth', ->
        $scope.progressBarCss.width = $scope.progressBarWidth / progressBarMultiplicator + '%'