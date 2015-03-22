'use strict';
angular.module('app').AddNewClientCtrl = function ( $scope, $http) {
    
    // Add new client
    $scope.AddNewClient = function () {
        $http.get('/clients/newFileNo')
    .success(function (result) {
            $scope.newFileNo = result[0][0].NewFileNo;
            $scope.generalInformation = $scope.CreateNewGeneralInfo();
        })
    .error(function () {
            alert("error while fetching new file no.");
        });
    };

    // Create empty general section
    $scope.CreateNewGeneralInfo = function () {
        var generalInfo = {
            fileNo: $scope.newFileNo,
            address: '',
            aptNo: '',
            initialInfo: '',
            defendantName: '',
            city: '',
            evidence1: '',
            caseType: '',
            state: '',
            evidence2: '',
            otherType: '',
            homePhone: '',
            caseStatus: '',
            cellPhone: '',
            originatingAttorney: '',
            accidentDate: null,
            workPhone: '',
            assignedAttorney: '',
            clientCreated: null,
            drivingLicense: '',
            refferal: '',
            email: '',
            dateOfBirth: null,
            SSN: '',
            firstName: '',
            lastName: ''
        };
        return generalInfo;
    };
}