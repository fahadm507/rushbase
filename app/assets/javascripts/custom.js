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

});
