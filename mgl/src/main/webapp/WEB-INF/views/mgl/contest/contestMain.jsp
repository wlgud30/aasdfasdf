<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/ct_css/swiper.css?ver1">
<script src="/resources/js/swiper.min.js"></script>
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
<c:if test="${adList.size() >0 }">
<div class="cont_mb_b" id="slide_main">
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach items="${adList}" var="list">
				<div class="swiper-slide" onClick="">
					<ul class="list_room white_bg">
						<li>
							<div class="room_photo" onclick="frm('${list.ct_idx}')">
								<c:choose>
									<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}">
										<span class="alarm_rally sub0_bg">예정</span>
									</c:when>
									<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}">
										<span class="alarm_rally main_bg">진행</span>
									</c:when>
								</c:choose>
								<div class="photo_area mask_mbig"
									style="background-image: url(${list.ct_st_img})"></div>
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
											<li><i class="i_font icon-cursor sub_color"></i>${list.ct_host}
											</li>
										</ul>
									</div>
								</div>
								<!-- col-inputside end -->
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
			<!-- swiper-slide end -->
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Pagination -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
</div>
</c:if>
<script>
	$(document).ready(function() {
		var swiper = new Swiper('.swiper-container', {
			autoHeight : true, //enable auto height 
			//speed: 400,
			centeredSlides : true,
			autoplay : {
				delay : 3000,
				disableOnInteraction : false
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
	});
</script>
<!--   <div class="content white_bg">
    <table class="color_td td_fix">
      <tr>
        <td class="bg_th w50">나의대회<br>
          <p class="small_font">(참여/관심)</p>
          <i class="icon-f icon-record bg_icon"></i><i class="icon-f icon-liked bg_icon small_i"></i></td>
        <td onclick="location.href='/Contest/ContestParticipateList.techni'">참여대회<br>
          (5)<i class="icon-f icon-shaft_r btn_i main_color fl_r"></i></td>
        <td onclick="location.href='/Contest/ContestLikeList.techni'">관심대회<br>
          (0)<i class="icon-f icon-shaft_r btn_i main_color fl_r"></i></td>
      </tr>
    </table>
  </div> -->
<!-- content end -->
<div class="tab_btn_b_area tab_btn_bm col_2data pd_lr ver_lay_m">
	<div>
		<ul class="tab_btn_b tab_cont">
			<li><span>예정대회(${preList.size()}) <em
					class="tiny_text dis_b">접수증</em></span></li>
			<li><span>진행대회(${ingList.size()}) <em
					class="tiny_text dis_b">대진표 등록</em>
			</span></li>
		</ul>
	</div>
	<div>
		<span class="btn_st btn_small btn_color1"
			onclick="location.href='/Contest/ContestLastList.techni'">종료대회</span>
	</div>
</div>
<!-- tab_bt_area end -->
<script type="text/javascript">
	function click_hit(idx){
		var ct_idx = idx;
		$.ajax({
			async : true,
			type : 'post',
			url : "/Contest/ContestHit.techni",
			data : JSON.stringify({"ct_idx" : ct_idx}),
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}
			});
	};
</script>
<div class="tab_cont_con">
	<ul class="list_room white_bg cont_mb_b tab_con">
		<c:choose>
			<c:when test="${preList.size() > 0}">
				<c:forEach items="${preList }" var="list">
					<li>
						<div class="room_photo">
							<c:choose>
								<c:when test="${list.ct_idx eq 'CT190429008'}"><span class="alarm_rally sub0_bg">홍보</span></c:when>
								<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}"><span class="alarm_rally sub0_bg">예정</span></c:when>
								<c:when test="${list.ct_match_yn eq 'Y' && list.ct_end > today}"><span class="alarm_rally main_bg">진행</span></c:when>
								<c:otherwise><span class="alarm_rally sub1_bg">종료</span></c:otherwise>
					        </c:choose>
							<div class="photo_area mask_mbig" style="background-image:url(${list.ct_st_img})"></div>
						</div>
						<div class="room_data">
							<h4>${list.ct_nm}</h4>
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
										<li><i class="i_font icon-location-pin sub_color"></i>${list.ct_location}</li>
										<li><i class="i_font icon-cursor sub_color"></i>${list.ct_host}
										</li>
									</ul>
								</div>
								<div class="td_2">
									<c:choose>
										<c:when test="${list.ct_idx eq 'CT190429008' }">
											<span class="vet_btn"><i class="text_i icon-view icon-f"></i>${list.ct_hit}</span>
											<span class="line_btn m_size small_font popwin_btn0" onclick="click_hit('CT190429008')">상세<br> 보기</span>
										</c:when>
										<c:otherwise>
											<span class="vet_btn"><i class="text_i icon-view icon-f"></i>${list.ct_hit}</span>
											<span class="line_btn m_size small_font"
											onclick="frm('${list.ct_idx}');">상세<br> 보기
											</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<!-- col-inputside end -->
						</div>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li>
					<div class="content white_bg">
						<h3 class="guide_big space_guide">
							<span class="icon-outline_4"></span>진행중인 대회가 없습니다.
						</h3>
					</div>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>




	<!-- tab_con end -->

	<ul class="list_room white_bg cont_mb_b tab_con">
		<c:choose>
			<c:when test="${inglist.size() > 0}">
				<c:forEach items="${ingList }" var="list">
					<li>
						<div class="room_photo">
							<c:choose>
								<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}"><span class="alarm_rally sub0_bg">예정</span></c:when>
								<c:when test="${list.ct_match_yn eq 'Y' && list.ct_end > today}"><span class="alarm_rally main_bg">진행</span></c:when>
								<c:otherwise><span class="alarm_rally sub1_bg">종료</span></c:otherwise>
					        </c:choose>
							<div class="photo_area mask_mbig" style="background-image:url(${list.ct_st_img})"></div>
						</div>
						<div class="room_data">
							<h4>${list.ct_nm}</h4>
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
										<li><i class="i_font icon-location-pin sub_color"></i>${list.ct_location}</li>
										<li><i class="i_font icon-cursor sub_color"></i>${list.ct_host}
										</li>
									</ul>
								</div>
								<div class="td_2">
									<span class="line_btn m_size small_font"
										onclick="frm('${list.ct_idx}');">상세<br> 보기
									</span>
								</div>
							</div>
							<!-- col-inputside end -->
						</div>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li>
					<div class="content white_bg">
						<h3 class="guide_big space_guide">
							<span class="icon-outline_4"></span>진행중인 대회가 없습니다.
						</h3>
					</div>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>


	<!-- tab_con end -->
	<div class="popwin_size white_bg">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="title_m">개요</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" onclick="location.href='#'"></span>
			</div>
		</div>
		<!-- title_popupp end -->
		<div class="popup_body">
			<table class="table_form">
				<tr>
					<td><h4 class="title_g">${ctvo.ct_nm}</h4></td>
				</tr>
				<tr>
					<td><a href="${ctvo.ct_homepage}">${ctvo.ct_homepage}</a></td>
				</tr>
				<tr>
					<td>
						<span class="guide_text">대회</span>${fn:substring(ctvo.ct_start,0,4)}년 ${fn:substring(ctvo.ct_start,5,7)}월
						<c:choose>
							<c:when test="${fn:substring(ctvo.ct_start,8,10) eq fn:substring(ctvo.ct_end,8,10)}">
								${fn:substring(ctvo.ct_start,8,10)}일 
								(${fn:substring(ctvo.ct_start,11,13)}시${fn:substring(ctvo.ct_start,14,16)}분
								<span class="time_line_i"></span>
								${fn:substring(ctvo.ct_end,11,13)}시${fn:substring(ctvo.ct_end,14,16)}분)
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${fn:substring(ctvo.ct_start,8,10) ne fn:substring(ctvo.ct_end,8,10)}">
								${fn:substring(ctvo.ct_start,8,10)}일 ~ ${fn:substring(ctvo.ct_end,8,10)}일 
								(${fn:substring(ctvo.ct_start,11,13)}시${fn:substring(ctvo.ct_start,14,16)}분
								<span class="time_line_i"></span>
								${fn:substring(ctvo.ct_end,11,13)}시${fn:substring(ctvo.ct_end,14,16)}분)
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						<span class="guide_text">접수</span>
						${fn:substring(ctvo.ct_startline,0,4)}년 ${fn:substring(ctvo.ct_startline,5,7)}월 ${fn:substring(ctvo.ct_startline,8,10)}일
						<span class="time_line_i"></span>
						${fn:substring(ctvo.ct_deadline,0,4)}년 ${fn:substring(ctvo.ct_deadline,5,7)}월 ${fn:substring(ctvo.ct_deadline,8,10)}일
					</td>
				</tr>
				<tr>
					<td>
						<span class="guide_text">이의신청기간</span>
						${fn:substring(ctvo.ct_appeal,0,4)}년 ${fn:substring(ctvo.ct_appeal,5,7)}월 ${fn:substring(ctvo.ct_appeal,8,10)}일
					</td>
				</tr>
				<tr>
					<td><span class="guide_text">장소</span>${ctvo.ct_location}</td>
				</tr>
				<tr>
					<td><span class="guide_text">주최</span>${ctvo.ct_host}</td>
				</tr>
				<tr>
					<td><span class="guide_text">주관</span>${ctvo.ct_supervision}</td>
				</tr>
				<tr>
					<td><span class="guide_text">후원</span>${ctvo.ct_sponsor}</td>
				</tr>
				<tr>
					<td><span class="guide_text">문의처</span>${ctvo.ct_inquiry}</td>
				</tr>
				<tr>
					<td><span class="guide_text">참가비</span>${ctvo.ct_entry_fee}</td>
				</tr>
				<tr>
					<td><span class="guide_text">입금계좌</span>${ctvo.ct_account}</td>
				</tr>
				<tr>
					<td>
						<span class="guide_text">요강</span><span class="bd_link main_color" onclick="file('file')"><i class=" i_font_mrs"></i>다운로드</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="guide_text">대회 포스터</span><span class="bd_link main_color" onclick="file('img')"><i class=" i_font_mrs"></i>다운로드</span>
					</td>
				</tr>
				<tr>
					<td class="img_view"><img src="${ctvo.ct_st_img}"></td>
				</tr>
			</table>
		</div>
		<!-- popup_body end--> 
	</div>
</div>
<!-- tab_cont_con end -->