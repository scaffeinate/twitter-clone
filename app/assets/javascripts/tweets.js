// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
	$('#ps-media-upload-btn').click(function(e){
		e.preventDefault();
		$('#media-upload-btn').click();
	});

	$('#media-upload-btn').change(function(){
		$('#ps-media-upload-btn').removeClass('btn-default').addClass('btn-primary');
		readURL(this);
	});

	$('#remove-tweet-img').click(function(e){
		var media_upload_btn = $('#media-upload-btn');
		e.preventDefault();
		media_upload_btn.replaceWith(media_upload_btn.val('').clone(true));
		$('#tweet-img-preview').parent().addClass('hidden');
		$('#tweet-img-preview').remove();
		$('#ps-media-upload-btn').removeClass('btn-primary').addClass('btn-default');
	});

	$('#location-btn').click(function(e){
		e.preventDefault();
		var location = $('#tweet_location').val();
		if(location) {
			$(this).addClass('btn-default').removeClass('btn-primary');
			$('#tweet_location').val('');
		} else {
			$(this).removeClass('btn-default').addClass('btn-primary');
			geoFindMe();
		}
	});

	$('#tweet_tweet_text').keyup(function(){
    console.log('hello world');
		var len = $(this).val().length;
    $('#tweet-count').text(140 - len);
	});

});

function geoFindMe() {
	function success(position) {
		var latitude  = position.coords.latitude;
		var longitude = position.coords.longitude;
		$('#tweet_location').val(latitude + ',' + longitude);
	};

	function error() {
	};
	navigator.geolocation.getCurrentPosition(success, error);
}

function readURL(input) {

	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#tweet-img-preview').parent().removeClass('hidden');
			$('#tweet-img-preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}