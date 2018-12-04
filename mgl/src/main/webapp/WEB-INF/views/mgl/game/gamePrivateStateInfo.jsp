<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
	<div id="wrap">
		<header>
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
				<div class="bt_top">
					<c:choose>
						<c:when test="${u_status eq '게임중'}">
							<span class="icon-playing icon-f btn_i i-text">게임중</span>
						</c:when>
						<c:when test="${u_status eq '대기중' }">
							<span class="icon-expect icon-f btn_i i-text">대기중</span>
						</c:when>
						<c:when test="${u_status eq '게임가능'}">
							<span class="icon-out icon-f btn_i i-text" onClick="attendOut()">퇴실</span>
						</c:when>
						<c:otherwise>
							<span class="icon-enter icon-f btn_i i-text" onClick="attend()">출석</span>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/GameState.techni'"><span>게임현황판</span></li>
					<li class="active_tab" onClick="location.href='/UClub/GameOKList.techni'"><span>게임등록</span></li>
					<li onClick="location.href='/UClub/AttendList.techni '"><span>출석확인</span></li>
				</ul>
			</div>
			<!-- tab_btn_b_area end -->
			<div class="tab_bt_area white_bg">
				<div>
					<ul class="tabs_cont">
						<li>
							<span onClick="location.href='/UClub/GameOKList.techni'">수동등록</span>
						</li>
						<li class="active_tab">
							<span onClick="location.href='/UClub/GamePrivateStateInfo.techni'">개인리그등록</span>
						</li>
						<li>
							<span onClick="location.href='/UClub/GameTeamStateInfo.techni'">팀리그등록</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- tab_bt_area end -->
			<div class="tit_select cet_lay pd_lrb gray_bg">
				<ul class="li_col-nol">
					<li>
						<h4 class="title_s">
							<b>개인별 게임수</b>
						</h4>
						<form action="/Game/PrivateLeagueInsert.techni" method="post"
							id="frm">
							<input id="user_id" type="hidden" name="user_id" value="">
							<select name="private_no" id="private_no">
								<option value="0">선택</option>
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
						</form>
					</li>
				</ul>
				<div class="btn_full">
					<span class="btn_st" onclick="privateLeagueInsert()">게임등록</span>
				</div>
			</div>
			<div class="content white_bg visible_area_ul" id="appendDiv">
				<ul class="li_name line_tno" id="appendUl">
				</ul>
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
							name="option_add" checked="checked" onclick="allShow()">
							<label for="check_all">전체</label></li>
						<li><input type="radio" class="check_circle"
							id="check_detail" name="option_add"> <label
							for="check_detail">상세</label></li>
					</ul>
					<div class="check_ul_area">
						<table class="table_form line_no" id="ckTable">
							<tr>
								<td class="td_ti"><b>성별</b></td>
								<td><ul class="list_check li_lot">
										<li><input type="checkbox" class="li_check"
											id="check_man" onclick="checkV()" value="M"> <label
											for="check_man">남</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_woman" onclick="checkV()" value="F"> <label
											for="check_woman">여</label></li>
									</ul></td>
							</tr>
							<tr>
								<td class="td_ti"><b>급수</b></td>
								<td><ul class="list_check li_lot">
										<li><input type="checkbox" class="li_check"
											id="check_1_1" value="자강" onclick="checkV()"> <label
											for="check_1_1">자강</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_1_2" value="A" onclick="checkV()"> <label
											for="check_1_2">A</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_1_3" value="B" onclick="checkV()"> <label
											for="check_1_3">B</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_1_4" value="C" onclick="checkV()"> <label
											for="check_1_4">C</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_1_5" value="D" onclick="checkV()"> <label
											for="check_1_5">D</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_1_6" value="초심" onclick="checkV()"> <label
											for="check_1_6">초심</label></li>
										<li><input type="checkbox" class="li_check"
											id="check_1_7" value="왕초" onclick="checkV()"> <label
											for="check_1_7">왕초</label></li>
									</ul></td>
							</tr>
							<tr>
								<td class="td_ti"><b>나이</b></td>
								<td><ul class="list_check li_lot">
										<li><input type="checkbox" class="li_check" id="check_10"
											value="10" onclick="checkV()"> <label for="check_10">10대</label>
										</li>
										<li><input type="checkbox" class="li_check" id="check_20"
											value="20" onclick="checkV()"> <label for="check_20">20대</label>
										</li>
										<li><input type="checkbox" class="li_check" id="check_30"
											value="30" onclick="checkV()"> <label for="check_30">30대</label>
										</li>
										<li><input type="checkbox" class="li_check" id="check_40"
											value="40" onclick="checkV()"> <label for="check_40">40대</label>
										</li>
										<li><input type="checkbox" class="li_check" id="check_50"
											value="50" onclick="checkV()"> <label for="check_50">50대</label>
										</li>
										<li><input type="checkbox" class="li_check" id="check_60"
											value="60" onclick="checkV()"> <label for="check_60">60대</label>
										</li>
										<li><input type="checkbox" class="li_check" id="check_70"
											value="70" onclick="checkV()"> <label for="check_70">70대</label>
										</li>
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
						<li onclick="appendUl('${list.u_id }','${list.u_nm}','${list.u_photo}','${fn:substring(list.u_age,0,1)}0대','${list.u_club_gd}','${list.u_sex }','${i}')" id="${list.u_id }" class="no_${i} v_all ${list.u_sex } ${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd }">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum"
										style="background-image:url(${list.u_photo});"></div>
								</div>
								<div class="text_area">
									<span class="name3">${list.u_nm }</span> <span class="age_rank">(${fn:substring(list.u_age,0,1)}0대-${list.u_club_gd})</span>
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
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<ul id="ft_nv1" class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li class="active_tab"  onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>
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
		
	</script>
</body>
</html>