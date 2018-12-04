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
					<span class="btn_st btn_wh btn_series" onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEntry.techni'">이전</span><span class="btn_st btn_wh btn_series" onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEnvir.techni'">다음</span>
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
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEnvir.techni'"><span>조별(종목)</span></li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhitePlayerDiv.techni'"><span>선수구분</span></li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteEntry.techni'"><span>출전신청</span></li>
					<li onClick="location.href='/Game/GameSelfMatchBlueAndWhiteMap.techni'"><span>대진표</span></li>
				</ul>
			</div>
			<div class="content white_bg line_dark">
				<div class="btn_full">
					<span class="btn_st" onclick="location.href='#;'">자동생성</span>
				</div>
				<div class="col_2line">
					<div>
						<h4 class="th_st">
							청팀<span class="nb_data">(22명)</span>
						</h4>
						<table class="game_td ell_td">
							<tbody>
								<tr>
									<td><div class="photo_name">
											<div class="thum_area">
												<div class="thum"
													style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
											</div>
											<div class="text_area">
												<span class="name3">가길동입니다.</span>
											</div>
										</div>
										<!--photo_name end--></td>
									<td class="btn_td"><span class="bd_link btn_gray"
										onclick="location.href='#;'">백팀</span></td>
								</tr>
								<tr>
									<td><div class="photo_name">
											<div class="thum_area">
												<div class="thum"
													style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
											</div>
											<div class="text_area">
												<span class="name3">가길동입니다.</span>
											</div>
										</div>
										<!--photo_name end--></td>
									<td class="btn_td"><span class="bd_link btn_gray"
										onclick="location.href='#;'">백팀</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div>
						<h4 class="th_st">
							백팀<span class="nb_data">(22명)</span>
						</h4>
						<table class="game_td ell_td">
							<tbody>
								<tr>
									<td><div class="photo_name">
											<div class="thum_area">
												<div class="thum"
													style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
											</div>
											<div class="text_area">
												<span class="name3">가길동입니다.</span>
											</div>
										</div>
										<!--photo_name end--></td>
									<td class="btn_td"><span class="bd_link btn_gray"
										onclick="location.href='#;'">청팀</span></td>
								</tr>
								<tr>
									<td><div class="photo_name">
											<div class="thum_area">
												<div class="thum"
													style="background-image: url(/resources/img/member_photo_07.jpg);"></div>
											</div>
											<div class="text_area">
												<span class="name3">가길동입니다.</span>
											</div>
										</div>
										<!--photo_name end--></td>
									<td class="btn_td"><span class="bd_link btn_gray"
										onclick="location.href='#;'">청팀</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- col_2line end-->
			</div>
			<!-- content end -->
			<div class="content white_bg">
				<div class="btn_full">
					<span class="btn_st" onClick="location.href='#;'">대회참석</span>
				</div>
				<ul class="li_name">
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_1"><label
									for="check_1"><span class="name3">가길동입니다.</span></label>
							</div>
						</div>
						<!--photo_name end--></li>
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_2"><label
									for="check_2"><span class="name3">홍길남이여</span></label>
							</div>
						</div>
						<!--photo_name end--></li>
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_3"><label
									for="check_3"><span class="name3">길동</span></label>
							</div>
						</div>
						<!--photo_name end--></li>
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_4"><label
									for="check_4"><span class="name3">남길동</span></label>
							</div>
						</div>
						<!--photo_name end--></li>
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_5"><label
									for="check_5"><span class="name3">가길</span></label>
							</div>
						</div>
						<!--photo_name end--></li>
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_6">
								<label for="check_6"><span class="name3">백길차랍니다.</span></label>
							</div>
						</div>
						<!--photo_name end--></li>
				</ul>
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