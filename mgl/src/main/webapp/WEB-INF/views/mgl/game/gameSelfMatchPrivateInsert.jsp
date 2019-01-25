<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$('#wh option[id=${cs_k_idx}]').attr('selected','selected');
	$('#count option[id=${cs_k_count}]').attr('selected','selected');
});
var team1 = 0;
var team2 = 0;

function selectChange(){
	var cs_k_idx = $("#wh").val();
	location.href="/Game/selfMatchPrivateInsertForm.techni?cs_kind=${cs_kind}&cs_idx=${cs_idx}&cs_k_idx="+cs_k_idx;
}
function appendUl(idd,nm,photo,age,gd,sex,i){
	$("#"+idd).attr("style","display:none");
	$("#appendUl").append("<li id = 're_"+idd+"'><div class='photo_name'><div class='thum_area'><div class='thum' style='background-image: url("+photo+")'></div>"
	+"</div><div class='text_area'> <span class='name3'>"+nm+"</span><span class='age_rank'>("+age+"-"+gd+")</span></div>"
	+"<div class='icon_btn small_s'><span onclick=\"ulRemove('re_"+idd+"')\"  class='icon-remove' title='remove'></span></div></div></li>");
	options();
}
function ulRemove(idd){
	$("#"+idd).remove();
	$("#"+idd.substring(3,idd.length)).attr("style","display:''");
	options();
}
function Remove(idd,nm,photo,age,gd,sex){
	$("#re_"+idd).remove();
	var i = $("#appendUl_").length
	$("#appendUl_").prepend("<li onclick=\"appendUl('"+idd+"','"+nm+"','"+photo+"','"+age+"','"+gd+"','"+sex+"','"+i+"')\" id='"+idd+"'><div class='photo_name'><div class='thum_area'><div class='thum' style=\"background-image: url("+photo+");\"></div></div><div class='text_area'><span class='name3'>"+nm+"</span><span class='age_rank'>("+age+"-"+gd+")</span></div></div></li>")
	options();	
}
function privateLeagueInsert(){
	if($("#appendUl li").length < 4){
		swal("MGL" ,"최소 4명이 필요합니다.")
	}else if($("#count").val()==0 || $("#count").val()==null){
		swal("MGL","경기수를 선택해 주세요")
	}else{
		var cs_k_idx = $("#wh").val();
		var user_id ="";
		$("#user_id").val();
		$("#appendUl li").each(function(){
			user_id += $(this).attr("id").substring(3,$(this).attr("id").length)+",";
		});
		$.ajax({
			type:"POST",
			url:"/Game/selfMatchPrivateInsert.techni",
			dataType:'json',
			data : JSON.stringify({"user_id" : user_id.substring(0,user_id.length-1), "cs_k_idx" : cs_k_idx,"cs_idx" : "${cs_idx}","count" : $("#count").val()}),
			contentType : "application/json; charset=UTF-8",
			success:function(data){
				if(data.cnt > 0 ){
					swal({
						title : "MGL",
						text : "등록 되었습니다.",
						type : "success"
					})
					.then((value) =>{
						location.href="/Game/selfMatchPrivateInsertForm.techni?cs_kind=${cs_kind}&cs_idx=${cs_idx}"+"&cs_k_idx="+cs_k_idx;
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
</script>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="matchSetting()"><span>조별(종목)</span>
		</li>
		<li class="active_tab"  onClick="teamSetting(${cs_kind})"><span>선수구분</span>
		</li>
	</ul>
</div>
			<div class="tit_select cet_lay">
				<ul class="li_col-nol">
					<li>
						<h4 class="title_s" style="margin-top: 10px;">
							<b>구분(종목)</b>
						</h4> 
						<select id="wh" name="wh" onchange="selectChange()">
							<c:forEach items="${list0 }" var="list">
								<option id="${list.cs_k_idx}" value="${list.cs_k_idx}">${list.cs_k_nm }</option>
							</c:forEach>
						</select>
						<h4 class="title_s">
							<b>경기수</b>
						</h4> 
						<select id="count" name="count" >
								<option id="0" value="0">선택</option>
								<option id="1" value="1">1</option>
								<option id="2" value="2">2</option>
								<option id="3" value="3">3</option>
								<option id="4" value="4">4</option>
								<option id="5" value="5">5</option>
								<option id="6" value="6">6</option>
								<option id="7" value="7">7</option>
								<option id="8" value="8">8</option>
								<option id="9" value="9">9</option>
						</select>
					</li>
				</ul>
			</div>
			<div class="content white_bg visible_area_ul" id="appendDiv">
				<ul class="li_name line_tno" id="appendUl">
					<c:forEach items="${list}" var="list">
						<li id="re_${list.u_id}" class="dataN">
							<div class="photo_name">
								<div class="thum_area">
									<div class="thum" style="background-image: url(${list.u_photo})"></div>
								</div>
								<div class="text_area">
									 <span class="name3">${list.u_nm}</span>
									 <span class="age_rank">(${fn:substring(list.u_age,0,1)}0대-${list.u_club_gd})</span>
								</div>
								<div class="icon_btn small_s">
									<span onclick="Remove('${list.u_id}','${list.u_nm}','${list.u_photo}','${fn:substring(list.u_age,0,1)}0대','${list.u_club_gd}','${list.u_sex }')" class="icon-remove" title="remove"></span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="content white_bg ">
				<div class="btn_full pd_lrtb mb_b0">
					<span class="btn_st" onClick="privateLeagueInsert()">등록</span>					
				</div>			
			</div>
			<!-- content end-->
			<!-- content end -->
			<div class="content white_bg">
				<ul class="li_name line_tno" id="appendUl_">
				<c:forEach items="${list2}" var="list">
				<c:set var="i" value="${i+1}" />
					<li onclick="appendUl('${list.u_id }','${list.u_nm}','${list.u_photo}','${fn:substring(list.u_age,0,1)}0대','${list.u_club_gd}','${list.u_sex }','${i}')" id="${list.u_id }" >
						<div class="photo_name">
							<div class="thum_area">
								<div class="thum" style="background-image: url(${list.u_photo});"></div>
							</div>
							<div class="text_area">
								<span class="name3">${list.u_nm}</span>
								<span class="age_rank">(${list.u_age}-${list.u_club_gd})</span>
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
	<!-- wrap end -->
	<script>
	function matchSetting(){
		var path = "/Game/selfMatchTypeInsertForm.techni"
		var cs_kind = "${cs_kind}"
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action",path)
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","cs_kind");
			hiddenField.setAttribute("value",cs_kind);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
	}
	function teamSetting(kind){
		if(kind=="개인리그전"){
			var path = "/Game/selfMatchPrivateInsertForm.techni"
		}else{
			var path = "/Game/selfMatchTeamInsertForm.techni"	
		}
		var cs_kind = "${cs_kind}"
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action",path)
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","cs_kind");
			hiddenField.setAttribute("value",cs_kind);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
	}
	function options(){
		$(".prettydropdown:eq(2) ul li").each(function(){
			var n = Number($(this).attr('data-value'));
 			if($("#appendUl li").length * n %4 != 0){
				$(this).css('display','none');
			}else{
				$(this).css('display','');
			}
 			if($("#appendUl li").length <= n){
				$(this).css('display','none');
			}
		});
	}
	$(document).ready(function() {
		$(".prettydropdown:eq(0)  label:eq(0)").remove();
		$(".prettydropdown:eq(0)  label:eq(0)").remove();
		$(".prettydropdown:eq(2)  label:eq(0)").remove();
		$(".prettydropdown:eq(2)  label:eq(0)").remove();
		$("#appendDiv").attr("style","display:''");
		options()
	});
	</script>
</body>
</html>