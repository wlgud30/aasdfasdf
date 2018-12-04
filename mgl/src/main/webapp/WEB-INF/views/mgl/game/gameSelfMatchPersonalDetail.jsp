<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="152x152" href="/resources/img/favicon_152.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon_32.png">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="/resources/img/favicon_144.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/css.css" type="text/css" />
<script src="/resources/js/jquery-1.12.0.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/js_st.js"></script>
<script src="/resources/js/Navi.js"></script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onclick="history.back();"></div>
				<div class="tit_top">
					<h1>양천클럽</h1>
				</div>
				<div class="bt_top">
					<span class="btn_st btn_wh" onClick="location.href='/Game/GameSelfMatchWrite.techni'">대회생성</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<div class="room_data">
					<h4>양천클럽 1분기 자체대회</h4>
					<div class="divide_text">
						<b class="way">개인리그전</b>
					</div>
					<div class="li_dot col_li">
						<span>2018.03.22 PM 06:00 ~ PM 08:00</span>
						<span>계남다목적체육관(서울 양천구 신정동)</span>
					</div>
				</div>
			</div>
			<div class="content white_bg">
				<div class="bd_cat">
					<ul class="li_col-nol">
						<li><b>참여회원</b>18명 / 85명</li>
					</ul>
				</div>
				<table class="game_td thead_td cet_lay bt_line2_td">
					<thead>
						<tr>
							<th class="no_td">No</th>
							<th>구분(종목)</th>
							<th>인원</th>
							<th>팀수</th>
							<th>게임</th>
							<th class="ga_btn_s"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="no_td">1</td>
							<td>1조</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="ga_btn_s"><span class="i_file-view" onclick="location.href='/Game/GameSelfMatchPersonalDetailSearch.techni'"></span></td>
						</tr>
						<tr>
							<td class="no_td">2</td>
							<td>1조</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="ga_btn_s"><span class="i_file-view" onclick="location.href='/Game/GameSelfMatchPersonalDetailSearch.techni'"></span></td>
						</tr>
						<tr>
							<td class="no_td">3</td>
							<td>5조 에요</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="ga_btn_s"><span class="i_file-view" onclick="location.href='/Game/GameSelfMatchPersonalDetailSearch.techni'"></span></td>
						</tr>
						<tr>
							<td class="no_td">4</td>
							<td>1조 에요</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="ga_btn_s"><span class="i_file-view" onclick="location.href='/Game/GameSelfMatchPersonalDetailSearch.techni'"></span></td>
						</tr>
						<tr class="merge_th">
							<td class="no_td"></td>
							<td>합계</td>
							<td>18</td>
							<td>32</td>
							<td>36</td>
							<td class="ga_btn_s"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- content end-->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : aa
					})
				});
			</script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li onClick="location.href='/Game/GameStateInfo.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubMemberInfoList.techni'"><span>회원</span></li>
				<li onClick="location.href='/UClub/UClubDetail.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>