myApp.service 'accountService', ($flash, $http) ->
    self = this
    @model =
        myself: null
        myBusiness: null

    @testEmail = (email, callbackSuccess, callbackError) ->
        $http
            'method': 'GET'
            'url': '/rest/email/test/' + email
            'headers': 'Content-Type:application/json;charset=utf-8'
        .success (data) ->
            if callbackSuccess != null
                callbackSuccess data.value
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @registration = (dto, callbackSuccess, callbackError) ->
        $http
            'method': 'POST'
            'url': '/rest/registration'
            'headers': 'Content-Type:application/json;charset=utf-8'
            'data': dto
        .success (data) ->
            self.setMyself data
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @testFacebook = (dto, callbackSuccess, callbackError) ->
        $http
            'method': 'POST'
            'url': '/rest/facebook/test'
            'headers': 'Content-Type:application/json;charset=utf-8'
            'data': dto
        .success (data) ->
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @logout = (callbackSuccess, callbackError) ->
        $http
            'method': 'GET'
            'url': '/rest/logout'
            'headers': 'Content-Type:application/json;charset=utf-8'
        .success (data) ->
            self.setMyself null
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @changePassword = (oldPassword, newPassword, callbackSuccess, callbackError) ->
        dto =
            oldPassword: oldPassword
            newPassword: newPassword
        $http
            'method': 'PUT'
            'url': '/rest/account/password/' + self.getMyself().id
            'headers': 'Content-Type:application/json;charset=utf-8'
            'data': dto
        .success (data, status) ->
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @editAccount = (dto, callbackSuccess, callbackError) ->
        $http
            'method': 'PUT'
            'url': '/rest/account/' + self.getMyself().id
            'headers': 'Content-Type:application/json;charset=utf-8'
            'data': dto
        .success (data) ->
            self.setMyself data
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @login = (dto, callbackSuccess, callbackError) ->
        $http
            'method': 'POST'
            'url': '/rest/login'
            'headers': 'Content-Type:application/json;charset=utf-8'
            'data': dto
        .success (data) ->
            self.setMyself data
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @forgotPassword = (dto, callbackSuccess, callbackError) ->
        $http
            'method': 'PUT'
            'url': '/rest/forgot/password'
            'headers': 'Content-Type:application/json;charset=utf-8'
            'data': dto
        .success (data, status) ->
            if callbackSuccess != null
                callbackSuccess data
        .error (data, status) ->
            $flash.error data.message
            if callbackError != null
                callbackError data, status

    @getMyself = ->
        @model.myself

    @setMyself = (dto) ->
        @model.myself = dto

    @getMyBusiness = ->
        @model.myBusiness

    @setMyBusiness = (dto) ->
        @model.myBusiness = dto

    return