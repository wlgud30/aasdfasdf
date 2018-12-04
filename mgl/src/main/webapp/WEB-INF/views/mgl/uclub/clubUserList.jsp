<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MGL</title>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
</head>
<body>
<div id="wrap">
	<header>
			<div class="head_top">
			<div class="btn_back" onClick="history.back();"></div>
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="tit_top">
					<h1>
						<a href='/Board/BoardList.techni'>${list[0].c_nm }</a> 회원 목록
					</h1>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
	</header>
	<div id="container">
	<div class="content white_bg pt_00">
						<table class="thead_td text_td cet_lay">
							<thead>
								<tr>
									<th>이름</th>
									<th class="level_td">직급</th>
									<th class="phone-date_td"><ul class="li_nol">
											<li class="phone_data">전화번호</li>
										</ul></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<tr>
										<td class="name2_td">
											<div class="photo_name">
												<div class="thum_area">
													<div class="thum" style="background-image:url(${list.u_photo});"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.u_nm }</span>
													<span class="age_rank">(${fn:substring(list.u_age,0,1)}0대 ${list.u_club_gd })</span>
												</div>
											</div>
										</td>
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
											</ul></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
	</div>
	</div>
</body>
</html>