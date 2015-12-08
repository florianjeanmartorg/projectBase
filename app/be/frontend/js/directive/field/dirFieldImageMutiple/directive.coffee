myApp.directive 'dirFieldImageMutiple', (directiveService, $upload, $flash, $filter, generateId, $window) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/field/dirFieldImageMutiple/template.html'
    replace: true
    transclude: true
    compile: ->
        post: (scope) ->
            directiveService.autoScopeImpl scope

            #params
            scope.success = false
            scope.images = []
            scope.id = generateId.generate()
            scope.errorMessage = ''
            scope.inDownload = false

            #if the field is active ?
            scope.isActive = ->
                return !(scope.getInfo().active? and scope.getInfo().active() == false)


            #watch  status
            scope.$watch 'inDownload', ->
                scope.isValid()

            #is the field is valid ?
            scope.isValid = ->
                if scope.getInfo().optional != null and scope.getInfo().optional() or scope.isActive() == false or scope.inDownload != true
                    scope.getInfo().isValid = true
                else
                    scope.getInfo().isValid = scope.getInfo().field[scope.getInfo().fieldName].length > 0 and scope.inDownload != true


            # display the error message
            scope.displayError = ->
                if scope.getInfo().isValid == false and scope.getInfo().firstAttempt == false
                    return true
                false

            # remove an image from list
            scope.remove = (imageContainer) ->
                for key of scope.images
                    if scope.images[key] == imageContainer
                        scope.images.splice key, 1

            #upload field
            scope.onFileSelect = ($files) ->

                #create a new object
                imgContainer = {}
                file = undefined
                i = undefined
                scope.inDownload = true
                i = 0
                while i < $files.length
                    file = $files[i]
                    url = '/rest/file/' + scope.getInfo().target
                    if scope.unique != true
                        scope.images.push imgContainer
                    scope.upload = $upload.upload
                        url: url
                        data:
                            myObj: scope.myModelObj
                        file: file
                    .progress (evt) ->
                        imgContainer.percent = parseInt(100.0 * evt.loaded / evt.total)
                    .success (data) ->
                        scope.success = true
                        imgContainer.percent = 100.0
                        imgContainer.image = data
                        scope.inDownload = false
                    .error (data) ->
                        for key of scope.images
                            if scope.images[key] == imgContainer
                                scope.images.splice key, 1
                        imgContainer.percent = 0
                        scope.inDownload = false
                        $flash.error data.message
                    i++

            # watch image to bind with field and valid
            scope.$watch 'images', ->
                scope.getInfo().field[scope.getInfo().fieldName] = []
                for key of scope.images
                    scope.getInfo().field[scope.getInfo().fieldName].push scope.images[key].image
                scope.isValid()
            , true

            #initialization
            if !scope.getInfo().field[scope.getInfo().fieldName]?
                scope.getInfo().field[scope.getInfo().fieldName] = []

            #build images (first time)
            for key of scope.getInfo().field[scope.getInfo().fieldName]
                scope.images.push image: scope.getInfo().field[scope.getInfo().fieldName][key]

            scope.isValid()