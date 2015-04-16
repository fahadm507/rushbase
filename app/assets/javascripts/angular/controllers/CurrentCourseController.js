angular.module("rushBase")
  .controller("CurrentCourseController",["$scope", "CurrentCourse",
    function($scope, CurrentCourse){
      var user_id = $scope.currentUser
      console.log("user_id = " + user_id)
      CurrentCourse.query({user_id: user_id}, function(success){
        $scope.currentCourses = success
      });
  }]);



