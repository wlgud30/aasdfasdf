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
					<span class="btn_st btn_wh btn_series" onClick="location.href='/Game/GameSelfMatchPersonalPlayerDiv.techni'">이전</span><span class="btn_st btn_wh btn_series" onClick="location.href='/Game/GameSelfMatchPersonalMap.techni'">다음</span>
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
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/GameSelfMatchPersonalEnvir.techni'"><span>조별(종목)</span></li>
					<li onClick="location.href='/Game/GameSelfMatchPersonalPlayerDiv.techni'"><span>선수구분</span></li>
					<li onClick="location.href='/Game/GameSelfMatchPersonalMap.techni'"><span>대진표</span></li>
				</ul>
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
							<th class="nb2_td">인원</th>
							<th>팀수</th>
							<th>게임수</th>
							<th class="i_btn_td"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="no_td">1</td>
							<td class="ga_title">1조</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="i_btn_td"><span class="i_btn i-minus"></span></td>
						</tr>
						<tr>
							<td class="no_td">2</td>
							<td class="ga_title">1조</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="i_btn_td"><span class="i_btn i-minus"></span></td>
						</tr>
						<tr>
							<td class="no_td">3</td>
							<td class="ga_title">5조 에요</td>
							<td>5</td>
							<td>10</td>
							<td>15</td>
							<td class="i_btn_td"><span class="i_btn i-minus"></span></td>
						</tr>
						<tr>
							<td class="no_td">4</td>
							<td class="ga_title"><input type="text"
								placeholder="구분(종목) 입력"></td>
							<td class="score_nol_td"><input type="text" placeholder="00"
								class="cet_lay"></td>
							<td>10</td>
							<td>15</td>
							<td class="i_btn_td"><span class="i_btn i-plus"></span></td>
						</tr>
						<tr class="merge_th">
							<td class="no_td"></td>
							<td>합계</td>
							<td>18/18</td>
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
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>