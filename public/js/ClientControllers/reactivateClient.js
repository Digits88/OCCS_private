'use strict';
angular.module('app').ReactivateClientCtrl = function ($scope, $http) {
    
    // Add new client
    $scope.ReactivateClient = function () {
        //$scope.isGeneralInfoEdiatable = false;
        var fileId = $scope.generalInformation.fileNo;
        $http.post('/clients/reactivateClient/' + fileId)
            .success(function () {
            var index = $scope.myData.indexOf($scope.mySelections[0]);
            $scope.myData[index].status = 'Active';
        })
            .error(function () { alert("error"); });
    };
}