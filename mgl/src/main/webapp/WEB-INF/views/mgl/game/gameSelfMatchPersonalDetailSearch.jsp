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
							<option value="#" selected="selected">1 조</option>
							<option value="#">2 조</option>
							<option value="">3 조</option>
					</select></li>
					<li><h4 class="title_s">10팀 15게임</h4></li>
				</ul>
			</div>
			<div class="tab_bt_area white_bg">
				<div>
					<ul class="tab_cont">
						<li>순위확인</li>
						<li>게임이력확인</li>
					</ul>
				</div>
			</div>
			<!-- content end-->
			<div class="content white_bg pt_00">
				<table class="grade_td">
					<tr>
						<td class="name_td">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum" style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="ranking">1</span><span class="name3">홍길이에요</span>
								</div>
							</div>
						</td>
						<td>
							<ul class="score_li">
								<li>4<span>승</span></li>
								<li>0<span>패</span></li>
								<li>100<span>득</span></li>
								<li>50<span>실</span></li>
								<li>50<span>차</span></li>
							</ul>
							<ul class="etch_li li_dot">
								<li><span class="tit_div">우승</span>4</li>
								<li><span class="tit_div">점수</span>4.50</li>
								<li><span class="tit_div">총점</span>8.50</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="name_td">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum" style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="ranking">89</span><span class="name3">홍단</span>
								</div>
							</div>
						</td>
						<td>
							<ul class="score_li">
								<li>4<span>승</span></li>
								<li>0<span>패</span></li>
								<li>100<span>득</span></li>
								<li>50<span>실</span></li>
								<li>50<span>차</span></li>
							</ul>
							<ul class="etch_li li_dot">
								<li><span class="tit_div">우승</span>4</li>
								<li><span class="tit_div">점수</span>4.50</li>
								<li><span class="tit_div">총점</span>8.50</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="name_td">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum" style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="ranking">99</span><span class="name3">홍길이에요</span>
								</div>
							</div>
						</td>
						<td>
							<ul class="score_li">
								<li>4<span>승</span></li>
								<li>0<span>패</span></li>
								<li>100<span>득</span></li>
								<li>50<span>실</span></li>
								<li>50<span>차</span></li>
							</ul>
							<ul class="etch_li li_dot">
								<li><span class="tit_div">우승</span>4</li>
								<li><span class="tit_div">점수</span>4.50</li>
								<li><span class="tit_div">총점</span>8.50</li>
							</ul>
						</td>
					</tr>
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
