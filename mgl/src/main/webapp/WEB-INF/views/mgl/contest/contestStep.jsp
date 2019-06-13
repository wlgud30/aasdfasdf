<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- <div class="cat_area">
	<h4 class="title_m">심판요청사항</h4>
</div>
<div class="white_bg scroll_y_small  bo_12_white cont_mb_b">
	<table class="td_small td_t-b_0">
		<tr>
			<td class="sub_color w20">1코트</td>
			<td><i class="icon-referee-chg icon-f"></i>
			<span>심판 교체</span></td>
			<td class="w30">2019.06.30 PM 04:15</td>
		</tr>
	</table>
</div> -->
<!-- content end -->
<div class="cat_t0_area col_2data ver_lay_b">
<%-- <c:forEach items="${list }" var="list"> --%>
	<div>
		<h4 class="title_m">대회진행 상황</h4>
	</div>
	<div>
		<%-- <select>
			<option value="체육관" selected>${list. }체육관</option>
			<option value="남산체육관">${list. }남산체육관</option>
			<option value="후암초등학교체육관">${list. }후암초등학교체육관</option>
		</select> --%>
	</div>
<%-- </c:forEach> --%>	
</div>
<div class="white_bg scroll_x bo_12_white cont_mb_b">
	<%-- <c:forEach items="${list2 }" var="list2"> --%>
	<table class="game_td thead_td cet_lay th_row">
		<thead>
			<tr>
				<th class="td_1 rowfont">코트<br>시간</th>
				<c:forEach items="${listC}" var="list">
					<th>${list.ct_court}</th>
				</c:forEach>
			</tr>
		</thead>
		<c:forEach items="${listT}" var="listT">
			<tr>
				<td>${fn:substring(listT.ct_w_dat,0,5)}</td>
				<c:forEach items="${list}" var="list">
				<c:if test="${list.ct_w_dat eq listT.ct_w_dat}">
					<td>
						<c:choose>
							<c:when test="${list.ct_status eq '대기' }">
								<div class="i_text gray_color">
									<i class="icon-f icon-expect"></i>
									<span class="i_text_s">${list.ct_status }</span>
								</div>
							</c:when>
							<c:when test="${list.ct_status eq '종료' }">
								<div class="i_text sub_color">
									<i class="icon-f icon-score"></i>
									<span class="i_text_s">${list.ct_status }</span>
								</div>
							</c:when>
							<c:when test="${list.ct_status eq '예정' }">
								<div class="i_text sub1_color">
									<i class="icon-f icon-record"></i>
									<span class="i_text_s">${list.ct_status }</span>
								</div>
							</c:when>
							<c:when test="${list.ct_status eq '진행' }">
								<div class="i_text main_color">
									<i class="icon-f icon-progress"></i>
									<span class="i_text_s">${list.ct_status }</span>
								</div>
							</c:when>
						</c:choose>
					</td>
				</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
		<%-- <tr>
			<td>${list2. }06:00</td>
			<td><div class="i_text gray_color"><i class="icon-f icon-expect"></i>
			<span class="i_text_s">${list2. }대기</span>
			</div></td>
			<td><div class="i_text sub_color"><i class="icon-f icon-score"></i>
			<span class="i_text_s">${list2. }종료</span>
			</div></td>
			<td><div class="i_text sub1_color"><i class="icon-f icon-record"></i>
			<span class="i_text_s">${list2. }예정</span>
			</div></td>
			<td><div class="i_text main_color"><i class="icon-f icon-progress"></i>
			<span class="i_text_s">${list2. }진행</span>
			</div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr> --%>
	</table>
	<%-- </c:forEach> --%>
</div>
  <!-- content end --> 