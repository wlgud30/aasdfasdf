<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top"><h2 class="write_title">자체대회 공지사항 입니다. 공지사항 긴 타이틀입니다. 공지사항 긴
타이틀입니다. 공지사항 긴 타이틀입니다</h2></div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="title_area">
				<div>
					<div class="photo_name">
						<div class="thum_area">
							<div class="thum"
								style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
						</div>
						<div class="text_area">
							<span class="name3">가길동입니다.</span> <span class="date">2018.03.22
								PM 9:23</span>
						</div>
					</div>
					<!-- photo_name end-->
				</div>
				<div>
					<ul class="li_small">
						<li><i class="text_i icon-eye"></i>2</li>
						<li><i class="text_i icon-speech"></i>943</li>
					</ul>
				</div>
			</div>
			<!-- title_area end -->
			<div class="content white_bg write_cont">
				<table class="table_form">
					<tr>
						<td>양천클럽 2분기 자체대회</td>
					</tr>
					<tr>
						<td><div class="col_2input">
								<div>
									<p class="guide_text">대회일자</p>
									2018<span class="date_dot_i"></span>08<span class="date_dot_i"></span>15
								</div>
								<div>
									<p class="guide_text">대회시간</p>
									10<span class="second_i"></span>00<span class="time_line_i"></span>12<span
										class="second_i"></span>00
								</div>
							</div></td>
					</tr>
					<tr>
						<td><p class="guide_text">대회방식</p>
							<ul class="list_check">
								<li>청백전</li>
							</ul></td>
					</tr>
					<tr>
						<td><div class="col_2input wauto">
								<div>
									<span class="guide_text left_guide">점수</span>60
								</div>
								<div>
									<span class="guide_text left_guide">소요분</span>60
								</div>
							</div></td>
					</tr>
					<tr>
						<td>대회 체육관</td>
					</tr>
				</table>
				<hr class="line_div">
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td>자체대회에 대한 소개입니다.<br> - 자체대회시즌 소개<br> - 기타사항 등
						</td>
					</tr>
				</table>
			</div>
			<!-- content end -->
			<div class="content white_bg">
				<ul class="list_st comment_li">
					<li>
						<div class="thum_area">
							<div class="thum"
								style="background-image: url(/resources/img/member_photo_02.jpg);"></div>
						</div>
						<div class="comment_text">
							<div class="info_li">
								<span class="name3">일길동입니다.</span><span class="date">2018.03.22
									PM 9:23</span>
							</div>
							<div class="me_text">댓글을 통해서 참석합니다. 즐거운 대회 기대합니다. 더욱 발전하는
								클럽이 되길 바랍니다.</div>
						</div>
					</li>
					<li>
						<div class="thum_area">
							<div class="thum"
								style="background-image: url(/resources/img/member_photo_04.jpg);"></div>
						</div>
						<div class="comment_text">
							<div class="info_li">
								<span class="name3">길동</span><span class="date">2018.03.22
									PM 9:23</span>
							</div>
							<div class="me_text">참석합니다.</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<div class="talk_feed comment_write">
				<ul class="list_check">
					<li><input type="radio" name="choice" class="check_circle"
						id="check_1" value="check" checked="checked"><label
						for="check_1">참석</label></li>
					<li><input type="radio" name="choice" class="check_circle"
						id="check_2" value="check"><label for="check_2">불참</label></li>
				</ul>
				<div class="writewrap">
					<textarea rows="1" class="write_text" placeholder="댓글을 남겨주세요."></textarea>
				</div>
				<span class="btn_st">댓글</span>
			</div>
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>