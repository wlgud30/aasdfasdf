<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<ul class="list_room white_bg cont_mb_b">
	<%-- <c:forEach items="${list }" var="list"> --%>
		<li>
			<div class="room_photo">
				<div class="photo_area mask_mbig" style="background-image:url(img/cal_20180630_nh.jpg)"></div>
			</div>
			<div class="room_data">
				<h4><%-- ${list. } --%>대회명</h4>
				<div class="col-inputside ver_lay_b">
					<div class="max-ws_td">
						<ul class="li_row_s el_texts">
							<li><i class="i_font icon-calendar sub_color"></i><%-- ${list. } --%>대회일자</li>
							<li><i class="i_font icon-location-pin sub_color"></i><%-- ${list. } --%>대회장소</li>
							<li><i class="i_font icon-cursor sub_color"></i><%-- ${list. } --%>대회주최 </li>
						</ul>
					</div >
					<div class="td_2">
						<span class="line_btn m_size small_font" onclick="location.href='/Contest/ContestDetail.techni'">상세<br>
						보기</span>
					</div>
				</div>
	<!-- col-inputside end --> 
			</div>
		</li>
	<%-- </c:forEach> --%>
</ul>
