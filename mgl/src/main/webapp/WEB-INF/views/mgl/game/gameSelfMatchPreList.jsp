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
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo" onclick="location.href='/UClub/UClubList.techni'">
				</div>
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
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-8, -7);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					})
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/GameSelfMatchIngList.techni'"><span>진행중 대회</span></li>
					<li onClick="location.href='/Game/GameSelfMatchPreList.techni'"><span>예정대회</span></li>
					<li onClick="location.href='/Game/GameSelfMatchLastList.techni'"><span>종료대회</span></li>
				</ul>
			</div>
			<div class="content white_bg">
				<table class="game_td col_td21">
					<tr
						onClick="location.href='/Game/GameSelfMatchPersonalDetail.techni'">
						<td><ul class="li_nol">
								<li><h4>양천클럽 예정 자체대회</h4></li>
								<li>2018.03.22 PM 06:00 ~ PM 08:00</li>
							</ul></td>
						<td><ul class="li_nol">
								<li><b>참여인원</b>44 / 85</li>
								<li>개인리그전</li>
							</ul></td>
					</tr>
					<tr onClick="location.href='/Game/GameSelfMatchBlueAndWhiteDetail.techni'">
						<td><ul class="li_nol">
								<li><h4>양천클럽 예정 자체대회</h4></li>
								<li>2018.03.22 PM 06:00 ~ PM 08:00</li>
							</ul></td>
						<td><ul class="li_nol">
								<li><b>참여인원</b>44 / 85</li>
								<li>청백전</li>
							</ul></td>
					</tr>
					<tr
						onClick="location.href='/Game/GameSelfMatchPersonalDetail.techni'">
						<td><ul class="li_nol">
								<li><h4>양천클럽 2분기 자체대회</h4></li>
								<li>2018.03.22 PM 06:00 ~ PM 08:00</li>
							</ul></td>
						<td><ul class="li_nol">
								<li><b>참여인원</b>44 / 85</li>
								<li>개인리그전</li>
							</ul></td>
					</tr>
					<tr onClick="location.href='/Game/GameSelfMatchBlueAndWhiteDetail.techni'">
						<td><ul class="li_nol">
								<li><h4>양천클럽 1분기 자체대회</h4></li>
								<li>2018.03.22 PM 06:00 ~ PM 08:00</li>
							</ul></td>
						<td><ul class="li_nol">
								<li><b>참여인원</b>44 / 85</li>
								<li>청백전</li>
							</ul></td>
					</tr>
					<tr onClick="location.href='/Game/GameSelfMatchBlueAndWhiteDetail.techni'">
						<td><ul class="li_nol">
								<li><h4>양천클럽 1분기 자체대회</h4></li>
								<li>2018.03.22 PM 06:00 ~ PM 08:00</li>
							</ul></td>
						<td><ul class="li_nol">
								<li><b>참여인원</b>44 / 85</li>
								<li>청백전</li>
							</ul></td>
					</tr>
				</table>
			</div>
			<!-- content end -->
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
