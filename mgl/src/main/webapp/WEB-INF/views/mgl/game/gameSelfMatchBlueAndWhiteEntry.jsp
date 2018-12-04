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
					<span class="btn_st btn_wh btn_series" onClick="location.href='#'">이전</span><span class="btn_st btn_wh btn_series" onClick="location.href='/Game/GameSelfMatchBlueAndWhitePlayerDiv.techni'">다음</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<script src="js/jquery.tablednd.js"></script>
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-6, -5);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					});
					var tab_s_no = $(location).attr('pathname').slice(-8, -7);
					$('.tabs_cont').navi_depth({
						pageNum : tab_s_no
					});
					$(".mix3_td").tableDnD({
						dragHandle : ".order_td"
					});
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEnvir.techni'"><span>조별(종목)</span></li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhitePlayerDiv.techni'"><span>선수구분</span></li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEntry.techni'"><span>출전신청</span></li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteMap.techni'"><span>대진표</span></li>
				</ul>
			</div>
			<div class="tab_bt_area white_bg">
				<ul class="tabs_cont">
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEntry.techni'">청팀</li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEntry.techni'">백팀</li>
				</ul>
			</div>
			<!-- content end-->
			<div class="pd_lrb cet_lay">
				<span class="btn_st onclick=" location.href='#;'">전체확인</span><span
					class="btn_st onclick=" location.href='#;'">팀등록</span>
			</div>
			<div class="tit_select cet_lay">
				<ul class="li_col-nol">
					<li><h4 class="title_s">
							<b>구분(종목)</b>
						</h4> <select onchange="if(this.value) location.href=(this.value);">
							<option value="">1. A 조 그룹</option>
							<option value="" selected="selected">2. B 조 그룹</option>
							<option value="">3. 이밴트(남복 2팀)</option>
					</select></li>
					<li><h4 class="title_s">3팀</h4></li>
				</ul>
			</div>
			<div class="content white_bg pt_00 scroll_move">
				<div>
					<table class="mix3_td">
						<tr>
							<td class="cot2 order_td">6</td>
							<td class="name_ph"><div class="photo_name">
									<div class="thum_area">
										<div class="thum"
											style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
									</div>
									<div class="text_area">
										<span class="name3">홍길</span>
									</div>
								</div>
								<!--photo_name end--></td>
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
							<td class="btn_icons_td"><div class="icon_btn">
									<span onclick="location.href='#;'" class="icon-arrow-up"></span><span
										onclick="location.href='05-04_game-registration2-2.html'"
										class="icon-pencil"></span><span onclick="location.href='#;'"
										class="icon-remove"></span>
								</div></td>
						</tr>
						<tr>
							<td class="cot2 order_td">1</td>
							<td class="name_ph"><div class="photo_name">
									<div class="thum_area">
										<div class="thum"
											style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
									</div>
									<div class="text_area">
										<span class="name3">가길동입니다.</span>
									</div>
								</div>
								<!--photo_name end--></td>
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
							<td class="btn_icons_td"><div class="icon_btn">
									<span onclick="location.href='#;'" class="icon-arrow-up"></span><span
										onclick="location.href='05-04_game-registration2-2.html'"
										class="icon-pencil"></span>
								</div></td>
						</tr>
						<tr>
							<td class="cot2 order_td">2</td>
							<td class="name_ph"><div class="photo_name">
									<div class="thum_area">
										<div class="thum"
											style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
									</div>
									<div class="text_area">
										<span class="name3">백길동입니다.</span>
									</div>
								</div>
								<!--photo_name end--></td>
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
							<td class="btn_icons_td"><div class="icon_btn">
									<span onclick="location.href='#;'" class="icon-arrow-up"></span><span
										onclick="location.href='05-04_game-registration2-2.html'"
										class="icon-pencil"></span>
								</div></td>
						</tr>
						<tr>
							<td class="cot2 order_td">12</td>
							<td class="name_ph"><div class="photo_name">
									<div class="thum_area">
										<div class="thum"
											style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
									</div>
									<div class="text_area">
										<span class="name3">백길동입니다.</span>
									</div>
								</div>
								<!--photo_name end--></td>
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
							<td class="btn_icons_td"><div class="icon_btn">
									<span onclick="location.href='#;'" class="icon-arrow-up"></span><span
										onclick="location.href='05-04_game-registration2-2.html'"
										class="icon-pencil"></span>
								</div></td>
						</tr>
						<tr>
							<td class="cot2 order_td">22</td>
							<td class="name_ph"><div class="photo_name">
									<div class="thum_area">
										<div class="thum"
											style="background-image: url(/resources/img/member_photo_07.jpg);"></div>
									</div>
									<div class="text_area">
										<span class="name3">최길동입니다.</span>
									</div>
								</div>
								<!--photo_name end--></td>
							<td class="name_ph"><div class="photo_name">
									<div class="thum_area">
										<div class="thum"
											style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
									</div>
									<div class="text_area">
										<span class="name3">하남동</span>
									</div>
								</div>
								<!--photo_name end--></td>
							<td class="btn_icons_td"><div class="icon_btn">
									<span onclick="location.href='#;'" class="icon-arrow-up"></span><span
										onclick="location.href='05-04_game-registration2-2.html'"
										class="icon-pencil"></span>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- content end-->
			<div class="cat_gray_area">
				<h4 class="title_m">
					청팀<span class="num_data">(22명)</span>
				</h4>
			</div>
			<div class="content white_bg">
				<table class="line_td game_opt">
					<tr>
						<td>
							<div class="title_area">
								<div>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum"
												style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">가길동입니다.</span>
											<ul class="list_check li_lot">
												<li><input type="checkbox" class="li_check"
													id="check_1"><label for="check_1">1</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2"><label for="check_2">2</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_3"><label for="check_3">3</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_4"><label for="check_4">4</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_5"><label for="check_5">5</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_6"><label for="check_6">6</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_7"><label for="check_7">7</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_8"><label for="check_1">8</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_9"><label for="check_2">9</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_10"><label for="check_3">10</label></li>
											</ul>
										</div>
									</div>
									<!-- photo_name end -->
								</div>
								<div>
									<b class="item_tit">출전</b>3
								</div>
							</div>
							<!-- title_area end-->
						</td>
					</tr>
					<tr>
						<td>
							<div class="title_area">
								<div>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum"
												style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">이미동입니다.</span>
											<ul class="list_check li_lot">
												<li><input type="checkbox" class="li_check"
													id="check_1_1"><label for="check_1_1">1</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_1_2"><label for="check_1_2">2</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_1_3"><label for="check_1_3">3</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_1_4"><label for="check_1_4">4</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_1_5"><label for="check_1_5">5</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_1_6"><label for="check_1_6">6</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_1_7"><label for="check_1_7">7</label></li>
											</ul>
										</div>
									</div>
									<!-- photo_name end -->
								</div>
								<div>
									<b class="item_tit">출전</b>10
								</div>
							</div>
							<!-- title_area end-->
						</td>
					</tr>
					<tr>
						<td>
							<div class="title_area">
								<div>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum"
												style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">동철</span>
											<ul class="list_check li_lot">
												<li><input type="checkbox" class="li_check"
													id="check_3_1"><label for="check_3_1">1</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_3_2"><label for="check_3_2">2</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_3_3"><label for="check_3_3">3</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_3_4"><label for="check_3_4">4</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_3_5"><label for="check_3_5">5</label></li>
											</ul>
										</div>
									</div>
									<!-- photo_name end -->
								</div>
								<div>
									<b class="item_tit">출전</b>100
								</div>
							</div>
							<!-- title_area end-->
						</td>
					</tr>
					<tr>
						<td>
							<div class="title_area">
								<div>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum"
												style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">박철곤입니다.</span>
											<ul class="list_check li_lot">
												<li><input type="checkbox" class="li_check"
													id="check_2_1"><label for="check_2_1">1</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_2"><label for="check_2_2">2</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_3"><label for="check_2_3">3</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_4"><label for="check_2_4">4</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_5"><label for="check_2_5">5</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_6"><label for="check_2_6">6</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_7"><label for="check_2_7">7</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_8"><label for="check_2_8">8</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_9"><label for="check_2_9">9</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_10"><label for="check_2_10">10</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_11"><label for="check_2_11">11</label></li>
												<li><input type="checkbox" class="li_check"
													id="check_2_12"><label for="check_2_12">12</label></li>
											</ul>
										</div>
									</div>
									<!-- photo_name end -->
								</div>
								<div>
									<b class="item_tit">출전</b>90
								</div>
							</div>
							<!-- title_area end-->
						</td>
					</tr>
				</table>
			</div>
			<!-- content end -->
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