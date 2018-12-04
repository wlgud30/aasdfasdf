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
				<div class="tit_top">
					<h1>대회생성</h1>
				</div>
				<div class="bt_top">
					<!-- <span class="btn_st btn_wh" onClick="location.href='/Game/GameSelfMatchWriteAct'">등록</span> -->
					<span class="btn_st btn_wh" onClick="location.href='#'">등록</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<table class="table_form">
					<tr>
						<td><input type="text" placeholder="대회명"></td>
					</tr>
					<tr>
						<td><div class="col_2input">
								<div>
									<p class="guide_text">대회일자</p>
									<input type="text" placeholder="YYYY" class="date1_input"
										maxlength="4"><span class="date_dot_i"></span><input
										type="text" placeholder="MM" class="date2_input" maxlength="2"><span
										class="date_dot_i"></span><input type="text" placeholder="DD"
										class="date2_input" maxlength="2">
								</div>
								<div>
									<p class="guide_text">대회시간</p>
									<input type="text" class="time_input" placeholder="00"
										maxlength="2"><span class="second_i"></span><input
										type="text" class="time_input" placeholder="00" maxlength="2"><span
										class="time_line_i"></span><input type="text"
										class="time_input" placeholder="00" maxlength="2"><span
										class="second_i"></span><input type="text" class="time_input"
										placeholder="00" maxlength="2">
								</div>
							</div></td>
					</tr>
					<tr>
						<td><p class="guide_text">대회방식</p>
							<ul class="list_check">
								<li><input type="radio" name="choice" class="check_circle"
									id="check_1" value="check"><label for="check_1">수동입력</label></li>
								<li><input type="radio" name="choice" class="check_circle"
									id="check_2" value="check"><label for="check_2">청백전</label></li>
								<li><input type="radio" name="choice" class="check_circle"
									id="check_3" value="check"><label for="check_3">개인리그전</label></li>
							</ul></td>
					</tr>
					<tr>
						<td><div class="col_2input wauto">
								<div>
									<span class="guide_text left_guide">점수</span><input type="text"
										class="time_input" placeholder="00" maxlength="2">
								</div>
								<div>
									<span class="guide_text left_guide">소요분</span><input
										type="text" class="time_input" placeholder="00" maxlength="2">
								</div>
							</div></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="대회 체육관"></td>
					</tr>
				</table>
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td><textarea class="texbox"
								placeholder="클럽 자체 대회에 대한 간단한 소개"></textarea></td>
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