<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content white_bg pt_00">
	<ul class="list_room white_bg">
		<%-- <c:forEach items="${list }" var="list"> --%>
		<li>
			<div class="room_photo">
				<span class="alarm_rally sub_color"><%-- ${list. } --%>종료</span>
				<div class="photo_area mask_mbig" style="background-image:url(img/cal_20180630_nh.jpg)"></div>
			</div>
			<div class="room_data">
				<div class="col-inputside ver_lay_b">
					<div class="max-ws_td">
						<ul class="li_row_s el_texts">
							<li>
								<span class="guide_text">주관</span>
								<%-- ${list. } --%>구로구 배드민턴협회
							</li>
							<li>
								<span class="guide_text">일시</span>
								<%-- ${list. } --%>2019.03.23 AM 10:00~PM 4:30
							</li>
							<li>
								<span class="guide_text">장소</span>
								<%-- ${list. } --%>구로누리배드민턴장
							</li>
							<li>
								<span class="guide_text">협찬</span>
								<%-- ${list. } --%>구로구 서울특별시체육회, 구로구체육진흥회
							</li>	
						</ul>
					</div >
				</div>
			<!-- col-inputside end --> 
			</div>
		</li>
		<%-- </c:forEach> --%>
	</ul>
	<!-- list_room end -->
	<div class="pd_lrb td_st td3 btn_full btn_sml mb_tiny">
		<div>
			<span class="btn_st popwin_btn1" onclick="location.href='#'">개요보기</span>
		</div>
		<div>
			<span class="btn_st btn_color1" onclick="location.href='/Contest/ContestApplication.techni'">출전신청</span>
		</div>
		<div>
			<span class="btn_st btn_color2" onclick="location.href='/Contest/ContestStep.techni'">스텝</span>
		</div>
	</div>
</div>
<!-- content end -->
<div class="white_bg cont_mb_b box_line_gray">
	<div class="col_2input ver_lay_m">
		<div>
			<table class="text_td cet_lay">
				<%-- <c:forEach items="${list2 }" var="list2"> --%>
				<tr>
					<td class="no_td"><%-- ${list2. } --%>여복</td>
					<td>
						<ul class="name_row">
							<li>
								<span class="name3"><%-- ${list2. } --%>김남길</span>
							</li>
							<li>
								<span class="name3"><%-- ${list2. } --%>남홍이</span>
							</li>
							</ul>
					</td>
					<td class="w20">
						<ul class="name_row">
							<li> <%-- ${list2. } --%>50 </li>
							<li> <%-- ${list2. } --%>3 </li>
						</ul>
					</td>
				</tr>
				<tr>
					<td class="no_td"><%-- ${list2. } --%>여복</td>
					<td>
						<ul class="name_row">
							<li>
								<span class="name3"><%-- ${list2. } --%>김남</span>
							</li>
							<li>
								<span class="name3"><%-- ${list2. } --%>남홍</span>
							</li>
						</ul>
					</td>
					<td class="w20">
						<ul class="name_row">
							<li> <%-- ${list2. } --%>500 </li>
							<li> <%-- ${list2. } --%>3 </li>
						</ul>
					</td>
				</tr>
				<%-- </c:forEach> --%>
			</table>
		</div>
		<div class="w10">
			<span class="btn_st" onclick="location.href='/Contest/ContestMyGame.techni'">대진표</span>
		</div>
	</div>
</div>
<!-- content end -->
<div class="pd_lr cont_mb_b white_bg">
	<table class="hue_td">
		<%-- <c:forEach items="${list3 }" var="list3"> --%>
		<tr>
			<td rowspan="2" style="width:50%" onclick="location.href='/Contest/ContestMyGame.techni'">
			<h4 class="bg_th round_t2">대진표<i class="icon-f icon-match bg_icon small_i"></i></h4>
				<ul class="li_row_m pd_s">
					<li>
						<span class="guide_text">전체 종목수</span>
						<%-- ${list3. } --%>90종목
					</li>
					<li>
						<span class="guide_text">전체 게임수</span>
						<%-- ${list3. } --%>800게임
					</li>
					<li>
						<span class="guide_text">진행 게임수</span>
						<%-- ${list3. } --%>800게임
					</li>
					<li>
						<span class="guide_text">진행율</span>
						<%-- ${list3. } --%>100%
					</li>
				</ul>
			</td>
			<td onclick="location.href='/Contest/ContestEventPlayer.techni'">
			<h4 class="bg_th sub2_bg round_t2">출전선수<i class="icon-f icon-player bg_icon small_i"></i></h4>
				<ul class="li_row_m pd_s">
					<li>
						<span class="guide_text">출전팀수</span>
						<%-- ${list3. } --%>580팀
					</li>
					<li>
						<span class="guide_text">출전클럽</span>
						<%-- ${list3. } --%>61클럽
					</li>
				</ul>
			</td>
		</tr>
		<%-- </c:forEach> --%>
		<tr>
			<td onclick="location.href='/Contest/ContestMyRanking.techni'">
			<h4 class="bg_th sub_bg round4">순위<i class="icon-f icon-ranking bg_icon small_i"></i></h4>
			</td>
		</tr>
	</table>
</div>
<!-- content end -->
<div class="tab_btn_b_area tab_btn_bm">
	<ul class="tab_btn_b tab_cont">
		<li>
			<span>게시(공지)</span><i class="btn_i icon-f icon-write main_color right_rank"></i>
		</li>
		<li>
			<span>이의신청</span><i class="btn_i icon-f icon-write main_color right_rank"></i>
		</li>
	</ul>
</div>
<!-- tab_bt_area end -->
<div class="tab_cont_con">
	<div class="content white_bg tab_con">
		<table class="board2">
			<tr onclick="location.href='03-02_game-view.html'">
				<td class="bd_title"><span class="main_color">[교류전]</span>
				제2회 누리체육관 레슨자 대회</td>
				<td class="date">2018.03.22</td>
			</tr>
		</table>
	</div>
	<!-- tab_con end -->
	<div class="content white_bg tab_con">
		<table class="board2">
			<tr onclick="location.href='03-02_game-view.html'">
				<td class="bd_title"> 제2회 누리체육관 레슨자 대회</td>
				<td class="date">2018.03.22</td>
			</tr>
		</table>
	</div>
	<!-- tab_con end --> 
</div>
<!-- tab_cont_con end -->
<div id="popwin_wrap">
	<div class="popwin_size white_bg">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="game_title">개요</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" onclick="location.href='#'"></span>
			</div>
		</div>
		<!-- title_popupp end -->
		<div class="popup_body">
			<table class="table_form">
				<tr>
					<td><h4 class="title_g">2018년 제2회 누리 체유관 레슨자 대회</h4></td>
				</tr>
				<tr>
					<td>http://www.badmintongame.co.kr/</td>
				</tr>
				<tr>
					<td><span class="guide_text">대회</span>
					2018.08.10 (일)
					<span class="time_line_i"></span>
					2018.08.14 (금)</td>
				</tr>
				<tr>
					<td><span class="guide_text">접수</span>
					2018.06.11 (월)
					<span class="time_line_i"></span>
					2018.06.17 (목)</td>
				</tr>
				<tr>
					<td><span class="guide_text">장소</span>
					구로구 실내 배드민턴장</td>
				</tr>
				<tr>
					<td><span class="guide_text">주최</span>
					구로구 체육회</td>
				</tr>
				<tr>
					<td><span class="guide_text">주관</span>
					구로구 배드민턴협회</td>
				</tr>
				<tr>
					<td><span class="guide_text">후원</span>
					구로구 서울특별시체육회, 구로구체육진흥회</td>
				</tr>
				<tr>
					<td><span class="guide_text">문의처</span>
					010-2000-0000</td>
				</tr>
				<tr>
					<td><span class="guide_text">요강</span>
					<a href="img/2018슈퍼오닝대회요강(안).hwp">2018슈퍼오닝대회요강(안).hwp</a></td>
				</tr>
				<tr>
					<td class="img_view"><img src="img/cal_20180623_sejong.jpg"></td>
				</tr>
			</table>
		</div>
		<!-- popup_body end--> 
	</div>
</div>
<!-- popwin_size end --> 
</body>
</html>