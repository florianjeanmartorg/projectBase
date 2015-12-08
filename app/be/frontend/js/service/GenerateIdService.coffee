myApp.service 'generateId', () ->

    @generate = ->
        text = ''
        possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
        i = 0
        while i < 20
            text += possible.charAt(Math.random() * possible.length | 0)
            i++
        text

    return