angular.module('rushBase')
  .factory('CurrentCourse', function($resource){
    var CurrentCourse = $resource('/users/:user_id/current_courses/:id.json',
      {id: '@id', user_id: '@user_id'},
      {
        update: { method: 'PUT' }
      });
    return CurrentCourse;

  });
