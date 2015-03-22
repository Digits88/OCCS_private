'use strict';
angular.module('app').controller('ClientsCtrl', function ($scope, $http) {
    
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
    
    $scope.mySelections = [];
    $scope.selectedClientInjury = [];
    $scope.selectedMiscInfo = [];
    
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
    $scope.setClientGridPagingData = function (data, page, pageSize) {
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
            $scope.currentUrl = '/clients';
            $scope.wait();
            if (searchText) {
                var ft = searchText.toLowerCase();
                
                
                $http.get('/clients').success(function (largeLoad) {
                    data = largeLoad.filter(function (item) {
                        return JSON.stringify(item).toLowerCase().indexOf(ft) != -1;
                    });
                    $scope.setClientGridPagingData(data, page, pageSize);
                });
            } else {
                $http.get('/clients').success(function (largeLoad) {
                    $scope.setClientGridPagingData(largeLoad, page, pageSize);
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
                $scope.allUrls = [  '/clients/generalInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/additionalInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/clientAutoInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/medicalInsuranceInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/clientInjuries/' + $scope.mySelections[0].fileNo,
                                    '/clients/defendantInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/defendantAttorneyInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/defendantInsuranceInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/govtClaimInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/courtInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/miscInfo/' + $scope.mySelections[0].fileNo,
                                    ];
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
                
                // Get medical Insurance information
                $http.get('/clients/medicalInsuranceInfo/' + $scope.mySelections[0].fileNo).success(function (medicalInsuranceInfo) {
                    $scope.medicalInsuranceInfo = medicalInsuranceInfo[0][0];
                });
                
                // Get client injuries information
                $http.get('/clients/clientInjuries/' + $scope.mySelections[0].fileNo).success(function (clientInjuries) {
                    $scope.clientInjuriesData = clientInjuries[0];
                });
                
                // Get Defendant information
                $http.get('/clients/defendantInfo/' + $scope.mySelections[0].fileNo).success(function (defendantInfo) {
                    $scope.defendantInfo = defendantInfo[0][0];
                });
                
                // Get Defendant Attorney information
                $http.get('/clients/defendantAttorneyInfo/' + $scope.mySelections[0].fileNo).success(function (defendantAttorneyInfo) {
                    $scope.defendantAttorneyInfo = defendantAttorneyInfo[0][0];
                });
                
                // Get Defendant Insurance information
                $http.get('/clients/defendantInsuranceInfo/' + $scope.mySelections[0].fileNo).success(function (defendantInsuranceInfo) {
                    $scope.defendantInsuranceInfo = defendantInsuranceInfo[0][0];
                });
                
                // Get Statute information
                $http.get('/clients/statuteInfo/' + $scope.mySelections[0].fileNo).success(function (statuteInfo) {
                    $scope.statuteInfo = statuteInfo[0][0];
                });
                
                // Get Govt Claim information
                $http.get('/clients/govtClaimInfo/' + $scope.mySelections[0].fileNo).success(function (govtClaimInfo) {
                    $scope.govtClaimInfo = govtClaimInfo[0][0];
                });
                
                // Get Court information
                $http.get('/clients/courtInfo/' + $scope.mySelections[0].fileNo).success(function (courtInfo) {
                    $scope.courtInfo = courtInfo[0][0];
                });
                
                // Get Misc information
                $http.get('/clients/miscInfo/' + $scope.mySelections[0].fileNo).success(function (miscInfo) {
                    $scope.miscData = miscInfo[0];
                });
                $scope.waitForAll();

            }
        },
        multiSelect: false
    };
    
    $scope.clientInjuriesGridOptions = {
        data: 'clientInjuriesData',
        columnDefs: [{ field: 'note', displayName: 'Note', width: 50, },
                        { field: 'createdDate', displayName: 'Created Date', width: 100 },
                        { field: 'modifiedDate', displayName: 'Modified Date', width: 100 },
                        { field: 'description', displayName: 'Description' }],
        selectedItems: $scope.selectedClientInjury,
        multiSelect: false
    };
    
    $scope.miscGridOptions = {
        data: 'miscData',
        columnDefs: [{ field: 'note', displayName: 'Note', width: 50, },
                        { field: 'createdDate', displayName: 'Created Date', width: 100 },
                        { field: 'modifiedDate', displayName: 'Modified Date', width: 100 },
                        { field: 'description', displayName: 'Description' }],
        selectedItems: $scope.selectedMiscInfo,
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
    
    // Save General Information
    $scope.saveGeneralInfo = function () {
        $http.put('/clients/generalInfo', $scope.generalInformation)
    .success(function (user) {
        })
    .error(function () {
            // Error: authentication failed
            alert("error");
        });
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