// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var removeParent = function(e){
  $(e).parent().parent().remove();
};

$(document).ready(function(){
  $("#new-tweet").autosize();
});