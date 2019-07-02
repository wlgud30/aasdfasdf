  $(document).ready(function($) {	
	var $loading_tag = $('<div class="loader-wrap"><div class="loader-shape">'+
     '<div class="loader"><span class="loader-item"></span><span class="loader-item"></span><span class="loader-item"></span><span class="loader-item"></span><span class="loader-item"></span></div></div></div>');
	var $loading_link = $('<link rel="stylesheet" href="css/loading.css">');
	$('head').append($loading_link);
	$('body').prepend($loading_tag);
    console.log('로딩 활성화');

 });
    $(window).on('load', function() {
   if($("body div").is(".loader-wrap") === true){
	$('body .loader-wrap').remove();
	  }		 
    console.log('로딩 비활성화');
  });	
