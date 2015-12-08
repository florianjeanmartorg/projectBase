myApp.service 'directiveService', ($sce) ->

    @autoScope = (s) ->
        k = undefined
        res = undefined
        v = undefined
        res = {}
        for k of s
            `k = k`
            v = s[k]
            res[k] = v
            if k.slice(0, 2) == 'ng' and v == '='
                res[k[2].toLowerCase() + k.slice(3)] = '@'
        res

    @autoScopeImpl = (s, name) ->
        fget = undefined
        key = undefined
        val = undefined
        s.$$NAME = name
        for key of s
            `key = key`
            val = s[key]
            if key.slice(0, 2) == 'ng'

                fget = (scope, k) ->
                    ->
                        v = undefined
                        v = 0
                        if scope[k] == undefined or scope[k] == null or scope[k] == ''
                            v = scope[k[2].toLowerCase() + k.slice(3)]
                        else
                            v = scope[k]
                        if scope['decorate' + k.slice(2)]
                            scope['decorate' + k.slice(2)] v
                        else
                            v

                s['get' + key.slice(2)] = fget(s, key)

        s.isTrue = (v) ->
            v == true or v == 'true' or v == 'y'

        s.isFalse = (v) ->
            v == false or v == 'false' or v == 'n'

        s.isNull = (v) ->
            v == null

        s.html = (v) ->
            $sce.trustAsHtml v
    return