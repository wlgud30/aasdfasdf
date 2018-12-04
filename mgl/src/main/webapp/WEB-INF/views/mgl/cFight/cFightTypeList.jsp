<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<script type="text/javascript">
function detail(param){
	$("#cf_g_idx").val(param.substring(0,16));
	$("#frm").submit();
}
</script>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="tit_top">
					<h1 class="game_title">${list[0].cf_nm}</h1>
				</div>
				<div class="bt_top">
					<span class="icon-score icon-f btn_i i-text" onClick="location.href='/Cfight/CfightReferee.techni'">심판</span>
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
					});
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Cfight/CfightDetail.techni'"><span>나의게임</span></li>
					<li onClick="location.href='/Cfight/CfightTypeList.techni'" class="active_tab"><span>종목</span></li>
					<li onClick="location.href='/Cfight/CfightTimeList.techni'"><span>시간</span></li>
					<li onClick="location.href='/Cfight/CfightCourtList.techni'"><span>코트</span></li>
				</ul>
			</div>
			<div class="content white_bg">
				<form id="frm" action="/Cfight/CfightMatchDetail.techni" method="post">
					<input type="hidden" id="cf_g_idx" name="cf_g_idx">
				</form>
				<table class="game_td cet_lay link_tr td_pd_l0">
					<c:forEach items="${list}" var="list">
						<tr onclick="detail('${list.cf_gidx }')">
							<td class="ga_title">${list.cf_t_nm }</td>
							<td class="w10">${list.type_count }팀</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var ft_nv = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : ft_nv
					})
				});
			</script>
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Cfight/CfightSummary.techni'"><span>개요</span></li>
				<li onClick="location.href='/Cfight/CfightEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Cfight/CfightDetail.techni'" class="active_tab"><span>대진표</span></li>
				<li onClick="location.href='/Cfight/CfightMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>