'use strict';
angular.module('app').controller('ClientsCtrl', function ($scope, $http) {
    
    //Call other sub controllers
    angular.module('app').AddNewClientCtrl($scope, $http);
    angular.module('app').ClientsGridCtrl($scope, $http);
    angular.module('app').BusyIconCtrl($scope, $http);
    
    // Group options
    $scope.status = {
        isFirstOpen: true,
        isFirstDisabled: false
    };
    
    // Save General Information
    $scope.saveGeneralInfo = function () {
        $http.put('/clients/generalInfo', $scope.generalInformation)
    .success(function (user) {
        })
    .error(function () {
            // Error: authentication failed
            alert("error");
        });
    };

    $scope.AddNewClientSection = function () {
        $scope.isGeneralInfoEdiatable = false;
        
    };
});

//angular.module('app').filter('ISODateReviver', function () {
//    return function (input) {
//        if (input === null || input === undefined)
//            return "";
//        var a = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)(?:([\+-])(\d{2})\:(\d{2}))?Z?$/.exec(input);
//        if (a) {
//            var utcMilliseconds = Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4], +a[5], +a[6]);
//            return new Date(utcMilliseconds).toLocaleDateString();
//        }
//        return input;
//    }
//});

angular.module('app').filter('testValueFilter', function () {
    return function (input) {
        return input;
    }
});

//function isoDateReviver(value) {
//    if (typeof value === 'string') {
//        var a = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)(?:([\+-])(\d{2})\:(\d{2}))?Z?$/.exec(value);
//        if (a) {
//            var utcMilliseconds = Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4], +a[5], +a[6]);
//            return new Date(utcMilliseconds);
//        }
//    }
//    return value;
//}