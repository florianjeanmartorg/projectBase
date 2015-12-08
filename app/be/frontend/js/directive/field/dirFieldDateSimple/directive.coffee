myApp.directive 'dirFieldDateSimple', (directiveService, $filter, generateId, $filter) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/field/dirFieldDateSimple/template.html'
    replace: true
    transclude: true
    compile: ->
        post: (scope) ->
            directiveService.autoScopeImpl scope

            #params
            scope.result = null
            scope.hours = []
            scope.days = []
            scope.day = null
            scope.hour = null

            #build choice
            #if the start date change, recompile
            scope.$watch 'getInfo().startDate', ->
                scope.compileDate()

            scope.compileDate = ->
                scope.days = []
                scope.hours = []
                #build hour
                if scope.getInfo().startDate != null and scope.getInfo().startDate != undefined
                    i = 0
                    while i <= 23
                        scope.hours.push
                            value: i
                            key: i + ':00'
                        i++
                    #build day
                    i = 0
                    while i < scope.getInfo().maxDay
                        date = new Date(scope.getTime(scope.getInfo().startDate) + i * 24 * 60 * 60 * 1000)
                        date.setHours 0
                        date.setMinutes 0
                        date.setSeconds 0
                        date.setMilliseconds 0
                        day = date.getDate()
                        month = date.getMonth() + 1
                        time = date.getTime()
                        scope.days.push time
                        i++
                    #reinitialize model
                    if scope.days.length > 0
                        if scope.day < scope.days[0] or scope.day > scope.days[scope.days.length - 1]
                            scope.day = null
                        #select default value
                        if scope.day == null
                            if scope.getInfo().field[scope.getInfo().fieldName] != null
                                date = scope.getDate(scope.getInfo().field[scope.getInfo().fieldName])
                                date.setMinutes 0
                                date.setSeconds 0
                                date.setMilliseconds 0
                                hour = date.getHours()
                                date.setHours 0
                                day = date.getTime()
                                scope.day = day
                                scope.hour = hour
                            else
                                if scope.getInfo().defaultSelection == 'lastDay'
                                    scope.day = scope.days[scope.days.length - 1]
                                else
                                    scope.day = scope.days[0]
                                if scope.hour == null
                                    scope.hour = (new Date).getHours()

            #watching
            scope.$watch 'day', ->
                scope.compileValue()

            scope.$watch 'hour', ->
                scope.compileValue()

            #compile value
            scope.compileValue = ->
                time = scope.day
                time += scope.hour * 60 * 60 * 1000
                scope.getInfo().field[scope.getInfo().fieldName] = new Date(time)
                scope.isValid()

            #is active
            scope.isActive = ->
                !(scope.getInfo().active? and scope.getInfo().active() == false)

            #validation
            scope.isValid = ->
                isValid = undefined
                if scope.getInfo().disabled == true or scope.isActive() == false
                    scope.getInfo().isValid = true
                    return
                isValid = true
                if scope.getInfo().field[scope.getInfo().fieldName] == null
                    isValid = false
                if scope.getInfo().validationFct != null
                    isValid = isValid and scope.getInfo().validationFct()
                scope.getInfo().isValid = isValid

            #get time from date or time
            scope.getTime = (param) ->
                if param instanceof Date
                    return param.getTime()
                param

            #get date from date or time
            scope.getDate = (param) ->
                if param instanceof Date
                    return param
                return new Date(param)