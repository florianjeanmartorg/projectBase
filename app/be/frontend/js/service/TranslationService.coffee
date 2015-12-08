myApp.service 'translationService', ($rootScope, $filter) ->
    svc = undefined
    svc = this
    svc.elements = null

    svc.set = (elements) ->
        svc.elements = elements.translations

    svc.get = (code) ->
        if ! !svc.elements[code]
            return svc.elements[code]
        return code

    svc.translateExceptionsDTO = (exception) ->
        if exception.params != null and Object.keys(exception.params).length > 0
            $filter('translateTextWithVars') exception.messageToTranslate, exception.params
        else if exception.messageToTranslate != null
            $filter('translate') exception.messageToTranslate
        else
            exception.message

    return