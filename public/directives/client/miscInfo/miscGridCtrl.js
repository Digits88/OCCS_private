'use strict';

angular.module('app').controller('miscGridCtrl', function ($scope, $rootScope, $http, $location, myService) {
    
    // add misc note
    $scope.addMiscNote = function () {
        var newNoteId = $scope.miscData[$scope.miscData.length - 1].noteId + 1;

        $scope.inserted = {
            fileNo: $scope.generalInformation.fileNo,
            note: "",
            createdDate: Date(),
            modifiedDate: Date(),
            description: "",
            noteId: newNoteId
        };
        $scope.miscData.push($scope.inserted);
        $scope.rowform.$show();
    };
    
    // Save Court Information
    $scope.saveMiscInfo = function (data, id, fileNo) {
        
        var miscItem = {
            fileNo : fileNo,
            noteId: id,
            note: data.note,
            createdDate: data.createdDate,
            modifiedDate: data.modifiedDate,
            description: data.description
        }
        
        $http.post('/clients/miscInfo', { miscInfo: miscItem })
            .success(function (user) {
            $scope.refreshMiscData(fileNo);
        })
            .error(function () { alert("error"); });
    };
    
    // remove user
    $scope.deleteMiscNote = function (index) {
        var noteId = $scope.miscData[index].noteId;
        
        $scope.miscData.splice(index, 1);
        
        var url = "/clients/miscInfo/" + $scope.generalInformation.fileNo + "/" + noteId;
        $http.delete(url)
            .success(function (user) {
            $scope.refreshMiscData(fileNo);
        })
            .error(function () { alert("error"); });
    };
});