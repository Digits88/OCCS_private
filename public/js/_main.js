'use strict';

/**********************************************************************
 * Angular Application
 **********************************************************************/
var app = angular.module('app', [   'ngGrid', 
                                    'ui.bootstrap', 
                                    'ngResource', 
                                    'ngRoute', 
                                    'ngAnimate', 
                                    'cgBusy',
                                    'xeditable'])
  .config(function ($routeProvider, $locationProvider, $httpProvider) {
    //================================================
    // Check if the user is connected
    //================================================
    var checkLoggedin = function ($q, $timeout, $http, $location, $rootScope, myService) {
        // Initialize a new promise
        var deferred = $q.defer();
        
        // Make an AJAX call to check if the user is logged in
        $http.get('/loggedin').success(function (user) {
            // Authenticated
            if (user !== '0')
                /*$timeout(deferred.resolve, 0);*/
                deferred.resolve();

        // Not Authenticated
            else {
                $rootScope.message = 'You need to log in.';
                //$timeout(function(){deferred.reject();}, 0);
                deferred.reject();
                $location.url('/login');
            }
        });
        
        return deferred.promise;
    };
    //================================================
    
    //================================================
    // Add an interceptor for AJAX errors
    //================================================
    $httpProvider.interceptors.push(function ($q, $location) {
        return {
            response: function (response) {
                // do something on success
                return response;
            },
            responseError: function (response) {
                if (response.status === 401)
                    $location.url('/login');
                return $q.reject(response);
            }
        };
    });
    //================================================
    
    //================================================
    // Define all the routes
    //================================================
    $routeProvider
      .when('/', {
        //templateUrl: '/views/main.html'
        //templateUrl: 'views/login.html',
        //controller: 'LoginCtrl'
    })
      .when('/dashboard', {
        templateUrl: 'views/dashboard.html',
        controller: 'DashboardCtrl',
        resolve: {
            loggedin: checkLoggedin
        }
    })
      .when('/login', {
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl'
    })
      .when('/register', {
        templateUrl: 'views/register.html',
        controller: 'RegisterCtrl'
    })
      .when('/users', {
        templateUrl: 'views/users.html',
        controller: 'UsersCtrl'
    })
      .when('/nggridtest', {
        templateUrl: 'views/nggridtest.html',
        controller: 'MyCtrl'
    })
      .when('/clients', {
        templateUrl: 'views/clients.html',
        controller: 'ClientsCtrl'
    })
      .when('/bootstraptest', {
        templateUrl: 'views/bootstraptest.html',
        controller: 'BootstrapCtrl'
    })
      .when('/generalsection', {
        templateUrl: 'views/generalsection.html',
        controller: 'GeneralSectionCtrl'
    })
      .when('/logout', {
        templateUrl: '/',
        controller: 'LogoutCtrl'
    })
      .otherwise({
        redirectTo: '/'
    });
        //================================================

})// end of config()
  .run(function ($rootScope, $http, myService, $location,editableOptions) {
    $rootScope.message = '';
    editableOptions.theme = 'bs2';
    $rootScope.isActive = function (viewLocation) {
        return viewLocation === $location.path();
    };

    // Logout function is available in any pages
    $rootScope.logout = function () {
        $rootScope.message = 'Logged out.';
        $http.post('/logout');
    };
}).directive('myLogin', function () {
    return {
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl'
    };
}).directive('generalSection', function () {
    return {
        restrict: 'E',
        templateUrl: 'directives/client/generalSection/generalsection.html',
        controller: 'GeneralCtrl'
    };
});