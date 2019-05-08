<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function frm(ct_idx) {
		var form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "/Contest/ContestDetail.techni");
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "ct_idx");
		hiddenField.setAttribute("value", ct_idx);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
</script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
<c:choose>
	<c:when test="${list.size()==0 }">
		<ul class="list_room white_bg cont_mb_b tab_con"
			style="display: block;">
			<li>
				<div class="content white_bg">
					<h3 class="guide_big space_guide">
						<span class="icon-outline_4"></span>종료된 대회가 없습니다.
					</h3>
				</div>
			</li>
		</ul>
	</c:when>
	<c:otherwise>

		<ul class="list_room white_bg cont_mb_b">
			<c:forEach items="${list }" var="list">
				<li>
					<div class="room_photo">
						<c:choose>
							<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}">
								<span class="alarm_rally sub0_bg">예정</span>
							</c:when>
							<c:when test="${list.ct_match_yn eq 'Y' && list.ct_end > today}">
								<span class="alarm_rally main_bg">진행</span>
							</c:when>
							<c:otherwise>
								<span class="alarm_rally sub1_bg">종료</span>
							</c:otherwise>
						</c:choose>
						<div class="photo_area mask_mbig"
							style="background-image:url(${list.ct_st_img})"></div>
					</div>
					<div class="room_data">
						<h4>${list.ct_nm }</h4>
						<div class="col-inputside ver_lay_b">
							<div class="max-ws_td">
								<ul class="li_row_s el_texts">
									<li><i class="i_font icon-calendar sub_color"></i>
										${fn:substring(list.ct_start,0,4)}년 ${fn:substring(list.ct_start,5,7)}월
										<c:choose>
											<c:when test="${fn:substring(list.ct_start,8,10) eq fn:substring(list.ct_end,8,10)}">
												${fn:substring(list.ct_start,8,10)}일 
												(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분
												<span class="time_line_i"></span>
												${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${fn:substring(list.ct_start,8,10) ne fn:substring(list.ct_end,8,10)}">
												${fn:substring(list.ct_start,8,10)}일 ~ ${fn:substring(list.ct_end,8,10)}일 
												(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분
												<span class="time_line_i"></span>
												${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
											</c:when>
										</c:choose>	
									</li>
									<li><i class="i_font icon-location-pin sub_color"></i>${list.ct_location }</li>
									<li><i class="i_font icon-cursor sub_color"></i>${list.ct_host }
									</li>
								</ul>
							</div>
							<div class="td_2">
								<span class="line_btn m_size small_font"
									onclick="frm('${list.ct_idx }');">상세<br> 보기
								</span>
							</div>
						</div>
						<!-- col-inputside end -->
					</div>
				</li>
			</c:forEach>
		</ul>

	</c:otherwise>
</c:choose>
