'use strict';
/**********************************************************************
 * Login controller
 **********************************************************************/
angular.module('app').controller('LogoutCtrl', function ($scope, $rootScope, $http, $location, myService) {
    // This object will be filled by the form
    
    $http.post('/logout')
    .success(function () {
      
        $location.url('/');
    })
    .error(function () {
    
        $location.url('/');
    });

});