$('#cancel-admin-auth-btn').on('click', function() {
        $("#admin-sign-in-box").toggleClass('show hidden animated fadeInUp');
	return false;
});

$('#cancel-pwd-btn').on('click', function() {
        $("#forgot-pwd-box").toggleClass('show hidden animated fadeInUp');
	return false;
});

$('#get-pwd-btn').on('click', function() {
	return false;
});

$('#forgot-pwd').on('click', function() {
	$("#sign-in-box").toggleClass('show hidden animated fadeInUp');
	$("#forgot-pwd-box").toggleClass('show hidden animated fadeInUp');
	return false;
});
$('#sign-in-box').on('click', function() {
	return false;
});
$('#admin-sign-in-box').on('click', function() {
	return false;
});
$('#forgot-pwd-box').on('click', function() {
	return false;
});
$('#sign-in').on('click', function() {
//	$("#sign-up").toggleClass('show hidden');
//	$("#sign-in").toggleClass('show hidden');
if (!$("#forgot-pwd-box").hasClass('hidden')) {
        $("#forgot-pwd-box").toggleClass('show hidden animated fadeInUp');
    }


        $("#forgot-pwd-box").addClass('hidden');
	$("#sign-in-box").toggleClass('show hidden animated fadeInUp');
//	$("#cogs-menu").toggleClass('show hidden animated fadeIn');
//	$("#profile-menu").toggleClass('show hidden animated fadeIn');
	return false;
});
$('#admin-sign-in').on('click', function() {
	$("#admin-sign-in-box").toggleClass('show hidden animated fadeInUp');
	return false;
});
$('#sign-out').on('click', function() {
	$("#sign-up").toggleClass('show hidden');
	$("#sign-in").toggleClass('show hidden');
	$("#cogs-menu").toggleClass('show hidden animated fadeIn');
	$("#profile-menu").toggleClass('show hidden animated fadeIn');
	return false;
});

// Sign-in box toggle
// =================
$('#sign-in-btn').on('click', function() {
	$("#sign-in-box").toggleClass('show hidden animated fadeInUp');
	return false;
});

// Admin Sign-in box toggle
// =================
$('#admin-sign-in-btn').on('click', function() {
	$("#admin-sign-in-box").toggleClass('show hidden animated fadeInUp');
	return false;
});

// Search box toggle
// =================
$('#search-btn').on('click', function() {
	$("#search-icon").toggleClass('fa-search fa-times margin-2');
	$("#search-box").toggleClass('show hidden animated fadeInUp');
	return false;
});

// Smooth scrolling for UI elements page
// =====================================
$(document).ready(function(){
   $('a[href*=#buttons],a[href*=#panels], a[href*=#info-boards], a[href*=#navs], a[href*=#alerts], a[href*=#thumbnails], a[href*=#social], a[href*=#section-header],a[href*=#page-tip], a[href*=#block-header], a[href*=#tags]').bind("click", function(e){
	  var anchor = $(this);
	  $('html, body').stop().animate({
		 scrollTop: $(anchor.attr('href')).offset().top
	  }, 1000);
	  e.preventDefault();
   });
   return false;
});

// 404 error page smile
// ====================
$('#search-404').on('focus', function() {
	$("#smile").removeClass("fa-meh-o flipInX");
	$("#smile").addClass("fa-smile-o flipInY");
});

$('#search-404').on('blur', function() {
	$("#smile").removeClass("fa-smile-o flipInY");
	$("#smile").addClass("fa-meh-o flipInX");
});
// Sign up popovers
// ================
$(function(){
	$('#exampleInputName1').popover();
});

$(function(){
	$('#exampleInputUsername1').popover();
});

$(function(){
	$('#exampleInputEmail1').popover();
});

$(function(){
	$('#exampleInputPassword1').popover();
});

$(function(){
	$('#exampleInputPassword2').popover();
});

// Profile - Status Update 
// =======================

$('#update-status').on('click', function() {
	$(".user-status > p").toggleClass("show hidden");
	$(".user-status > form").toggleClass("hidden show");
	return false;
});

$('.user-status > form > button').on('click', function() {
	$(".user-status > p").toggleClass("show hidden");
	$(".user-status > form").toggleClass("hidden show");
	return false;
});

// Lost password form
//===================

$('.pwd-lost > .pwd-lost-q > a').on('click', function() {
	$(".pwd-lost > .pwd-lost-q").toggleClass("show hidden");
	$(".pwd-lost > .pwd-lost-f").toggleClass("hidden show animated fadeIn");
	return false;
});
