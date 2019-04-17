<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content white_bg">
	<%-- <c:forEach items="${list }" var="list"> --%>
	<div class="tit_bg">
		<h4 class="title_s"><%-- ${list. } --%>제5회 물맑은양평 전국 배드민턴대회</h4>
		<p class="small_font"><%-- ${list. } --%>(2019.05.11 PM 10:00) </p>
	</div>
	<table class="text_td cet_lay bt_line_td">
		<tr>
			<td class="no_td"><%-- ${list. } --%>여복</td>
			<td>
				<ul class="name_row">
					<li>
						<span class="name3"><%-- ${list. } --%>김남길입니다.</span>
					</li>
					<li>
						<span class="name3"><%-- ${list. } --%>남홍이에요</span>
					</li>
				</ul>
			</td>
			<td class="w20">
				<ul class="name_row">
					<li> <%-- ${list. } --%>50 </li>
					<li> <%-- ${list. } --%>3 </li>
				</ul>
			</td>
			<td class="btn_td"><span class="btn_st btn_wh_gray btn_small" onclick="location.href='/Contest/ContestMyGame.techni'">상세보기</span></td>
		</tr>
		<tr>
			<td class="no_td"><%-- ${list. } --%>여복</td>
			<td>
				<ul class="name_row">
					<li>
						<span class="name3"><%-- ${list. } --%>김남</span>
					</li>
					<li>
						<span class="name3"><%-- ${list. } --%>남홍</span>
					</li>
				</ul>
			</td>
			<td class="w20">
				<ul class="name_row">
					<li><%-- ${list. } --%> 500 </li>
					<li><%-- ${list. } --%> 3 </li>
				</ul>
			</td>
			<td class="btn_td"><span class="btn_st btn_wh_gray btn_small" onclick="location.href='/Contest/ContestMyGame.techni'">상세보기</span></td>
		</tr>
	</table>
	<%-- </c:forEach> --%>
</div>
<!-- content end --> 
</body>
</html>