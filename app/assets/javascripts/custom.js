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


});
