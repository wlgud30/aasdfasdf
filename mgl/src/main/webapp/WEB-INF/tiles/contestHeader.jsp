<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%
String ct_nm=(String)session.getAttribute("ct_nm");
%>
<div class="title_head head_el" style="top: 40px;">
	<div class="head_top" id="head_top">
		<div class="tit_top">
			<h1 class="el_club_side" id="sub_title"></h1>
			<div class="side_rt_db">
				<span class="side_right member_ub" id="sub_title_2"></span> <span
					id="sub_title_3" class="" onclick="location.href='#;'"></span>
			</div>
		</div>

		<div class="bt_top" id="bt_top"></div>
	</div>
	<%if(session.getAttribute("login") == null){ %>
	<!-- <div class="popwin_size white_bg wsize-300"
		style="opacity: 0; top: calc(50% - 141.5px); display: none;">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="game_title">임시회원 로그인</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" onclick="location.href='#'"></span>
			</div>
		</div>
		title_popupp end
		<div class="popup_body">
			<p class="vital_text mb_b">
				임시회원은 3개월간 민턴in의 모든 메뉴를 <br> 사용할 수 있습니다. <br> 정회원으로 가입 시
				영구히 사용 가능합니다.
			</p>
			<div class="pd_lrtb space_no gray_line mb_b mb_t">
				<table class="table_form td_pdr">
					<tbody>
						<tr>
							<td><input type="text" placeholder="핸드폰 번호 ('-' 제외)"
								maxlength="11"></td>
							<td rowspan="2" class="bg_th round4 sub2_bg ver_lay_m">로그인</td>
						</tr>
						<tr>
							<td><input type="text" placeholder="생년월일 ('-' 제외)"
								maxlength="8"></td>
						</tr>
					</tbody>
				</table>
			</div>
			col_2input end
			<hr class="line_m_both">
			<div class="btn_full col2_lay">
				<div>
					<span class="btn_st btn_colorg close_popup "
						onclick="location.href='#;'">취소</span>
				</div>
				<div>
					<span class="btn_st close_popup" onclick="location.href='#;'">정회원
						가입하기</span>
				</div>
			</div>
			col2_lay end
		</div>
		popup_body end
	</div> -->
	<% }%>
</div>
<script>

var lo = window.location.pathname;
var ct_nm = "<% out.print(ct_nm); %>";
	if (lo.includes("/Contest/ContestMain.techni")) {
		$("#sub_title").text("대회");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		/* $(".tit_top:eq(0)").after("<div class='w10'><div class='search_line fl_r'><input type='text' placeholder='대회명, 지역, 체육관'><i class='icon-search icon-f' onclick=\"location.href='10_contest-search-result.html'\"></i></div></div>")
		$("#bt_top").append("<span class='btn_st'>선수검색</span>"); */
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
	} else if (lo.includes("/Contest/ContestLastList.techni")) {
		$("#sub_title").text("종료대회");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
	} else if (lo.includes("/Contest/ContestCreate.techni")) {
		$("#sub_title").text("대회 신청");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
		$("#bt_top").append("<span class='btn_st' onclick=\"ctForm();\">신청</span>");
	} else if (lo.includes("/Contest/ContestDetail.techni")) {
		$("#sub_title").text(ct_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick=\"location.href='/Contest/ContestMain.techni'\"></div>");
	}else if(lo.includes("/Contest/ContestStep.techni")){
		$("#sub_title").text("스텝 ("+ct_nm+" )");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
	}else if(lo.includes("/Contest/ContestMyGame.techni")||lo.includes("/Contest/ContestMyGameEvent.techni")||lo.includes("/Contest/ContestMyGameTime.techni")||lo.includes("/Contest/ContestMyGameCoat.techni")){
		$("#sub_title").text("대진표 ("+ct_nm+" )");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick=\"location.href='/Contest/ContestDetail.techni'\"></div>");
	}else if(lo.includes("/Contest/ContestMyGameEventDetail.techni")||lo.includes("/Contest/ContestTournament.techni")){
		
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick=\"location.href='/Contest/ContestMyGameEvent.techni'\"></div>");
	}else if(lo.includes("/Contest/ContestMyRanking.techni")||lo.includes("/Contest/ContestEventRanking.techni")||lo.includes("/Contest/ContestClubRanking.techni")){
		$("#sub_title").text("순위 ("+ct_nm+" )");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick=\"location.href='/Contest/ContestDetail.techni'\"></div>");
	}else if(lo.includes("Contest/ContestEventPlayer.techni")||lo.includes("/Contest/ContestGroupPlayer.techni")){
		$("#sub_title").text("선수 ("+ct_nm+" )");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick=\"location.href='/Contest/ContestDetail.techni'\"></div>");
	}else if(lo.includes("Contest/ContestReferee.techni")){
		$("#sub_title").text("심판 ("+ct_nm+" )");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top")
				.prepend(
						"<div id='btn_back' class='btn_back' onclick=\"location.href='/Contest/ContestDetail.techni'\"></div>");
	}
	
	
</script>
<%
	if (session.getAttribute("login") == null) {
%>
<script>
	var ua = navigator.userAgent
	var a = navigator.userAgent.indexOf("AL:");
	var b = navigator.userAgent.indexOf("ID:");
	var c = navigator.userAgent.indexOf("PW:")
	var d = navigator.userAgent.indexOf("TOKEN:")
	var au = "${au}";
	if (ua.substr(a + 3, 1) == "1" && au != "1") {
	}
</script>
<%
	}
%>