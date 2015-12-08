myApp.filter 'translateText', ($sce, translationService) ->
    (input, params, toUpperCase) ->
        text = undefined
        if typeof input == 'object'
            text = translationService.get(input[0])
            for key of input
                if key != 0
                    text = text.replace('{' + parseFloat(key) - 1 + '}', input[key])
            if toUpperCase == true
                return text.toUpperCase()
            return text
        else
            text = translationService.get(input)
            if params?
                if Object::toString.call(params) == '[object Array]'
                    for key of params
                        text = text.replace('{' + key + '}', params[key])
                else
                    text = text.replace('{0}', params)
            if toUpperCase == true
                return text.toUpperCase()
            return text
        input