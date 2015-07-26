'use strict';
angular.module('app').CloseClientCtrl = function ($scope, $http) {
    
    // Add new client
    $scope.CloseClient = function () {
        //$scope.isGeneralInfoEdiatable = false;
        var fileId = $scope.generalInformation.fileNo;
        
        $http.post('/clients/closeClient/' + fileId)
            .success(function () {
            var index = $scope.myData.indexOf($scope.mySelections[0]);
            $scope.myData[index].status = 'Closed';
        })
            .error(function () { alert("error"); });
    };
}