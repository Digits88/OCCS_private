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
    
    $scope.deleteUser = function (user_id) {
        // Simple POST request example (passing data) :
        $http.delete('/user/' + user_id)
        .success(function (data, status, headers, config) {
            // Fill the array to display it in the page
            $http.get('/users').success(function (users) {
                for (var i in users)
                    $scope.users.push(users[i]);
            });
            
            $scope.$watch("users", function () {
                $scope.$apply();
            });
                // this callback will be called asynchronously
                // when the response is available
        })
        .error(function (data, status, headers, config) {
            alert("error");
    // called asynchronously if an error occurs
    // or server returns response with an error status.
        });
    }
});

