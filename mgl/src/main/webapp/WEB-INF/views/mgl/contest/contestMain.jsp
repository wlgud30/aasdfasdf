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
	<div class="cont_mb_b" id="slide_main">
		<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${adList}" var="list">
					<div class="swiper-slide" onClick="">
						<ul class="list_room white_bg">
							<li>
								<div class="room_photo">
								<c:choose>
									<c:when test="${list.ct_match_yn eq 'N'}"><span class="alarm_rally sub0_bg">예정</span></c:when>
									<c:when test="${list.ct_match_yn eq 'Y'}"><span class="alarm_rally main_bg">진행</span></c:when>
								</c:choose>
									<div class="photo_area mask_mbig"
										style="background-image: url(/resources/img/cal_20180602_gapyeong.jpg)"></div>
								</div>
								<div class="room_data">
									<h4>${list.ct_nm }</h4>
									<div class="col-inputside ver_lay_b">
										<div class="max-ws_td">
											<ul class="li_row_s el_texts">
												<li><i class="i_font icon-calendar sub_color"></i>${list.ct_start} - ${list.ct_end }</li>
												<li><i class="i_font icon-location-pin sub_color"></i>${list.ct_location }</li>
												<li><i class="i_font icon-cursor sub_color"></i>${list.ct_sponsor }
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

	<div class="tab_cont_con">
		<ul class="list_room white_bg cont_mb_b tab_con">
			<c:forEach items="${preList }" var="list">
				<li>
					<div class="room_photo">
						<span class="alarm_rally sub0_bg">예정</span>
						<div class="photo_area mask_mbig"
							style="background-image: url(/resources/img/thumbnail_02.jpg)"></div>
					</div>
					<div class="room_data">
						<h4>${list.ct_nm}</h4>
						<div class="col-inputside ver_lay_b">
							<div class="max-ws_td">
								<ul class="li_row_s el_texts">
									<li><i class="i_font icon-calendar sub_color"></i>${list.ct_start}~${list.ct_end}</li>
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
		</ul>
		<!-- tab_con end -->
		<ul class="list_room white_bg cont_mb_b tab_con">
			<c:forEach items="${ingList }" var="list">
				<li>
					<div class="room_photo">
						<span class="alarm_rally main_bg">진행</span>
						<div class="photo_area mask_mbig"
							style="background-image: url(/resources/img/cal_20180623_sejong.jpg)"></div>
					</div>
					<div class="room_data">
						<h4>${list.ct_nm}</h4>
						<div class="col-inputside ver_lay_b">
							<div class="max-ws_td">
								<ul class="li_row_s el_texts">
									<li><i class="i_font icon-calendar sub_color"></i>${list.ct_start}~${list.ct_end}</li>
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
		</ul>
		<!-- tab_con end -->
	</div>
	<!-- tab_cont_con end -->