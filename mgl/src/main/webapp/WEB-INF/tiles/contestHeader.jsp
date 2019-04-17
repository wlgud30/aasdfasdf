<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<div class="title_head head_el" style="top: 40px;">
	<div class="head_top" id="head_top">
		<div class="tit_top">
			<h1 class="el_club_side" id="sub_title"></h1>
			<div class="side_rt_db">
				<span class="side_right member_ub" id="sub_title_2"></span> 
				<span id="sub_title_3" class="" onclick="location.href='#;'"></span>
			</div>
		</div>
		
		<div class="bt_top" id="bt_top"></div>
	</div>
</div>
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
		location.href = '/Member/LoginContest.techni?m_id='
				+ ua.substr(b + 3, c - b - 3) + '&m_pw=' + ua.substr(c + 3)
				+ "&m_push=" + ua.substr(d + 6, a - d - 6)
	}
	var lo = window.location.pathname;
	if (lo.includes("/Contest/ContestMain.techni")) {
		$("#sub_title").text("대회");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$(".tit_top").after("<div class='search_td '><div class='td_st search_field ver_lay_b'><div><input type='text' placeholder='대회명, 지역, 체육관'></div><div class='side_data'><i class='icon-search icon-f btn_i search_btn'></i></div></div></div>")
		$("#bt_top").append("<span class='btn_st'>선수검색</span>");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
	}
</script>
<%
	}
%>