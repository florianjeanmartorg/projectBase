myApp.service 'constantService', ->

    @compareNumber = (a, b) ->
        parseFloat(a) == parseFloat(b)

    return