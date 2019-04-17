<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
if(session.getAttribute("login")!=null){
%>
<div class="content white_bg">
	<table class="color_td">
		<tr>
			<td rowspan="2" class="bg_th" style="width:51%">나의대회<br>
			<p class="small_font">(참여/관심)</p>
			<i class="icon-f icon-record bg_icon"></i><i class="icon-f icon-liked bg_icon small_i"></i></td>
			<td onclick="location.href='/Contest/ContestParticipateList.techni'">참여대회 (5)<i class="icon-f icon-shaft_r btn_i main_color fl_r"></i></td>
		</tr>
		<tr>
			<td onclick="location.href='/Contest/ContestLikeList.techni'"> 관심대회 (2)<i class="icon-f icon-shaft_r btn_i main_color fl_r"></i></td>
		</tr>
	</table>
</div>
<%} %>
<!-- content end -->
<div class="content white_bg">
	<div class="td2 td_st">
		<div>
			<table class="color_td">
				<tr>
					<td class="bg_th sub2_bg round4" onclick="location.href='/Contest/ContestIngList.techni'">진행대회 (5)
					<p class="small_font">(대진표 등록)</p>
					<i class="icon-f icon-match bg_icon small_i"></i></td>
				</tr>
			</table>
		</div>
		<div>
			<table class="color_td">
				<tr>
					<td class="bg_th sub_bg round4" onclick="location.href='/Contest/ContestPreList.techni'">예정대회 (25)
					<p class="small_font">(점수 중 대회)</p>
					<i class="icon-f icon-score bg_icon small_i"></i></td>
				</tr>
			</table>
		</div>
	</div>
<!-- td2 end --> 
</div>
<!-- content end -->
<div class="cat_area col_2data">
	<div>
		<h4 class="title_m">종료대회</h4>
	</div>
	<div>
		<span class="bd_link sm_font gray_text" onclick="location.href='/Contest/ContestLastList.techni'">MORE</span>
	</div>
</div>
<ul class="list_room white_bg cont_mb_b">
	<%-- <c:forEach items="${list }" var="list"> --%>
		<li>
			<div class="room_photo">
				<div class="photo_area mask_mbig" style="background-image:url(img/thumbnail_02.jpg)"></div>
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
