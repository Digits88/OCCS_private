'use strict';
/**********************************************************************
 * Login controller
 **********************************************************************/
angular.module('app').controller('LoginCtrl', function ($scope, $rootScope, $http, $location, myService) {
    // This object will be filled by the form
    $scope.user = {};
    $scope.user.username = "admin";
    $scope.user.password = "admin";
    $rootScope.isLoggingRequired = true;
    
    // Register the login() function
    $scope.login = function () {
        $http.post('/login', {
            username: $scope.user.username,
            password: $scope.user.password,
        })
    .success(function (user) {
            // No error: authentication OK
            myService.set(user.name);
            $rootScope.message = 'Authentication successful!';
            $rootScope.isLoggingRequired = false;
            $rootScope.loggedInUserName = "Hello " + myService.get() + "!";
            $location.url('/dashboard');
        })
    .error(function () {
            // Error: authentication failed
            $rootScope.message = 'Authentication failed.';
            $location.url('/login');
        });
    };
});