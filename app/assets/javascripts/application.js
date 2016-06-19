// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .
//= require jquery.bxslider.js
//= require jquery.bxslider.min.js


$(function(){
	$('header').hover(function(){
		$('.homeimage').animate({'top':'-200px'});
	});
	$('.homeimage').hover(function(){
		$(this).animate({'left':'1900px'}),
		setTimeout(function(){
    $('.homeimage').fadeOut();
		},1000);

	});

    $(document).on('page:change', function(event) {
	setTimeout(function(){
	$('.hometopload').fadeOut(2000);
	setTimeout(function(){

  
	$('.homecontentall').fadeIn();

	},2000);
	},2000);
	});

	$(document).ready(function(){
	  $('.bxslider').bxSlider({auto:true});
	  });
	
});
