myApp.service 'modalService', ($modal) ->

    @basicModal = (title, directiveName, param, save) ->
        resolve =
            directiveName: ->
                directiveName
            param: ->
                param
            title: ->
                title
            save: ->
                save
        $modal.open
            backdrop: 'static'
            templateUrl: '/assets/js/modal/BasicModal/view.html'
            controller: 'BasicModalCtrl'
            size: 'lg'
            resolve: resolve

    @messageModal = (title, message, save) ->
        resolve =
            message: ->
                message
            title: ->
                title
            save: ->
                save
        $modal.open
            templateUrl: '/assets/js/modal/MessageModal/view.html'
            controller: 'MessageModalCtrl'
            size: 'lg'
            resolve: resolve

    @openRegistrationModal = (fctToExecute, fctToExecuteParams) ->
        resolve =
            fctToExecute: ->
                fctToExecute
            fctToExecuteParams: ->
                fctToExecuteParams
        $modal.open
            backdrop: 'static'
            templateUrl: '/assets/js/modal/RegistrationModal/view.html'
            controller: 'RegistrationModalCtrl'
            size: 'lg'
            resolve: resolve

    @openLoginModal = (fctToExecute, fctToExecuteParams, helpMessage) ->
        resolve =
            fctToExecute: ->
                fctToExecute
            fctToExecuteParams: ->
                fctToExecuteParams
            helpMessage: ->
                helpMessage
        $modal.open
            backdrop: 'static'
            templateUrl: '/assets/js/modal/LoginModal/view.html'
            controller: 'LoginModalCtrl'
            size: 'l'
            resolve: resolve

    @openEditPasswordModal = ->
        $modal.open
            backdrop: 'static'
            templateUrl: '/assets/js/modal/ChangePassword/view.html'
            controller: 'ChangePasswordModalCtrl'
            size: 'l'

    @openForgotPasswordModal = (email) ->
        resolve = email: ->
            email
        $modal.open
            backdrop: 'static'
            backdrop: 'static'
            templateUrl: '/assets/js/modal/ForgotPasswordModal/view.html'
            controller: 'ForgotPasswordModalCtrl'
            size: 'l'
            resolve: resolve

    return