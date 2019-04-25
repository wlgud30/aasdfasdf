<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
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
					<li onClick="location.href='/Game/selfMatchDetail.techni'"><span>나의게임</span></li>
					<li class="active_tab" onClick="location.href='/Game/selfMatchTypeList.techni'"><span>종목</span></li>
					<li onClick="location.href='/Game/selfMatchTimeList.techni'"><span>시간</span></li>
					<li onClick="location.href='/Game/selfMatchCourtList.techni'"><span>코트</span></li>
				</ul>
			</div>
			<div class="content white_bg">
				<form id="frm" action="/Game/selfMatchMatchDetail.techni" method="post">
					<input type="hidden" id="cs_k_idx" name="cs_k_idx">
				</form>
				<table class="game_td cet_lay link_tr td_pd_l0">
					<c:forEach items="${list}" var="list">
						<tr onclick="detail('${list.cs_gidx }')">
							<td class="ga_title">${list.cs_k_nm }</td>
							<td class="w10">${list.kind_count }팀</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
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
				function detail(param){
					$("#cs_k_idx").val(param.substring(0,22));
					$("#frm").submit();
				}
			</script>
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Game/selfMatchSummary.techni'"><span>개요</span></li>
				<li onClick="location.href='/Game/selfMatchEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Game/selfMatchDetail.techni'" class="active_tab"><span>대진표</span></li>
				<li onClick="location.href='/Game/selfMatchMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>