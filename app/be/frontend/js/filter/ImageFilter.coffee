myApp.filter 'image', (constantService) ->
    (input, orginal) ->
        if input?
            if input.storedName?
                if orginal? and orginal == true
                    return constantService.fileBucketUrl + '/' + input.storedNameOriginalSize
                else
                    return constantService.fileBucketUrl + '/' + input.storedName
            else
                return input
        null