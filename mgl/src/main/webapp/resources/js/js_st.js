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
	var fix_top = document.getElementsByClassName('fix_top');	
    if (fix_top.length > 0 ) {	// 고정 요소 존재확인
	 $fix_top_cont = $(fix_top).next('div');
     $fix_top_cont.css({"margin-top":$(fix_top).outerHeight()});	
	 }		 
   }	
$(window).ready(height_cont).resize(height_cont);	

//textarea 높이 css
     $('textarea.texbox,textarea.write_text').on('keyup resize', function (){
       $(this).css('height', 'auto' );
       $(this).height( this.scrollHeight );
     }).trigger("keyup");

//검색바 토글
  var bt_top = document.getElementsByClassName('bt_top');
 $(bt_top).find('.icon-search').click(function () {
		var search_head = $(this).parents("header").next('#container');		  
		if (search_head.hasClass('input_search')) {
			search_head.removeClass('input_search');
			search_head.find('.search_bar_area').stop(true, false).slideUp(200); 
		}
		else {
			search_head.addClass('input_search');
			search_head.find('.search_bar_area').stop(true, false).slideDown(200);
		}	  
    });	 
	 
//아코디언
  var accordion = document.getElementsByClassName('accordion_ul');
	$(accordion).on('click','.accd_head', function(){
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.children('.accd_a').stop(true, false).slideUp(200);
		}
		else {
			element.addClass('open');
			element.children('.accd_a').stop(true, false).slideDown(200);
			element.siblings('li').children('.accd_a').stop(true, false).slideUp(200);
			element.siblings('li').removeClass('open');		
		}
	});	
	
//아코디언1
  var acd1 = document.getElementsByClassName('acd_area');
	$(acd1).on('click','.acd-head', function(){
		var acd_p = $(this).parent();
		if (acd_p.hasClass('open')) {
			acd_p.removeClass('open');
			acd_p.children('.acd-cont').stop(true, false).slideUp(200);
		}
		else {
			acd_p.addClass('open');
			acd_p.children('.acd-cont').stop(true, false).slideDown(200);	
		}
	});	
	
//라디어 박스 선택 슬라이드(아코디언)
  $('input[name^="option_add"]').change(function () {
	var check_uls= $(this).closest('.list_check').next('.check_ul_area');
   if($('#check_detail').is(':checked')){ 
    $(check_uls).stop(true, false).slideDown(200);
   }else{ 
    $(check_uls).stop(true, false).slideUp(200);
   }
  });	
	
//select 변경...
var $select = document.getElementsByTagName('select');
if ($select.length > 0) {
  $($select).prettyDropdown();  
  var selectTarget = $('.prettydropdown ul');  
  $(selectTarget).each(function(){
  var selectname = $(this).children('.selected').text();  
  $(this).before('<label></label>');
  $(this).siblings('label').text(selectname);
  $(this).on('click',function(){
    var select_name = $(this).children('.selected').text();
    $(this).siblings('label').text(select_name);
    });	
  });		
}			
//탭
  var tab_nav = document.getElementsByClassName('tab_cont'), 
      tab_con = document.getElementsByClassName('tab_cont_con'),
	  tab_navli = $(tab_nav).children();  
   for (var i = 0, tab_nav_le = tab_nav.length; i < tab_nav_le; i++) { 
   var tab_navle = tab_nav[i];
    $(tab_navle).children().first().addClass('active_tab');  
   } 
   
   for (var i = 0, tab_con_le = tab_con.length; i < tab_con_le; i++) { 
   var tab_conle = tab_con[i];
    $(tab_conle).children().first().show();     
   } 
   
  $(tab_navli).click(function(e){
      var tabIndex = $(tab_navli).index(this);
	  $(tab_con).children('.tab_con:eq('+tabIndex+')').siblings().hide();
	  $(tab_con).children('.tab_con:eq('+tabIndex+')').show();
  });

//tr 드래그 순서 변경
    var tr_move = document.getElementsByClassName('move_tr');
    var tr_mo =	$(tr_move).find('td').not('.btn_icons_td');
	if (tr_move.length > 0 ) {
	$(tr_move).tableDnD ({ 
            onDragStart: function(table, row) {
            // $(table).parent().find('.result').text(row.id);
			$(row).closest('tr').addClass('active_tr');			
		    $(table).find('tr').siblings().removeClass('move_active');
			$(row).closest('tr').siblings().removeClass('active_tr');				 
            },	
			dragHandle:tr_mo
	  }); 	
  	}
  
//tr 상하 순서 변경
$(tr_move).on('click','.icon-arrow-up',function(){ moveUp(this) });
$(tr_move).on('click','.icon-arrow-down',function(){ moveDown(this) });
function moveUp(el){
	var $tr = $(el).closest('tr'); 
	$tr.prev().before($tr);
			$tr.addClass('move_active');
			$tr.siblings('tr').removeClass('move_active');	
			$tr.siblings('tr').removeClass('active_tr');			
}
function moveDown(el){
	var $tr = $(el).closest('tr'); 
	$tr.next().after($tr); 
	$tr.addClass('move_active');
	$tr.siblings('tr').removeClass('move_active');	
	$tr.siblings('tr').removeClass('active_tr');	
}

//이름 텍스트 짤림...	
  var name_3 = document.getElementsByClassName('name3');
  var na_length = 5; //표시할 글자수
  for (var i = 0, name_le = name_3.length; i < name_le; i++) { 
   nle = name_3[i];
   if( $(nle).text().length >= na_length ){
    $(nle).text($(nle).text().substr(0,na_length)); 
    }  
   }
   
//클럽이름 club_name-long 짤림...	
  var clublong = document.getElementsByClassName('club_name-long');
  var clublong_le = 10; //표시할 글자수
  for (var i = 0, clublong_lg = clublong.length; i < clublong_lg; i++) { 
  var clublong_nu = clublong[i];
   if( $(clublong_nu).text().length >=clublong_le ){
    $(clublong_nu).text($(clublong_nu).text().substr(0,clublong_le)); 
    }  
   }  

//클럽 텍스트 짤림...	    
  var club_css = document.getElementsByClassName('club_name');
  var club_un = 8; //표시할 글자수	  
  for (var i = 0, club_le = club_css.length; i < club_le; i++) { 
  var clubnu = club_css[i]; 
   if( $(clubnu).text().length >= club_un ){
    $(clubnu).text($(clubnu).text().substr(0,club_un)); 
    }
   }  
  	
//첨부파일업로드
  var filebox = document.getElementsByClassName('filebox'); 
  var fileTarget = $(filebox).find('input.upload-hidden')   
    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $(this).siblings('.upload-name').val(filename);
    });	

//사인	
	var signature = document.getElementById('signature');	
	if ($(signature).length) {
		$(signature).jqSignature({lineWidth:2,height:180});	
        var sign_btn = $(signature).find('.btn_st');	
	    $(sign_btn).on('click', function(){
		$(signature).jqSignature('clearCanvas');
		$(this).fadeOut(50);
	    });
    	$(signature).on('jq.signature.changed', function() {
	      $(sign_btn).fadeIn(50);
	    });			
	  }	  
	  
// 데이타 넓이 조절	
  function col_side() {
	  $('.el_club_side').each(function () { 
		$(this).next('.side_rt_db').each(function(){ 
		$side_dt =$(this).outerWidth(); 
		});
        $(this).css({'max-width': 'calc(100% - ' + $side_dt+ 'px)'});	
	 });
    }	
  $(window).ready(col_side); 
  
// 데이타 no 영역 visible 처리
 var visib_td = document.getElementsByClassName('visible_area_td');
 if($(visib_td).children('table').has('tr').length > 0) {
   $(visib_td).show();
 } else {
   $(visib_td).hide();
 }
 $('.creat_btn').click(function(){
  if($(visib_td).children('table').has('tr').length > 0) {
   $(visib_td).show();
 } else {
   $(visib_td).hide();
 }
 });

 var visib_ul = document.getElementsByClassName('visible_area_ul');
 if($(visib_ul).children('ul').has('li').length > 0) {
   $(visib_ul).show();
 } else {
   $(visib_ul).hide();
 }
 $('.v_all').click(function(){
  if($(visib_ul).children('ul').has('li').length > 0) {
   $(visib_ul).show();
 } else {
   $(visib_ul).hide();
 }
});

});