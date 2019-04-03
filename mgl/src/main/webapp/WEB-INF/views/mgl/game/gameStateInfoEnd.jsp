<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<%-- <header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="민턴in" class="logo" onClick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1><a href='/Board/BoardList.techni'>${list[0].c_nm }</a></h1>
				</div>
				<div class="bt_top">
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header> --%>
			<!-- InstanceBeginEditable name="container" -->
			<script>
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
						var path = "/Game/EndGame.techni";
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
				
				function gameEnd(c_gidx){
					swal({
						title : "민턴in",
						text : "점수를 등록 하시겠습니까?",
						buttons : {
							confirm : "OK",
							cancel : "NO"
						}
					})
					.then((value)=>{
						if(value){
								var path = "/Game/GameScoreRegistForm.techni"
								var form = document.createElement("form");
								form.setAttribute("method","POST");
								form.setAttribute("action",path)
								var hiddenField = document.createElement("input");
								hiddenField.setAttribute("type","hidden");
								hiddenField.setAttribute("name","c_gidx");
								hiddenField.setAttribute("value",c_gidx);
								form.appendChild(hiddenField);
								document.body.appendChild(form);
								form.submit();
						}else{
							
						}
					})
				}
				
				function ymd(){
					$("#frm").submit();
				}
				
				function gameEnd(c_gidx){
					swal({
						title : "민턴in",
						text : "점수를 등록 하시겠습니까?",
						buttons : {
							confirm : "OK",
							cancel : "NO"
						}
					})
					.then((value)=>{
						if(value){
								var path = "/Game/GameScoreRegistForm.techni"
								var form = document.createElement("form");
								form.setAttribute("method","POST");
								form.setAttribute("action",path)
								var hiddenField = document.createElement("input");
								hiddenField.setAttribute("type","hidden");
								hiddenField.setAttribute("name","c_gidx");
								hiddenField.setAttribute("value",c_gidx);
								form.appendChild(hiddenField);
								document.body.appendChild(form);
								form.submit();
						}else{
							
						}
					})
				}
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li><span
						onClick="location.href='/UClub/GamePrivateStateInfo.techni'">게임짜기</span></li>
					<li><span onClick="location.href='/Game/GameState.techni'">진행게임</span>
					<li class="active_tab"><span onClick="location.href='/Game/EndGame.techni '">끝난게임</span></li>
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
				<form action="/Game/GameTodayRank.techni" method="post" id="frm">
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
<!-- 					<div>
						<ul class="li_small">
							<li><b>게임</b>45</li>
							<li><b>출석</b>48</li>
						</ul>
					</div> -->
					
				</div>
				<!-- days_head end--->
				<div>
			        <ul class="btns_li">
			        	<li>
			        		<span class="line_btn btn_sml main_color" onClick="ymd()">오늘의 <br>순위<i class="la la-signal"></i></span>
			        	</li>
			        </ul>
		        </div>
			</div><!--days_area end-->
		</div>	
			<!--pd_lrb end-->
			<div class="content white_bg pt_00">
			<c:choose>
			<c:when test="${list[0].cm_total eq null || fn:length(list2[0]) eq 0}">
 					<h3 class="guide_big space_guide">
 						<span class="icon-outline_4"></span>종료된 게임이 없습니다.
 					</h3>
  			</c:when>
			<c:otherwise>
				<table class="mix3_td">
				<c:forEach items="${list2 }" var="listc" varStatus="status">
					<tr <c:if test="${list[status.index].cm_total ne 0 }"> onclick="location.href='/Game/GameResult.techni?&c_gidx=${list[status.index].c_gidx}'" </c:if>>
						<td class="cot2">${list[status.index].cm_order} 게임<span class="game_no"></span></td>
						<td class="ga_title" <c:if test="${list[status.index].cm_total ne 0 }"></c:if>>
						<ul class="col_21">
						<c:forEach items="${listc }" var="listv" varStatus="status2">
							<c:if test="${status2.index eq 0 }"><li></c:if>
							<c:if test="${status2.index eq 2 }"></li><li></c:if>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${listv.u_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3">${listv.u_nm }</span>
										</div>
									</div>
									<c:if test="${status2.index eq 3 || status2.index eq 1 }">
									<c:if test="${listv.cm_total != 0 }">
									<div class="divide_text bold_text">
											<span>${listv.cm_total }</span><span>${listv.cm_win }</span>
									</div>
									</c:if>
									</c:if>
								<c:if test="${status2.index eq 3 }"></li></c:if>
								<%-- <c:if test="${status2.index eq 2 }"><li></c:if>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">${listv.teamAB } </span>
										</div>
									</div>
								
								<c:if test="${status2.index eq 3 }">
									<c:if test="${listv.cm_total != 0 }">
										<div class="divide_text bold_text">
											<span>${listv.cm_total }</span><span>${listv.cm_win }</span>
										</div>
									</c:if>
									</li>
								</c:if> --%>
						</c:forEach>
						</ul>
						</td>
							<c:choose>
								<c:when test="${list[status.index].cm_total eq 0 }">
									<td colspan="1" class="ga_btn_s">
										<div class="btns_box">
												<span class="bd_link" onclick="gameEnd('${list[status.index].c_gidx}')">점수</span>
										</div>
									</td>
								</c:when>
							</c:choose>
					</tr>
					</c:forEach>
					
					
					<!-- <tr>
						<td class="cot2">2코트<span class="game_no">81게임</span></td>
						<td>
							<ul class="col_21">
								<li><div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(img/member_photo_02.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">백길동입니다.</span>
										</div>
									</div>
									photo_name end
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(img/member_photo_03.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">가길</span>
										</div>
									</div>
									photo_name end
									<div class="divide_text bold_text">
										<span>25</span><span>승</span>
									</div></li>
								<li><div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(img/member_photo_04.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">가길동입니다.</span>
										</div>
									</div>
									photo_name end
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(img/member_photo_06.jpg);"></div>
										</div>
										<div class="text_area">
											<span class="name3">길동</span>
										</div>
									</div>
									photo_name end
									<div class="divide_text bold_text">
										<span>25</span><span>승</span>
									</div></li>
							</ul>
						</td>
					</tr> -->
				</table>
				</c:otherwise>
				</c:choose>
			</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>	
			    $(document).ready(function(){	
			    var aa = $(location).attr('pathname').slice(-6, -5); 
				$('.ft_menu').navi_depth({pageNum:aa})
			     });
    		</script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li class="active_tab" onClick="location.href='/UClub/GamePrivateStateInfo.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>