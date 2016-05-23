var app = angular.module('rushBase',
  ['ngResource','ngRoute']);


app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when(
    '/courses',
    {
      templateUrl: 'angular/courses/index.html',
      controller:  'UserPostController'
    }
  ).otherwise({
      redirectTo: ''
    });
}]);
