myApp.directive 'accountFormCtrl', ($flash, directiveService, languageService, modalService) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/form/account/template.html'
    replace: true
    transclude: true
    compile: ->
        post: (scope) ->
            directiveService.autoScopeImpl scope
            #
            # initialization default data
            #
            scope.update = scope.getInfo().dto?
            if !scope.getInfo().dto?
                scope.getInfo().dto = gender: null
            scope.passwordActive = true
            langOptions = []
            scope.fields =
                gender:
                    name: 'gender'
                    fieldTitle: '--.generic.gender'
                    options: [
                        {
                            key: 'MALE'
                            value: '--.generic.male'
                        }
                        {
                            key: 'FEMALE'
                            value: '--.generic.female'
                        }
                    ]
                    disabled: ->
                        scope.getInfo().disabled
                    field: scope.getInfo().dto
                    fieldName: 'gender'
                firstname:
                    name: 'firstname'
                    fieldTitle: '--.generic.firstname'
                    validationRegex: '^.{2,50}$'
                    validationMessage: [
                        '--.generic.validation.size'
                        '2'
                        '50'
                    ]
                    disabled: ->
                        scope.getInfo().disabled
                    field: scope.getInfo().dto
                    fieldName: 'firstname'
                lastname:
                    name: 'lastname'
                    fieldTitle: '--.generic.lastname'
                    validationRegex: '^.{2,50}$'
                    validationMessage: [
                        '--.generic.validation.size'
                        '2'
                        '50'
                    ]
                    disabled: ->
                        scope.getInfo().disabled
                    field: scope.getInfo().dto
                    fieldName: 'lastname'
                language:
                    name: 'language'
                    fieldTitle: '--.generic.favoriteLanguage'
                    validationMessage: '--.error.validation.not_null'
                    options: langOptions
                    disabled: ->
                        scope.getInfo().disabled
                    field: scope.getInfo().dto
                    fieldName: 'lang'
                email:
                    fieldType: 'email'
                    name: 'email'
                    fieldTitle: '--.generic.email'
                    validationRegex: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    validationMessage: '--.generic.validation.email'
                    disabled: ->
                        scope.getInfo().disabled
                    field: scope.getInfo().dto
                    fieldName: 'email'
                password:
                    name: 'password'
                    fieldTitle: '--.registration.form.password'
                    validationRegex: '^[a-zA-Z0-9-_%]{6,18}$'
                    validationMessage: '--.generic.validation.password'
                    fieldType: 'password'
                    details: '--.registration.form.password.help'
                    disabled: ->
                        scope.getInfo().disabled
                    active: ->
                        !scope.getInfo().updateMode and scope.passwordActive
                    field: scope.getInfo().dto
                    fieldName: 'password'
                repeatPassword:
                    name: 'repeatPassword'
                    fieldTitle: '--.registration.form.repeatPassword'
                    validationMessage: '--.generic.validation.wrongRepeatPassword'
                    fieldType: 'password'
                    disabled: ->
                        scope.getInfo().disabled
                    validationFct: ->
                        scope.fields.password.field == scope.fields.repeatPassword.field
                    active: ->
                        !scope.getInfo().updateMode and scope.passwordActive
                    field: scope.getInfo().dto
                    fieldName: 'repeatPassword'


            langs = languageService.getLanguages()
            for key of langs
                lang = langs[key]
                langOptions.push
                    key: lang
                    value: lang.code
                if lang.code == languageService.currentLanguage
                    scope.getInfo().dto.lang = lang

            scope.getInfo().maskPassword = ->
                scope.passwordActive = false

            scope.openSla = ->
                modalService.openSla '--.sla.modal.title', '/legal/'

            #
            # validation : watching on field
            #
            scope.$watch 'fields', ->
                validation = true
                for key of scope.fields
                    obj = scope.fields[key]
                    if scope.fields.hasOwnProperty(key) and (!obj.isValid? or obj.isValid == false)
                        obj.firstAttempt = !scope.getInfo().displayErrorMessage
                        validation = false
                scope.getInfo().isValid = validation
            , true

            #
            # display error watching
            #
            scope.$watch 'getInfo().displayErrorMessage', ->
                `var key`
                for key of scope.fields
                    obj = scope.fields[key]
                    obj.firstAttempt = !scope.getInfo().displayErrorMessage