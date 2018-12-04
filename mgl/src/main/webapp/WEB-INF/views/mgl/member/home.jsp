<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<style type="text/css">
header:before {
	border-bottom: 1px solid #dedee0;
}

header {
	box-shadow: none
}
</style>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<div class="logo_top" id="main_logo">
					<img src="/resources/img/logo_b.svg" alt="MGLB" class="logo"
						onClick="location.href='index1.html'">
				</div>
				<div class="tit_top">
					<h1>배드민턴</h1>
				</div>
				<div class="bt_top">
					<span class="icon-bell btn_i"
						onClick="location.href='06-03_member_list3.html'"></span> <span
						class="notice_ub">9</span>
				</div>
				<!-- InstanceBeginEditable name="main_top" -->
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<div class="fix_top">
				
				<div id="main_nav_area">
					<ul id="main_nav">
						<li onClick="location.href='index1.html'"><span>홈</span></li>
						<li onClick="location.href='index1-2.html'"><span>클럽</span></li>
						<li onClick="location.href='index1-3.html'"><span>게임이력</span>
						</li>
						<li onClick="location.href='index4.html'"><span>프로필</span></li>
						<li onClick="location.href='index5.html'"><span>전체서비스</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- fix_top end -->
			<!-- InstanceBeginEditable name="main_content" -->
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
			<!-- Swiper JS -->
			<link rel="stylesheet" href="/resources/css/swiper.css">
			
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>