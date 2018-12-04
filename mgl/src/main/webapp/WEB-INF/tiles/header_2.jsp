<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="fix_top">
<style>
			header:before{border-bottom: 1px solid #dedee0;} header{box-shadow:none}
</style>
      <script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('#main_nav').navi_depth({pageNum:aa});		
     });
    </script>
      <div id="main_nav_area">
        <ul id="main_nav">
          <li onClick="location.href='index1.html'">
            <span>홈</span>
          </li>
          <li onClick="location.href='index1-2.html'">
            <span>클럽</span>
          </li>
          <li onClick="location.href='index1-3.html'">
            <span>게임이력</span>
          </li>
          <li onClick="location.href='index4.html'">
            <span>프로필</span>
          </li>
          <li onClick="location.href='index5.html'">
            <span>전체서비스</span>
          </li>
        </ul>
      </div>
    </div>