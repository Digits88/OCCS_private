'use strict';
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
    
    // Save Defendant Information
    $scope.saveDefendantInfo = function () {
        $http.post('/clients/defendantInfo', { defendantInfo: $scope.defendantInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });

        $http.post('/clients/defendantAttorneyInfo', { defendantAttorneyInfo: $scope.defendantAttorneyInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };

    // Save Defendant insurance Information
    $scope.saveDefendantInsuranceInfo = function () {
        $http.post('/clients/defendantInsuranceInfo', { defendantInsuranceInfo: $scope.defendantInsuranceInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };

    // Save Statute Information
    $scope.saveStatuteInfo = function () {
        $http.post('/clients/statuteInfo', { statuteInfo: $scope.statuteInfo })
            .success(function(user) {
            })
            .error(function () { alert("error"); });

        $http.post('/clients/govtClaimInfo', { govtClaimInfo: $scope.govtClaimInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };

    // Save Court Information
    $scope.saveCourtInfo = function () {
        $http.post('/clients/courtInfo', { courtInfo: $scope.courtInfo })
            .success(function (user) { })
            .error(function () { alert("error"); });
    };

}