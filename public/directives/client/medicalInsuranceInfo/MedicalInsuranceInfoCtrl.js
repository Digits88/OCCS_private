<table>
                            <tr>
                                <td>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <input type="button" value="Edit">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="button" value="Save" ng-click="saveClientMedicalInsuranceInfo()">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="button" value="Cancel">
                                        </div>
                                    </div>
                                    <table>
                                        <!-- row 1 -->
                                        <tr>
                                            <td><label class="control-label">Named Insured: </label></td>
                                            <td><input type="text" placeholder="Named Insured" ng-model="medicalInsuranceInfo.namedInsured" /></td>
                                            <td><label class="control-label">Policy Number: </label></td>
                                            <td><input type="text" placeholder="Policy Number" ng-model="medicalInsuranceInfo.policyNumber" /></td>
                                        </tr>
                                        <!-- row 2 -->
                                        <tr>
                                            <td><label class="control-label">Insurance Company: </label></td>
                                            <td><input type="text" placeholder="Insurance Company" ng-model="medicalInsuranceInfo.insuranceCompany" /></td>
                                            <td><label class="control-label">Medi-Cal Number: </label></td>
                                            <td><input type="text" placeholder="Medi-Cal Number" ng-model="medicalInsuranceInfo.mediCalNumber" /></td>
                                        </tr>
                                        <!-- row 3 -->
                                        <tr>
                                            <td><label class="control-label">Address: </label></td>
                                            <td><input type="text" placeholder="Address" ng-model="medicalInsuranceInfo.address" /></td>
                                            <td><label class="control-label">Medi-Care Number: </label></td>
                                            <td><input type="text" placeholder="Medi-Care Number" ng-model="medicalInsuranceInfo.mediCareNumber" /></td>
                                        </tr>
                                        <!-- row 4 -->
                                        <tr>
                                            <td><label class="control-label">City: </label></td>
                                            <td><input type="text" placeholder="City" ng-model="medicalInsuranceInfo.city" /></td>
                                            <td><label class="control-label">Claim Number: </label></td>
                                            <td><input type="text" placeholder="Claim Number" ng-model="medicalInsuranceInfo.claimNumber" /></td>
                                        </tr>
                                        <!-- row 5 -->
                                        <tr>
                                            <td><label class="control-label">State: </label></td>
                                            <td><input type="text" placeholder="State" ng-model="medicalInsuranceInfo.state" /></td>
                                        </tr>
                                        <!-- row 6 -->
                                        <tr>
                                            <td><label class="control-label">Zip: </label></td>
                                            <td><input type="text" placeholder="Zip" ng-model="medicalInsuranceInfo.zip" /></td>
                                        </tr>
                                        <!-- row 7 -->
                                        <tr>
                                            <td><label class="control-label">Phone Number: </label></td>
                                            <td><input type="text" placeholder="Phone Number" ng-model="medicalInsuranceInfo.phoneNumer" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <!-- Client Injuries -->
                                <td>
                                    <accordion-group is-open="clientInjuries.open">
                                        <accordion-heading>
                                            Client Injuries<i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': clientInjuries.open, 'glyphicon-chevron-right': !clientInjuries.open}"></i>
                                        </accordion-heading>
                                        <p class="gridStyle" ng-grid="clientInjuriesGridOptions"></p>
                                        <table>
                                            <tr>
                                                <td><input type="text" placeholder="Note" ng-model="selectedClientInjury[0].note" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div ng-controller="DatepickerCtrl">
                                                        <p class="input-group">
                                                            <input type="text" class="form-control" datepicker-popup="shortDate" ng-model="selectedClientInjury[0].modifiedDate" is-open="opened" min-date="minDate" max-date="'2015-06-22'" datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3"><input type="text" placeholder="Note" ng-model="selectedClientInjury[0].description" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <input type="button" value="Add New">
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="button" value="Edit">
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="button" value="Save">
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="button" value="Delete">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </accordion-group>
                                </td>
                            </tr>
                        </table>