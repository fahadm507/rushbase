angular.module("rushBase")
  .controller("UserPostController",["$scope", "$resource", "UserPost","Auth",
    function($scope,$resource, UserPost, Auth){

      $scope.user_posts = UserPost.query();
      console.log(Auth._currentUser);
      console.log(Auth.isAuthenticated())
      // var credentials = {

      //   };

      //   Auth.register(credentials).then(function(registeredUser) {
      //       console.log(registeredUser); // => {id: 1, ect: '...'}
      //   }, function(error) {
      //       // Registration failed...
      //   });

      //   $scope.$on('devise:new-registration', function(event, user) {
      //       // ...
      //   });

  }]);

