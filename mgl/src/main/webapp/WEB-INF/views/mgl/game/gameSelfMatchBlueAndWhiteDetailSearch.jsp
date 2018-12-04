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
			<div class="tit_select gray_bg">
				<ul class="li_col-nol">
					<li><h4 class="title_s">
							<b>구분(종목)</b>
						</h4> <select onchange="if(this.value) location.href=(this.value);">
							<option value="" selected="selected">A 조 그룹</option>
							<option value="">B 조 그룹</option>
							<option value="">이밴트(남복 2팀)</option>
					</select></li>
					<li><h4 class="title_s">3팀 3게임</h4></li>
				</ul>
			</div>
			<div class="content white_bg">
				<table class="game_td mix_img_col3 thead_td bt_line_td">
					<thead>
						<tr>
							<th><h4>청팀</h4></th>
							<th class="td_th">VS</th>
							<th><h4>백팀</h4></th>
						</tr>
					</thead>
					<tr>
						<td>3.0</td>
						<td class="td_th">승수</td>
						<td>3.0</td>
					</tr>
					<tr>
						<td>-58</td>
						<td class="td_th">점수차</td>
						<td>+58</td>
					</tr>
					<tr>
						<td>3.00</td>
						<td class="td_th">우승포인트</td>
						<td>0.00</td>
					</tr>
					<tr>
						<td>17.3</td>
						<td class="td_th">점수차포인트</td>
						<td>32.85</td>
					</tr>
					<tr>
						<td>40.50</td>
						<td class="td_th">합계</td>
						<td>1.13</td>
					</tr>
					<tr>
						<td>승</td>
						<td class="td_th">결과</td>
						<td>패</td>
					</tr>
				</table>
			</div>
			<!-- content end-->
			<div class="content white_bg pt_0">
				<table class="mix_td">
					<tr>
						<td rowspan="2" class="court_td cot2">2코트 21<span class="date_span">2018.03.22 PM 07:25</span></td>
						<td class="ga_title">
							<ul class="team_li">
								<li>
									<span class="team_b i_team" title="청팀"></span>
									<span class="name3">A조팀이에요</span>(40 A)
								</li>
								<li>
									<span class="name3">C조팀이에요</span>(30 D)
								</li>
							</ul>
						</td>
						<td class="score_data">25</td>
						<td class="score_data">+4</td>
						<td class="score_data">승</td>
					</tr>
					<tr>
						<td class="ga_title">
							<ul class="team_li">
								<li>
									<span class="team_w i_team" title="백팀"></span>
									<span class="name3">홍길</span>(40 A)
								</li>
								<li>
									<span class="name3">조길</span>(30 D)
								</li>
							</ul>
						</td>
						<td class="score_data">25</td>
						<td class="score_data">+4</td>
						<td class="score_data">승</td>
					</tr>
					<tr>
						<td rowspan="2" class="court_td cot2">2코트 21<span class="date_span">2018.03.22 PM 07:25</span></td>
						<td class="ga_title">
							<ul class="team_li">
								<li><span class="team_b i_team" title="청팀"></span><span
									class="name3">A조팀이에요</span>(40 A)</li>
								<li><span class="name3">C조팀이에요</span>(30 D)</li>
							</ul>
						</td>
						<td class="score_data">25</td>
						<td class="score_data">+4</td>
						<td class="score_data">승</td>
					</tr>
					<tr>
						<td class="ga_title"><ul class="team_li">
								<li><span class="team_w i_team" title="백팀"></span><span
									class="name3">홍길동</span>(40 A)</li>
								<li><span class="name3">조길</span>(30 D)</li>
							</ul></td>
						<td class="score_data">25</td>
						<td class="score_data">+4</td>
						<td class="score_data">승</td>
					</tr>
					<tr>
						<td rowspan="2" class="court_td cot2">2코트 21<span
							class="date_span">2018.03.22 PM 07:25</span></td>
						<td class="ga_title"><ul class="team_li">
								<li><span class="team_b i_team" title="청팀"></span><span
									class="name3">A조팀이에요</span>(40 A)</li>
								<li><span class="name3">C조팀이에요</span>(30 D)</li>
							</ul></td>
						<td class="score_data">25</td>
						<td class="score_data">+4</td>
						<td class="score_data">승</td>
					</tr>
					<tr>
						<td class="ga_title"><ul class="team_li">
								<li><span class="team_w i_team" title="백팀"></span><span
									class="name3">홍길이에요</span>(40 A)</li>
								<li><span class="name3">조길동</span>(30 D)</li>
							</ul></td>
						<td class="score_data">2</td>
						<td class="score_data">+4</td>
						<td class="score_data">승</td>
					</tr>
				</table>
			</div>
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('.ft_menu').navi_depth({pageNum:aa})
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