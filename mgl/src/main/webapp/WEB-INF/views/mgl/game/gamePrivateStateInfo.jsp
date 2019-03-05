<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- 		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo"
						onClick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>
						<a href='/Board/BoardList.techni'>${list[0].c_nm }</a>
					</h1>
				</div>
			</div>
		</header> --%>

<!-- InstanceBeginEditable name="container" -->
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li class="active_tab"><span
			onClick="location.href='/UClub/GamePrivateStateInfo.techni'">게임짜기</span></li>
		<li><span onClick="location.href='/Game/GameState.techni'">진행게임</span>
		<li><span onClick="location.href='/Game/EndGame.techni '">끝난게임</span></li>
	</ul>
</div>
<!-- tab_btn_b_area end -->
<div class="tab_bt_area white_bg">
	<div>
		<ul class="tabs_cont">
			<li class="active_tab"><span
				onClick="location.href='/UClub/GamePrivateStateInfo.techni'">개인리그</span>
			</li>
			<li><span
				onClick="location.href='/UClub/GameTeamStateInfo.techni'">팀리그</span>
			</li>
			<li><span onClick="location.href='/UClub/GameOKList.techni'">한
					게임</span></li>
		</ul>
	</div>
</div>
<div class="content white_bg acd_area" id="appendDiv">
	<div class="acd-head">
		<h4 class="title_s">
			<b class="item_divide">개인리그</b>
		</h4>
		<span id="acd_count">0명 참여 - 각 0게임</span>
	</div>
	<div class="acd-cont">
		<ul class="li_name" id="appendUl">
		</ul>
	</div>
</div>
<div class="tit_select pd_lrb gray_bg td_st td4 btn_full">
	<div>
		<input id="user_id" type="hidden" name="user_id" value="">
		<h4 class="title_s">게임수</h4>
		<select name="private_no" id="private_no" onchange="acd_count();">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
		</select>
	</div>
	<div>
		<span class="btn_st btn_colorg popwin_btn1"
			onclick="location.href='#;'">게스트등록</span>
	</div>
	<div class="bin_space"></div>
	<div>
		<span class="btn_st" onclick="location.href='#;'">게임등록</span>
	</div>
</div>
<!-- content end -->
<c:if test="${list[0].u_nm ne null}">
	<div class="content white_bg acd_area">
		<div class="acd-head">
			<h4 class="title_s">
				<b>출전선수 구분</b><b id="st"></b>
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
		<ul class="li_name line_tno" id="s">
			<c:set var="i" value="${i}" />
			<c:forEach items="${list}" var="list">
				<c:set var="i" value="${i+1}" />
				<li
					onclick="appendUl('${list.u_id }','${list.u_nm}','${list.u_photo}','${fn:substring(list.u_age,0,1)}0대','${list.u_club_gd}','${list.u_sex }','${i}')"
					id="${list.u_id }"
					class="no_${i} v_all ${list.u_sex } ${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd }">
					<div class="photo_name">
						<div class="thum_area">
							<div class="thum" style="background-image:url(${list.u_photo});"></div>
						</div>
						<div class="text_area">
							<span class="name3">${list.u_nm }</span>
								<c:choose>
									<c:when test="${list.end_count ne 0}"><em class="game_nb-tiny">${list.end_count }</em></c:when>
									<c:when test="${list.wait_count > 0 }"><em class="game_nb-tiny">0</em></c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							 
							<span class="age_rank">(${fn:substring(list.u_age,0,1)}0대-${list.u_club_gd})</span>
						</div>
						<div class="small_s">
							<span class="btn_st btn_wh btn_wh_color1 btn_small"
								onClick="location.href='#;'">출전</span>
						</div>
					</div> <!--photo_name end-->
				</li>
			</c:forEach>
		</ul>
	</div>
</c:if>
<!-- content end -->
<!-- InstanceEndEditable -->
<!-- container end -->
<div id="popwin_wrap">
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
</div>
<div id="ft_area">
	<!-- InstanceBeginEditable name="ft_tag" -->
	<!-- InstanceEndEditable -->
	<ul id="ft_nv1" class="ft_menu">
		<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
		<li class="active_tab"
			onClick="location.href='/UClub/GamePrivateStateInfo.techni'"><span>게임</span></li>
		<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
		<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
	</ul>
</div>
<!-- wrap end -->
<script type="text/javascript">
		$(document).ready(function(){
			$(".prettydropdown ul li").each(function(){
				var n = Number($(this).attr('data-value'));
				if(n != 0){
					$(this).css('display','none');
				}
			});
		});
		function options(){
			$(".prettydropdown ul li").each(function(){
				var n = Number($(this).attr('data-value'));
	 			if($("#appendUl li").length * n %4 != 0){
					$(this).css('display','none');
				}
	 			if($("#appendUl li").length <= n){
					$(this).css('display','none');
				}
			});
		}
		function appendUl(idd,nm,photo,age,gd,sex,i){
			$("#"+idd).attr("style","display:none");
			$("#appendUl").append("<li id = 're_"+idd+"'><div class='photo_name'><div class='thum_area'><div class='thum' style='background-image: url("+photo+")'></div>"
			+"</div><div class='text_area'> <span class='name3'>"+nm+"</span><span class='age_rank'>("+age+"-"+gd+")</span></div>"
			+"<div class='icon_btn small_s'><span onclick=\"ulRemove('re_"+idd+"')\"  class='icon-remove' title='remove'></span></div></div></li>");
			$(".prettydropdown ul li").each(function(){
					$(this).css('display','');
			});
			options();
			checkV();
			acd_count();
		}
		function ulRemove(idd){
			$("#"+idd).remove();
			$("#"+idd.substring(3,idd.length)).attr("style","display:''");
			$(".prettydropdown ul li").each(function(){
				$(this).css('display','');
			});
			if($("#appendUl li").length == 0){
				$("#appendDiv	").css('display','none');
			}
			if($("#v_all").is(":hidden")){
				$("#v_all").attr("style","display:''");
			}
			options();
			checkV();
			acd_count();
		}
		function privateLeagueInsert(){
			if($("#appendUl li").length < 4){
				swal("MGL" ,"최소 4명이 필요합니다.")
			}else if($("#private_no").val() == 0 ){
				swal("MGL","게임 수를 선택해 주세요.")
			}else{
				var user_id ="";
				$("#user_id").val();
				$("#appendUl li").each(function(){
					user_id += $(this).attr("id").substring(3,$(this).attr("id").length)+",";
				});
				$("#user_id").val(user_id.substring(0,user_id.length-1));
				
				$.ajax({
					type:"POST",
					url:"/Game/PrivateLeagueInsert.techni",
					dataType:'json',
					data : JSON.stringify({"user_id" : user_id.substring(0,user_id.length-1), "private_no" : $("#private_no").val() }),
					contentType : "application/json; charset=UTF-8",
					success:function(data){
						if(data.cnt > 0 ){
							swal({
								title : "MGL",
								text : "게임 등록 되었습니다.",
								type : "success"
							})
							.then((value) =>{
								location.href="/Game/GameState.techni"
							})
						}else{
							swal("MGL", "죄송합니다. 다시 시도 해주세요.");
						}
					},
					error : function(error){
						swal("MGL","error : " + error);
					}
				});
			}
		}
		
		function allShow(){
			
			$(".v_all").attr("style","display:''");
			$("#v_all").attr("style","display:''");
			$("input[type=checkbox]").prop("checked",false);
			$("#st").text("");
			checkV();
		}
		function checkV(){
			var s_test = "";
			var gd_test = "";
			var age_test = "";
			var la = " : ";
			$("#v_all").attr("style","display:''");
			$(".v_all").attr("style","display:none");
			$(".li_check:checked").each(function() {
				la += $("label[for="+this.id+"]").text()+",";
				if($(this).val() == "M" || $(this).val()=="F" &&s_test.length==0){
					s_test += "."+$(this).val();
				}else if(s_test.length !=0 && $(this).val() == "M" || $(this).val()=="F"){
					s_test += ",."+$(this).val()
				}else if(isNaN($(this).val()) && gd_test.length==0 && $(this).val() != "M" && $(this).val() != "F" ) {
					gd_test += "."+$(this).val()
				}else if(isNaN($(this).val()) && gd_test.length!=0 && $(this).val() != "M" && $(this).val() != "F" ){
				  	gd_test += ",."+$(this).val();
				}else if(!isNaN($(this).val()) && age_test ==0){
					age_test +="."+$(this).val();
				}else if(!isNaN($(this).val()) && age_test !=0){
					age_test += ",."+$(this).val();
				}
			})
			$(".v_all").attr("style","display:''");
			if(s_test != ""){
				$("#s").find("li").not(s_test).attr("style","display:none");
			}
			if(gd_test != ""){
				$("#s").find("li").not(gd_test).attr("style","display:none");
			}
			if(age_test !=""){
				$("#s").find("li").not(age_test).attr("style","display:none");
			}
			$("#st").text(la.substring(0,la.length-1));
			
			$("#appendUl li").each(function(){
				$("#"+$(this).attr("id").substr(3,$(this).attr("id").length)).css('display','none');
			});
			
			var a = 0;
			$("#s li").each(function(){
				if($(this).is(":hidden")){
					a++;
				}
			});
			if(a==$("#s li").length){
				$("#v_all").attr("style","display:none");
			}
		}
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
		function guestInsert(){
			var g_id = $("#g_id").val();
			var g_sex = $('input[name="choice"]:checked').val();
			var g_age = $("#g_age").val();
			var g_gd = $("#g_gd").val();
			
			var today = new Date();
			
			var yyyy = today.getFullYear();
			
			g_age = yyyy-g_age;
			alert(g_age);
			if(g_id == null || g_id ==""){
				swal("MGL","이름을 입력해주세요.")
			}else if(g_sex == null || g_sex ==""){
				swal("MGL","성별을 입력해주세요.")
			}else if(g_age == null || g_age ==""){
				swal("MGL","연령대를 입력해주세요.")
			}else if(g_gd == null || g_gd ==""){
				swal("MGL","급수를 입력해주세요.")
			}else{
				$.ajax({
					async : true,
					type:"post",
					datatype : 'json',
					url : "/Member/GuestInsert.techni",
					data : JSON.stringify({"g_id" : g_id, "g_sex" : g_sex , "g_age" : g_age+"", "g_gd" : g_gd}),
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							location.href="/UClub/GameTeamStateInfo.techni"
						}else{
							swal("MGL","죄송합니다. 다시 시도해 주세요.")
						}
					},
					error : function(error){
						swal("MGL","error : "+error);
					}
				}); 
			}
		}
		function acd_count(){
			$("#acd_count").text($("#appendUl > li").length+"명 참여 - 각 "+$("#private_no").val()+"게임")
		}
	</script>