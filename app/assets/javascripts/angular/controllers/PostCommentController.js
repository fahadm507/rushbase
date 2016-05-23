angular.module("rushBase")
  .controller("PostCommentController",["$scope","$http", "UserPost", "PostComment",
    function($scope, $http, UserPost, PostComment){
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

     // Simple GET request example:
  // $http({
  //   method: 'GET',
  //   //this includes a token with access to public_content of sandbox user
  //   url:'https://api.instagram.com/v1/users/self/?access_token=233406681.2df93bc.b3f21cd8e6d9414ebc65079572d58bc1'
  //   }).then(function(response) {
  //     // this callback will be called asynchronously
  //     $scope.test = "response.data"
  //     console.log(response.data)
  //     // when the response is available
  //   }, function(response) {
  //     // called asynchronously if an error occurs
  //     $scope.test = "failed"
  //     // or server returns response with an error status.
  //   });
}]);
