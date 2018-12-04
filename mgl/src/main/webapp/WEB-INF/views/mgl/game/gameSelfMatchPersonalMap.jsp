<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
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
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top">
					<h1>양천클럽</h1>
				</div>
				<div class="bt_top">
					<span class="btn_st btn_wh btn_series"
						onClick="location.href='07-03-3_participation1-3.html'">이전</span><span
						class="btn_st btn_wh btn_series"
						onClick="location.href='07-03-4_match-set2-4.html'">다음</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-6, -5);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					})
					var tab_s_no = $(location).attr('pathname').slice(-8, -7);
					$('.tabs_cont').navi_depth({
						pageNum : tab_s_no
					});
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/GameSelfMatchPersonalEnvir.techni'"><span>조별(종목)</span></li>
					<li onClick="location.href='/Game/GameSelfMatchPersonalPlayerDiv.techni'"><span>선수구분</span></li>
					<li onClick="location.href='/Game/GameSelfMatchPersonalMap.techni'"><span>대진표</span></li>
				</ul>
			</div>
			<div class="tab_bt_area white_bg">
				<div>
					<ul class="tabs_cont">
						<li onClick="location.href='07-03-5_match-make1-4.html'">대진생성</li>
						<li onClick="location.href='07-03-4_match-set2-4.html'">대진환경</li>
					</ul>
				</div>
			</div>
			<!-- content end-->
			<div class="pd_lrtb white_bg">
				<ul class="li_col-nol">
					<li><b>총게임수</b>60게임</li>
					<li><b>참가팀</b>21팀</li>
					<li><b>참여회원</b>44명</li>
				</ul>
			</div>
			<div class="content white_bg pt_00">
				<table class="game_td thead_td cet_lay bt_line_td">
					<thead>
						<tr>
							<th class="team_nb">순서</th>
							<th class="no_td">No</th>
							<th>구분(종목)</th>
							<th>팀수</th>
							<th>청/백</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="score_nol_td"><input type="text" placeholder="6"
								class="cet_lay"></td>
							<td class="no_td">1</td>
							<td class="ga_title">이밴트(남복 2팀)</td>
							<td>3</td>
							<td>3/3</td>
						</tr>
						<tr>
							<td class="score_nol_td"><input type="text" placeholder="2"
								class="cet_lay"></td>
							<td class="no_td">2</td>
							<td class="ga_title">B 조 그룹</td>
							<td>10</td>
							<td>10/10</td>
						</tr>
						<tr>
							<td class="score_nol_td"><input type="text" placeholder="5"
								class="cet_lay"></td>
							<td class="no_td">3</td>
							<td class="ga_title">이밴트(남복 2팀)</td>
							<td>3</td>
							<td>3/3</td>
						</tr>
						<tr>
							<td class="score_nol_td"><input type="text" placeholder="3"
								class="cet_lay"></td>
							<td class="no_td">4</td>
							<td class="ga_title">A 조 그룹</td>
							<td>3</td>
							<td>3/3</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- content end-->
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
<!-- InstanceEnd -->
</html>