<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top">
					<h1>${list[0].cf_nm } 팀 확인</h1>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="cat_gray_area">
				<ul class="li_col-nol">
					<li><b>참가팀</b>${list[0].c_t_count }</li>
					<li><b>참여회원</b>${list[0].c_count }</li>
				</ul>
			</div>
			<div class="content white_bg pt_00">
				<c:set var="n" value="${list[0].cf_t_num}"/>
				<table class="mix3_td no2_gap cet_lay bt_line_td">
					<c:forEach items="${list }" var="list" varStatus="status">
					<c:set var="i" value="${i+1}" />
					<c:if test="${n ne list.cf_t_num}">
						<c:set var="n" value="${list.cf_t_num }" />
						<c:set var="i" value="${1}" />
					</c:if>
						<tr>
							<td class="no_td cot2">${list.cf_t_num } </td>
							<td class="ga_title">${list.cf_t_nm }</td>
							<td class="no_td sm_no">${list.cf_t_num}-${i}</td>
							<td class="n3_rank">
								<span class="name3">${list.cf_t_a_nm }</span>
								<span class="age_rank">(${list.cf_t_a_age }-${list.cf_t_a_gd })</span>
							</td>
							<td class="n3_rank">
								<span class="name3">${list.cf_t_b_nm }</span> 
								<span class="age_rank">(${list.cf_t_b_age }-${list.cf_t_b_gd })</span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- content end-->
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
</html>