<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul class="list_room white_bg cont_mb_b">
	<c:forEach var="list" items="${lastList}">
		<li>
			<div class="room_photo">
				<span class="alarm_rally main_bg">종료</span>
				<div class="photo_area mask_mbig"
					style="background-image: url(${list.ct_st_img})"></div>
			</div>
			<div class="room_data">
				<h4>${list.ct_nm }</h4>
				<ul class="li_row_s el_texts">
					<li id="${list.ct_idx }" onclick="desideMatch(this)"><i class="i_font icon-calendar sub_color"></i>
						${fn:substring(list.ct_start,0,4)}년
						${fn:substring(list.ct_start,5,7)}월 <c:choose>
							<c:when
								test="${fn:substring(list.ct_start,8,10) eq fn:substring(list.ct_end,8,10)}">
													${fn:substring(list.ct_start,8,10)}일 
													(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분
													<span class="time_line_i"></span>
													${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
												</c:when>
						</c:choose> <c:choose>
							<c:when
								test="${fn:substring(list.ct_start,8,10) ne fn:substring(list.ct_end,8,10)}">
													${fn:substring(list.ct_start,8,10)}일 ~ ${fn:substring(list.ct_end,8,10)}일 
													(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분
													<span class="time_line_i"></span>
													${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
												</c:when>
						</c:choose></li>
					<li><i class="i_font icon-location-pin sub_color"></i>${list.ct_location }</li>
					<li><i class="i_font icon-cursor sub_color"></i>${list.ct_host }</li>
				</ul>
			</div>
		</li>

	</c:forEach>
	
</ul>
<script>
function desideMatch(tg){
		var ct_idx= $(tg).attr('id');
		var form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "/ContestWeb/ContestWebDesideMatchList.techni");
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "ct_idx");
		hiddenField.setAttribute("value", ct_idx);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
	
</script>