'use strict';
angular.module('app').AddNewClientCtrl = function ($scope, $http) {
    
    // Add new client
    $scope.AddNewClient = function () {
        //$scope.isGeneralInfoEdiatable = false;
        
        $http.get('/clients/newFileNo')
    .success(function (result) {
            $scope.newFileNo = result[0][0].NewFileNo;
            $scope.NewGeneralInfo();
            $scope.NewAdditionalInfo();
            $scope.NewClientAutoInfo();
            $scope.NewMeidcalInsuranceInfo();
            $scope.NewClientInjuries();
            $scope.NewDefendantInfo();
            $scope.NewDefendantAttorneyInfo();
            $scope.NewDefendantInsuranceInfo();
            $scope.NewStatuteInfo();
            $scope.NewGovtClaimInfo();
            $scope.NewCourtInfo();
            $scope.NewMiscData();
        })
    .error(function () {
            alert("error while fetching new file no.");
        });
    };
    
    // Create empty general section
    $scope.NewGeneralInfo = function () {
        $scope.generalInformation.fileNo = $scope.newFileNo;
        $scope.generalInformation.address = '';
        $scope.generalInformation.aptNo = '';
        $scope.generalInformation.initialInfo = '';
        $scope.generalInformation.defendantName = '';
        $scope.generalInformation.city = '';
        $scope.generalInformation.state = '';
        $scope.generalInformation.evidence1 = '';
        $scope.generalInformation.caseType = '';
        $scope.generalInformation.evidence2 = '';
        $scope.generalInformation.otherType = '';
        $scope.generalInformation.homePhone = '';
        $scope.generalInformation.caseStatus = '';
        $scope.generalInformation.cellPhone = '';
        $scope.generalInformation.originatingAttorney = '';
        $scope.generalInformation.accidentDate = null;
        $scope.generalInformation.workPhone = '';
        $scope.generalInformation.assignedAttorney = '';
        $scope.generalInformation.clientCreated = '';
        $scope.generalInformation.drivingLicense = '';
        $scope.generalInformation.refferal = '';
        $scope.generalInformation.email = '';
        $scope.generalInformation.dateOfBirth = null;
        $scope.generalInformation.SSN = '';
        $scope.generalInformation.firstName = '';
        $scope.generalInformation.lastName = '';
      
       
    };
    
    // Create additional information section
    $scope.NewAdditionalInfo = function () {
        
        $scope.additionalInfo.fileNo = $scope.newFileNo;
        $scope.additionalInfo.clientOccupation = '';
        $scope.additionalInfo.employer = '';
        $scope.additionalInfo.address = '';
        $scope.additionalInfo.city = '';
        $scope.additionalInfo.state = '';
        $scope.additionalInfo.spouseLastName = '';
        $scope.additionalInfo.spouseFirstName = '';
        $scope.additionalInfo.spouseOccupation = '';
        $scope.additionalInfo.spouseAddress = '';
        $scope.additionalInfo.spouseEmployer = '';
        $scope.additionalInfo.spouseCity = '';
        $scope.additionalInfo.spouseState = '';

    };
    
    // Create client auto information
    $scope.NewClientAutoInfo = function () {
        $scope.clientAutoInfo.fileNo = $scope.newFileNo;
        $scope.clientAutoInfo.insuranceCompany = '';
        $scope.clientAutoInfo.address = '';
        $scope.clientAutoInfo.city = '';
        $scope.clientAutoInfo.state = '';
        $scope.clientAutoInfo.zip = '';
        $scope.clientAutoInfo.phoneNumber = '';
        $scope.clientAutoInfo.adjuster = '';
        $scope.clientAutoInfo.policyNumber = '';
        $scope.clientAutoInfo.effectiveStartDate = null;
        $scope.clientAutoInfo.effectiveEndDate = null;
        $scope.clientAutoInfo.medPayAvailable = '';
        $scope.clientAutoInfo.amount = 0;
        $scope.clientAutoInfo.liabilityMinCoverage = 0;
        $scope.clientAutoInfo.liabilityMaxCoverage = 0;
        $scope.clientAutoInfo.UMIMin = 0;
        $scope.clientAutoInfo.UMIMax = 0;
        $scope.clientAutoInfo.reimbursable = 0;
        $scope.clientAutoInfo.notes = '';
    };
    
    // Create medical Insurance Info
    $scope.NewMeidcalInsuranceInfo = function () {
        $scope.medicalInsuranceInfo.fileNo = $scope.newFileNo;
        $scope.medicalInsuranceInfo.namedInsured = '';
        $scope.medicalInsuranceInfo.insuranceCompany = '';
        $scope.medicalInsuranceInfo.address = '';
        $scope.medicalInsuranceInfo.city = '';
        $scope.medicalInsuranceInfo.state = '';
        $scope.medicalInsuranceInfo.zip = '';
        $scope.medicalInsuranceInfo.phoneNumer = '';
        $scope.medicalInsuranceInfo.policyNumber = '';
        $scope.medicalInsuranceInfo.mediCalNumber = '';
        $scope.medicalInsuranceInfo.mediCareNumber = '';
        $scope.medicalInsuranceInfo.claimNumber = '';
    };
    
    // Create medical Insurance Info
    $scope.NewClientInjuries = function () {
        $scope.clientInjuriesData.splice(0, $scope.clientInjuriesData.length);
    };
    
    $scope.NewDefendantInfo = function () {
        $scope.defendantInfo.fileNo = $scope.newFileNo;
        $scope.defendantInfo.lastName = '';
        $scope.defendantInfo.firstName = '';
        $scope.defendantInfo.address = '';
        $scope.defendantInfo.city = '';
        $scope.defendantInfo.state = '';
        $scope.defendantInfo.zip = '';
        $scope.defendantInfo.homePhone = '';
        $scope.defendantInfo.businessPhone = '';
        $scope.defendantInfo.dateOfBirth = null;
        $scope.defendantInfo.drivingLicense = '';
    };
    
    $scope.NewDefendantAttorneyInfo = function () {
        $scope.defendantAttorneyInfo.fileNo = $scope.newFileNo;
        $scope.defendantAttorneyInfo.firm = '';
        $scope.defendantAttorneyInfo.attorney = '';
        $scope.defendantAttorneyInfo.address = '';
        $scope.defendantAttorneyInfo.city = '';
        $scope.defendantAttorneyInfo.state = '';
        $scope.defendantAttorneyInfo.zip = '';
        $scope.defendantAttorneyInfo.phone = '';
    };
    
    $scope.NewDefendantInsuranceInfo = function () {
        $scope.defendantInsuranceInfo.fileNo = $scope.newFileNo;
        $scope.defendantInsuranceInfo.nameOfInsured = '';
        $scope.defendantInsuranceInfo.insuranceCompany = '';
        $scope.defendantInsuranceInfo.address = '';
        $scope.defendantInsuranceInfo.city = '';
        $scope.defendantInsuranceInfo.state = '';
        $scope.defendantInsuranceInfo.zip = '';
        $scope.defendantInsuranceInfo.phone = '';
        $scope.defendantInsuranceInfo.adjuster = '';
        $scope.defendantInsuranceInfo.claimNumber = '';
        $scope.defendantInsuranceInfo.policyLimits = '';
    };
    
    $scope.NewStatuteInfo = function () {
        $scope.statuteInfo.fileNo = $scope.newFileNo;
        $scope.statuteInfo.yrFromAccident = null;
        $scope.statuteInfo._2yrFromAccident = null;
        $scope.statuteInfo.complaintFiledDate = null;
        $scope.statuteInfo._60daysFromFiledDate = null;
        $scope.statuteInfo._2yrsDate = null;
        $scope.statuteInfo._3yrsDate = null;
        $scope.statuteInfo._5yrsDate = null;
        $scope.statuteInfo.isGovtClaim = 'false';
    };
    
    $scope.NewGovtClaimInfo = function () {
        $scope.govtClaimInfo.fileNo = $scope.newFileNo;
        $scope.govtClaimInfo._6monthsStatue = null;
        $scope.govtClaimInfo.sl1yr = null;
        $scope.govtClaimInfo._2yrs = null;
        $scope.govtClaimInfo.city = '';
        $scope.govtClaimInfo.cityRejectedDate = null;
        $scope.govtClaimInfo.cityRejectedAfter6Months = null;
        $scope.govtClaimInfo.county = '';
        $scope.govtClaimInfo.countyRejectedDate = null;
        $scope.govtClaimInfo.countyRejectedAfter6Months = null;
        $scope.govtClaimInfo.state = '';
        $scope.govtClaimInfo.stateRejectedDate = null;
        $scope.govtClaimInfo.stateRejectedAfter6Months = null;
        $scope.govtClaimInfo.other = '';
        $scope.govtClaimInfo.otherRejectedDate = null;
        $scope.govtClaimInfo.otherRejectedAfter6Months = null;
    };
    
    $scope.NewCourtInfo = function () {
        $scope.courtInfo.fileNo = $scope.newFileNo;
        $scope.courtInfo.caseNumber = '';
        $scope.courtInfo.court = '';
        $scope.courtInfo.address = '';
        $scope.courtInfo.city = '';
        $scope.courtInfo.state = '';
        $scope.courtInfo.zip = '';
    };
    
    $scope.NewMiscData = function () {
        $scope.miscData.splice(0, $scope.miscData.length);
       
    };
}