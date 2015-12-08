myApp.controller 'MessageModalCtrl', ($scope, $flash, $modalInstance, $compile, title, message, save) ->
    $scope.message = message
    $scope.title = title
    $scope.loading = false

    $scope.close = ->
        $modalInstance.close()

    $scope.displaySaveButton = ->
        save?

    $scope.save = ->
        save $scope.close