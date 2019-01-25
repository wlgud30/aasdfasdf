<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
    <!-- <div class="head_top"> 
    <div class="bt_top"><i class="la la-navicon btn_i"></i> </div>
      <div class="logo_top" id="main_logo"><img src="/resources/img/logo_b.svg"  alt="MGLB" class="logo"  onClick="location.href='/Member/home.techni'"></div>
      <div class="tit_top" id="head1">
        <h1>배드민턴</h1>
      </div>
      <div class="bt_top">
        <span class="icon-bell btn_i"  onClick="location.href='/Member/home.techni'"></span>
        <span class="notice_ub">!</span>
      </div>
      InstanceBeginEditable name="main_top"
      InstanceEndEditable  </div>
    head_top end  -->
    <div class="head_top" id="head1">
      <div class="bt_top menu_quick">
      	<div class="btn_more"><i class="more_menu la la-navicon"></i> 
      		<ul class="me_ul">
				<li onClick="location.href='/Board/BoardList.techni'"><i class="icon-main icon-f"></i>홈</li>
		       	<li onClick="location.href='/UClub/UClubAllList.techni'"><i class="icon-club icon-f"></i>클럽</li>
		       	<li onClick="location.href='index4.html'"><i class="icon-user"></i>프로필</li>
		          </ul>
		</div>
	</div>
      <div class="logo_top" id="main_logo"><img src="/resources/img/logo1.svg"  alt="Minton-in" class="logo" onClick="location.href='/Board/BoardList.techni'"></div>
      <div class="bt_top">
        <div class="alarm" onClick="location.href='06-03_member_list3.html'">
          <span class="icon-bell btn_i" ></span>
          <span class="notice_ub">!</span>
        </div>
        <div class="btn_more"> <i class="more_menu la la-ellipsis-v"></i>
          <ul class="me_ul">
     	<li onClick="location.href='#;'">사용법</li>
		<li onClick="location.href='#;'">홈으로 설정</li>
          </ul>
        </div>
        <!-- btn_more end --> 
      </div>
    </div>
    <hr class="line_both">
    <!-- head_top end --> 
    
    <script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('#main_nav').navi_depth({pageNum:aa});		
     });
    </script>
<!--     <div id="main_nav_area">
      <ul id="main_nav">
        <li onClick="location.href='index1.html'">
          <span><img src="/resources/img/logoa.svg" alt="Minton-in" class="logo" onclick="location.href='index1.html'"></span>
        </li>
        <li onClick="location.href='index1-2.html'"> <i class="icon-club-info icon-f btn_i"></i>
          <span class="nav_text">클럽</span>
        </li>
        <li onClick="location.href='index1-3.html'"> <i class="icon-record icon-f btn_i"></i>
          <span class="nav_text">게임이력 </span>
        </li>
        <li onClick="location.href='index4.html'"> <i class="icon-profile icon-f btn_i"></i>
          <span class="nav_text">프로필 </span>
        </li>
        <li onClick="location.href='index5.html'"> <i class="icon-more icon-f btn_i"></i>
          <span class="nav_text">전체서비스 </span>
        </li>
      </ul>
    </div> -->