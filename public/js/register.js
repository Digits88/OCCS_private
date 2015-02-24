'use strict';

/**********************************************************************
 * Register controller
 **********************************************************************/
angular.module('app').controller('RegisterCtrl', function ($scope, $rootScope, $http, $location) {
    // This object will be filled by the form
    $scope.user = {};
    
    // Register the login() function
    $scope.register = function () {
        $http.post('/register', {
            username: $scope.user.username,
            password: $scope.user.password,
        })
    .success(function (user) {
            // No error: authentication OK
            $rootScope.message = 'Authentication successful!';
            $location.url('/dashboard');
        })
    .error(function () {
            // Error: authentication failed
            $rootScope.message = 'Authentication failed.';
            $location.url('/login');
        });
    };
});