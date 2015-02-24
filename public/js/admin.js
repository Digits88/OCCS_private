/**********************************************************************
 * Admin controller
 **********************************************************************/
angular.module('app').controller('AdminCtrl', function ($scope, $http, myService) {
    $scope.loggedInUserName = "Hello " + myService.get() + "!";
    // List of users got from the server
    $scope.users = [];
    // Fill the array to display it in the page
    $http.get('/users').success(function (users) {
        for (var i in users)
            $scope.users.push(users[i]);
    });
    // Fill the array to display it in the page
    //$http.get('/menus').success(function (users) {
    //    for (var i in users)
    //        $scope.users.push(users[i]);
    //});
});