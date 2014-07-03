angular.module('directory.controllers', [])
  .controller('HomeCtrl', function ($scope, Auth, $location) {
    if(!Auth.isAuthenticated()){
      $location.path("/login");
    }
  });