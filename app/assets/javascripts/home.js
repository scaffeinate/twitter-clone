// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var removeParent = function(e){
  $("#tweet-"+$(e).data('tweet')+" .reply-form > .row").remove();
};

$(document).ready(function(){
  $("#tweet_tweet_text").autosize();
});