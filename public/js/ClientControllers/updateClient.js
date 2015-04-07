﻿'use strict';
angular.module('app').UpdateClientCtrl = function ($scope, $http) {
    
    // Save General Information
    $scope.saveGeneralInfo = function () {
        $http.post('/clients/generalInfo', { generalInformation: $scope.generalInformation })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };
    
    // Save Additional Client Information
    $scope.saveAdditionalInfo = function () {
        $http.post('/clients/additionalInfo', { additionalInfo: $scope.additionalInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };
    
    // Save Client Auto Information
    $scope.saveClientAutoInfo = function () {
        $http.post('/clients/clientAutoInfo', { clientAutoInfo: $scope.clientAutoInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };

    // Save Client Medical Insurance Information
    $scope.saveClientMedicalInsuranceInfo= function () {
        $http.post('/clients/clientMedicalInsuranceInfo', { medicalInsuranceInfo: $scope.medicalInsuranceInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };
}