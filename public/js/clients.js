'use strict';
angular.module('app').controller('ClientsCtrl', function($scope, $http) {

    //Call other sub controllers
    angular.module('app').AddNewClientCtrl($scope, $http);
    angular.module('app').ClientsGridCtrl($scope, $http);
    angular.module('app').BusyIconCtrl($scope, $http);
    angular.module('app').UpdateClientCtrl($scope, $http);
    
    angular.module('app').CloseClientCtrl($scope, $http);
    angular.module('app').ReactivateClientCtrl($scope, $http);

    $scope.ExpandButtonCaption = "Expand All";
    $scope.isNewClientClicked = false;

    $scope.expandAll = false;
    
    $scope.ExpandAllGroups = function () {
        $scope.expandAll = !$scope.expandAll;
        $scope.ExpandButtonCaption = $scope.expandAll ? "Collapse All" : "Expand All";

        $scope.isGeneralInfoOpen = !$scope.isGeneralInfoOpen;
        $scope.IsAdditionalInfoOpen = !$scope.IsAdditionalInfoOpen;
        $scope.IsClientAutoInfoOpen = !$scope.IsClientAutoInfoOpen;
        $scope.IsClientMedicalInsuranceOpen = !$scope.IsClientMedicalInsuranceOpen;
        $scope.IsClientInjuriesOpen = !$scope.IsClientInjuriesOpen;
        $scope.IsDefendantInfoOpen= !$scope.IsDefendantInfoOpen;
        $scope.IsDefendantInsuranceInfoOpen = !$scope.IsDefendantInsuranceInfoOpen;
        $scope.IsStatuteOpen = !$scope.IsStatuteOpen;
        $scope.IsCourtOpen= !$scope.IsCourtOpen;
        $scope.IsMiscOpen = !$scope.IsMiscOpen;
    }
    // Group options
    $scope.status = {
        isFirstOpen: true,
        isFirstDisabled: false
    };
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