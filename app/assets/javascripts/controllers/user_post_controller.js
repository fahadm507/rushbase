angular.module("rushBase")
  .controller("UserPostController",["$scope", "$resource", "UserPost", "User",
    function($scope,$resource, UserPost, User){
      $scope.user_posts = UserPost.query();
      $scope.all_users = User.query();
  }]);
