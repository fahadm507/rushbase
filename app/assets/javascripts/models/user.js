angular.module('rushBase')
  .factory('User', function($resource){
    var User = $resource('/users/:id.json',
      {id: '@id'},
      {
        update: { method: 'PUT' }
      });
    return User;

  });
