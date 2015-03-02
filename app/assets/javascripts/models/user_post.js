angular.module('rushBase')
  .factory('UserPost', function($resource){
    var UserPost = $resource('/user_posts/:id.json',
      {id: '@id'},
      {
        update: { method: 'PUT' }
      });
    return UserPost;

  });
