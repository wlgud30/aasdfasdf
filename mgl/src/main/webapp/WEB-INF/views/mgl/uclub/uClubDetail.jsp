<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
$(document).ready(function(){
		var msg = "${msg}";
		var c_idx = "${club[0].c_idx}";
		if(msg !="" && msg != null&&msg!="null"){
			swal("MGL",msg);
		}
		$("#iBtn").click(function(){
			$.ajax({
				async : true,
				type :  'post',
				data : c_idx,
				url : "/Club/ClubYN.techni",
				dataType:"json",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
				if(data.cnt>0){
					swal("MGL","가입 대기중 입니다.")
				}else{
					$("#frm").attr("action", "/UClub/UClubJoin.techni").submit();
				}
			},
			error : function(error){
				swal("MGL","error : "+error);
			}
			})
			
		
		});
	})
	function resize(obj) {
	  $("#textsize").style.height = "1px";
	  $("#textsize").style.height = "1px";
	}
	function userList(){
		
		if("${yn}" == "1"){
			location.href="/UClub/ClubUserList.techni";
		}else{
			return;
		}
	}
	function ref(){
		if(parent.document.referrer=="http://mgl.techni.co.kr:8081/UClub/SearchList.techni"){
			history.back();
		}else{
			location.href='/Board/BoardList.techni'
		}
	}
	function clubDel(){
		var mng = "${club[0].u_mng}"
		var cnt = ${club[0].cu_cnt}
		if(cnt == 1 && mng == "매니저"){
			swal({
				title : "MGL",
				text : "클럽을 삭제 하시겠습니까?",
				buttons : true
			})
			.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						url : "/Club/ClubDel.techni",
						contentType : "application/json; charset=UTF-8",
						dataType : "json",
						success : function(data){
							if(data.cnt>0){
								swal({
									title : "MGL",
									text : "클럽이 삭제 되었습니다."
								})
								.then((value)=>{
										location.href='/UClub/UClubAllList.techni'
								})
							}else{
								swal("MGL" , "다시 시도해 주세요.")
							}
						},
						error : function(error){
							swal("MGL","error : "+error);
						}
					})
				}
			})
		}else{
			swal("MGL","클럽삭제는 매니저 혼자 남았을때만 가능합니다.")
		}
	} 
	
	
</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="ref()"></div>
				<div class="tit_top">
					<h1>${club[0].c_nm}</h1>
				</div>
				<div class="bt_top">
					<c:if test="${club[0].u_mng eq '가입대기' or club[0].u_mng eq '탈퇴' or club[0].u_mng eq '' or club[0].u_mng eq null}">
						<span id="iBtn" class="btn_st btn_wh">가입신청</span>
					</c:if>
					<c:if test="${club[0].u_mng eq '매니저' }">
						<span class="icon-note btn_i i-text"><a href="/Club/ClubUpdateForm.techni">수정</a></span>
						<span class="icon-dump icon-f btn_i i-text" onclick="clubDel();">삭제</span>
					</c:if>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<form id="frm" method="post">
				<input type="hidden" name="c_idx" value="${club[0].c_idx }">
				<input type="hidden" name="u_push" value=${club[0].u_push }>
			</form>
			<div class="content white_bg">
			<div class="photo-data">
				<div class="img_upload_area">
					<div class="img_upload" style="background-image: url(${club[0].c_photo})">
					</div>
				</div>
				<c:set var="string1" value="${club[0].u_tel }"></c:set>
				 <div class="tit_main">
				 	<ul class="li_row">
						 <li><i class="icon-f i_font icon-clubking"></i>${club[0].u_nm }</li>
						 <li><i class="icon-f i_font icon-mobile"></i>
						 	<c:choose>
								<c:when test="${fn:length(string1) eq 11 }">
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
								</c:when>
								<c:otherwise>
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
								</c:otherwise>
							</c:choose>
						 </li>
						 <li onclick="userList()"><i class="i_font icon-people"></i>${club[0].cu_cnt }명</li>
					</ul>
				</div>
			</div>
			 <hr class="line_div">
			 <table class="table_form line_no">
				  <tr>
				  	<td class="td_ti"><b>회 장</b></td>
				  	<td>
				  	${club[0].u_nm } (<c:choose>
								<c:when test="${fn:length(string1) eq 11 }">
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
								</c:when>
								<c:otherwise>
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
								</c:otherwise>
							</c:choose>
							)
				  	</td>
				  </tr>
				  <c:forEach items="${club }" var="list">
				  <c:if test="${list.ga_nm ne null }">
				  <tr>  
				  <c:set var="string1" value="${list.ga_tel }"></c:set>
					  <td class="td_ti"><b>총 무</b></td>
					  <td>${list.ga_nm } (
							<c:choose>
								<c:when test="${fn:length(string1) eq 11 }">
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
								</c:when>
								<c:otherwise>
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
								</c:otherwise>
							</c:choose>)</td>
				  </tr>  
				  </c:if>
				  </c:forEach>
			  </table>
			    <hr class="line_div">
				<%-- <div class="tit_main cet_lay">
					<ul>
						<li onclick="userList()" class="people_nb">${club.cu_cnt }</li>
					</ul>
					<ul class="li_col-nol">
						<li class="clubking">${club.u_nm }</li>
						<li onclick="userList()" class="people_nb">${club.u_mng }</li>
						<li class="phone_i">
							<c:set var="string1" value="${club.u_tel }"></c:set>
							<c:choose>
								<c:when test="${fn:length(string1) eq 11 }">
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
								</c:when>
								<c:otherwise>
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
								</c:otherwise>
							</c:choose>
						</li>
						<li>${club.ga_nm }</li>
						<li class="people_nb">${club.ga }</li>
						<li class="phone_i">
							<c:set var="string1" value="${club.ga_tel }"></c:set>
							<c:choose>
								<c:when test="${fn:length(string1) eq 11 }">
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
								</c:when>
								<c:otherwise>
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				<hr class="line_div"> --%>
				<!-- <table class="table_form line_no td_wauto">
					<tr>
						<td class="td_ti"><b>회 장</b></td>
						<td>홍길동 (010-000-0000)</td>
					</tr>
					<tr>
						<td class="td_ti"><b>부회장</b></td>
						<td>김길동 (010-001-0001)</td>
					</tr>
					<tr>
						<td class="td_ti"><b>총 무</b></td>
						<td>백제동 (010-001-0001)</td>
					</tr>
				</table> 
				<hr class="line_div"> -->
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td id="textsize">${fn:replace(club[0].c_info, newLineChar, "<br/>")}
						</td>
					</tr>
				</table>
			</div>
			<!-- content end -->
			<div class="content white_bg">
				<table class="table_form">
					<tbody><tr><td>${club[0].cst_nm }</td></tr> 
  </tbody></table>
			  <div class="map_st">
					<div id="map_area" class="map_style">
			 			<div id ="map"></div>
			 		</div>
						<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nnecWcqPS5ijy6eswU2Q&submodules=geocoder"></script>
						<script>
$(function(){ 
	var map = new naver.maps.Map('map');
	
	$(document).ready(function assdasd(){
		   var map = new naver.maps.Map('map');
		   var myaddress = '${club[0].c_location}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
		          if (status !== naver.maps.Service.Status.OK) {
		              return;
		          }
		          var result = response.result;
		          // 검색 결과 갯수: result.total
		          // 첫번째 결과 결과 주소: result.items[0].address
		          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
		          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
		          
		          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
		          // 마커 표시
		          var marker = new naver.maps.Marker({
		            position: myaddr,
		            map: map
		          });
		          // 마커 클릭 이벤트 처리
		          naver.maps.Event.addListener(marker, "click", function(e) {
		            if (infowindow.getMap()) {
		                infowindow.close();
		            } else {
		                infowindow.open(map, marker);
		            }
		          });
		      });
	});
});
</script>
			 	</div>
			</div>
					<%-- <tr>
						<td>${club.c_location }</td>
					</tr>
				</table> --%>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>
