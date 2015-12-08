myApp.directive 'loginFormCtrl', ($flash, facebookService, translationService, directiveService, $timeout, accountService, $location, modalService) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/form/login/template.html'
    replace: true
    transclude: true
    compile: ->
        post: (scope) ->
            directiveService.autoScopeImpl scope

            #params
            scope.facebookAppId = facebookService.facebookAppId
            scope.facebookAuthorization = facebookService.facebookAuthorization
            scope.basic_url = location.host
            #create the basic url
            if scope.basic_url.indexOf('http') == -1
                if scope.basic_url.indexOf('localhost') != -1
                    scope.basic_url = 'http://' + scope.basic_url
                else
                    scope.basic_url = 'https://' + scope.basic_url
            #intialize dto
            if !scope.getInfo().dto?
                scope.getInfo().dto = {}

            #form
            scope.fields =
                email:
                    fieldType: 'email'
                    name: 'email'
                    fieldTitle: '--.registration.form.yourEmail'
                    validationRegex: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    validationMessage: '--.generic.validation.email'
                    disabled: ->
                        scope.getInfo().loading
                    field: scope.getInfo().dto
                    fieldName: 'email'
                password:
                    name: 'password'
                    fieldTitle: '--.generic.yourPassword'
                    validationRegex: '^[a-zA-Z0-9-_%]{6,18}$'
                    validationMessage: '--.generic.validation.password'
                    fieldType: 'password'
                    disabled: ->
                        scope.getInfo().loading
                    field: scope.getInfo().dto
                    fieldName: 'password'

            #display loading
            # different ways if mobile version or not
            scope.setLoading = (b) ->
                if scope.getInfo().mobileVersion
                    if b == true
                        modalService.openLoadingModal()
                    else
                        modalService.closeLoadingModal()
                else
                    scope.getInfo().loading = b

            #
            # validation : watching on field
            #
            scope.$watch 'fields', (->
                validation = true
                for key of scope.fields
                    obj = scope.fields[key]
                    if !obj.isValid? or obj.isValid == false
                        obj.firstAttempt = !scope.getInfo().displayErrorMessage
                        validation = false
                scope.getInfo().isValid = validation
            ), true

            #
            # display error watching
            #
            scope.$watch 'getInfo().displayErrorMessage', ->
                for key of scope.fields
                    obj = scope.fields[key]
                    obj.firstAttempt = !scope.getInfo().displayErrorMessage

            #
            #facebook success
            #
            scope.facebookSuccess = (data) ->
                accountService.setMyself data
                if data.type == 'BUSINESS'
                    $location.path '/business/' + accountService.getMyself().businessId
                else if scope.getInfo().mobileVersion
                    $location.path '/'
                scope.getInfo().facebookSuccess data
                scope.setLoading false

            #
            # facebook connection
            #
            scope.fb_login = ->

                success = (data) ->

                    scope.facebookSuccess data
                    scope.setLoading false

                failed = (data) ->
                    $flash.error data.message
                    scope.setLoading false
                    scope.$apply()

                scope.setLoading true
                if scope.getInfo().mobileVersion
                    if facebookService.isConnected()
                        facebookService.loginToServer success, failed
                    else
                        url = 'https://www.facebook.com/dialog/oauth/?scope='+facebookService.facebookAuthorization+'&client_id=' + scope.facebookAppId + '&redirect_uri=' + scope.basic_url + '/&state=BELGIUM&scope=' + scope.facebookAuthorization + '&response_type=token'
                        window.open url, '_self'
                else
                    facebookService.login ((data) ->
                        success data
                    ), (data) ->
                        failed data

            #return a specific url param
            scope.getUrlParam = (name, url) ->
                if !url
                    url = location.href
                name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]')
                regexS = '[\\?&]' + name + '=([^&#]*)'
                regex = new RegExp(regexS)
                results = regex.exec(url)
                if results == null then null else results[1]

            # try to catch facebook connection
            # mobile version
            if location.href.indexOf('access_token') != -1
                access_token = scope.getUrlParam('access_token', location.href)
                if access_token?
                    scope.setLoading true
                    facebookService.loginToServerSimple access_token, ((data) ->
                        scope.facebookSuccess data
                    ), (data, status) ->
                        scope.setLoading false
                        $location.path '/customer_registration'


