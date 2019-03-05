<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
			<!-- InstanceBeginEditable name="container" -->
			<script>
				$(document)
						.ready(
								function() {
									var aa = $(location).attr('pathname')
											.slice(-8, -7);
									$('.tab_btn_b').navi_depth({
										pageNum : aa
									})
									var tab_s_no = $(location).attr('pathname')
											.slice(-10, -9);
									$('.tabs_cont').navi_depth({
										pageNum : tab_s_no
									});
									var btn_no = $(location).attr('pathname')
											.slice(-14, -13);
									$('.btns_li').navi_depth({
										pageNum : btn_no
									});
									var tab_in_no = $(location)
											.attr('pathname').slice(-16, -15);
									$('.tabs_in').navi_depth({
										pageNum : tab_in_no
									});
								});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li><span
						onClick="location.href='/UClub/GamePrivateStateInfo.techni'">게임짜기</span></li>
					<li><span onClick="location.href='/Game/GameState.techni'">진행게임</span>
					<li  class="active_tab"><span onClick="location.href='/Game/EndGame.techni '">끝난게임</span></li>
				</ul>
			</div>
			<div class="tab_bt_area white_bg">

			</div>
			<!-- tab_bt_area end -->
			<div class="pd_lrb cet_lay">
				<script>
					$(document).ready(
							function() {
								var day_no = $(location).attr('pathname')
										.slice(-12, -11);
								$('.day_scroll').navi_depth({
									pageNum : day_no
								})
							});
				</script>
				<div class="days_area">
					<form action="/Game/EndGame.techni" method="post" id="frm">
						<input type="hidden" name="cm_ymd" value="${cm_ymd}">
					</form>
					<div class="days_head">
						<div>
							<ul class="li_nol">
								<li><p id="year"></p></li>
								<li><p id = "month"></p></li>
							</ul>
						</div>
						<div>
							<div class="day_scroll_area">
								<div>
								<ul class="day_scroll">
									<li class="ymd">
										<input id = "m_4" type="hidden">
										<p id="today_4"></p>
										<p id="todayD_4"></p>
									</li>
									<li class="ymd">
										<input id = "m_3" type="hidden">
										<p id="today_3"></p>
										<p id="todayD_3"></p>
									</li>
									<li class="ymd">
										<input id = "m_2" type="hidden">
										<p id="today_2"></p>
										<p id="todayD_2"></p>
									</li>
									<li class="ymd">
										<input id = "m_1" type="hidden">
										<p id="today_1"></p>
										<p id="todayD_1"></p>
									</li>
									<li class="ymd">
										<input id = "m_0" type="hidden">
										<p id="today_0"></p>
										<p id="todayD"></p>
									</li>
								</ul>
							</div>
						</div>
							<!-- day_scroll_area end -->
						</div>
					</div>
					<!-- days_head end -->
					<div>
						<ul class="btns_li active_tab" >
							<li><span class="line_btn btn_sml main_color" onClick="ymd()">오늘의 <br>순위<i class="la la-signal"></i></span></li>
						</ul>
					</div>
				</div>
				<!--days_area end-->
			</div>
			<!--pd_lrb end-->
			<div class="tab_in_area white_bg pt_00">
				<div>
					<ul class="tabs_in">
						<li class="active_tab"><span>개인순위</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- tab_bt_area end -->
			<div class="content white_bg pt_00">
				<c:if test="${list[0].u_nm ne null }">
				<table class="text_td thead_td cet_lay td_pd_l0 mb_t">
					<thead>
						<tr>
							<th>순위</th>
							<th>이름</th>
							<th class="td_1">전</th>
							<th class="td_1">승</th>
							<th class="td_1">패</th>
							<th class="td_2">득실</th>
							<th class="td_2">획득점수</th>
						</tr>
					</thead>
					<c:set var="i"  value="${i}"/>
					<c:forEach items="${list}" var="list"><c:set var="i"  value="${i+1}"/>
					<tr>
						<td class="nb_td">${i}</td>
						<td class="ga_title"><span class="name3">${list.u_nm }</span> <span
							class="age_rank">(${list.age } ${list.u_club_gd })</span></td>
						<td class="td_1">${list.my_win + list.my_lose}</td>
						<td class="td_1">${list.my_win }</td>
						<td class="td_1">${list.my_lose }</td>
						<td class="td_2"><span class="gainloss">${list.my_gap }</span> <span
							class="gain-loss">(${list.my_pp}/${list.my_pp - list.my_gap })</span></td>
						<td class="td_2">${list.my_ap }</td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var ft_nv = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : ft_nv
					})
				});
			</script>
			<ul id="ft_nv1" class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li class="active_tab" onClick="location.href='/UClub/GamePrivateStateInfo.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>
	<script type="text/javascript">
	$(document).ready(function() {
		var date = new Date();
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		var i = 1
		var mon = "${cm_ymd}"
		$("#year").text((date.getFullYear())+"년")
		$("#month").text(mon.substr(5,2)+"월")
		$("#today").text(date.getDate())
		$("#todayD").text(week[date.getDay()])
		for(i = 0;i<5;i++){
			var a = date.getDay()-i
			if(date.getDate()-i <= 0){
				$("#m_"+i).val(date.getMonth())
				$("#today_"+i).text(new Date(date.getFullYear(),date.getMonth(),date.getDate()-i).getDate())
				$("#today_"+i).attr("class",new Date(date.getFullYear(),date.getMonth(),date.getDate()-i).getDate());
			}else{
				$("#m_"+i).val(date.getMonth()+1)
				$("#today_"+i).text(date.getDate()-i)
				$("#today_"+i).attr("class",date.getDate()-i);
			}
			if(a<0){
				a = a+7;
			}
			$("#todayD_"+i).text(week[a])
		}
		var dayyy = "${cm_ymd}".substring(8,10);
		if(Number(dayyy) <10){
			dayyy = dayyy.substr(1,2);
		}
		$("."+dayyy).parent().attr("class","ymd active_tab");
		
		
		$(".ymd").click(function(e){
			var y = $("#year").text().substring(0,4);
			var m = $(this).children("input").val();
			if(m.length == 1){
				m = "0"+m
			}
			var d = $(this).find(">:nth-child(2)").text();
			if(d.length < 2){
				d = "0"+d;
			}
			var cm_ymd = y+"-"+m+"-"+d;
			var path = "/Game/GameTodayRank.techni";
			var form = document.createElement("form");
			
			form.setAttribute("method","POST");
			form.setAttribute("action",path);
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","cm_ymd");
			hiddenField.setAttribute("value",cm_ymd);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
		})
		
		var aa = $(location).attr('pathname').slice(-8, -7);
		$('.tab_btn_b').navi_depth({
			pageNum : aa
		})
		var tab_s_no = $(location).attr('pathname').slice(-10, -9);
		$('.tabs_cont').navi_depth({
			pageNum : tab_s_no
		});
		
	});
	function attend(){
		$.ajax({
			type:"POST",
			url:"/UClub/AttendInsert.techni",
			success:function(data){
				if(data.cnt > 0 ){
					location.href="/UClub/AttendList.techni"
				}else{
					swal("MGL", "이미 출석된 회원입니다.");
				}
			},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
	}

	function attendOut(){
		$.ajax({
			type:"POST",
			url:"/UClub/attendOut.techni",
			success:function(data){
				if(data.cnt > 0 ){
					location.href="/UClub/AttendList.techni"
				}else{
					swal("MGL", "이미 퇴실 상태입니다.");
				}
			},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
	}
	function ymd(){
		$("#frm").submit();
	}
	</script>