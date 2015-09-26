$(document).ready(function(){
   $(".scroll-top").hide();
   $(".scroll-top").click(function(){
    $("html, body").stop().animate({scrollTop:0}, '1000', 'swing');
  });

   $(".funy").hover(function(){
     $(this).css({"width": "60", "height": "60"});
   }, function(){
     $(this).css({"width": "40", "height": "40"});
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
   $(".funy").hover(function(){
     $(this).css({"width": "60", "height": "60"});
   }, function(){
     $(this).css({"width": "40", "height": "40"});
   });
});
