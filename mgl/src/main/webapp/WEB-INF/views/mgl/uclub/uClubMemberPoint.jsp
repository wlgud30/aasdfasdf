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
<script>

</script>
<body>
<div id="wrap">
	<header>
			<div class="head_top">
			<div class="btn_back" onClick="history.back();"></div>
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="tit_top">
					<h1>
						<a href='/Board/BoardList.techni'>${list[0].c_nm }</a> 경기 내역
					</h1>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
	</header>
	<div id="container">
	<div class="content white_bg">
						<table class="thead_td text_td cet_lay">
							<thead>
								<tr>
									<th>게임 시간</th>
									<th>승/패</th>
									<th>획득 점수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<tr onclick="location.href='/Game/GameResult.techni?c_gidx=${list.c_gidx}'">
										<td class="ga_title">${list.cm_match_date } ${list.cm_end }</td>
										<td class="w10">${list.cm_win }</td>
										<td class="w10">${list.cm_aptn}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
	</div>
	</div>
</body>
</html>