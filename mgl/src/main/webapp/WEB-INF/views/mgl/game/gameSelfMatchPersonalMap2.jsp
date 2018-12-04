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
					<span class="btn_st btn_wh" onClick="location.href='#;'">완료</span>
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
						<li onClick="location.href='/Game/GameSelfMatchPersonalMap2.techni'">대진생성</li>
						<li onClick="location.href='/Game/GameSelfMatchPersonalMap.techni'">대진환경</li>
					</ul>
				</div>
			</div>
			<!-- content end-->
			<div class="pd_lrb">
				<ul class="li_col-nol">
					<li><b>게임예상시간</b>PM 06:00 ~ PM9:00</li>
					<li><b>총게임수</b>60게임</li>
					<li><b>참가팀</b>21팀</li>
					<li><b>참여회원</b>44명</li>
				</ul>
			</div>
			<ul class="accordion_ul">
				<li><ul class="accd_head">
						<li>PM 06:00</li>
						<li>3게임</li>
					</ul>
					<div class="accd_a">
						<table class="mix3_td">
							<tbody>
								<tr>
									<td class="cot2">B조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">홍길</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="cot2">C조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">호동</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">길동</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="cot2">A조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">백길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">길동</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div></li>
				<li><ul class="accd_head">
						<li>PM 06:00</li>
						<li>3게임</li>
					</ul>
					<div class="accd_a">
						<table class="mix3_td">
							<tbody>
								<tr>
									<td class="cot2">B조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">홍길</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="cot2">C조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">호동</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">길동</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="cot2">A조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">백길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">길동</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div></li>
				<li><ul class="accd_head">
						<li>PM 06:00</li>
						<li>3게임</li>
					</ul>
					<div class="accd_a">
						<table class="mix3_td">
							<tbody>
								<tr>
									<td class="cot2">B조</td>
									<td class="ga_title">
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">홍길</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="cot2">C조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_05.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">호동</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">길동</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="cot2">A조</td>
									<td>
										<ul class="col_21">
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">백길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_03.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길</span>
													</div>
												</div>
												<!--photo_name end--></li>
											<li><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">가길동입니다.</span>
													</div>
												</div>
												<!--photo_name end-->
												<div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(/resources/img/member_photo_06.jpg);"></div>
													</div>
													<div class="text_area">
														<span class="name3">길동</span>
													</div>
												</div>
												<!--photo_name end--></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div></li>
			</ul>
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