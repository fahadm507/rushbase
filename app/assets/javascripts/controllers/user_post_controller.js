angular.module("rushBase")
  .controller("UserPostController",["$scope", "$resource", "UserPost", "User",
    function($scope,$resource, UserPost, User){
      $scope.user_posts = UserPost.query();
      $scope.all_users = User.query();

      var userId;
      $scope.$watch('currentUser', function(newVal){
        return userId = newVal;
      });

      console.log("user id ", $scope.userId);
      $scope.current = User.get({id: 3});

  }]);
