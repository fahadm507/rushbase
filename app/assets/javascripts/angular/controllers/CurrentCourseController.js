angular.module("rushBase")
  .controller("CurrentCourseController",["$scope", "CurrentCourse",
    function($scope, CurrentCourse){
      $scope.currentCourse = new CurrentCourse();
      $scope.currentCourses = '';
      var user_id = $scope.currentUser
      CurrentCourse.query({user_id: user_id}, function(success){
        $scope.currentCourses = success
    });

    // CurrentCourse.get({user_id: user_id},
    //   function(currentCourse){//if its exists
    //     $scope.currentCourse = currentCourse;//set currentCourse instance to the the one that exists
    //     $scope.responseBtn = false;//set 'add ad info button' to false( which hides the button)
    //     var element = angular.element('#krb5-info-id');//find add kerbros button and hide it
    //     element.hide();
    //   },
    //   function(currentCourse){// if it doesn't exist'

    //   });
    $scope.test = function(){
      return $scope.test = "hello world";
    }
    $scope.saveCurrentCourse = function(currentCourse){
      if (currentCourse.id){
        currentCourse.update({user_id:user_id}, currentCourse,

        function(response){
          $scope.currentCourse = response;
          $scope.notice = 'successfully updated';
        },
        function(error){
          //error message
          $scope.errors = error;
        });
      }else {
        console.log("data " + currentCourse.name);

        $scope.currentCourse.$save({user_id: user_id},

        function(currentCourse){
          $scope.currentCourses.push(currentCourse)
          $scope.notice = 'succesfully added';
        },
        function(currentCourse){
          $scope.errors = currentCourse;
        });
      }
    };

    $scope.deletecurrentCourse = function(){
      currentCourse.delete({user_id: user_id},
        function(success){
          $scope.notice = 'successfully deleted';
        },
        function(failure){

        }
      );
    };

  }]);



