<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="fix_top bg_gray">
	<div id="swiper_nav" class="gray_bg fix-top"> 
	<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide" onClick="location.href='/Contest/ContestMyGameEventDetail.techni'">1G</div>
				<div class="swiper-slide" onClick="location.href='#;'">2G</div>
				<div class="swiper-slide" onClick="location.href='#;'">3G</div>
				<div class="swiper-slide" onClick="location.href='#;'">4G</div>
				<div class="swiper-slide" onClick="location.href='#;'">5G</div>
				<div class="swiper-slide" onClick="location.href='#;'">6G</div>
				<div class="swiper-slide" onClick="location.href='#;'">7G</div>
				<div class="swiper-slide" onClick="location.href='#;'">8G</div>
				<div class="swiper-slide" onClick="location.href='07-02-1_game-event-tournament.html'">본선</div>
			</div>
<!-- Add Arrows -->
		<div class="swiper-btn-next"></div>
		<div class="swiper-btn-prev"></div>
	</div>
</div>
<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView:5,
		spaceBetween: 1,
		navigation: {
			nextEl: '.swiper-btn-next',
			prevEl: '.swiper-btn-prev',
		},
	});
</script> 
</div>
<!-- fix_top end -->
	<div class="content white_bg pt_00">
		<div class="cat_s_area">
			<h4 class="title_ms">랭킹</h4>
		</div>
	<table class="td_small cet_lay">
		<thead class="pd_left0">
			<tr>
				<th>순위</th>
				<th>소속</th>
				<th>선수</th>
				<th>승</th>
				<th>패</th>
				<th>득</th>
				<th>실</th>
				<th>차</th>
			</tr>
		</thead>
		<tr>
			<td class="no_td">1</td>
			<td class="club_td"><span class="club_name">TeamB.S.F＆SPROS</span></td>
			<td class="na_row_td"><span class="name3">가길</span>
			<span class="name3">길동</span></td>
			<td class="td_1">2</td>
			<td class="td_1">6</td>
			<td class="td_2">75</td>
			<td class="td_2">47</td>
			<td class="td_2">-11</td>
		</tr>
	</table>
</div>
<!-- content end-->
<div class="cat_s_area white_bg">
	<h4 class="title_ms">대진표</h4>
</div>
<div class="match-figure_area white_bg">
	<div class="match-figure figure5">
		<dl class="club-player">
			<dt>
				<span class="club_name">Adidas Power</span>
			</dt>
			<dd>
				<span class="name3">가길동입니다.</span>
			</dd>
			<dd>
				<span class="name3">나길동</span>
			</dd>
		</dl>
		<div class="match_data">
			<ol class="time-court">
				<li class="time_s">08:40</li>
				<li>22-400</li>
			</ol>
			<p class="win_lose lose_mark">패:19</p>
			<p class="win_lose win_mark">승:25</p>
		</div>
	</div>
<!-- match-figure end--> 
</div>
<!-- content end-->
<div class="cat_s_area white_bg">
	<h4 class="title_ms">일정</h4>
</div>
<div class="content white_bg pt_00">
	<div class="head-data">
		<div>
			<ul class="li_col-nol impot">
				<li>4코트 230</li>
				<li>혼복-40-자강</li>
				<li>토너먼트</li>
			</ul>
		</div>
		<div>
			<span class="sign-round color3">완료</span>
		</div>
	</div>
  	<!-- head-data end-->
	<table class="line_no td-pt">
		<tr>
			<td class="club_td"><span class="club_name">TeamB.S.F＆SPROS</span></td>
			<td class="name3-2_td">
				<ul class="name_row">
					<li>
						<span class="name3 name_max">남길</span>
						<span class="age_rank side_right">(30-A)</span>
					</li>
					<li>
						<span class="name3 name_max">남홍</span>
						<span class="age_rank side_right">(30-자강)</span>
					</li>
				</ul>
			</td>
			<td class="game_score">0</td>
		</tr>
		<tr class="color3">
			<td class="club_td"><span class="club_name">리더아머마르스</span></td>
			<td class="name3-2_td">
				<ul class="name_row">
					<li>
						<span class="name3 name_max">남홍길</span>
						<span class="age_rank side_right">(30-A)</span>
					</li>
					<li>
						<span class="name3 name_max">김남홍길입니다.</span>
						<span class="age_rank side_right">(30-자강)</span>
					</li>
				</ul>
			</td>
			<td class="game_score">30</td>
		</tr>
	</table>
</div>