<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html><!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
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
			swal("MGL",msg);
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
				swal("MGL","검색어를 입력해주세요.");
			}else{
			$("#frm").attr("action", "/UClub/SearchList.techni").submit();
			}
		}) 
		$(".post1").click(function(){
/* 			var method = method || "post"; 
		    var path = "/Club/ClubDetail.techni";
		    var form = document.createElement("form"); 
		    form.setAttribute("method", method);
		    form.setAttribute("action", path);
		        var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "c_idx");
		        hiddenField.setAttribute("value", c_idx);
		        form.appendChild(hiddenField);
		        var hiddenField2 = document.createElement("input");
		        hiddenField2.setAttribute("type", "hidden");
		        hiddenField2.setAttribute("name", "msg");
		        hiddenField2.setAttribute("value", null);
		        form.appendChild(hiddenField2);
		    document.body.appendChild(form);
		    form.submit();
		}); */
			var c_idx = $(this).attr("value");
		    $("#c_idx").val(c_idx);
		    $("#frm2").submit();
		});
	})
	
</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg"  alt="MGL" class="logo" onclick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>클럽(모임)</h1>
				</div>
				<div class="bt_top">
					<span id = "do"></span>
					<span class="icon-logout icon-f btn_i i-text" onClick="logout()">로그아웃</span>
					<span class="icon-search icon-f btn_i i-text" onclick="location.href='#'">클럽찾기</span>
					<span class="icon-add btn_i icon-f i-text" onclick="location.href='/UClub/UClubWrite.techni'">클럽생성</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<form method="post" id="frm">
				<div class="search_bar_area">
					<div class="search_bar">
						<input id='keyword' name='keyword' type="text" placeholder="지역, 클럽명으로 검색하세요.">
						<span id="btn_search" class="icon-search icon-f btn_i" ></span>
					</div>
				</div>
			</form>
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
			<div class="content white_bg pt_00">
				<ul class="list_room">
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
