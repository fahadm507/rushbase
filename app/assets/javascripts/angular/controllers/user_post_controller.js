angular.module("rushBase")
  .controller("UserPostController",["$scope", "$resource", "UserPost",
    function($scope,$resource, UserPost){
      $scope.userPosts = UserPost.query();
      $scope.postComments = PostComment.query({user_post_id: $scope.userPostId});
  }]);

