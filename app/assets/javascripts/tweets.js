// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
	$("#ps-media-upload-btn").click(function(e){
		e.preventDefault();
		$(this).removeClass("btn-default").addClass("btn-primary");
		$("#media-upload-btn").click();
	});

	$("#location-btn").click(function(e){
		e.preventDefault();
		$(this).removeClass("btn-default").addClass("btn-primary");
		geoFindMe();
	});

});

function geoFindMe() {
	
	function success(position) {
		var latitude  = position.coords.latitude;
		var longitude = position.coords.longitude;
		$("#tweet_location").val(latitude + "," + longitude);
	};

	function error() {

	};

	navigator.geolocation.getCurrentPosition(success, error);
}