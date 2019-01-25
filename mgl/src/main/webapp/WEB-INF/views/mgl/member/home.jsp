<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
			<div class="ct_sd pt_00">
				<ul id="li_2divide" class="cet_lay white_bg mb_t">
					<li><span class="item_text">게임 포인트</span> <span
						class="sub_color">1,984 P</span></li>
					<li><span class="item_text">대회 포인트</span> <span
						class="sub_color">369 P</span></li>
				</ul>
			</div>
			<!-- ct_sd end -->
			<div class="ct_sd white_bg">
				<div class="photo-data">
					<div id="profile_img_area">
						<div onClick="location.href='#;'" id="profile_img"
							style="background-image: url(img/woman_face.svg)"></div>
					</div>
					<!-- img_upload_are end -->
					<div>
						<table id="rank_td" class="line_no_t_td cet_lay">
							<thead>
								<tr>
									<th><span class="th_dot">대표클럽</span></th>
									<th><span class="th_dot">시.군.구</span></th>
									<th><span class="th_dot">시.도</span></th>
									<th><span class="th_dot">전국</span></th>
								</tr>
							</thead>
							<tr>
								<td class="bold_text">자강</td>
								<td class="bold_text">A</td>
								<td class="bold_text">B</td>
								<td class="bold_text">왕초</td>
							</tr>
							<tr>
								<td class="bold_text main_color">4</td>
								<td class="bold_text main_color">57</td>
								<td class="bold_text main_color">1,234</td>
								<td class="bold_text main_color">3,342</td>
							</tr>
							<tr>
								<td class="tiny_text gray_text">(85)</td>
								<td class="tiny_text gray_text">(248)</td>
								<td class="tiny_text gray_text">(38,590)</td>
								<td class="tiny_text gray_text">(236,948)</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- photo-data end -->
			</div>
			<!-- ct_sd end -->
			<div class="ct_sd white_bg pt_00">
				<table class="td_m cet_lay td_pd_l0">
					<tr>
						<td><i class="icon-f i_font icon-big1 icon-volume"></i> <span
							class="item_text">공지</span> <span class="sub_color">10</span></td>
						<td><i class="icon-f i_font icon-big1 icon-outline_4"></i> <span
							class="item_text">예정대회</span> <span class="sub_color">20</span></td>
						<td><i class="icon-f i_font icon-big1 icon-match"></i> <span
							class="item_text">진행대회</span> <span class="sub_color">60</span></td>
					</tr>
				</table>
			</div>
			<!-- ct_sd end -->
			<div class="content pt_00" id="slide_main">
				<!-- Swiper -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide" onClick="location.href='#;'">
							<img src="/resources/img/slide_01.png">
						</div>
						<div class="swiper-slide" onClick="location.href='#;'">
							<img src="/resources/img/slide_02.png">
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
		<script>
			$(document).ready(function(){
				$("#home").attr("class","active_tab");	
				alert("${msg}");
			});
		</script>