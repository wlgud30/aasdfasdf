<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 $(document).ready(function() {
	 var msg = "${msg}";
	if(${msg != null} || ${msg eq ""}){
		swal("MGL","${msg}");
	}
			
});

function phoneFomatter(num){
		num.toString();
		var formatNum = "";
		if(num.length==11){
			formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/,"$1-$2-$3");
		}else{
			formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/,"$1-$2-$3");
		}
		$(".phone_data").val(formatNum);
}
 
function post1(c_idx,u_id){
	var method = method || "post"; 
	var path = "/UClub/UClubMemberJoin.techni";
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
	hiddenField2.setAttribute("name", "u_id");
	hiddenField2.setAttribute("value", u_id);
	form.appendChild(hiddenField2);
	
	
		    document.body.appendChild(form);
		    form.submit();
}
</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo" onClick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1><a href='/Board/BoardList.techni'>${list[0].c_nm }</a></h1>
				</div>
				<div class="bt_top"></div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container" >
			<!-- InstanceBeginEditable name="container" -->
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b tab_cont">
					<li onclick="active_change(this)"><span>전체 (${fn:length(list)})</span></li>
					<li onclick="active_change(this)"><span>가입대기(${fn:length(list2)})</span></li>
					<li onclick="active_change(this)"><span>탈퇴대기(${fn:length(list3)})</span></li>
				</ul>
			</div>
			<div class="tab_cont_con pt-t_s white_bg">
				<div class="tab_con">
				<%-- 	<div class="pd_lrtb col_2data white_bg">
						<div>
							<span class="btn_st" onClick="location.href='#;'">엑셀 다운</span>
						</div>
						<div>
							<ul class="li_small">
								<li><b>회원</b>${list[0].c_count}</li>
							</ul>
						</div> 
					</div> --%>
					<div class="content white_bg pt_00">
						<table class="thead_td text_td cet_lay">
							<thead>
								<tr>
									<th>이름</th>
									<th class="level_td">직급</th>
									<th class="phone-date_td"><ul class="li_nol">
											<li class="phone_data">전화번호</li>
											<li class="in_data">가입일자</li>
										</ul></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<tr onclick="location.href='/UClub/UClubMemberView.techni?&u_id=${list.u_id}'">
										<td class="name2_td"><span class="name3">${list.u_nm }</span>
										<span class="age_rank">(${list.u_age}살 ${list.u_club_gd })</span></td>
										<td class="level_td">${list.uc_mng }</td>
										<td class="phone-date_td"><ul class="li_nol">
												<li class="phone_data">
												<c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose>
												</li>
												<li class="in_data">${list.u_join_date }</li>
											</ul></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- content end-->
				</div>
				<!-- tab_con end-->
				<div class="tab_con">
					<%-- <div class="pd_lrtb col_2data white_bg">
						<div>
							<span class="btn_st" onClick="location.href='#;'">엑셀 다운</span>
						</div>
						<div>
							<ul class="li_small">
								<li><b>날짜</b>2018.03.22</li>
								<li><b>회원</b>${list[0].c_count}</li>
							</ul>
						</div>
					</div> --%>
					<div class="content white_bg pt_00">
						<table class="thead_td text_td cet_lay">
							<thead>
								<tr>
									<th>이름</th>
									<th class="level_td">급수</th>
									<th class="phone-date_td"><ul class="li_nol">
											<li class="phone_data">전화번호</li>
											<li class="in_data">신청일자</li>
										</ul></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list2 }" var="list">
									<tr class="${list.c_idx }" onclick="post1('${list.c_idx}','${list.u_id}')">
										<td class="name2_td"><span class="name3">${list.u_nm }</span><span
											class="age_rank">(${list.u_age }살)</span></td>
										<td class="level_td">${list.u_club_gd }</td>
										<td class="phone-date_td"><ul class="li_nol">
												<li class="phone_data">
													<c:set var="string1" value="${list.u_tel }"/>
													<c:choose>
														<c:when test="${fn:length(string1) eq 11 }">
															${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
														</c:when>
														<c:otherwise>
															${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
														</c:otherwise>
													</c:choose>
												</li>
												<li class="in_data">${list.u_join_date }</li>
											</ul></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- content end-->
				</div>
				<!-- tab_con end-->
				<div class="tab_con">
					<%-- <div class="pd_lrtb col_2data white_bg">
						<div>
							<span class="btn_st" onClick="location.href='#;'">엑셀 다운</span>
						</div>
						<div>
							<ul class="li_small">
								<li><b>날짜</b>2018.03.22</li>
								<li><b>회원</b>${list[0].c_count}</li>
							</ul>
						</div>
					</div> --%>
					<div class="content white_bg pt_00">
						<table class="thead_td text_td cet_lay">
							<thead>
								<tr>
									<th>이름</th>
									<th class="level_td">현재 상태</th>
									<th class="phone-date_td"><ul class="li_nol">
											<li class="phone_data">전화번호</li>
											<li class="in_data">가입일자</li>
										</ul></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list3 }" var="list">
									<tr onclick="location.href='/UClub/UClubOutDetail.techni?u_id=${list.u_id}'">
										<td class="name2_td"><span class="name3">${list.u_nm }</span><span
											class="age_rank">(${list.u_age }살)</span></td>
										<td class="level_td">${list.uc_mng }</td>
										<td class="phone-date_td"><ul class="li_nol">
												<li class="phone_data">
													<c:set var="string1" value="${list.u_tel }"/>
													<c:choose>
														<c:when test="${fn:length(string1) eq 11 }">
															${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
														</c:when>
														<c:otherwise>
															${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
														</c:otherwise>
													</c:choose>
												</li>
												<li class="in_data">${list.u_join_date }</li>
											</ul></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- content end-->
				</div>
				<!-- tab_con end-->
			</div>
			<!-- tab_cont_con -->
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
    function active_change(me){
		$(".tab_btn_b li").each(function(){
			$(this).attr("class","");
		});
		$(me).attr("class","active_tab");
	}
    </script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li class="active_tab" onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>

		</div>
	</div>
	<!-- wrap end -->
</body>
<script>
</script>
<!-- InstanceEnd -->
</html>