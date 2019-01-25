<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(document).ready(function() {
	$('#court_${cf_court}').attr('selected','selected');
});
function courtChange(t){
	$("#cf_court").val(t.replace("코트",""));
	$("#frm").submit();
}
function onlyNumber(){
	if((event.keyCode<48)||(event.keyCode>57))
   		event.returnValue=false;
}

function pSubmit(){

	var aScore = $("#aScore").val();
	var bScore = $("#bScore").val();

	if(aScore == ""||bScore ==""||aScore == null||bScore==null){
		swal({
			title : "MGL",
			text : "점수를 입력해주세요."
		})
	}else if(aScore == bScore){
		swal({
			title : "MGL",
			text : "점수가 같습니다. 다시 확인해주세요."
		})
	}else{
		swal({
			title : "MGL",
			text : "점수를 등록하시겠습니까?",
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
					data : JSON.stringify({"a1_id" :"${list[0].cf_at_id1}","a2_id":"${list[0].cf_at_id2}","b1_id":"${list[0].cf_bt_id1}","b2_id":"${list[0].cf_bt_id2}","cf_gidx":"${list[0].cf_gidx}","aScore":aScore,"bScore":bScore}),
					url:"/Cfight/CfightScoreInsert.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title : "MGL",
								text : "점수가 등록되었습니다.",
								type : "success"
							})
							.then((value) =>{
								$("#a1_id").val("${list[2].cf_at_id1}");
								$("#a2_id").val("${list[2].cf_at_id2}");
								$("#b1_id").val("${list[2].cf_bt_id1}");
								$("#b2_id").val("${list[2].cf_bt_id2}");
								$("#court").val("${cf_court}");
								/* $("#frm2").submit(); */
								location.href='/Cfight/CfightReferee.techni'
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
}

</script>
		<form method="post" action="/Cfight/CfightPush.techni" id="frm2">
			<input type="hidden" name="a1_id" id="a1_id"/>
			<input type="hidden" name="a2_id" id="a2_id"/>
			<input type="hidden" name="b1_id" id="b1_id"/>
			<input type="hidden" name="b2_id" id="b2_id"/>
			<input type="hidden" name="court" id="court"/>
		</form>
			<!-- InstanceBeginEditable name="container" -->
			<div class="pd_lrtb white_bg tit_select">
				<ul class="li_col-nol">
					<li>
						<h4 class="title_s"><b>코트선택</b></h4>
						<select onchange="courtChange(this.value)">
							<c:forEach begin="1" end="${court}">
								<c:set var="i" value="${i+1}" />
								<option id="court_${i}">${i}코트</option>
							</c:forEach>
						</select>
					</li>
				<!-- 	<li><ul class="li_col-nol title_s">
							<li><b>전체</b>600</li>
							<li><b>완료</b>201</li>
							<li><b>잔여</b>0</li>
							<li><b>진행율</b>100%</li>
						</ul></li> -->
				</ul>
			</div>
			<form action="/Cfight/CfightReferee.techni" method="post" id="frm"> 
				<input type="hidden" name="cf_court" id="cf_court">
			</form>
			<c:if test="${list  ne null }">
			<c:set var="j" value="${j+1}" />
			<div class="content white_bg pd_0 cet_lay">
			<c:forEach items="${list}" var="list">
			<c:if test="${j eq 1 }">
				<div class="line_dark pd_0">
					<ul class="li_col-nol impot_bg">
						<li>${fn:substring(list.cf_w_date,0,5)}</li>
						<li>${list.cf_court}코트 ${list.cf_no}</li>
						<li>${list.cf_t_nm}</li>
						<li>토너먼트</li>
					</ul>
					<table class="line_no td-pt score-result3">
						<tr>
							<td class="club_name32"><span class="club_name">${list.team_a_nm }</span>
								<ul class="name_col">
									<li>
										<span class="name3">${list.a1_id }</span>
									 	<span class="age_rank">(${list.a1_age }-${list.a1_gd })</span>
									 </li>
									<li>
										<span class="name3">${list.a2_id }</span> 
										<span class="age_rank">(${list.a2_age }-${list.a2_gd })</span>
									</li>
								</ul>
								<div class="score_input_area">
									<input type="text" placeholder="00" class="box_input cet_lay" id ="aScore" maxlength="2" onkeypress="onlyNumber();" >
								</div>
								</td>
							<td class="score2_td"><span class="sign-round color3">진행</span>
							</td>
							<td class="club_name32"><span class="club_name">${list.team_a_nm }</span>
								<ul class="name_col">
									<li><span class="name3">${list.b1_id }</span> <span class="age_rank">(${list.b1_age }-${list.b1_gd })</span></li>
									<li><span class="name3">${list.b2_id }</span> <span class="age_rank">(${list.b2_age }-${list.b2_gd })</span></li>
								</ul>
								<div class="score_input_area">
									<input type="text" placeholder="00" class="box_input cet_lay" id ="bScore" maxlength="2" onkeypress="onlyNumber();">
								</div>
								</td>
						</tr>
					</table>
					<div class="btn_full pd_lrb"><span class="btn_st" onclick="pSubmit()">점수 등록</span></div> 
				</div>
				</c:if>
				<c:if test="${j ne 1 }">
					<ul class="li_col-nol impot_bg">
						<li>${fn:substring(list.cf_w_date,0,5)}</li>
						<li>${list.cf_court}코트 ${list.cf_no}</li>
						<li>${list.cf_t_nm}</li>
						<li>토너먼트</li>
					</ul>
					<table class="line_no td-pt score-result3">
						<tr>
							<td class="club_name32"><span class="club_name">${list.team_a_nm }</span>
								<ul class="name_col">
									<li>
										<span class="name3">${list.a1_id }</span>
									 	<span class="age_rank">(${list.a1_age }-${list.a1_gd })</span>
									 </li>
									<li>
										<span class="name3">${list.a2_id }</span> 
										<span class="age_rank">(${list.a2_age }-${list.a2_gd })</span>
									</li>
								</ul>
								</td>
							<td class="score2_td"><span class="sign-round color2">${list.cf_status }</span>
							</td>
							<td class="club_name32"><span class="club_name">${list.team_a_nm }</span>
								<ul class="name_col">
									<li><span class="name3">${list.b1_id }</span> <span class="age_rank">(${list.b1_age }-${list.b1_gd })</span></li>
									<li><span class="name3">${list.b2_id }</span> <span class="age_rank">(${list.b2_age }-${list.b2_gd })</span></li>
								</ul>
								</td>
						</tr>
					</table>
				</c:if>
				<c:set var="j" value="${j+1}" />
			</c:forEach>
			</div>
			</c:if>
			<!-- content end-->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
		<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
		<script>
		$(document).ready(function() {
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
		});
		</script>