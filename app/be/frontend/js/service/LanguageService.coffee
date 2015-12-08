myApp.service 'languageService', ($flash, $window, $http, $rootScope) ->
    @languages
    @languagesStructured = []
    @currentLanguage
    self = this

    @setLanguages = (currentLanguage, languages) ->
        @currentLanguage = currentLanguage
        @languages = languages
        for key of languages
            lang = languages[key]
            @languagesStructured.push
                key: lang.code
                value: lang.language

    $rootScope.$watch ->
        self.currentLanguage
    , (newValue, oldValue) ->
        if newValue != oldValue
            self.changeLanguage self.currentLanguage, true

    @changeLanguage = (lang, forced) ->
        if lang != @currentLanguage or forced
            $http
                'method': 'PUT'
                'url': '/rest/language/' + lang
                'headers': 'Content-Type:application/json;charset=utf-8'
            .success () ->
                $window.location.reload()
            .error ->
                $flash.error data.message

    @getLanguages = ->
        angular.copy @languages

    return