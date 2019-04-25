<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function frm(ct_idx){
		var form = document.createElement("form");
		form.setAttribute("method","POST");
		form.setAttribute("action","/Contest/ContestDetail.techni");
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type","hidden");
		hiddenField.setAttribute("name","ct_idx");
		hiddenField.setAttribute("value",ct_idx);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
</script>
<ul class="list_room white_bg cont_mb_b">
	<c:forEach items="${list }" var="list">
		<li>
			<div class="room_photo">
				<span class="alarm_rally sub1_bg">종료</span>
				<div class="photo_area mask_mbig" style="background-image:url(img/thumbnail_02.jpg)"></div>
			</div>
			<div class="room_data">
				<h4>${list.ct_nm }</h4>
				<div class="col-inputside ver_lay_b">
					<div class="max-ws_td">
						<ul class="li_row_s el_texts">
							<li><i class="i_font icon-calendar sub_color"></i>${list.ct_start }</li>
							<li><i class="i_font icon-location-pin sub_color"></i>${list.ct_location }</li>
							<li><i class="i_font icon-cursor sub_color"></i>${list.ct_host } </li>
						</ul>
					</div >
					<div class="td_2">
						<span class="line_btn m_size small_font" onclick="frm('${list.ct_idx }');">상세<br>
						보기</span>
					</div>
				</div>
	<!-- col-inputside end --> 
			</div>
		</li>
	</c:forEach>
</ul>
