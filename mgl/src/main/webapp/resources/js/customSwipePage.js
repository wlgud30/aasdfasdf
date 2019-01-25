jQuery(document).ready(function($) {	
//container 높이 css
  function height_cont() {
	 var $ft = $('#ft_area').find('.ft_menu');
	if ($ft.length > 0 ) { //존재확인
    $cont_h = $(window).height() - $('header').outerHeight() - $ft.outerHeight()+1;
	} else {
	$cont_h = $(window).height() - $('header').outerHeight();
	}
    $('#container').css({'height':$cont_h, "margin-top":$('header').outerHeight(true)});
   }	
$(window).ready(height_cont).resize(height_cont);	 
});
    $( document ).one( "pagecreate", ".eventPage", function() {
        // Handler for navigating to the next page
        function navnext( next ) {
            $( ":mobile-pagecontainer" ).pagecontainer( "change", next + ".html", {
                transition: "slide"
            });
        }
 
        // Handler for navigating to the previous page
        function navprev( prev ) {
            $( ":mobile-pagecontainer" ).pagecontainer( "change", prev + ".html", {
                transition: "slide",
                reverse: true
            });
        }
        
        $( document ).on( "swipeleft", ".ui-page", function( event ) {
            var next = $( this ).jqmData( "next" );
            if ( next ) {
                navnext( next );
            }
        });
        
    $( document ).on( "click", ".next", function() {
        var next = $( ".ui-page-active" ).jqmData( "next" );
        // Check if there is a next page
        if ( next ) {
            navnext( next );
        }
    });		
        $( document ).on( "swiperight", ".ui-page", function( event ) {
            var prev = $( this ).jqmData( "prev" );
            if ( prev ) {
                navprev( prev );
            }
        });
    $( document ).on( "click", ".prev", function() {
        var prev = $( ".ui-page-active" ).jqmData( "prev" );
        if ( prev ) {
            navprev( prev );
        }
    });		
        
    });
$( document ).on( "pagebeforeshow", ".eventPage", function() {		
      var thePage = $( this ),
        title = thePage.jqmData( "title" );	
        next = thePage.jqmData( "next" ),
        prev = thePage.jqmData( "prev" );
    $( "header h1" ).text( title );
    if ( next ) {
        $( ":mobile-pagecontainer" ).pagecontainer( "load", next + ".html" );
    }
    $( ".next.active_btn, .prev.active_btn" ).removeClass( "active_btn" );
    if ( ! next ) {
        $( ".next" ).addClass( "active_btn" );
    }
    if ( ! prev ) {
        $( ".prev" ).addClass( "active_btn" );
    }
});
			