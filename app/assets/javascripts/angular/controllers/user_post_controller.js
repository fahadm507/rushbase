angular.module("rushBase")
  .controller("UserPostController",["$scope", "$resource", "UserPost",
    function($scope,$resource, UserPost){

      $scope.userPosts = UserPost.query();
  }]);

