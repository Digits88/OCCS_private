'use strict';
angular.module('app').ClientsGridCtrl = function ( $scope, $http) {
    
    $scope.mySelections = [];
    $scope.selectedClientInjury = [];
    $scope.selectedMiscInfo = [];

    $scope.caseTypes = ["Injury", "Illness", "Death"];
    $scope.caseStatus = ["Open", "Closed"];

    $scope.example = {
        value: new Date(2010, 11, 28, 14, 57)
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
    
    $scope.$on('ngGridEventData', function (e, s) {
        $scope.gridOptions.selectRow(0, true);
        $(".ngViewport").focus();
    });

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
        enableRowSelection:true,
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
                $scope.allUrls = ['/clients/generalInfo/' + $scope.mySelections[0].fileNo.toString(),
                                    '/clients/additionalInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/clientAutoInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/medicalInsuranceInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/clientInjuries/' + $scope.mySelections[0].fileNo,
                                    '/clients/defendantInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/defendantAttorneyInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/defendantInsuranceInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/govtClaimInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/courtInfo/' + $scope.mySelections[0].fileNo,
                                    '/clients/miscInfo/' + $scope.mySelections[0].fileNo
                ];
                //$scope.currentUrl = '/clients/generalInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get client general information
                $http.get('/clients/generalInfo/' + $scope.mySelections[0].fileNo).success(function (generalInformation) {
                    $scope.generalInformation = generalInformation[0][0];
                });
                //$scope.currentUrl = '/clients/additionalInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get additional information
                $http.get('/clients/additionalInfo/' + $scope.mySelections[0].fileNo).success(function (additionalInfo) {
                    $scope.additionalInfo = additionalInfo[0][0];
                });
                //$scope.currentUrl = '/clients/clientAutoInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get additional information
                $http.get('/clients/clientAutoInfo/' + $scope.mySelections[0].fileNo).success(function (clientAutoInfo) {
                    $scope.clientAutoInfo = clientAutoInfo[0][0];
                });
                //$scope.currentUrl = '/clients/medicalInsuranceInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get medical Insurance information
                $http.get('/clients/medicalInsuranceInfo/' + $scope.mySelections[0].fileNo).success(function (medicalInsuranceInfo) {
                    $scope.medicalInsuranceInfo = medicalInsuranceInfo[0][0];
                });
                //$scope.currentUrl = '/clients/clientInjuries/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get client injuries information
                $http.get('/clients/clientInjuries/' + $scope.mySelections[0].fileNo).success(function (clientInjuries) {
                    $scope.clientInjuriesData = clientInjuries[0];
                });
                //$scope.currentUrl = '/clients/defendantInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get Defendant information
                $http.get('/clients/defendantInfo/' + $scope.mySelections[0].fileNo).success(function (defendantInfo) {
                    $scope.defendantInfo = defendantInfo[0][0];
                });
                //$scope.currentUrl = '/clients/defendantAttorneyInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get Defendant Attorney information
                $http.get('/clients/defendantAttorneyInfo/' + $scope.mySelections[0].fileNo).success(function (defendantAttorneyInfo) {
                    $scope.defendantAttorneyInfo = defendantAttorneyInfo[0][0];
                });
                //$scope.currentUrl = '/clients/defendantInsuranceInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get Defendant Insurance information
                $http.get('/clients/defendantInsuranceInfo/' + $scope.mySelections[0].fileNo).success(function (defendantInsuranceInfo) {
                    $scope.defendantInsuranceInfo = defendantInsuranceInfo[0][0];
                });
                //$scope.currentUrl = '/clients/statuteInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get Statute information
                $http.get('/clients/statuteInfo/' + $scope.mySelections[0].fileNo).success(function (statuteInfo) {
                    var formattedStatuteInfo = {
                        fileNo: statuteInfo[0][0].fileNo,
                        yrFromAccident: new Date(statuteInfo[0][0].yrFromAccident),
                        _2yrFromAccident: new Date(statuteInfo[0][0]._2yrFromAccident),
                        complaintFiledDate: new Date(statuteInfo[0][0].complaintFiledDate),
                        _60daysFromFiledDate: new Date(statuteInfo[0][0]._60daysFromFiledDate),
                        _2yrsDate: new Date(statuteInfo[0][0]._2yrsDate),
                        _3yrsDate: new Date(statuteInfo[0][0]._3yrsDate),
                        _5yrsDate: new Date(statuteInfo[0][0]._5yrsDate),
                        isGovtClaim: new Date(statuteInfo[0][0].isGovtClaim)
                    };

                    $scope.statuteInfo = formattedStatuteInfo;
                });
                //$scope.currentUrl = '/clients/govtClaimInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get Govt Claim information
                $http.get('/clients/govtClaimInfo/' + $scope.mySelections[0].fileNo).success(function (govtClaimInfo) {
                    var formattedGovtClaimInfo =
                    {
                        fileNo: govtClaimInfo[0][0].fileNo,
                        _6monthsStatue: new Date(govtClaimInfo[0][0]._6monthsStatue),
                        sl1yr: new Date(govtClaimInfo[0][0].sl1yr),
                        _2yrs: new Date(govtClaimInfo[0][0]._2yrs),
                        city: new Date(govtClaimInfo[0][0].city),
                        cityRejectedDate: new Date(govtClaimInfo[0][0].cityRejectedDate),
                        cityRejectedAfter6Months: new Date(govtClaimInfo[0][0].cityRejectedAfter6Months),
                        county: new Date(govtClaimInfo[0][0].county),
                        countyRejectedDate: new Date(govtClaimInfo[0][0].countyRejectedDate),
                        countyRejectedAfter6Months: new Date(govtClaimInfo[0][0].countyRejectedAfter6Months),
                        state: new Date(govtClaimInfo[0][0].state),
                        stateRejectedDate: new Date(govtClaimInfo[0][0].stateRejectedDate),
                        stateRejectedAfter6Months: new Date(govtClaimInfo[0][0].stateRejectedAfter6Months),
                        other: new Date(govtClaimInfo[0][0].other),
                        otherRejectedDate: new Date(govtClaimInfo[0][0].otherRejectedDate),
                        otherRejectedAfter6Months: new Date(govtClaimInfo[0][0].otherRejectedAfter6Months)
                    };
                    $scope.govtClaimInfo = formattedGovtClaimInfo;
                });
                //$scope.currentUrl = '/clients/courtInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
                // Get Court information
                $http.get('/clients/courtInfo/' + $scope.mySelections[0].fileNo).success(function (courtInfo) {
                    $scope.courtInfo = courtInfo[0][0];
                });
                //$scope.currentUrl = '/clients/miscInfo/' + $scope.mySelections[0].fileNo.toString();
                //$scope.wait();
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

    $scope.refreshMiscData = function(fileNo) {
        $http.get('/clients/miscInfo/' + fileNo).success(function (miscInfo) {
            $scope.miscData = miscInfo[0];
        });
    };

    $scope.refreshGridData = function() {
        $scope.getPagedDataAsync($scope.pagingOptions.pageSize, $scope.pagingOptions.currentPage);
    }
}
