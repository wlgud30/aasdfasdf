<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="pd_lrb">
	<table class="table_form">
		<tr>
			<td><b class="item_divide">코트선택</b> <select onchange="change(this.value)" id="nCourt">
					<c:forEach items="${list}" var="list">
						<c:set var="i" value="${i+1}" />
						<option id="court_${i}">${i}코트</option>
					</c:forEach>
			</select></td>
		</tr>
	</table>
</div>
<%-- <c:forEach items="${list }" var="list"> --%>
<c:set var="j" value="${j+1}" />
<div class="content white_bg pd_0 cet_lay" id="add">
	<c:forEach items="${listC}" var="list">
		<c:if test="${j eq 1 }">
			<div class="line_dark pd_0">
				<ul class="li_col-nol impot_bg">
					<li>${fn:substring(list.ct_w_dat,0,5)}</li>
					<fmt:parseNumber var="pages" integerOnly="true" value="${list2.ct_num/all_court+(1-(list2.ct_num/all_court%1))%1+1}"/>
					<li>${list.ct_court}코트${pages}경기</li>
					<li>${list.ct_k_nm}</li>
					<li>토너먼트</li>
				</ul>
				<table class="line_no td-pt score-result3">
					<tr>
						<td class="club_name32"><span class="club_name">${list.team_a_nm }</span>
							<ul class="name_col">
								<li><span class="name3">${list.a1_nm }</span> <span
									class="age_rank">(${list.a1_age }-${list.a1_gd })</span></li>
								<li><span class="name3">${list.a2_nm }</span> <span
									class="age_rank">(${list.a2_age }-${list.a2_gd })</span></li>
							</ul>
							<div class="score_input_area">
								<input type="number" placeholder="00" class="box_input cet_lay"
									id="aScore" maxlength="2" >
							</div></td>
						<td class="score2_td"><span class="sign-round color3">진행</span>
						</td>
						<td class="club_name32"><span class="club_name">${list.team_a_nm }</span>
							<ul class="name_col">
								<li><span class="name3">${list.b1_nm }</span> <span
									class="age_rank">(${list.b1_age }-${list.b1_gd })</span></li>
								<li><span class="name3">${list.b2_nm }</span> <span
									class="age_rank">(${list.b2_age }-${list.b2_gd })</span></li>
							</ul>
							<div class="score_input_area">
								<input type="number" placeholder="00" class="box_input cet_lay"
									id="bScore" maxlength="2">
							</div></td>
					</tr>
				</table>
				<div class="btn_full pd_lrb">
					<span class="btn_st" onclick="pSubmit()">점수 등록</span>
				</div>
			</div>
			<input type="hidden" value="${list.ct_at_id1}" name="a1_id" id="a1_id">
			<input type="hidden" value="${list.ct_at_id2}" name="a2_id" id="a2_id">
			<input type="hidden" value="${list.ct_bt_id1}" name="b1_id" id="b1_id">
			<input type="hidden" value="${list.ct_bt_id2}" name="b2_id" id="b2_id">
			<input type="hidden" value="${list.ct_gidx}" name="ct_gidx" id="ct_gidx">
			<input type="hidden" value="${list.team_a_idx}" name="aTeam" id="aTeam">
			<input type="hidden" value="${list.team_b_idx}" name="bTeam" id="bTeam">
		</c:if>
		<c:if test="${j ne 1 }">
			<ul class="li_col-nol impot_bg">
				<li>${fn:substring(list.ct_w_dat,0,5)}</li>
				<fmt:parseNumber var="pages" integerOnly="true"
					value="${list.ct_num/all_court+(1-(list.ct_num/all_court%1))%1}" />
				<li>${list.ct_court}코트${pages}경기</li>
				<li>${list.ct_k_nm}</li>
				<li><c:choose><c:when test="${fn:contains(list.ct_gidx,'win') eq 'true'}">본선</c:when><c:otherwise>예선</c:otherwise> </c:choose></li>
			</ul>
			<table class="line_no td-pt score-result3">
				<tr>
					<td class="club_name32"><span class="club_name"><c:choose><c:when test="${fn:substring(list.ct_gidx,14,15) eq 'true' }"> ${fn:substring(list.team_a_idx,14,15)+1}그룹 1위</c:when><c:otherwise>${list.team_a_nm }</c:otherwise> </c:choose></span>
						<ul class="name_col">
							<li><span class="name3">${list.a1_nm }</span> <span
								class="age_rank">(${list.a1_age }-${list.a1_gd })</span></li>
							<li><span class="name3">${list.a2_nm }</span> <span
								class="age_rank">(${list.a2_age }-${list.a2_gd })</span></li>
						</ul></td>
					<td class="score2_td"><span class="sign-round color2">${list.ct_status }</span>
					</td>
					<td class="club_name32"><span class="club_name"><c:choose><c:when test="${fn:substring(list.ct_gidx,14,15) eq 'true' }"> ${fn:substring(list.team_b_idx,14,15)+1}그룹 1위</c:when><c:otherwise>${list.team_b_nm }</c:otherwise> </c:choose></span>
						<ul class="name_col">
							<li><span class="name3">${list.b1_nm }</span> <span
								class="age_rank">(${list.b1_age }-${list.b1_gd })</span></li>
							<li><span class="name3">${list.b2_nm }</span> <span
								class="age_rank">(${list.b2_age }-${list.b2_gd })</span></li>
						</ul></td>
				</tr>
			</table>
		</c:if>
		<c:set var="j" value="${j+1}" />
	</c:forEach>
</div>
<%-- </c:forEach> --%>
<!-- content end-->
<script>
function change(court){
	$.ajax({
		async : true,
		type:"post",
		data : court.replace("코트",""),
		url : "/Contest/ContestReferee2.techni",
		datatype : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$("#add").empty();
			$("#add").append(data.str);
		},
		error : function(error){
			swal("민턴in","error : "+error);
		}
	}) 
}
function pSubmit(){

	var aScore = $("#aScore").val();
	var bScore = $("#bScore").val();
	alert($("#aTeam").val());
	alert($("#bTeam").val());
	if(aScore == ""||bScore ==""||aScore == null||bScore==null){
		swal({
			title : "민턴in",
			text : "점수를 입력해주세요."
		})
	}else if(aScore == bScore){
		swal({
			title : "민턴in",
			text : "점수가 같습니다. 다시 확인해주세요."
		})
	}else{
				$.ajax({
					async : true,
					type:"post",
					data : JSON.stringify({"a1_id" :$("#a1_id").val(),"a2_id":$("#a2_id").val(),"b1_id":$("#b1_id").val(),"b2_id":$("#b2_id").val(),"ct_gidx":$("#ct_gidx").val(),"aScore":aScore,"bScore":bScore,"aTeam" : $("#aTeam").val(),"bTeam" : $("#bTeam").val()}),
					url:"/Contest/ContestPointInsert.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							change($("#nCourt").val().substring( 0, $("#nCourt").val().length-2 ));
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
					},
					error : function(error){
						swal("민턴in","error : "+error);
						alert("code:"+error.status+"\n"+"message:"+error.responseText+"\n"+"error:"+error);
					}
				}) 
			
	}
}
</script>