myApp.directive 'numbersOnly', ($filter, translationService, $locale) ->
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attrs, modelCtrl) ->
        scope.$watch attrs.numbersOnly, ->
            convertToFloat = undefined
            convertToString = undefined
            displayError = undefined
            errorMessage = undefined
            filterFloat = undefined
            nbDecimal = undefined
            valueToDisplay = undefined
            if attrs.numbersOnly == 'integer' or attrs.numbersOnly == 'double' or attrs.numbersOnly == 'percent'
                scope.lastValidValue = 0
                if attrs.numbersOnly == 'integer'
                    errorMessage = $filter('translateText')('--.generic.numberOnly')
                    nbDecimal = 0
                else
                    errorMessage = $filter('translateText')('--.generic.numberOnly')
                    nbDecimal = 2
                scope.$root.$on '$localeChangeSuccess', (event, current, previous) ->
                    result = undefined
                    if modelCtrl.$modelValue?
                        result = convertToString(parseFloat(modelCtrl.$modelValue))
                        if result?
                            modelCtrl.$setViewValue result.toString()
                            return modelCtrl.$render()
                    return
                modelCtrl.$parsers.unshift (viewValue) ->
                    result = undefined
                    resultString = undefined
                    resultToDisplay = undefined
                    if viewValue == ''
                        return null
                    result = convertToFloat(viewValue)
                    if isNaN(result)
                        displayError()
                        if ! !scope.lastValidValue
                            resultString = scope.lastValidValue.toString()
                            if attrs.numbersOnly == 'percent'
                                resultToDisplay = (scope.lastValidValue * 100).toString()
                            else
                                resultToDisplay = scope.lastValidValue.toString()
                        else
                            resultString = ''
                            resultToDisplay = ''
                        modelCtrl.$setViewValue resultToDisplay
                        modelCtrl.$render()
                    else
                        if attrs.numbersOnly == 'percent'
                            result = result / 100
                        scope.lastValidValue = result
                        resultString = result.toString()
                    if resultString == ''
                        return null
                    #return result
                    resultString
                modelCtrl.$formatters.unshift (modelValue) ->
                    #return a string for display
                    scope.displayValue modelValue

                scope.displayValue = (modelValue) ->
                    result = undefined
                    result = parseFloat(modelValue)
                    if attrs.numbersOnly == 'percent'
                        result = result * 100
                    convertToString result

                displayError = ->
                    if scope.setErrorMessage?
                        return scope.setErrorMessage(errorMessage)
                    return

                convertToString = (value) ->
                    formats = undefined
                    result = undefined
                    if !value? or isNaN(value)
                        return ''
                    value = value.toFixed(nbDecimal)
                    formats = $locale.NUMBER_FORMATS
                    result = value.toString().replace(new RegExp('\\.', 'g'), formats.DECIMAL_SEP)

                convertToFloat = (viewValue) ->
                    decimalRegex = undefined
                    formats = undefined
                    value = undefined
                    if viewValue == ''
                        return NaN
                    formats = $locale.NUMBER_FORMATS
                    decimalRegex = formats.DECIMAL_SEP
                    if decimalRegex == '.'
                        decimalRegex = '\\.'
                    value = viewValue.replace(new RegExp(decimalRegex, 'g'), '.')
                    filterFloat value

                filterFloat = (value) ->
                    regexFloat = undefined
                    if value.isNaN
                        return NaN
                    if attrs.numbersOnly == 'integer'
                        regexFloat = new RegExp('^(\\-|\\+)?([0-9]+|Infinity)?$')
                    else
                        regexFloat = new RegExp('^(\\-|\\+)?([0-9]+(\\.[0-9]*)?|Infinity)?$')
                    if regexFloat.test(value)
                        return Number(value)
                    NaN

                if modelCtrl.$modelValue?
                    scope.lastValidValue = parseFloat(modelCtrl.$modelValue)
                    valueToDisplay = scope.displayValue(scope.lastValidValue)
                    modelCtrl.$setViewValue valueToDisplay
                    return modelCtrl.$render()