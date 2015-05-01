'use strict';
/**********************************************************************
 * Login controller
 **********************************************************************/


angular.module('app').controller('GeneralCtrl', function ($scope, $rootScope, $http, $location, myService) {
    
    $scope.testMethod = function () {
        alert("this is general section directive controller");
    };
});