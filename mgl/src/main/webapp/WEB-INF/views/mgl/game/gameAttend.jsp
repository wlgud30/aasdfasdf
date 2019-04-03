<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd ");
	Calendar cal = Calendar.getInstance();
	String Today = dateFormat.format(cal.getTime());
%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var attendList = new Array();
		var cnt = 0;
		$("input[name^='player_name']").each(function(){
			attendList[cnt] = $(this).val();
			
			 $(":checkbox").each(function(){
				 m = $(this).val();
					if(attendList[cnt]== m){
						$(this).attr("disabled",true);
						$(this).closest('li').css({'background-color':'#F0F0F0'});
					} 
			 });	// checked 끝
			cnt++;
		});	// player_name each() 끝
	}); // jquery 끝

		function startTime() {
			    var today = new Date();
			    var h = today.getHours();
			    var m = today.getMinutes();
			    var s = today.getSeconds();
			    var di = "";
			    m = checkTime(m);
			    s = checkTime(s);
			    if( h > 11 && h < 24 ){
			    	di = "PM";
			    	h = parseInt(h % 12);
			    	if(h == 0){
			    		h = 12;
			    	}
			    	h = parseInt(h % 12);
			    } else {
			   		di = "AM";
			    }
			    di + " " + h + ":" + m;
			    var t = setTimeout(startTime, 500);
		}
		function checkTime(i) {
		    	if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    	return i;
		}
		
		function AjaxAttend(t){
			if(confirm("선택하신 회원을 출석등록하시겠습니까?")){
				var xhttp;
				var url = "/Ajax/AJax4GameAttend.techni";
				var tot = 0;
				if(window.XMLHttpRequest){
					xhttp = new XMLHttpRequest();
				} else {
					xhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				$(":checked").each(function(){
					tot++;
				});
				var c = 0;
				$(":checked").each(function(){
					xhttp.onreadystatechange=function(){
						if(this.readyState == 4 && this.status == 200) {
						};
					};
					c++;
					xhttp.open("GET", url+"?uId=" + $(this).val() + "&today="+t, true);
					xhttp.send();
<% 	//아래 alert("선택하신...")태그는 ajax처리가 잘 안되어 임시로 넣었습니다. (*check 다수개 등록시 오류때문) 
		//다른 방법으로 사용하여도 무관합니다.
%>					
					alert("선택하신 "+ tot + " 명 중 " + c +" 번째 회원이 등록되었습니다.");
				});
				location.href="/Game/GameAttend.techni";
			}else{
				return;
			}
		}
	
function attend(){
	$.ajax({
		type:"POST",
		url:"/UClub/AttendInsert.techni",
		success:function(data){
			if(data.cnt > 0 ){
				location.href="/UClub/AttendList.techni"
			}else{
				swal("민턴in", "이미 출석된 회원입니다.");
			}
		},
		error : function(error){
			swal("민턴in","error : " + error);
		}
	});
}

function attendOut(){
	$.ajax({
		type:"POST",
		url:"/UClub/attendOut.techni",
		success:function(data){
			if(data.cnt > 0 ){
				location.href="/UClub/AttendList.techni"
			}else{
				swal("민턴in", "이미 퇴실 상태입니다.");
			}
		},
		error : function(error){
			swal("민턴in","error : " + error);
		}
	});
}
		
function multiAttend(){
	var u_id=[];
	$('input[class="li_check ck_rt"]:checkbox:checked').each(function(){u_id.push($(this).val());});
	$.ajax({
		type:"POST",
		url:"/UClub/MultiAttend.techni",
		dataType:'json',
		data : JSON.stringify({u_id: u_id }),
		contentType : "application/json; charset=UTF-8",
		success:function(data){
			if(data.cnt > 0 ){
				location.href="/UClub/AttendList.techni"
			}else{
				swal("민턴in", "이미 퇴실 상태입니다.");
			}
		},
		error : function(error){
			swal("민턴in","error : " + error);
		}
	});
}		

</script>
<body onload="startTime()">
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="민턴in" class="logo" onclick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>${list[0].c_nm }</h1>
				</div>
				<div class="bt_top">
					<c:choose>
						<c:when test="${u_status eq '게임중'}">
							<span class="icon-playing icon-f btn_i i-text">게임중</span>
						</c:when>
						<c:when test="${u_status eq '게임대기' }">
							<span class="icon-expect icon-f btn_i i-text">대기중</span>
						</c:when>
						<c:when test="${u_status eq '게임가능'}"> 
							<span class="icon-out icon-f btn_i i-text" onClick=attendOut();>퇴실</span>
						</c:when>
						<c:otherwise>
							<span class="icon-enter icon-f btn_i i-text" onClick=attend();>출석</span>
						</c:otherwise>
					</c:choose>
					<!-- <span class="btn_st btn_wh" onclick="location.href='/Game/GameMemberAttend.techni'">게임준비</span> -->
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-8, -7);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					})
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/GameState.techni'" class="main_select"><span>게임현황판</span></li>
					<li onClick="location.href='/UClub/GameOKList.techni'"><span>게임등록</span></li>
					<li class="active_tab" onClick="location.href='/UClub/AttendList.techni '"><span>출석확인</span></li>
				</ul>
			</div>
			<div class="content white_bg">
				<div class="bd_cat col_2-1">
					<!-- <div>
						<h4 class="title_m">출석회원</h4>
					</div> -->
					<div>
						<ul class="li_small">
							<%-- <li><b>등록시간</b><%=now %>2018.03.22 PM 07:38</li> --%>
							<li><b>출석회원</b>${fn:length(listY)} 명 /<c:choose><c:when test="${fn:length(list) eq 0 }">${listY[0].c_count} 명</c:when><c:otherwise> ${list[0].c_count} 명</c:otherwise> </c:choose></li>
						</ul>
					</div>
				</div>
				<ul class="li_name">
					<%-- <c:if test="${ACNT != '' && ACNT ne null }"> --%>
					<c:forEach var="attend" items="${listY}">
					<li>
						<div class="photo_name">
							<div class="thum_area">
								<div class="thum" style="background-image: url(${attend.u_photo});"></div>
							</div>
							<div class="text_area">
							<!-- class="name3" 를 퇴실표시때문에 제거 -->
								<span>${attend.u_nm}
								<c:if test="${attend.u_status eq '퇴실' }">(${attend.u_status })</c:if></span>
								<span class="age_rank">(${fn:substring(attend.u_age ,0,1)}0-${attend.u_club_gd })</span>
							</div>
							<input type="hidden" id="player_name" name="player_name" value="${attend.u_id }" />
						</div>
					</li>
					</c:forEach>
					<%-- </c:if> --%>
				</ul>
			</div>
			<!-- content end -->
		<c:if test="${fn:length(list) ne 0}">
			<div class="content white_bg">
				<div class="btn_full">
					<span class="btn_st" onclick="multiAttend();">출석등록</span>
				</div>
			
				<ul class="li_name">
					<c:forEach var="data" items="${list }">
					<li>
						<div class="photo_name">
							<div class="thum_area">
								<div class="thum" style="background-image: url(${data.u_photo});"></div>
							</div>
							<div class="text_area" style="width:81px;">
								<input type="checkbox" class="li_check ck_rt" id="check_${data.u_id }" name="check_${data.u_id }" value="${data.u_id }">
								<label for="check_${data.u_id }"><span class="name3">${data.u_nm }</span><span class="age_rank">(${fn:substring(data.u_age ,0,1)}0-${data.u_club_gd })</span></label>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('.ft_menu').navi_depth({pageNum:aa})
     });
    </script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li class="active_tab" onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>