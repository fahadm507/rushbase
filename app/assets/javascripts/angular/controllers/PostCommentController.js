angular.module("rushBase")
  .controller("PostCommentController",["$scope", "UserPost", "PostComment",
    function($scope, UserPost, PostComment){
      //$scope.userPosts = UserPost.query();
      $scope.postComment = new PostComment();
      $scope.savePostComment = function(postComment){
      if (postComment.id){
        postComment.update({user_id:user_id}, postComment,

        function(response){
          $scope.postComment = response;
          $scope.notice = 'successfully updated';
        },
        function(error){
          //error message
          $scope.errors = error;
        });
      }else {
        $scope.postComment.$save({user_post_id: $scope.userPostId},
        function(postComment){
          $scope.postComments = UserPost.query({user})
          $scope.newComment = postComment;
          $scope.notice = 'succesfully added';
        },
        function(postComment){
          $scope.errors = postComment;
        });
      }
    };
  }]);
