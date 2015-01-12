$(document).ready(function(){
  if($(".pagination").length) {
    $(window).scroll(function(){
      var url = $("a.next_page").attr("href");
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
       $.getScript(url);
      }
    });
  }
});