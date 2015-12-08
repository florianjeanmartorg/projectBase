myApp.filter 'zeropad', ($sce, translationService) ->
    (n) ->
        len = 2
        num = parseInt(n, 10)
        len = parseInt(len, 10)
        if isNaN(num) or isNaN(len)
            return n
        num = '' + num
        while num.length < len
            num = '0' + num
        num