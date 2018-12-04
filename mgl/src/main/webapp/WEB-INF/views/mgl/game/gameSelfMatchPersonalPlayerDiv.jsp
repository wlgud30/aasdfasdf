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
			<div class="content white_bg">
				<div class="btn_full">
					<span class="btn_st" onclick="location.href='#;'">자동생성</span>
				</div>
			</div>

			<div class="tit_select cet_lay">
				<ul class="li_col-nol">
					<li><h4 class="title_s">
							<b>구분(종목)</b>
						</h4> <select onchange="if(this.value) location.href=(this.value);">
							<option value="">1. 1 조</option>
							<option value="" selected="selected">2. 2 조</option>
							<option value="">3. 3 조</option>
					</select></li>
					<li><h4 class="title_s">5명/5명</h4></li>
				</ul>
			</div>
			<div class="content white_bg">
				<table class="line_td">
					<tr>
						<td class="name_ph"><div class="photo_name">
								<div class="thum_area">
									<div class="thum"
										style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3">가길동입니다.</span>
								</div>
							</div>
							<!--photo_name end--></td>
						<td class="btn_icons_td"><select>
								<option value="종목이동" selected="selected">종목이동</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
						</select></td>
					</tr>
					<tr>
						<td><div class="photo_name">
								<div class="thum_area">
									<div class="thum"
										style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3">가길</span>
								</div>
							</div>
							<!--photo_name end--></td>
						<td class="btn_icons_td"><select>
								<option value="종목이동" selected="selected">종목이동</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
						</select></td>
					</tr>
					<tr>
						<td class="name_ph"><div class="photo_name">
								<div class="thum_area">
									<div class="thum"
										style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3">가길</span>
								</div>
							</div>
							<!--photo_name end--></td>
						<td class="btn_icons_td"><select>
								<option value="종목이동" selected="selected">종목이동</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
						</select></td>
					</tr>
					<tr>
						<td class="name_ph"><div class="photo_name">
								<div class="thum_area">
									<div class="thum"
										style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3">하남동</span>
								</div>
							</div>
							<!--photo_name end--></td>
						<td class="btn_icons_td"><select>
								<option value="종목이동" selected="selected">종목이동</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
						</select></td>
					</tr>
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