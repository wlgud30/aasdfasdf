<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%
	Map<String, Object> map = (Map<String, Object>) session.getAttribute("mvo");
%>
<%
if(session.getAttribute("login")==null){
%>
<script>
var ua = navigator.userAgent
var a = navigator.userAgent.indexOf("AL:");
var b = navigator.userAgent.indexOf("ID:");
var c = navigator.userAgent.indexOf("PW:")
var d = navigator.userAgent.indexOf("TOKEN:")
var au = "${au}";
if(ua.substr(a+3,1) == "1"&&au != "1"){
	location.href='/Member/LoginContest.techni?m_id='+ua.substr(b+3,c-b-3)+'&m_pw='+ua.substr(c+3)+"&m_push="+ua.substr(d+6,a-d-6)
}
var lo = window.location.pathname;
if(lo.includes("/Contest/ContestMain.techni")){
	
	
	
}
</script>
<div class="head_top" id="head1">
	<div class="bt_top menu_quick noti_btn_is">
		<div class="btn_more">
			<i class="more_menu la la-navicon"></i>
			<ul class="me_ul">
				<li onClick="location.href='http://localhost:8081'"><i
					class="icon-main icon-f"></i>메인</li>
				<li onClick=""><i class="icon-club icon-f"></i>로그인</li>
			</ul>
		</div>
	</div>
	<div class="logo_top" id="main_logo">
		<img src="/resources/img/logo1.svg" alt="Minton-in" class="logo"
			onClick="location.href='/Contest/ContestMain.techni'">
	</div>
</div>
<%
}else{
%>
<!-- <div class="head_top"> 
    <div class="bt_top"><i class="la la-navicon btn_i"></i> </div>
      <div class="logo_top" id="main_logo"><img src="/resources/img/logo_b.svg"  alt="MGLB" class="logo"  onClick="location.href='/Member/home.techni'"></div>
      <div class="tit_top" id="head1">
        <h1>배드민턴</h1>
      </div>
      <div class="bt_top">
        <span class="icon-bell btn_i"  onClick="location.href='/Member/home.techni'"></span>
        <span class="notice_ub">!</span>
      </div>
      InstanceBeginEditable name="main_top"
      InstanceEndEditable  </div>
    head_top end  -->
<div class="head_top" id="head1">
	<div class="bt_top menu_quick noti_btn_is">
		<div class="btn_more">
			<i class="more_menu la la-navicon"></i>
			<ul class="me_ul">
				<li onClick="location.href='http://localhost:8081'"><i
					class="icon-main icon-f"></i>메인</li>
				<li onClick="location.href='/Board/BoardListRepresent.techni'"><i
					class="icon-club icon-f"></i>클럽</li>
				<li onClick="location.href=''"><i
					class="icon-user"></i>대회신청</li>
				<li onclick="logout()"><i class="icon-out icon-f"></i>로그아웃</li>
			</ul>
		</div>
	</div>
	<div class="logo_top" id="main_logo">
		<img src="/resources/img/logo1.svg" alt="Minton-in" class="logo"
			onClick="location.href='/Board/BoardListRepresent.techni'">
	</div>
	<div class="bt_top">
		<div class="alarm" onClick="location.href='/Member/Alarm.techni'">
          <span class="icon-bell btn_i" ></span>
         
          	<%if(session.getAttribute("al_count") !=null){if((int)session.getAttribute("al_count") > 0 ){
          	%> <span class="notice_ub">
          	<% 		out.print("N"); %>
          		</span>
          	<%	}}
          	%>
         
        </div>
		<%
		
			if ((String) session.getAttribute("represent_idx") != null) {
		%>
		<span class="icon-f icon-p_set" id="pr_up_btn"></span>
		<%
			}
		%>
		<!-- btn_more end -->
	</div>
</div>
<!-- head_top end -->
<%
	if ((String) session.getAttribute("represent_idx") != null) {
%>
<div class="move_ct_area">
	<div class="white_bg move_ct" style="top: -249px;">
		<div class="photo-data">
			<div id="profile_img_area">
				<div onclick="location.href='index4.html'" id="profile_img"
					style="background-image:url(<%out.print(map.get("u_photo"));%>)"></div>
			</div>
			<!-- img_upload_are end -->
			<div>
				<table class="table_nol">
					<tbody>
						<tr>
							<td class="max-ws_td"><h4 class="title_g">
									<%
										out.print(map.get("u_nm"));
									%>
								</h4> <b class="side_right"> <%
 	out.print(map.get("c_gd"));
 %>
							</b></td>
							<td class="btn_td small_font"><span class="bd_link"
								onclick="location.href='/UClub/UClubMemberDetail.techni'">내프로필</span></td>
						</tr>
						<tr>
							<td class="max-ws_td"><b class="el_club_side main_color"
								style="max-width: calc(100% - 41px);"> <%
 	out.print(map.get("c_nm"));
 %>
							</b> <!-- <span class="side_right side_rt_db"><b class="bold_text main_color title_s">4</b>/85</span> --></td>
							<td class="btn_td small_font"><span class="bd_link"
								onclick="location.href='/UClub/GamePrivateStateInfo.techni'">게임등록</span></td>
						</tr>
						<tr>
							<td class="sm_font">게임/대회/광고 <span class="sub_color">
									<%
										out.print(map.get("aptn"));
									%>
							</span></td>
							<!-- <td class="btn_td small_font"><span class="bd_link" onclick="location.href='index1-3.html'">내역/사용</span></td> -->
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- photo-data end -->
		<div class="app_add">
			<div class="app_scroll">
				<ul class="app_li cet_lay">
					<li onclick="location.href='/Board/BoardListRepresent.techni'"><i
						class="icon-f app_i icon-club-info"></i> <span class="app_text">클럽</span>
					</li>
					<li onclick="location.href='#'"><i
						class="icon-f app_i icon-playing"></i> <span class="app_text">대회</span>
					</li>
					<li onclick="location.href='/UClub/GamePrivateStateInfo.techni'"><i
						class="icon-f app_i icon-match"></i> <span class="app_text">게임</span>
					</li>
					<li onclick="location.href='#;'"><i
						class="icon-f app_i icon-volume"></i> <span class="app_text">민턴소식</span>
					</li>
					<li onclick="location.href='#;'"><i
						class="icon-f app_i icon-ad"></i> <span class="app_text">광고</span>
					</li>
					<li onclick="location.href='#;'"><i
						class="app_i icon-book-open"></i> <span class="app_text">사용법</span>
					</li>
				</ul>
			</div>
			<div class="app_more">
				<span class="app_set_btn"><i class="icon-options btn_i"
					title="바로아이콘 설정"></i></span>
				<ul class="add-apps">
					<li><i class="icon-plus btn_i" title="아이콘 추가"></i></li>
					<li><i class="icon-minus btn_i" title="아이콘 삭제"></i></li>
				</ul>
			</div>
		</div>
		<!-- app_add edn -->
	</div>
	<!-- move_ct end -->
</div>
<%
	}}
%>
<!--     <div id="main_nav_area">
      <ul id="main_nav">
        <li onClick="location.href='index1.html'">
          <span><img src="/resources/img/logoa.svg" alt="Minton-in" class="logo" onclick="location.href='index1.html'"></span>
        </li>
        <li onClick="location.href='index1-2.html'"> <i class="icon-club-info icon-f btn_i"></i>
          <span class="nav_text">클럽</span>
        </li>
        <li onClick="location.href='index1-3.html'"> <i class="icon-record icon-f btn_i"></i>
          <span class="nav_text">게임이력 </span>
        </li>
        <li onClick="location.href='index4.html'"> <i class="icon-profile icon-f btn_i"></i>
          <span class="nav_text">프로필 </span>
        </li>
        <li onClick="location.href='index5.html'"> <i class="icon-more icon-f btn_i"></i>
          <span class="nav_text">전체서비스 </span>
        </li>
      </ul>
    </div> -->
<script>
	var toYN = navigator.userAgent.indexOf("TOKEN:")
	function logout() {
		var filter = "win16|win32|win64|mac";
		if (toYN != -1) {
			if (navigator.platform) {
				if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
					window.Android.appcall("0", "null", "null");
					location.href = "/Member/Logout.techni"
				} else {
					location.href = "/Member/Logout.techni"
				}
			}
		} else {
			location.href = "/Member/Logout.techni"
		}
	}
</script>