angular.module('directory.controllers', [])
  .controller('HomeCtrl', function ($scope, Auth, $location) {
    if(!Auth.isAuthenticated()){
      $location.path("/login");
    }
  })
  .controller('LoginCtrl', function ($scope, Auth, $http, $location) {
    $scope.formData = {};

    $scope.submit = function() {
      Auth.login($scope.formData).then(function(user) {
            console.log(user); // => {id: 1, ect: '...'}
        }, function(error) {
            // Authentication failed...
        });

        $scope.$on('devise:login', function(event, currentUser) {
            // after a login, a hard refresh, a new tab
        });

        $scope.$on('devise:new-session', function(event, currentUser) {
            // user logged in by Auth.login({...})
        });
    }

  });