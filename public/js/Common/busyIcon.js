'use strict';
angular.module('app').BusyIconCtrl = function ( $scope, $http) {
    $scope.delay = 50;
    $scope.minDuration = 0;
    $scope.message = 'Please Wait...';
    $scope.backdrop = false;
    $scope.promise = null;

    $scope.wait = function () {
        $scope.promise = $http.get($scope.currentUrl);
    };
    
    $scope.waitForAll = function () {
        $scope.promise = $http.get($scope.allUrls);
    };
}