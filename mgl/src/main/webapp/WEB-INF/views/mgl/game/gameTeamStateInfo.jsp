<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- InstanceBeginEditable name="doctitle" -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<%-- <header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo"
						onClick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>${list[0].c_nm }</h1>
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
		var aa = $(location).attr('pathname').slice(-8, -7);
		$('.tab_btn_b').navi_depth({
			pageNum : aa
		})
		var tab_s_no = $(location).attr('pathname').slice(-10, -9);
		$('.tabs_cont').navi_depth({
			pageNum : tab_s_no
		});
	});
</script>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li class="active_tab"><span
			onClick="location.href='/UClub/GamePrivateStateInfo.techni'">게임짜기</span></li>
		<li><span onClick="location.href='/Game/GameState.techni'">진행게임</span>
		<li><span onClick="location.href='/Game/EndGame.techni'">끝난게임</span></li>
	</ul>
</div>
<!-- tab_btn_b_area end -->
<div class="tab_bt_area white_bg">
	<div>
		<ul class="tabs_cont">
			<li><span
				onClick="location.href='/UClub/GamePrivateStateInfo.techni'">개인리그</span>
			</li>
			<li class="active_tab"><span
				onClick="location.href='/UClub/GameTeamStateInfo.techni'">팀리그</span>
			</li>
			<li><span onClick="location.href='/UClub/GameOKList.techni'">한
					게임</span></li>
		</ul>
	</div>
</div>
<!-- tab_bt_area end -->
<div class="content white_bg pt_00 acd_area">
	<div class="acd-head pd_lrtb bt_line_td">
		<h4 class="title_s">
			<b class="item_divide">팀리그</b>
		</h4>
		<span id="acd_count">0/5팀 참여</span>
	</div>
	<div class="acd-cont" id="dis">
		<table class="mix3_td" id="teamTable">
		</table>
	</div>
</div>
<!-- content end-->
<div class="content white_bg line1_dark pt_00">
	<div class="btn_full pd_lrtb mb_b0">
		<hr class="line_div mb_b0">
	</div>
	<table class="line_no">
		<tr>
			<td class="name_ph" id="td_1">
				<div class="photo_name popwin_btn1" onclick="ctest('one');">
					<input type="hidden" id="id_1"> <input type="hidden"
						id="sex_1">
					<div class="thum_area">
						<div class="thum" id="photo_1"
							style="background-image: url(img/member_photo_06.jpg);"></div>
					</div>
					<div class="text_area">
						<span class="name3" id="nm_1"></span> <span class="age_rank"
							id="age_gd_1"></span>
					</div>
				</div> <!--photo_name end-->
			</td>
			<td class="btn_icons_td">
				<div class="icon_btn">
					<span id="re1" onclick="remove('1',this)" class="icon-remove re1"
						title="remove"></span>
				</div>
			</td>
			<td class="name_ph" id="td_2">
				<div class="photo_name popwin_btn1" onclick="ctest('two')">
					<input type="hidden" id="id_2"> <input type="hidden"
						id="sex_2">
					<div class="thum_area">
						<div class="thum" id="photo_2"
							style="background-image: url(img/member_photo_05.jpg);"></div>
					</div>
					<div class="text_area">
						<span class="name3" id="nm_2"></span> <span class="age_rank"
							id="age_gd_2"></span>
					</div>
				</div> <!--photo_name end-->
			</td>
			<td class="btn_icons_td">
				<div class="icon_btn">
					<span id="re2" onclick="remove('2',this)" class="icon-remove re2"
						title="remove"></span>
				</div>
			</td>
		</tr>
	</table>
</div>
<!-- content end -->
<div class="cet_lay pd_lrb gray_bg td_st td3 btn_full">
	<div>
		<span class="btn_st btn_color1" onClick="appendTable()">팀생성</span>
	</div>
	<div>
		<span class="btn_st" onclick="gameInsert()">게임등록</span>
	</div>
	<div>
		<span class="btn_st btn_colorg popwin_btn2"
			onclick="location.href='#;'">게스트등록</span>
	</div>
</div>
<c:if test="${list[0].u_nm ne null}">
	<div class="content white_bg acd_area">
		<div class="acd-head">
			<h4 class="title_s">
				<b>출전선수 구분</b><b id="st"> : 전체</b>
			</h4>
		</div>
		<!-- acd-head end-->
		<div class="acd-cont">
			<ul class="list_check">
				<li><input type="radio" class="check_circle" id="check_all"
					name="option_add" checked="checked" onclick="allShow()"> <label
					for="check_all">전체</label></li>
				<li><input type="radio" class="check_circle" id="check_detail"
					name="option_add"> <label for="check_detail">상세</label></li>
			</ul>
			<div class="check_ul_area">
				<table class="table_form line_no" id="ckTable">
					<tr>
						<td class="td_ti"><b>성별</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="check_man"
									onclick="checkV()" value="M"> <label for="check_man">남</label></li>
								<li><input type="checkbox" class="li_check"
									id="check_woman" onclick="checkV()" value="F"> <label
									for="check_woman">여</label></li>
							</ul></td>
					</tr>
					<tr>
						<td class="td_ti"><b>급수</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="check_1_1"
									value="자강" onclick="checkV()"> <label for="check_1_1">자강</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_2"
									value="A" onclick="checkV()"> <label for="check_1_2">A</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_3"
									value="B" onclick="checkV()"> <label for="check_1_3">B</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_4"
									value="C" onclick="checkV()"> <label for="check_1_4">C</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_5"
									value="D" onclick="checkV()"> <label for="check_1_5">D</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_6"
									value="초심" onclick="checkV()"> <label for="check_1_6">초심</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_7"
									value="왕초" onclick="checkV()"> <label for="check_1_7">왕초</label></li>
							</ul></td>
					</tr>
					<tr>
						<td class="td_ti"><b>나이</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="check_10"
									value="10" onclick="checkV()"> <label for="check_10">10대</label></li>
								<li><input type="checkbox" class="li_check" id="check_20"
									value="20" onclick="checkV()"> <label for="check_20">20대</label></li>
								<li><input type="checkbox" class="li_check" id="check_30"
									value="30" onclick="checkV()"> <label for="check_30">30대</label></li>
								<li><input type="checkbox" class="li_check" id="check_40"
									value="40" onclick="checkV()"> <label for="check_40">40대</label></li>
								<li><input type="checkbox" class="li_check" id="check_50"
									value="50" onclick="checkV()"> <label for="check_50">50대</label></li>
								<li><input type="checkbox" class="li_check" id="check_60"
									value="60" onclick="checkV()"> <label for="check_60">60대</label></li>
								<li><input type="checkbox" class="li_check" id="check_70"
									value="70" onclick="checkV()"> <label for="check_70">70대</label></li>
							</ul></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- acd cont end-->
	</div>
	<!-- content acd_area end -->
	<div class="content white_bg" id="v_all">
		<ul class="li_name line_tno" id="pre">
			<c:set var="i" value="${i}" />
			<c:forEach items="${list}" var="list">
				<c:set var="i" value="${i+1}" />
				<li
					onclick="te('${list.u_id }','${list.u_nm}','${list.u_photo}','${fn:substring(list.u_age,0,1)}0대','${list.u_club_gd}','${list.u_sex }','${i}')"
					id="${list.u_id }"
					class="no_${i} v_all ${list.u_sex } ${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd }">
					<div class="photo_name">
						<div class="thum_area">
							<div class="thum" style="background-image:url(${list.u_photo});"></div>
						</div>
						<div class="text_area">
							<span class="name3">${list.u_nm }</span><c:choose>
									<c:when test="${list.end_count ne 0}"><em class="game_nb-tiny">${list.end_count }</em></c:when>
									<c:when test="${list.wait_count > 0 }"><em class="game_nb-tiny">0</em></c:when>
									<c:otherwise></c:otherwise>
								</c:choose> <span class="age_rank">(${fn:substring(list.u_age,0,1)}0대-${list.u_club_gd})</span>
						</div>
					</div> <!--photo_name end-->
				</li>
			</c:forEach>
		</ul>
	</div>
</c:if>
<!-- content end -->
<!-- InstanceEndEditable -->
<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">선수 선택</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="scroll_wrap ht-5">
		<ul class="li_name line_tno" id="ctest">
		</ul>
	</div>
	<!--scroll_wrap end-->
</div>
<!-- popwin_size end -->
	<div class="popwin_size white_bg wsize-300">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="game_title">게스트 등록</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" onclick="location.href='#'"></span>
			</div>
		</div>
		<!-- title_popupp end -->
		<div class="popup_body">
			<table class="table_form mb_m">
				<tr>
					<td><input type="text" placeholder="이름(실명)" id="g_id"></td>
				</tr>
				<tr>
					<td><ul class="list_check">
							<li><input type="radio" name="choice" class="check_circle"
								id="check_1" value="m"> <label for="check_1">남자</label>
							</li>
							<li><input type="radio" name="choice" class="check_circle"
								id="check_2" value="f"> <label for="check_2">여자</label>
							</li>
						</ul></td>
				</tr>
				<tr>
					<td><div class="col_2input">
							<div>
								<select id="g_age">
									<option value="연령" selected="selected">연령</option>
									<option value="10">10대</option>
									<option value="20">20대</option>
									<option value="30">30대</option>
									<option value="40">40대</option>
									<option value="50">50대</option>
									<option value="50">60대</option>
									<option value="50">70대</option>
								</select>
							</div>
							<div>
								<select name="select" id="g_gd">
									<option value="급수" selected="selected">급수</option>
									<option value="자강">자강</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="초심">초심</option>
									<option value="왕초">왕초</option>
								</select>
							</div>
						</div></td>
				</tr>
			</table>
			<hr class="line_both">
			<div class="btn_full col2_lay">
				<div>
					<span class="btn_st btn_colorg close_popup " onclick="">취소</span>
				</div>
				<div>
					<span class="btn_st close_popup" onClick="guestInsert();">등록</span>
				</div>
			</div>
			<!-- col2_lay end -->
		</div>
		<!-- popup_body end-->
	</div>
<!-- container end -->
<div id="ft_area">
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
						<li class="active_tab"
							onClick="location.href='/UClub/GamePrivateStateInfo.techni'"><span>게임</span></li>
						<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
						<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
					</ul>
				</div>
	<script>
	var team1 = 0;
	var team2 = 0;
	var no_1 = 0;
	var cut_1 = "";
	var no_2 = 0;
	var cut_2 = "";
	var no = 1;
	var cut = "";

	function te(idd, nm, photo, age, gd, sex, i) {
		if (team1 == 0) {
			no_1 = i - 1;
			$("#" + idd).attr('style', 'display:none');
			$("#photo_1").attr('style', 'background-image: url(' + photo + ')');
			$("#nm_1").text(nm);
			$("#age_gd_1").text("(" + age + "-" + gd + ")");
			$("#re1").attr("id", "re_" + idd);
			$("#sex_1").val(sex);
			$("#id_1").val(idd)
			team1++;
			checkV()
			$('.la-close').click();
		} else if (team2 == 0) {
			no_2 = i - 1;
			$("#" + idd).attr('style', 'display:none');
			$("#photo_2").attr('style', 'background-image: url(' + photo + ')');
			$("#nm_2").text(nm);
			$("#age_gd_2").text("(" + age + "-" + gd + ")");
			$("#re2").attr("id", "re_" + idd);
			$("#sex_2").val(sex);
			$("#id_2").val(idd)
			team2++;
			checkV()
			$('.la-close').click();
		} else {
			swal("MGL", "자리가 꽉 찼습니다.")
		}
	}
	function remove(i, t) {
		if ($(t).attr("id") == "re" + i) {
			return;
		} else {
			$("#photo_" + i).attr('style', 'background-image: url()');
			$("#nm_" + i).text("");
			$("#age_gd_" + i).text("");
			$("#" + $(t).attr("id").substring(3, $(t).attr("id").length)).css(
					'display', '');
			$(t).attr("id", "re" + i);
			$("#id_" + i).val("");
			$("#sex_" + i).val("");
			if (i == 1) {
				team1 = 0;
			} else {
				team2 = 0;
			}
			checkV();
		}
	}
	function allShow() {
		$("input[type=checkbox]").prop("checked", false);
		$("#st").text("");
		checkV();
	}
	function checkV() {
		var s_test = "";
		var gd_test = "";
		var age_test = "";
		var la = " : ";
		$("#v_all").attr("style", "display:''");
		$(".v_all").attr("style", "display:none");
		$(".li_check:checked").each(
				function() {
					la += $("label[for=" + this.id + "]").text() + ",";
					if ($(this).val() == "M" || $(this).val() == "F"
							&& s_test.length == 0) {
						s_test += "." + $(this).val();
					} else if (s_test.length != 0 && $(this).val() == "M"
							|| $(this).val() == "F") {
						s_test += ",." + $(this).val()
					} else if (isNaN($(this).val()) && gd_test.length == 0
							&& $(this).val() != "M" && $(this).val() != "F") {
						gd_test += "." + $(this).val()
					} else if (isNaN($(this).val()) && gd_test.length != 0
							&& $(this).val() != "M" && $(this).val() != "F") {
						gd_test += ",." + $(this).val();
					} else if (!isNaN($(this).val()) && age_test == 0) {
						age_test += "." + $(this).val();
					} else if (!isNaN($(this).val()) && age_test != 0) {
						age_test += ",." + $(this).val();
					}
				})
		$(".v_all").attr("style", "display:''");
		if (s_test != "") {
			$("#pre").find("li").not(s_test).attr("style", "display:none");
		}
		if (gd_test != "") {
			$("#pre").find("li").not(gd_test).attr("style", "display:none");
		}
		if (age_test != "") {
			$("#pre").find("li").not(age_test).attr("style", "display:none");
		}
		$("#st").text(la.substring(0, la.length - 1))

		$("input[name=team_1]").each(function() {
			$("#" + $(this).val()).css('display', 'none');
		});
		$("input[name=team_2]").each(function() {
			$("#" + $(this).val()).css('display', 'none');
		});
		var id1 = $("#id_1").val();
		var id2 = $("#id_2").val();
		if (id1 != "") {
			$("#" + id1).css("display", "none");
		}
		if (id2 != "") {
			$("#" + id2).css("display", "none");
		}

		var a = 0;
		$("#pre li").each(function() {
			if ($(this).is(":hidden")) {
				a++;
			}
		});
		if (a == $("#pre li").length) {
			$("#v_all").attr("style", "display:none");
		}

	}

	function appendTable() {
		/* if(no > 1){
			$("#gameInsert").attr("style","display:''");
		} */
		/* $("#dis").attr("style","display:''") */
		if (team1 != 0 && team2 != 0) {
			if (no == 6) {
				swal("MGL", "최대 5팀까지 선택 가능합니다.")
			} else {
				team1 = 0;
				team2 = 0;
				$("#teamTable").append("<tr id='tt"+no+"'>");
				$("#tt" + no).append(
						"<td class='cot2 order_td'>" + no + "</td>")
				$("#tt" + no)
						.append(
								"<td class='name_ph pn_w40'><div class='photo_name'><input type='hidden' name='team_1' value="
										+ $("#id_1").val()
										+ "><div class='thum_area'>"
										+ "<div class='thum' style='"
										+ $("#photo_1").attr("style")
										+ "'></div></div>"
										+ "<div class='text_area'><span class='name3'>"
										+ $("#nm_1").text()
										+ "</span>"
										+ "<span class='age_rank'>"
										+ $("#age_gd_1").text()
										+ "</span></div></div></td>");
				$("#tt" + no)
						.append(
								"<td class='name_ph pn_w40'><div class='photo_name'><input type='hidden' name='team_2' value='"
										+ $("#id_2").val()
										+ "'><div class='thum_area'>"
										+ "<div class='thum' style='"
										+ $("#photo_2").attr("style")
										+ "'></div></div>"
										+ "<div class='text_area'><span class='name3'>"
										+ $("#nm_2").text()
										+ "</span>"
										+ "<span class='age_rank'>"
										+ $("#age_gd_2").text()
										+ "</span></div></div></td>");
				$("#tt" + no)
						.append(
								"<td class='btn_icons_td'><div class='icon_btn'>"
										+ "<span class='icon-remove' onclick=\"deleteTable('tt"
										+ no + "')\" title='remove'></span>"
										+ "</div></td>");
				$("#teamTable").append("</tr>")
				no++;
				$("#photo_1").attr('style', 'background-image: url()');
				$("#nm_1").text("");
				$("#age_gd_1").text("");
				$("id_1").val("");
				$("#sex_1").val("");
				$("#photo_2").attr('style', 'background-image: url()');
				$("#nm_2").text("");
				$("#age_gd_2").text("");
				$("id_2").val("");
				$("#sex_2").val("");
				$(".re1").attr("id", "re1");
				$(".re2").attr("id", "re2");
				$("#acd_count").text($("#teamTable > tr").length + "/5팀 참여");
			}
		} else {
			swal("MGL", "팀원을 선택해 주세요.")
		}
	}
	function deleteTable(tid) {
		no--;
		$("#" + $("#" + tid + " input[name=team_1]").val()).css("display", "");
		$("#" + $("#" + tid + " input[name=team_2]").val()).css("display", "");
		$("#" + tid).remove();
		$("#teamTable tr").each(
				function(i) {
					$(this).attr("id", "tt" + (i + 1));
					$(this).find("td").eq(0).text(i + 1);
					$(this).find("span").eq(4).attr("onclick",
							"deleteTable('tt" + (i + 1) + "')")
				});
		if ($("#v_all").is(":hidden")) {
			$("#v_all").attr("style", "display:''");
		}
		if (no <= 2) {
			$("#gameInsert").attr("style", "display:none");
		}
	}
	function gameInsert() {
		if (no < 3) {
			swal("MGL", "최소 2팀이상 등록해주세요.");
			return false;
		}
		var team_a = "";
		var json = new Array();
		$("input[name=team_1]").each(
				function(i) {
					team_a = $("input[name=team_1]").eq(i).val() + ","
							+ $("input[name=team_2]").eq(i).val()
					var arr = new Array();
					var data = new Object();
					arr.unshift(team_a)
					var q = "a" + i;
					eval("data." + q + "=" + "arr");
					json.push(data);
				})
		var jsonData = JSON.stringify(json);
		alert(jsonData);
		$.ajax({
			async : true,
			type : "post",
			data : jsonData,
			url : "/Game/TeamLeagueInsert.techni",
			datatype : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (data.cnt > 0) {
					location.href = "/Game/GameState.techni"
				} else {
					swal("MGL", "죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error) {
				swal("MGL", "error : " + error);
			}
		});

	}
	function guestInsert() {
		var g_id = $("#g_id").val();
		var g_sex = $('input[name="choice"]:checked').val();
		var g_age = $("#g_age").val();
		var g_gd = $("#g_gd").val();

		var today = new Date();

		var yyyy = today.getFullYear();

		g_age = yyyy - g_age;
		alert(g_age);
		if (g_id == null || g_id == "") {
			swal("MGL", "이름을 입력해주세요.")
		} else if (g_sex == null || g_sex == "") {
			swal("MGL", "성별을 입력해주세요.")
		} else if (g_age == null || g_age == "") {
			swal("MGL", "연령대를 입력해주세요.")
		} else if (g_gd == null || g_gd == "") {
			swal("MGL", "급수를 입력해주세요.")
		} else {
			$.ajax({
				async : true,
				type : "post",
				datatype : 'json',
				url : "/Member/GuestInsert.techni",
				data : JSON.stringify({
					"g_id" : g_id,
					"g_sex" : g_sex,
					"g_age" : g_age + "",
					"g_gd" : g_gd
				}),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						location.href = "/UClub/GameTeamStateInfo.techni"
					} else {
						swal("MGL", "죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error) {
					swal("MGL", "error : " + error);
				}
			});
		}
	}
	function ctest(n) {
		$('.la-close').click();
		$("#ctest li").each(function() {
			$(this).remove();
		})
		$("#pre li").each(function() {
			if(n == 'one'){
				var c = $(this).clone();
				var o = c.attr("onclick")
				c.attr("onclick", "one_" + o);
				c.appendTo($("#ctest"));
			}else{
				var c = $(this).clone();
				var o = c.attr("onclick")
				c.attr("onclick", "two_" + o);
				c.appendTo($("#ctest"));
			}
			
		})
	}
	function one_te(idd, nm, photo, age, gd, sex, i) {
		no_1 = i - 1;
		$("#" + idd).attr('style', 'display:none');
		$("#photo_1").attr('style', 'background-image: url(' + photo + ')');
		$("#nm_1").text(nm);
		$("#age_gd_1").text("(" + age + "-" + gd + ")");
		$("#re1").attr("id", "re_" + idd);
		$("#sex_1").val(sex);
		$("#id_1").val(idd)
		team1++;
		checkV()
		$('.la-close').click();
	}
	function two_te(idd, nm, photo, age, gd, sex, i) {
		no_2 = i - 1;
		$("#" + idd).attr('style', 'display:none');
		$("#photo_2").attr('style', 'background-image: url(' + photo + ')');
		$("#nm_2").text(nm);
		$("#age_gd_2").text("(" + age + "-" + gd + ")");
		$("#re2").attr("id", "re_" + idd);
		$("#sex_2").val(sex);
		$("#id_2").val(idd)
		team2++;
		checkV()
		$('.la-close').click();
	}
</script>