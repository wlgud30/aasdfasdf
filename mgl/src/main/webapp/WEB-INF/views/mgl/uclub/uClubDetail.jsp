<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$(document).ready(function(){
	if(window.location.pathname.includes("/Club/ClubDetail.techni")){
		$("#l1").attr("class","");
		$("#l2").attr("class","active_tab")
		$("#s1").attr("onclick","location.href='/UClub/UClubAllList.techni'")
		$("#s1").text("나의클럽")
		$("#s2").attr("onclick","location.href='/UClub/UClubSearch.techni'")
		$("#s2").text("Best & 검색")
		$("#s3").attr("onclick","location.href='/UClub/UClubWrite.techni'")
		$("#s3").text("클럽생성")
		$("#frm").after("<div class='head_top'><div class='btn_back' onclick='history.back();'></div><div class='tit_top'><h1>${club[0].c_nm}</h1></div><div class='bt_top'><span class='btn_st' id='iBtn'>가입하기</span></div></div>")
		$("#ft_area").remove();
	}
		var msg = "${msg}";
		var c_idx = "${club[0].c_idx}";
		if(msg !="" && msg != null&&msg!="null"){
			swal("민턴in",msg);
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
					swal("민턴in","가입 대기중 입니다.")
				}else{
					location.href='/UClub/UClubJoin.techni?c_idx=${club[0].c_idx }'
				}
			},
			error : function(error){
				swal("민턴in","error : "+error);
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
				title : "민턴in",
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
									title : "민턴in",
									text : "클럽이 삭제 되었습니다."
								})
								.then((value)=>{
										location.href='/UClub/UClubAllList.techni'
								})
							}else{
								swal("민턴in" , "다시 시도해 주세요.")
							}
						},
						error : function(error){
							swal("민턴in","error : "+error);
						}
					})
				}
			})
		}else{
			swal("민턴in","클럽삭제는 매니저 혼자 남았을때만 가능합니다.")
		}
	} 
	
	function chat(){
		swal("민턴in","서비스 준비중 입니다.")
	}
</script>
<div class="tab_btn_b_area tab_btn_b_area linet_mr1 mb_ta">
	<ul class="tab_btn_b">
		<li id="l1" class="active_tab"><span id="s1"
			onClick="location.href='/Club/ClubDetailMy.techni'">클럽정보</span></li>
		<li id="l2"><span id="s2"
			onClick="location.href='/UClub/UclubMUserList.techni'">회원</span></li>
		<li><span id="s3" onClick="chat()">채팅</span></li>
	</ul>
</div>
<!-- InstanceBeginEditable name="container" -->
<form id="frm" method="post">
	<input type="hidden" name="c_idx" value="${club[0].c_idx }"> <input
		type="hidden" name="u_push" value=${club[0].u_push }>
</form>
<div class="content white_bg">
	<div class="photo-data">
		<div class="img_upload_area">
			<div class="img_upload"
				style="background-image: url(${club[0].c_photo})"></div>
		</div>
		<c:set var="string1" value="${club[0].u_tel }"></c:set>
		<div class="tit_main">
			<ul class="li_row">
				<li><i class="icon-f i_font icon-clubking"></i>${club[0].u_nm }</li>
				<li><i class="icon-f i_font icon-mobile"></i> <c:choose>
						<c:when test="${fn:length(string1) eq 11 }">
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
								</c:when>
						<c:otherwise>
									${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
								</c:otherwise>
					</c:choose></li>
				<li onclick="userList()"><i class="i_font icon-people"></i>${club[0].cu_cnt }명</li>
			</ul>
		</div>
		<c:if test="${club[0].u_mng eq '매니저'}">
			<div class="btn_td">
				<span class="btn_st btn_small vet_btn btn-gray" onclick="clubDel()">삭제</span>
				<span class="btn_st btn_small vet_btn sub1_color" onclick="location.href='/Club/ClubUpdateForm.techni'">수정</span>
			</div>
		</c:if>
	</div>
	<c:if test="${empty list }">
		<hr class="line_div">
		<table class="table_form line_no">
			<c:forEach items="${club }" var="list">
				<c:if test="${list.ga_nm ne null }">
					<tr>
						<c:set var="string1" value="${list.ga_tel }"></c:set>
						<td class="td_ti"><b>${list.ga}</b></td>
						<td>${list.ga_nm }(<c:choose>
								<c:when test="${fn:length(string1) eq 11 }">
										${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
									</c:when>
								<c:otherwise>
										${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
									</c:otherwise>
							</c:choose>)
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
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
	<%
		pageContext.setAttribute("newLineChar", "\n");
	%>
	<table class="table_form line_no mob1_td">
		<tr>
			<td class="td_ti td_top"><b>소개</b></td>
			<td id="textsize">${fn:replace(club[0].c_info, newLineChar, "<br/>")}
			</td>
		</tr>
	</table>
	<hr class="line_div">
	<p class="guide_text tit_mb">급수</p>
	<ul class="sub_ul tab_sub line_td_li">
		<li><span>자강 <b class="tiny_text tit-nol dis_b">${ss}명</b>
		</span></li>
		<li><span>A <b class="tiny_text tit-nol dis_b">${a}명</b>
		</span></li>
		<li><span>B <b class="tiny_text tit-nol dis_b">${b}명</b>
		</span></li>
		<li><span>C <b class="tiny_text tit-nol dis_b">${c}명</b>
		</span></li>
		<li><span>D <b class="tiny_text tit-nol dis_b">${d}명</b>
		</span></li>
		<li><span>초심 <b class="tiny_text tit-nol dis_b">${e}명</b>
		</span></li>
		<li><span>왕초 <b class="tiny_text tit-nol dis_b">${f}명</b>
		</span></li>
	</ul>
</div>

<!-- content end -->
<div class="content white_bg acd_area">
	<div class="acd-head">
		<h4 class="title_s">위치보기</h4>
	</div>
	<%-- <table class="table_form">
		<tbody>
			<tr>
				<td>${club[0].cst_nm }</td>
			</tr>
		</tbody>
	</table> --%>
	<div class="map_st acd_cont" style="display: none;">
		<div id="map_area" class="map_style">
			<div id="map"></div>
		</div>
		<script type="text/javascript"
			src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nnecWcqPS5ijy6eswU2Q&submodules=geocoder"></script>
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
<!-- content end -->
<!-- InstanceEndEditable -->
<!-- container end -->
<div id="ft_area">
	<ul class="ft_menu">
		<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
		<li onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
		<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
		<li class="active_tab"
			onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
	</ul>
</div>
<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>
