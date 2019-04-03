<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/prettydropdowns.css?ver3" type="text/css" />
<script>
$(document).ready(function() {
		$('#wh option[id=${cf_t_idx}]').attr('selected','selected');
		$(".prettydropdown ul li").each(function(){
			$(this).attr("class","");
		});
		$(".prettydropdown ul li").each(function(){
			var dat = $(this).attr("data-value").substring(0,14);
			if(dat=="${cf_t_idx}"){
				$(this).attr("class","selected");
			}
		});
		$(".prettydropdown").find("label").text($("#${cf_t_idx}").text());
		
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
		swal("민턴in","자리가 꽉 찼습니다.")
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
			swal("민턴in","혼복경기는 같은 성별로 팀이 될 수 없습니다.");
			return false;
		}
	}
	
	if(team1 != 0 && team2 != 0){
	swal({
		title : "민턴in",
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
							title : "민턴in",
							text : "팀이 생성 되었습니다.",
							type : "success"
						})
						.then((value) =>{
							location.href="/Cfight/CfightRegisterT.techni?cf_idx=${cf_idx}"+"&cf_t_kind="+cf_t_kind+"&cf_t_idx="+cf_t_idx;
						})
					}else{
						swal("민턴in","죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error){
					swal("민턴in","error : "+error);
				}
			}) 
		}
	})
	}else{
		swal("민턴in","팀원을 선택해 주세요.");
	}
}
function teamDelete(idx){
	var a = $("#wh").val().split(",");
	var cf_t_idx = a[0];
	var cf_t_kind=a[1];
	swal({
		title : "민턴in",
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
							title : "민턴in",
							text : "팀이 삭제 되었습니다.",
							type : "success"
						})
						.then((value) =>{
							location.href="/Cfight/CfightRegisterT.techni?cf_idx=${cf_idx}"+"&cf_t_kind="+cf_t_kind+"&cf_t_idx="+cf_t_idx;
						})
					}else{
						swal("민턴in","죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error){
					swal("민턴in","error : "+error);
				}
			}) 
		}
	})
}
</script>

<!-- InstanceBeginEditable name="container" -->
<div class="cat_gray_area col_2input wauto">
	<div>
		<h4 class="title_s">
			<b class="item_divide">출전선수</b>${list3[0].c_t_count} /
			${list3[0].c_count }
		</h4>
	</div>
	<div>
		<span class="btn_st btn_small"
			onclick="location.href='/Cfight/CfightTeamList.techni?cf_idx=${cf_idx}'">전체확인</span>
	</div>
</div>
<div class="tit_select">
	<ul class="li_col-nol">
		<li>
			<h4 class="title_s">
				<b>구분(종목)</b>
			</h4> <select id="wh" name="wh" onchange="selectChange()">
				<c:forEach items="${list3 }" var="list">
					<option id="${list.cf_t_idx}"
						value="${list.cf_t_idx},${list.cf_t_kind}">${list.cf_t_nm }</option>
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
							<span class="name3">${list.cf_t_a_nm }</span> <span
								class="age_rank">(${fn:substring(list.cf_t_a_age,0,1)}0-${list.cf_t_a_gd })</span>
						</div>
					</div> <!--photo_name end-->
				</td>
				<td class="name_ph">
					<div class="photo_name">
						<div class="thum_area">
							<div class="thum"
								style="background-image: url(${list.cf_t_b_photo });"></div>
						</div>
						<div class="text_area">
							<span class="name3">${list.cf_t_b_nm }</span> <span
								class="age_rank">(${fn:substring(list.cf_t_b_age,0,1)}0-${list.cf_t_b_gd })</span>
						</div>
					</div> <!--photo_name end-->
				</td>
				<td class="btn_icons_td">
					<div class="icon_btn">
						<span onclick="teamDelete('${list.cf_team_idx}')"
							class="icon-remove" title="remove"></span>
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
					<span id="re1" onclick="remove('1',this)" class="icon-remove"
						title="remove"></span>
				</div>
			</td>
			<td class="name_ph">
				<div class="photo_name">
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
					<span id="re2" onclick="remove('2',this)" class="icon-remove"
						title="remove"></span>
				</div>
			</td>
		</tr>
	</table>
</div>
<!-- content end-->
<!-- content end -->
<div class="content white_bg acd_area">
	<div class="acd-head">
		<h4 class="title_s">
			<b>출전선수 구분</b><b id="st"></b>
		</h4>
	</div>
	<!-- acd-head end-->
	<div class="acd-cont" style="display: none;">
		<ul class="list_check">
			<li><input type="radio" class="check_circle" id="check_all"
				name="option_add" checked="checked" onclick="allShow()"> <label
				for="check_all">전체</label></li>
			<li><input type="radio" class="check_circle" id="check_detail"
				name="option_add"> <label for="check_detail">상세</label></li>
		</ul>
		<div class="check_ul_area">
			<table class="table_form line_no" id="ckTable">
				<tbody>
					<tr>
						<td class="td_ti"><b>성별</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="ccheck_man"
									onclick="checkV()" value="M"> <label for="ccheck_man">남</label></li>
								<li><input type="checkbox" class="li_check"
									id="ccheck_woman" onclick="checkV()" value="F"> <label
									for="ccheck_woman">여</label></li>
							</ul></td>
					</tr>
					<tr>
						<td class="td_ti"><b>급수</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="ccheck_1_1"
									value="자강" onclick="checkV()"> <label for="ccheck_1_1">자강</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_1_2"
									value="A" onclick="checkV()"> <label for="ccheck_1_2">A</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_1_3"
									value="B" onclick="checkV()"> <label for="ccheck_1_3">B</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_1_4"
									value="C" onclick="checkV()"> <label for="ccheck_1_4">C</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_1_5"
									value="D" onclick="checkV()"> <label for="ccheck_1_5">D</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_1_6"
									value="초심" onclick="checkV()"> <label for="ccheck_1_6">초심</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_1_7"
									value="왕초" onclick="checkV()"> <label for="ccheck_1_7">왕초</label></li>
							</ul></td>
					</tr>
					<tr>
						<td class="td_ti"><b>나이</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="ccheck_10"
									value="10" onclick="checkV()"> <label for="ccheck_10">10대</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_20"
									value="20" onclick="checkV()"> <label for="ccheck_20">20대</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_30"
									value="30" onclick="checkV()"> <label for="ccheck_30">30대</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_40"
									value="40" onclick="checkV()"> <label for="ccheck_40">40대</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_50"
									value="50" onclick="checkV()"> <label for="ccheck_50">50대</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_60"
									value="60" onclick="checkV()"> <label for="ccheck_60">60대</label></li>
								<li><input type="checkbox" class="li_check" id="ccheck_70"
									value="70" onclick="checkV()"> <label for="ccheck_70">70대</label></li>
							</ul></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- acd cont end-->
</div>
<div class="content white_bg" id="v_all">
	<ul class="li_name line_tno" id="s">
		<c:forEach items="${list}" var="list">
			<li
				onclick="te('${list.cf_u_id }','${list.cf_u_nm}','${list.cf_u_photo}','${list.cf_u_age}','${list.cf_u_gd}','${list.cf_u_sex }')"
				id="${list.cf_u_id }"
				class="v_all ${list.cf_u_sex } ${fn:substring(list.cf_u_age,0,1)}0 ${list.cf_u_gd }">
				<div class="photo_name">
					<div class="thum_area">
						<div class="thum"
							style="background-image: url(${list.cf_u_photo});"></div>
					</div>
					<div class="text_area">
						<span class="name3">${list.cf_u_nm}</span> <span class="age_rank">(${fn:substring(list.cf_u_age,0,1)}0-${list.cf_u_gd})</span>
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
				$(this).attr("style","background-color:red")
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
		</script>