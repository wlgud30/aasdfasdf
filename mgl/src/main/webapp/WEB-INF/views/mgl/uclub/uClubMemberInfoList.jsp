<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<script>
	function ym() {
		var y = $("#y").val().substring(2, 4);
		var m = $("#m").val();
		var ym = y + m;
		var path = "/UClub/UClubUserList.techni";
		var form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", path);
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "ym");
		hiddenField.setAttribute("value", ym);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
</script>
<!-- InstanceBeginEditable name="container" -->
<div class="tab_btn_b_area">
	<ul class="tab_btn_b tab_cont">
		<li class="active_tab" onclick="active_change(this)"><span>
				<c:choose>
					<c:when test="${list[0].u_age == 0}">전체(0)</c:when>
					<c:otherwise>전체(${fn:length(list)})</c:otherwise>
				</c:choose>
		</span></li>
		<li onclick="active_change(this)"><span>남(${fn:length(listM)})</span></li>
		<li onclick="active_change(this)"><span>여(${fn:length(listF)})</span></li>
	</ul>
</div>

<div class="tit_select pd_lrtb white_bg cet_lay">
	<select id="y" name="y" class="chosen">
		<option
			id="<%Calendar cal = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
			String beforeY = dateFormat.format(cal.getTime()).substring(0, 4);
			out.print(beforeY);%>">
			<%
				out.print(beforeY);
			%>
		</option>
		<option
			id="<%cal.add(cal.YEAR, -1);
			String beforeY1 = dateFormat.format(cal.getTime()).substring(0, 4);
			out.print(beforeY1);%>">
			<%
				out.print(beforeY1);
			%>
		</option>
		<option
			id="<%cal.add(cal.YEAR, -1);
			String beforeY2 = dateFormat.format(cal.getTime()).substring(0, 4);
			out.print(beforeY2);%>">
			<%
				out.print(beforeY2);
			%>
		</option>
	</select><span class="select_item">년</span> <select id="m" name="m"
		onchange="ym()" class="chosen">
		<option
			id="<%Calendar cal1 = Calendar.getInstance();
			cal1.add(cal.MONTH, -4);
			SimpleDateFormat dateFormat1 = new SimpleDateFormat("MM");
			String beforeM1 = dateFormat1.format(cal1.getTime()).substring(0, 2);
			out.print(beforeM1);%>">
			<%
				out.print(beforeM1);
			%>
		</option>
		<option
			id="<%cal1.add(cal.MONTH, +1);
			String beforeM2 = dateFormat1.format(cal1.getTime()).substring(0, 2);
			out.print(beforeM2);%>">
			<%
				out.print(beforeM2);
			%>
		</option>
		<option
			id="<%cal1.add(cal.MONTH, +1);
			String beforeM3 = dateFormat1.format(cal1.getTime()).substring(0, 2);
			out.print(beforeM3);%>">
			<%
				out.print(beforeM3);
			%>
		</option>
		<option
			id="<%cal1.add(cal.MONTH, +1);
			String beforeM4 = dateFormat1.format(cal1.getTime()).substring(0, 2);
			out.print(beforeM4);%>">
			<%
				out.print(beforeM4);
			%>
		</option>
		<option
			id="<%cal1.add(cal.MONTH, +1);
			String beforeM5 = dateFormat1.format(cal1.getTime()).substring(0, 2);
			out.print(beforeM5);%>">
			<%
				out.print(beforeM5);
			%>
		</option>
	</select><span class="select_item">월</span>
</div>
<ul class="sub_ul tab_sub" id="sort">
	<li class="active_tab" onClick="sort('all',this)"><span>전체</span></li>
	<li onClick="sort('자강',this)"><span>자강</span></li>
	<li onClick="sort('A',this)"><span>A</span></li>
	<li onClick="sort('B',this)"><span>B</span> </li>
	<li onClick="sort('C',this)"><span>C</span></li>
        <li onClick="sort('D',this)"><span>D</span></li>
        <li onClick="sort('초심',this)"><span>초심</span></li>
        <li onClick="sort('왕초',this)"><span>왕초</span></li>
 </ul>
				<div class="tab_cont_con">
			<div class="tab_con">
				<div class="content white_bg pt_00">
					<c:choose>
						<c:when test="${list[0].u_age ne 0 }">
							<c:set var="total" value="${fn:length(list)}" />
							<table id="cn" class="member_td rowspan_td td_pd_l0 cet_lay">
								<c:forEach items="${list }" var="list">
									<c:set var="i" value="${i}" />
									<tr class="${list.u_id } ${list.u_club_gd}">
										<td rowspan="2" class="nb_td"><a id="rank_${u_id}">${list.cm_p_total == 0.0 ? '-' : i+1 }</a>
											<input id="${list.u_id }" type="hidden" value="&you_rank=${i+1}">
										</td>
										<c:if test="${list.cm_p_total != 0.0 }">
											<c:set var="i" value="${i+1}" />
										</c:if>
										<td rowspan="2" class="name2_td">
											<div class="photo_name">
												<div class="thum_area">
													<div class="thum" style="background-image: url(${list.u_photo});"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.u_nm }</span> 
													<span class="age_rank">(${fn:substring(list.u_age,0,1)}0대 ${list.u_club_gd })</span>
												</div>
											</div>
										</td>
										<td class="rowspan-a td_1">${list.my_win }</td>
          								<td class="rowspan-a td_1">${list.my_lose }</td>
          								<td class="rowspan-a td_2">${list.my_gap }</td>
          								<td rowspan="2" class="btn_td"><span id="span_${list.u_id }" class="btn_st btn_wh_color1 btn_row2" onclick="rank('${list.u_id })">상대<br>전적</span></td>
										<%-- <td class="phone-date_td">
											<ul class="li_dot_item">
												<li>
													<b>획득 점수 : </b>
													<c:choose>
														<c:when test="${list.cm_p_total != null }">${list.cm_p_total }</c:when>
													</c:choose>
												</li>
											<!-- <li><b>대회</b>12.8P</li> -->
											</ul>
										</td> --%>
								</tr>
								<tr class="${list.u_id }_2  ${list.u_club_gd}">
								          <td colspan="2" class="rowspan-b"><p class="guide_nol">(승률 : <c:choose><c:when test="${list.my_win ne 0 }"><fmt:formatNumber value="${list.my_win/(list.my_win+list.my_lose) *100}" pattern=".00"/></c:when><c:otherwise>0</c:otherwise> </c:choose>%)</p></td>
								          <td class="rowspan-b"><p class="guide_nol">(${list.my_cm_p_total }/${list.my_cm_p_total-list.my_gap})</p></td>
								</tr>
							</c:forEach>
							</table>
						</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						</div>
						<!-- content end-->
					</div>
				<!-- tab_con end-->
				<div class="tab_con">
					<div class="content white_bg pt_00">
						<table class="member_td rowspan_td td_pd_l0 cet_lay">
							<c:forEach items="${listM }" var="list">
							<c:set var="j" value="${j}" />
								<tr class="${list.u_club_gd}" onClick="rank('${list.u_id}')">
									<td rowspan="2" class="nb_td">${list.cm_p_total == 0.0 ? '' : j+1 }
									<input id="${list.u_id }" type="hidden"
									value="&you_rank=${i+1}">
									</td>
								<c:if test="${list.cm_p_total != 0.0 }">
									<c:set var="j" value="${j+1}" />
								</c:if>
									<td rowspan="2"  class="name2_td"><div class="photo_name">
											<div class="thum_area">
												<div class="thum"
												style="background-image: url(${list.u_photo});"></div>
											</div>
											<div class="text_area">
												<span class="name3">${list.u_nm }</span> <span
												class="age_rank">(${fn:substring(list.u_age,0,1)}0대 ${list.u_club_gd })</span>
											</div>
										</div></td>
									<td class="rowspan-a td_1">${list.my_win }</td>
          							<td class="rowspan-a td_1">${list.my_lose }</td>
          							<td class="rowspan-a td_2">${list.my_gap }</td>
          							<td rowspan="2" class="btn_td">
          							<c:choose>
          								<c:when test="${list.u_id eq u_id }">
          									<span class="btn_st btn_tiny btn_rd" onclick="location.href='/UClub/UClubMemberDetail.techni'">프로필</span>
          								</c:when>
          								<c:otherwise>
          									<span class="btn_st btn_wh_color1 btn_row2" onclick="rank('${list.u_id })">상대<br>전적</span>
          								</c:otherwise>
          							</c:choose>
          							</td>
								</tr>
								<tr class="${list.u_club_gd}">
								          <td colspan="2" class="rowspan-b"><p class="guide_nol">(승률 : <c:choose><c:when test="${list.my_win ne 0 }"><fmt:formatNumber value="${list.my_win/(list.my_win+list.my_lose) *100}" pattern=".00"/></c:when><c:otherwise>0</c:otherwise> </c:choose>%)</p></td>
								          <td class="rowspan-b"><p class="guide_nol">(${list.my_cm_p_total }/${list.my_cm_p_total-list.my_gap})</p></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- content end-->
				</div>
				<!-- tab_con end-->
				<div class="tab_con">
					<div class="content white_bg pt_00">
						<table class="member_td rowspan_td td_pd_l0 cet_lay">
							<c:forEach items="${listF }" var="list">
							<c:set var="k" value="${k}" />
								<tr class="${list.u_club_gd}"  onClick="rank('${list.u_id}')">
									<td rowspan="2" class="nb_td">${list.cm_p_total == 0.0 ? '' : k+1 }
									<input id="${list.u_id }" type="hidden"
									value="&you_rank=${i+1}">
									</td>
								<c:if test="${list.cm_p_total != 0.0 }">
									<c:set var="k" value="${k+1}" />
								</c:if>
									<td rowspan="2" class="name2_td"><div class="photo_name">
											<div class="thum_area">
												<div class="thum"
												style="background-image: url(${list.u_photo});"></div>
											</div>
											<div class="text_area">
												<span class="name3">${list.u_nm }</span> <span
												class="age_rank">(${fn:substring(list.u_age,0,1)}0대 ${list.u_club_gd })</span>
											</div>
										</div></td>
									<td class="rowspan-a td_1">${list.my_win }</td>
          							<td class="rowspan-a td_1">${list.my_lose }</td>
          							<td class="rowspan-a td_2">${list.my_gap }</td>
          							<td rowspan="2" class="btn_td">
          								<c:choose>
	          								<c:when test="${list.u_id eq u_id }">
	          									<span class="btn_st btn_tiny btn_rd" onclick="location.href='/UClub/UClubMemberDetail.techni'">프로필</span>
	          								</c:when>
	          								<c:otherwise>
	          									<span class="btn_st btn_wh_color1 btn_row2" onclick="rank('${list.u_id })">상대<br>전적</span>
	          								</c:otherwise>
          								</c:choose>
          							</td>
								</tr>
								<tr class="${list.u_club_gd}">
								          <td colspan="2" class="rowspan-b"><p class="guide_nol">(승률 : <c:choose><c:when test="${list.my_win ne 0 }"><fmt:formatNumber value="${list.my_win/(list.my_win+list.my_lose) *100}" pattern=".00"/></c:when><c:otherwise>0</c:otherwise> </c:choose>%)</p></td>
								          <td class="rowspan-b"><p class="guide_nol">(${list.my_cm_p_total }/${list.my_cm_p_total-list.my_gap})</p></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- content end-->
				</div>
				<!-- tab_con end-->
			</div>
			<!-- tab_cont_con -->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : aa
					})
				});
			</script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li class="active_tab"
					onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>
	<!-- wrap end -->
	<script>
		/* var u_id = "${u_id}"
		$("#cn").append($("#${u_id}").clone(true))
		$("#${u_id}").clone().appendTo($("#cn"));
		var cl = $("#${u_id}").clone();
		$("#cn").append($("#${u_id}").clone()) */

		if ("${yn}" == "y") {
			var col = $(".${u_id}").clone();
			var col2=$(".${u_id}_2").clone();
			col2.prependTo("#cn");
			$("#cn tr:first-child").attr("class", "slef_data");
			col.prependTo("#cn");
			$("#cn tr:first-child").attr("class", "slef_data ${u_id}");
			$(".${u_id}").attr("onclick",
					"location.href='/UClub/UClubMemberDetail.techni'")
			$("#span_${u_id}").attr("class","btn_st btn_tiny btn_rd");
			$("#span_${u_id}").text("프로필")
		}
		function rank(you_id) {
			if (you_id == "${u_id}") {
				location.href = '/UClub/UClubMemberDetail.techni'
			} else {
				location.href = "/UClub/UClubMemberCompareTo.techni?&total=${i}&you_id="
						+ you_id
						+ $("#" + you_id).val()
						+ "&my_rank="
						+ $("#rank_${u_id}").text() + "&ym=${ym}"
			}
		}
		function active_change(me) {
			$(".tab_btn_b li").each(function() {
				$(this).attr("class", "");
			});
			$(me).attr("class", "active_tab");
		}
		$(document).ready(function() {
			var my = ${y}
			var mm = ${m}
			if (Number(mm) < 10) {
				mm = "0" + mm;
			}
			$('#y option[id=' + my + ']').attr('selected', 'selected');
			$('#m option[id=' + mm + ']').attr('selected', 'selected');
			$("#mList").click(function() {
				var method = method || "post";
				var path = "/UClub/UclubMUserList.techni";
				var form = document.createElement("form");
				var c_idx = "${c_idx}";
				form.setAttribute("method", method);
				form.setAttribute("action", path);
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "c_idx");
				hiddenField.setAttribute("value", c_idx);
				form.appendChild(hiddenField);
				document.body.appendChild(form);
				form.submit();
			})
		});
	</script>
	<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
	<script>
		$(document).ready(function() {
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
			$(".prettydropdown:eq(2)  label:eq(0)").remove();
			$(".prettydropdown:eq(2)  label:eq(0)").remove();
		});
		function sort(gd,el){
			if(gd == "all"){
				$(".member_td").each(function(){
					$("tr").each(function(){
						$(this).attr("style","");
					})	
				})
			}else{
				$(".member_td").each(function(){
					$("tr").each(function(){
						var a = $(this).attr('class');
						$(this).attr("style","");
						if(!a.includes(gd)){
							$(this).attr("style","display:none");
						}
						if(a.includes("slef_data")){
							$(this).removeAttr("style");
						}
					})
				})
			}
			$("#sort li").each(function(){
				$(this).removeAttr("class");
			});
			$(el).attr("class","active_tab");
		}
		
	</script>
