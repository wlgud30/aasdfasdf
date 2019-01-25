<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(document).ready(function() {
		$('#wh option[id=${cf_t_idx}]').attr('selected','selected');
});
var team1 = 0;
var team2 = 0;

function selectChange(){
	var a = $("#wh").val().split(",");
	var cf_t_idx = a[0];
	var cf_t_kind=a[1];
	location.href="/Cfight/CfightRegisterT.techni?cf_idx=${cf_idx}"+"&cf_t_kind="+cf_t_kind+"&cf_t_idx="+cf_t_idx;
}
function te(idd,nm,photo,age,gd,sex){
	if(team1 == 0){
		$("#"+idd).attr("style","display:none");
		$("#photo_1").attr('style','background-image: url('+photo+')');
		$("#nm_1").text(nm);
		$("#age_gd_1").text("("+age+"-"+gd+")");
		$("#re1").attr("id","re_"+idd);
		$("#sex_1").val(sex);
		$("#id_1").val(idd)
		team1++;
	}else if(team2 == 0){
		$("#"+idd).attr("style","display:none");
		$("#photo_2").attr('style','background-image: url('+photo+')');
		$("#nm_2").text(nm);
		$("#age_gd_2").text("("+age+"-"+gd+")");
		$("#re2").attr("id","re_"+idd);
		$("#sex_2").val(sex);
		$("#id_2").val(idd)
		team2++;
	}else{
		swal("MGL","자리가 꽉 찼습니다.")
	}
	
}
function remove(i,t){
	$("#photo_"+i).attr('style','background-image: url()');
	$("#nm_"+i).text("");
	$("#age_gd_"+i).text("");
	$("#"+$(t).attr("id").substring(3,$(t).attr("id").length)).attr("style","");
	$(t).attr("id","re"+i);
	$("id_"+i).val("");
	$("#sex_"+i).val("");
	if(i=="1"){
		team1=0;
	}else{
		team2=0;
	}
}
function teamInsert(){
	
	var a = $("#wh").val().split(",");
	var cf_t_idx = a[0];
	var cf_t_kind=a[1];
	
	if(a[1] == "혼복"){
		if($("#sex_1").val() == $("#sex_2").val()){
			swal("MGL","혼복경기는 같은 성별로 팀이 될 수 없습니다.");
			return false;
		}
	}
	
	if(team1 != 0 && team2 != 0){
	swal({
		title : "MGL",
		text : "팀을 생성 하시겠습니까?",
		buttons : {
			confirm : "OK",
			cancel : "NO"
		}
	})
	.then((value) => {
		if(value){
			$.ajax({
				async : true,
				type:"post",
				data : JSON.stringify({"cf_t_idx" : a[0] , "cf_idx" : "${cf_idx}","u_id_a" : $("#id_1").val(),"u_id_b" : $("#id_2").val()}),
				url : "/Cfight/CfightTeamInsert.techni",
				datatype : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					if(data.cnt>0){
						swal({
							title : "MGL",
							text : "팀이 생성 되었습니다.",
							type : "success"
						})
						.then((value) =>{
							location.href="/Cfight/CfightRegisterT.techni?cf_idx=${cf_idx}"+"&cf_t_kind="+cf_t_kind+"&cf_t_idx="+cf_t_idx;
						})
					}else{
						swal("MGL","죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error){
					swal("MGL","error : "+error);
				}
			}) 
		}
	})
	}else{
		swal("MGL","팀원을 선택해 주세요.");
	}
}
function teamDelete(idx){
	var a = $("#wh").val().split(",");
	var cf_t_idx = a[0];
	var cf_t_kind=a[1];
	swal({
		title : "MGL",
		text : "팀을 삭제 하시겠습니까?",
		buttons : {
			confirm : "OK",
			cancel : "NO"
		}
	})
	.then((value) => {
		if(value){
			$.ajax({
				async : true,
				type:"post",
				data : idx,
				url : "/Cfight/CfightTeamDelete.techni",
				datatype : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					if(data.cnt>0){
						swal({
							title : "MGL",
							text : "팀이 삭제 되었습니다.",
							type : "success"
						})
						.then((value) =>{
							location.href="/Cfight/CfightRegisterT.techni?cf_idx=${cf_idx}"+"&cf_t_kind="+cf_t_kind+"&cf_t_idx="+cf_t_idx;
						})
					}else{
						swal("MGL","죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error){
					swal("MGL","error : "+error);
				}
			}) 
		}
	})
}
</script>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />

			<!-- InstanceBeginEditable name="container" -->
			<div class="cat_gray_area col_2input wauto">
				<div>
					<h4 class="title_s">
						<b class="item_divide">출전선수</b>${list3[0].c_t_count} / ${list3[0].c_count }
					</h4>
				</div>
				<div>
					<span class="btn_st btn_small" onclick="location.href='/Cfight/CfightTeamList.techni?cf_idx=${cf_idx}'">전체확인</span>
				</div>
			</div>
			<div class="tit_select">
				<ul class="li_col-nol">
					<li>
						<h4 class="title_s">
							<b>구분(종목)</b>
						</h4> 
						<select id="wh" name="wh" onchange="selectChange()">
							<c:forEach items="${list3 }" var="list">
								<option id="${list.cf_t_idx}" value="${list.cf_t_idx},${list.cf_t_kind}">${list.cf_t_nm }</option>
							</c:forEach>
						</select>
					</li>
				</ul>
			</div>
			<div class="content white_bg pt_00">
				<table class="mix3_td">
					<c:forEach items="${list2}" var="list">
					<tr>
						<td class="name_ph">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum"
										style="background-image: url(${list.cf_t_a_photo });"></div>
								</div>
								<div class="text_area">
									<span class="name3">${list.cf_t_a_nm }</span> <span class="age_rank">(${list.cf_t_a_age }-${list.cf_t_a_gd })</span>
								</div>
							</div> <!--photo_name end-->
						</td>
						<td class="name_ph">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum" style="background-image: url(${list.cf_t_b_photo });"></div>
								</div>
								<div class="text_area">
									<span class="name3">${list.cf_t_b_nm }</span> <span class="age_rank">(${list.cf_t_b_age }-${list.cf_t_b_gd })</span>
								</div>
							</div> <!--photo_name end-->
						</td>
						<td class="btn_icons_td">
							<div class="icon_btn">
								<span onclick="teamDelete('${list.cf_team_idx}')" class="icon-remove"title="remove"></span>
							</div>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="content white_bg line1_dark pt_00">
				<div class="btn_full pd_lrtb mb_b0">
					<span class="btn_st" onClick="teamInsert()">팀 생성</span>
                    <hr class="line_div mb_b0">					
				</div>
				<table class="line_no">
					<tr>
						<td class="name_ph">
							<div class="photo_name">
								<input type="hidden" id="id_1">
								<input type="hidden" id="sex_1">
								<div class="thum_area">
									<div class="thum" id="photo_1" style="background-image: url(img/member_photo_06.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3" id="nm_1" ></span> <span class="age_rank" id="age_gd_1" ></span>
								</div>
							</div> <!--photo_name end-->
						</td>
						<td class="btn_icons_td">
							<div class="icon_btn">
								<span id="re1" onclick="remove('1',this)" class="icon-remove"title="remove"></span>
							</div>
						</td>
						<td class="name_ph">
							<div class="photo_name">
								<input type="hidden" id="id_2">
								<input type="hidden" id="sex_2">
								<div class="thum_area">
									<div class="thum" id="photo_2"  style="background-image: url(img/member_photo_05.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3" id="nm_2" ></span> <span class="age_rank" id="age_gd_2" ></span>
								</div>
							</div> <!--photo_name end-->
						</td>
						<td class="btn_icons_td">
							<div class="icon_btn">
								<span id="re2" onclick="remove('2',this)" class="icon-remove"title="remove"></span>
							</div>
						</td>
					</tr>
				</table>				
			</div>
			<!-- content end-->
			<!-- content end -->
			<div class="content white_bg">
				<ul class="li_name line_tno">
				<c:forEach items="${list}" var="list">
					<li onclick="te('${list.cf_u_id }','${list.cf_u_nm}','${list.cf_u_photo}','${list.cf_u_age}','${list.cf_u_gd}','${list.cf_u_sex }')" id="${list.cf_u_id }" >
						<div class="photo_name">
							<div class="thum_area">
								<div class="thum" style="background-image: url(${list.cf_u_photo});"></div>
							</div>
							<div class="text_area">
								<span class="name3">${list.cf_u_nm}</span>
								<span class="age_rank">(${list.cf_u_age}-${list.cf_u_gd})</span>
							</div>
						</div> <!--photo_name end-->
					</li>
				</c:forEach>
				</ul>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->

		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
		<script>
		$(document).ready(function() {
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
		});
		</script>