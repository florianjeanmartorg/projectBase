myApp.filter 'text', ($sce) ->
    (input, limit) ->
        if input != undefined or input != null
            if limit != undefined and input.length > limit
                input = input.substr(0, limit)
                #$filter('limitTo')(result,limit);
                input = input.substr(0, Math.min(input.length, input.lastIndexOf(' ')))
                input = input + ' ...'
            result = $sce.trustAsHtml(input.replace(/\n/g, '<br/>'))
            return result
        $sce.trustAsHtml input