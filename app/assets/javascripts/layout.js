$(document).ready(function(){
   $(".scroll-top").hide();
   $(".scroll-top").click(function(){
    $("html, body").stop().animate({scrollTop:0}, '1000', 'swing');
  });

  $(document).scroll(function(){
     height = $(this).scrollTop();
     if(height > $(window).height()){
         $(".scroll-top").show();
         $(".scroll-top").css({"position":"fixed", "bottom":"30px", "right":"20px"});
     }else{
         $(".scroll-top").hide();
     }
  });
});

$(document).on("page:load", function(){
  $(".scroll-top").hide();
   $(".scroll-top").click(function(){
    $("html, body").stop().animate({scrollTop:0}, '1000', 'swing');
  });
});
