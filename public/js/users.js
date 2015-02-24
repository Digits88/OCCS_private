/**********************************************************************
 * Users controller
 **********************************************************************/
angular.module('app').controller('UsersCtrl', function ($scope, $http, myService) {
    // List of users got from the server
    $scope.users = [];
    // Fill the array to display it in the page
    $http.get('/users').success(function (users) {
        for (var i in users)
            $scope.users.push(users[i]);
    });
    
});