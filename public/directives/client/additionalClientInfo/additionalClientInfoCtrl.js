'use strict';

angular.module('app').controller('AdditionalClientInfoCtrl', function ($scope, $rootScope, $http, $location, myService) {
    
    $scope.testMethod = function () {
        alert("this is addtional client info directive controller");
    };
});