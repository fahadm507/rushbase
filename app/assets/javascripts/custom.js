$(document).ready(function(){
  $(".rotate").textrotator({
    separator: ",",
    speed: 5000
  });

  $("div.mystuff-tab-menu>div.list-group>a").click(function(e) {
    e.preventDefault();
    $(this).siblings('a.active').removeClass("active");
    $(this).addClass("active");
    var index = $(this).index();
    $("div.mystuff-tab>div.mystuff-tab-content").removeClass("active");
    $("div.mystuff-tab>div.mystuff-tab-content").eq(index).addClass("active");
  });

  //find current post and toggle comments and new
  //comment actions
  var postId, targetComments, commentFormId;
  $(".add-comment").click(function(){
    postId =  $(this).attr("data-comment");
    targetComments = ("#all-comments-"+ postId)
    commentFormId = ("#new-comment-form-"+postId)
    $(commentFormId).toggle();
    $(targetComments).toggle();
  });

  $(".count-comments").click(function(){
    postId =  $(this).attr("data-comment");
    targetComments = ("#all-comments-"+ postId)
    commentFormId = ("#new-comment-form-"+postId)
    $(commentFormId).toggle();
    $(targetComments).toggle();
  });

  //adding current courses on the user profile
  $(".add-current-course").click(function(){
    var userId =  $(this).attr("data-user");
    var targetForm = ("#new-current-course-form-"+ userId)
    $(targetForm).toggle();
    $("#hide-current-course-form").click(function(){
      $(targetForm).hide();
    });

  });
  //adding take courses
  $(".add-taken-course").click(function(){
    var userId =  $(this).attr("data-user");
    var targetForm = ("#taken-course-form-"+ userId)
    $(targetForm).toggle();
    $("#hide-taken-course-form").click(function(){
      $(targetForm).hide();
    });
  });
  //Adding future courses
  $(".add-future-course").click(function(){
    var userId =  $(this).attr("data-user");
    var targetForm = ("#future-course-form-"+ userId)
    $(targetForm).toggle();
    $("#hide-future-course-form").click(function(){
      $(targetForm).hide();
    });
  });

  $(".add-education").click(function(){
    var userId =  $(this).attr("data-user");
    var targetForm = ("#education-form-"+ userId)
    $(targetForm).toggle();
    $("#hide-education-form").click(function(){
      $(targetForm).hide();
    });
  });




});
