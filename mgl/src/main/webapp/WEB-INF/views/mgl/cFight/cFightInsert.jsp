<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>
$(document).ready(function() {
	
});
var q = 1
function append(i,t){
	<c:set var="i" value="${i+1}" />
	q++;
	t.className="i_btn i-minus"
	$(t).attr("onclick","minus(this,"+(q-1)+")");
	$("#trAppend").append(
	"<tr id='abcd_"+(q)+"'><td class='no_td'><input id='no_"+q+"' class='no cet_lay' name='no' type='text' value="+q+"></td><td class='ga_title'><input type='text' class='type' id ='type_"+q+"' name='type' placeholder='구분(종목) 입력'></td><td class='score_nol_td'><select class= 'kind' name='kind' id='kind_"+q+"'><option value='혼복' selected='selected'>혼복</option><option value='남복'>남복</option><option value='여복'>여복</option></select></td><td class='i_btn_td'><span id ='ad_"+q+"' onclick='append("+q+",this)' class='i_btn i-plus'></span></td></tr>"
	);
}

function minus(t,i){
	$("#abcd_"+i).remove();
	var a = i;
	var b = $("#trAppend tr").length;
	for(var j = a; j<=b;j++){
		$("#abcd_"+(j+1)).attr("id","abcd_"+j);
		$("#no_"+(j+1)).attr("value",j);
		$("#no_"+(j+1)).attr("id","no_"+j);
		$("#type_"+(j+1)).attr("id","type_"+j);
		$("#kind_"+(j+1)).attr("id","kind_"+j);
		$("#ad_"+(j+1)).attr("onclick","minus(this,"+j+")")
		$("#ad_"+(j+1)).attr("id","ad_"+j);
	}
	$("#abcd_"+(b)).attr("id","abcd_"+b);
	$("#no_"+(b)).attr("value",b);
	$("#no_"+(b)).attr("id","no_"+b);
	$("#type_"+(b)).attr("id","type_"+b);
	$("#kind_"+(b)).attr("id","kind_"+b);
	$("#ad_"+(b)).attr("onclick","append("+b+",this)")
	$("#ad_"+(b)).attr("id","ad_"+b);
	q--
}
function clubAttend(nm,idx){
	nm = $("#"+nm).val();
	if(nm == ""){
		swal("MGL","클럽 이름을 입력해 주세요.");
		return false;
	}else{
		alert(nm)
	$.ajax({
		async : true,
		type:"post",
		url:"/Cfight/SelectCidx.techni",
		data : nm,
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data.cnt>0){
				$("#"+idx).val(data.c_idx);
			}else{
				$("#"+idx).val("");
				swal("MGL","클럽 이름을 확인해주세요.")
			}
		},
		error : function(error){
			swal("MGL","error : "+error);
		}
	}) 
	}
}
function formSubmit(){
	alert($("#frm").serialize());
	if($("#cf_nm").val()=="" || $("#cf_nm").val()==null){
		swal("MGL","대회 명을 입력해 주세요.");
		return false;
	}
	if($("#cf_start").val()=="" || $("#cf_start").val()==null){
		swal("MGL","대회 일자를 입력해 주세요.");
		return false;
	}
	if($("#cf_sTime1").val()=="" || $("#cf_sTime1").val()==null ||$("#cf_sTime2").val()=="" || $("#cf_sTime2").val()==null){
		swal("MGL","대회 시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_eTime1").val()=="" || $("#cf_eTime1").val()==null ||$("#cf_eTime2").val()=="" || $("#cf_eTime2").val()==null){
		swal("MGL","대회 시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_point").val()=="" || $("#cf_point").val()==null){
		swal("MGL","점수를 입력해 주세요.");
		return false;
	}
	if($("#cf_time").val()=="" || $("#cf_time").val()==null){
		swal("MGL","소요시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_end").val()=="" || $("#cf_end").val()==null){
		swal("MGL","등록마감 시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_cnm").val()=="" || $("#cf_cnm").val()==null){
		swal("MGL","체육관 명을 입력해 주세요.");
		return false;
	}
	if($("#cf_location").val()=="" || $("#cf_location").val()==null){
		swal("MGL","체육관 위치를 입력해 주세요.");
		return false;
	}
	if(!$('input:radio[name=cf_meth]').is(':checked')){
		swal("MGL","대회 방식을 입력해 주세요.");
		return false;
	}
	if($("#c1_idx").val()=="" || $("#c1_idx").val()==null && $("#c2_idx").val()=="" || $("#c2_idx").val()==null &&$("#c3_idx").val()=="" || $("#c3_idx").val()==null ){
		swal("MGL","참여 클럽을 입력해 주세요.");
		return false;
	}
	if($("#cf_body").val()=="" || $("#cf_body").val()==null){
		swal("MGL","대회 소개를 입력해 주세요.");
		return false;
	}
	var b = $("#trAppend tr").length;
	alert(b);
	for(var i = 1 ; i<b;i++){
		if($("#no_"+i).val() == "" || $("#no_"+i).val() == null){
			swal("MGL","게임 순서를 입력해 주세요.");
			return false;
		}
		if($("#type_"+i).val() == "" || $("#type_"+i).val() == null){
			swal("MGL","종목을 입력해 주세요.");
			return false;
		}
		if($("#kind_"+i).val() == "" || $("#kind_"+i).val() == null){
			swal("MGL","종류를 입력해 주세요.");
			return false;
		}
	}
	var fs = $("#frm").serialize();
	swal({
		title : "MGL",
		text : "대항전을 등록하시겠습니까?",
		buttons : {
			confirm : "OK",
			cancel : "NO"
		}
	})
	.then((value) => {
		if(value){
			$.ajax({
				type:"post",
				data : fs,
				url : "/Cfight/CfightInsert.techni",
				datatype : "json",
				success : function(data){
					if(data.cnt>0){
						swal({
							title : "MGL",
							text : "대항전이 등록되었습니다.",
							type : "success"
						})
						.then((value) =>{
							 location.href="/Board/BoardList.techni";
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
<body>
	<div id="wrap">
		<header>
		<div class="head_top">
			<!-- InstanceBeginEditable name="head_top" -->
			<div class="btn_back" onClick="history.back();"></div>
			<div class="tit_top">
				<h1>대회생성</h1>
			</div>
			<div class="bt_top">
				<!-- <span class="icon-match icon-f btn_i i-text">대진표생성</span>  -->
				<span class="icon-save icon-f btn_i i-text" onclick="formSubmit()">등록</span>
			</div>
			<!-- InstanceEndEditable -->
		</div>
		<!-- head_top end --> </header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<form id="frm">
			<div class="content white_bg">
				<table class="table_form">
					<tr>
						<td><input type="text" placeholder="대회명" name="cf_nm" id="cf_nm"></td>
					</tr>
					<tr>
						<td><div class="col_2input">
								<div>
									<p class="guide_text">대회일자</p>
									<input type="text" class="date_pick" name="cf_start" id="cf_start">
									<span class="date_icon_btn" onclick="location.href='#;'"></span>
								</div>
								<div>
									<p class="guide_text">대회시간</p>
									<input type="text" name="cf_sTime1" id="cf_sTime1" class="time_input" placeholder="00" maxlength="2">
									<span class="second_i"></span>
									<input type="text" name="cf_sTime2" id="cf_sTime2"class="time_input" placeholder="00" maxlength="2">
									<span class="time_line_i"></span>
									<input type="text" name="cf_eTime1" id="cf_eTime1"class="time_input" placeholder="00" maxlength="2">
									<span class="second_i"></span>
									<input type="text" name="cf_eTime2" id="cf_eTime2"class="time_input" placeholder="00" maxlength="2">
								</div>
							</div></td>
					</tr>
					<tr>
						<td><div class="col_2input wauto">
								<div>
									<span class="guide_text left_guide">점수</span>
									<input type="text" name="cf_point" id="cf_point"class="time_input" placeholder="00" maxlength="2">
								</div>
								<div>
									<span class="guide_text left_guide">소요분</span>
									<input name="cf_time" id="cf_time"type="text" class="time_input" placeholder="00" maxlength="2">
								</div>
							</div></td>
					</tr>
					<tr>
						<td><span class="guide_text left_guide">등록마감</span>
						<input type="text" name="cf_end" id="cf_end" class="date_pick">
						<span class="date_icon_btn" onclick="location.href='#;'"></span></td>
					</tr>
					<tr>
						<td><input type="text" name="cf_cnm" id="cf_cnm" placeholder="대회 체육관"></td>
					</tr>
					<tr>
						<td><input type="text" name="cf_location" id="cf_location" placeholder="체육관 위치"></td>
					</tr>
					<tr>
						<td><span class="guide_text left_guide">전체코트수</span> 
						<select name="cf_court">
								<option value="1" selected="selected">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
						</select></td>
					</tr>
					<tr>
						<td><p class="guide_text">대회방식</p>
							<ul class="list_check">
								<!-- <li><input type="radio" name="choice" class="check_circle"
									id="check_1" value="check"><label for="check_1">청백전</label></li>
								<li><input type="radio" name="choice" class="check_circle"
									id="check_2" value="check"><label for="check_2">개인리그전</label></li> -->
								<li><input type="radio" name="cf_meth" class="check_circle" id="check_3" value="팀리그전"><label for="check_3">팀리그전</label></li>
							</ul></td>
					</tr>
					<tr>
						<td><p class="guide_text">주최클럽</p>${c_nm}</td>
					</tr>
				</table>

				<p class="guide_text">참여클럽</p>
				<table class="table_form td_pdr">
					<tr>
						<td><input type="text" id="c1_nm" placeholder="클럽 이름"><input type="hidden" name="c_idx" id="c1_idx"></td>
						<td class="btn_td"><span class="btn_st btn_wh" onclick="clubAttend('c1_nm','c1_idx')">확인</span></td>
					</tr>
					<tr>
						<td><input type="text" id="c2_nm"  placeholder="클럽 이름"><input type="hidden" name="c_idx" id="c2_idx"></td>
						<td class="btn_td"><span class="btn_st btn_wh" onclick="clubAttend('c2_nm','c2_idx')">확인</span></td>
					</tr>
					<tr>
						<td><input type="text" id="c3_nm"  placeholder="클럽 이름"><input type="hidden" name="c_idx" id="c3_idx"></td>
						<td class="btn_td"><span class="btn_st btn_wh" onclick="clubAttend('c3_nm','c3_idx')">확인</span></td>
					</tr>
				</table>
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td><textarea class="texbox" name="cf_body" id="cf_body" placeholder="클럽 자체 대회에 대한 간단한 소개"></textarea></td>
					</tr>
				</table>
				<hr class="gap_m">
				<table class="game_td thead_td cet_lay td_pd_l0">
					<thead>
						<tr>
							<th class="no_td">게임순서</th>
							<th>구분(종목)</th>
							<th class="team_nb">종류</th>
							<th class="i_btn_td"></th>
						</tr>
					</thead>
					<tbody id="trAppend">
						<tr id="abcd_1">
							<td class="no_td"><input type="text" class='no cet_lay' value="1" name="no" id="no_1"></td>
							<td class="ga_title"><input type="text" class='type' placeholder="구분(종목) 입력" id="type_1"name="type"></td>
							<td class="score_nol_td">
								<select class= "kind" name="kind" id="kind_1">
										<option value="혼복" selected="selected">혼복</option>
										<option value="남복">남복</option>
										<option value="여복">여복</option>
								</select>
							</td>
							<td class="i_btn_td"><span id="ad_1" onclick="append(1,this)" class="i_btn i-plus"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
			</form>
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>