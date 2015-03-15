'use strict';
angular.module('app').controller('ClientsCtrl', function ($scope, $http) {
    $scope.mySelections = [];

    $scope.caseTypes = ["Injury", "Illness", "Death"];
    $scope.caseStatus = ["Open", "Closed"];

    $scope.status = {
        isFirstOpen: true,
        isFirstDisabled: false
    };
    
    $scope.filterOptions = {
        filterText: "",
        useExternalFilter: true
    };
    $scope.totalServerItems = 0;
    $scope.pagingOptions = {
        pageSizes: [5, 10, 20],
        pageSize: 5,
        currentPage: 1
    };
    $scope.setPagingData = function (data, page, pageSize) {
        var pagedData = data.slice((page - 1) * pageSize, page * pageSize);
        $scope.myData = pagedData;
        $scope.totalServerItems = data.length;
        if (!$scope.$$phase) {
            $scope.$apply();
        }
    };
    $scope.getPagedDataAsync = function (pageSize, page, searchText) {
        setTimeout(function () {
            var data;
            if (searchText) {
                var ft = searchText.toLowerCase();
                $http.get('/clients').success(function (largeLoad) {
                    data = largeLoad.filter(function (item) {
                        return JSON.stringify(item).toLowerCase().indexOf(ft) != -1;
                    });
                    $scope.setPagingData(data, page, pageSize);
                });
            } else {
                $http.get('/clients').success(function (largeLoad) {
                    $scope.setPagingData(largeLoad, page, pageSize);
                });
            }
        }, 100);
    };
    
    $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);
    
    $scope.$watch('pagingOptions', function (newVal, oldVal) {
        if (newVal !== oldVal && newVal.currentPage !== oldVal.currentPage) {
            $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage, $scope.filterOptions.filterText);
        }
    }, true);
    $scope.$watch('filterOptions', function (newVal, oldVal) {
        if (newVal !== oldVal) {
            $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage, $scope.filterOptions.filterText);
        }
    }, true);
    
    $scope.gridOptions = {
        data: 'myData',
        enablePaging: true,
        showFooter: true,
        totalServerItems: 'totalServerItems',
        pagingOptions: $scope.pagingOptions,
        filterOptions: $scope.filterOptions,
        columnDefs: [{ field: 'fileNo', displayName: 'File No.', width: 50, },
                        { field: 'firstName', displayName: 'First Name' },
                        { field: 'lastName', displayName: 'Last Name' },
                        { field: 'status', displayName: 'Status' }],
        selectedItems: $scope.mySelections,
        afterSelectionChange: function (data) {
            if (data.selected == true) {
                // Get client general information
                $http.get('/clients/generalInfo/' + $scope.mySelections[0].fileNo).success(function (generalInformation) {
                    $scope.generalInformation = generalInformation[0][0];
                });

                // Get additional information
                $http.get('/clients/additionalInfo/' + $scope.mySelections[0].fileNo).success(function (additionalInfo) {
                    $scope.additionalInfo = additionalInfo[0][0];
                });

                // Get additional information
                $http.get('/clients/clientAutoInfo/' + $scope.mySelections[0].fileNo).success(function (clientAutoInfo) {
                    $scope.clientAutoInfo = clientAutoInfo[0][0];
                });
            }
        },
        multiSelect: false
    };
    $scope.filterName = function () {
        var filterText = '' + $scope.nameFilter;
        if (filterText !== '') {
            $scope.filterOptions.filterText = filterText;
        } else {
            $scope.filterOptions.filterText = '';
        }
    };

});

angular.module('app').filter('ISODateReviver', function () {
    return function (input) {
        if (input === null || input === undefined)
            return "";
            var a = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)(?:([\+-])(\d{2})\:(\d{2}))?Z?$/.exec(input);
            if (a) {
            var utcMilliseconds = Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4], +a[5], +a[6]);
                return new Date(utcMilliseconds).toLocaleDateString();
            }
            return input;
    }
});

angular.module('app').filter('testValueFilter', function () {
    return function (input) {
        alert(input);
        return input;
    }
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