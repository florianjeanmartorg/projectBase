# directive
# donut chart
myApp.directive 'donutChartCtrl', (directiveService, $timeout, generateId) ->
    restrict: 'E'
    scope: directiveService.autoScope(ngInfo: '=')
    templateUrl: '/assets/js/directive/admin/donutChart/template.html'
    replace: true
    transclude: true
    compile: ->
        pre: (scope) ->
            scope.id = generateId.generate()
        post: (scope, element) ->
            directiveService.autoScopeImpl scope

            scope.$watch 'getInfo().data', ->
                dataToDisplay = undefined

                if scope.getInfo()? and scope.getInfo().data?
                    #compute data
                    scope.data = []
                    for key of scope.getInfo().data
                        scope.data.push
                            name: key
                            y: scope.getInfo().data[key]

                    $('#' + scope.id).highcharts
                        chart:
                            plotBackgroundColor: null
                            plotBorderWidth: null
                            plotShadow: false
                            type: 'pie'
                        title:
                            text: scope.getInfo().title
                        plotOptions:
                            pie:
                                allowPointSelect: true
                                cursor: 'pointer'
                                dataLabels:
                                    enabled: true
                                    format: '<b>{point.name}</b>: {point.percentage:.1f} % ({point.y})'
                                    style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
                        series: [ {
                            name: 'name'
                            data: scope.data
                        } ]