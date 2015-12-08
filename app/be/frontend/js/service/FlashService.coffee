myApp.service '$flash', () ->
    Messenger.options =
        extraClasses: 'messenger-fixed messenger-on-bottom messenger-on-right cr-messenger'
        theme: 'block'

    @success = (messages) ->
        print messages, 'success'

    @info = (messages) ->
        print messages, 'info'

    @error = (messages) ->
        print messages, 'error'

    @warning = (messages) ->
        print messages, 'warning'

    print = (messages, type) ->
        if messages?
            for key of messages.split('\n')
                message = messages.split('\n')[key]
                Messenger().post
                    message: message
                    type: type
                    showCloseButton: true

    return