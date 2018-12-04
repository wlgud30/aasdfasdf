<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MGL</title>
</head>
<body>
<div id="wrap">
	<header>
		<div class="head_top">
		<div class="btn_back" onClick="location.href='/Cfight/CfightReferee.techni'"></div>
			<div class="tit_top">
				<h1 class="game_title">${list2[0].cf_nm }</h1>
			</div>
			</div>
		</header>
		<div id="container">
			<div class="content white_bg">
				<table class="thead_td game_td cet_lay tr_line">
					<thead>
						<tr>
							<th class="sub_td"></th>
							<c:forEach items="${list }" var="list">
								<th>${list.cf_court }코트</th>
							</c:forEach>
						</tr>
					</thead>
					<c:forEach items="${list2}" var="list">
						<tr>
							<td class="sub_td">${fn:substring(list.cf_w_date,0,5)}</td>
							<c:forEach items="${list3}" var="list3">
								<c:if test="${list.cf_w_date eq list3.cf_w_date }">
									<td>${list3.cf_status }</td>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
		</div>
</div>
</div>
</body>
</html>