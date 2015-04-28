angular.module('rushBase')
  .factory('PostComment', function($resource){
    var PostComment = $resource('/user_posts/:user_post_id/post_comments/:id.json',
      {id: '@id', user_post_id: '@user_post_id' },
      {
        update: { method: 'PUT' }
      });
    return PostComment;
  });
