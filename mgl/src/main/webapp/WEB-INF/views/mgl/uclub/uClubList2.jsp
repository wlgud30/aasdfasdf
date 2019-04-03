<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.ti	{
	display: block !important;text-overflow:ellipsis;overflow: hidden;white-space: nowrap
}
</style>
<script>

var toYN = navigator.userAgent.indexOf("TOKEN:")

function pushTok(token,u_nm,msg,url){
	
	var PostString_link ="";
	
	PostString_link = "sendtype=push"
	PostString_link = PostString_link+"&appcode=techni_mglb"
	PostString_link = PostString_link+"&notitype=noti"
	PostString_link = PostString_link+"&oscode=a"
	PostString_link = PostString_link+"&token="+token
	PostString_link = PostString_link+"&title=MGL"
	PostString_link = PostString_link+"&desc="+encodeURI(msg)
	PostString_link = PostString_link+"&dataval="+encodeURI("http://mgl.techni.co.kr:8081/UClub/UClubAllList.techni")
	
	$.ajax({
		url : "/Member/token.techni",
		type : 'post',
		data : PostString_link,
		contentType : "application/x-www-form-urlencoded",
		charset : "UTF-8",
		success : function(){
		}
	})

}
	function logout(){
		var filter = "win16|win32|win64|mac";
		if(toYN != -1){
		if(navigator.platform){
			if(0 > filter.indexOf(navigator.platform.toLowerCase())){
				window.Android.appcall("0","null","null");
				location.href="/Member/Logout.techni"
			}else{
				location.href="/Member/Logout.techni"
			}
		}
	}else{
		location.href="/Member/Logout.techni"
	}

	} 
	$(document).ready(function(){
		var ag = navigator.userAgent;
		/* var msg = "${msg}";
		var push = "${u_push}";
		var nm = "${u_nm}";
		if(msg !="" && msg!=null){
			swal("민턴in",msg);
			if(push !="" && push !=null){
				pushTok(push,nm,nm+"님이 가입을 신청하였습니다.","http://mgl.techni.co.kr:8081/UClub/UclubMUserList.techni?c_idx=${c_idx}");
			}
		} */
		var filter = "win16|win32|win64|mac";
		
		if(toYN != -1){
		if(navigator.platform){
			if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			window.Android.appcall("1","${id}","${pw}");
				
			}
		}
		}
		
		 $("#btn_search").click(function(){
			var keyword = $("#keyword").val();
			if(keyword == ""||null){
				swal("민턴in","검색어를 입력해주세요.");
			}else{
			$("#frm").attr("action", "/UClub/SearchList.techni").submit();
			}
		}) 
		$(".post1").click(function(){
			var c_idx = $(this).attr("value");
		    $("#c_idx").val(c_idx);
		    $("#frm2").submit();
		});
	})
	
</script>

	
		<div class="tab_btn_b_area" style="margin-top: 46px;">
      <ul class="tab_btn_b">
        <li class="active_tab" onClick="location.href='index1-2.html'">
          <span>가입한 클럽</span>
        </li>
        <li onClick="location.href='index2-2.html'">
          <span>클럽 검색</span>
        </li>
        <li onClick="location.href='04-01_club_info_regist.html'">
          <span>클럽 생성</span>
        </li>
      </ul>
    </div>
			<!-- InstanceBeginEditable name="container" -->
			<c:choose>
				<c:when test="${list.size()==0 }">
					<div class="content white_bg">
						<h3 class="guide_big">
							<span class="icon-outline_4"></span>클럽이 없습니다.
						</h3>
					</div><!-- content end -->
					<div class="content white_bg">
					<h4 class="title_g">클럽 가입 방법</h4>
					<ol>
						<li>클럽 검색 아이콘  <span class="icon-magnifier main_color"></span> 을 클릭합니다.</li>
						<li>검색된 클럽을 선택합니다.</li>
						<li>클럽을 확인하고 "가입신청" 버튼을 누릅니다.<br><span class="main_color">참조)</span> 클럽 매니저가 검토 후 가입을 '승인' 합니다.</li>
					</ol>
						<hr class="line_div">
						<h4 class="title_g">클럽 생성 방법</h4>
					<ol>
						<li>클럽 생성 아이콘 <span class="icon-add main_color"></span> 을 클릭합니다.</li>
						<li>클럽 정보를 입력합니다.</li>
						<li>모든 항목 정보 입력후 등록 버튼을 클릭합니다.</li>
					</ol>
					</div>
				</c:when>
				<c:otherwise>
			<div class="content pt_00">
				<ul class="list_room white_bg mb_t">
				<c:forEach var="data" items="${list}">
					<li class="post1" value=${data.c_idx }>
						<div class="room_photo">
							<div class="photo_area" style="background-image: url(${data.c_photo})"></div>
						</div>
						<div class="room_data">
							<h4>${data.c_nm }</h4>
							<div class="li_date">
								<span class="ti"><c:set var="location" value="${data.c_location}" />${data.c_location}</span>
								<span class="members"><i class="icon-user"></i>${data.cu_cnt}</span>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			</c:otherwise>
			</c:choose>
			<form method="post" action="/Club/ClubDetail.techni" id="frm2">
				<input type="hidden" name="c_idx" id="c_idx">
			</form>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>
