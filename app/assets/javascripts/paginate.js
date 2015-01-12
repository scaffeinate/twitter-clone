$(document).ready(function(){
  if($(".pagination").length) {
    $(".pagination").hide();
    $("#loader").removeClass("hidden");
    $(window).bindWithDelay("scroll", function(){
      var url = $("a.next_page").attr("href");
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $.getScript(url);
      }
    }, 750);
  }
});