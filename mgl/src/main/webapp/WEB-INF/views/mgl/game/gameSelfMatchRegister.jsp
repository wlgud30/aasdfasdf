<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function multiInsert(kind){
		var u_id=[];
		var str = "";
		if(kind == "n"){
			$('input[class="li_check ck_rt n"]:checkbox:checked').each(function(){u_id.push($(this).val());});
			str = "등록"
		}else{
			$('input[class="li_check ck_rt y"]:checkbox:checked').each(function(){u_id.push($(this).val());});
			str="취소"
		}
		$.ajax({
			type:"POST",
			url:"/Game/selfMatchMultiJoin.techni",
			dataType:'json',
			data : JSON.stringify({"u_id" : u_id, "cs_idx" : "${cs_idx}", "kind" : kind}),
			contentType : "application/json; charset=UTF-8",
			success:function(data){
				if(data.cnt > 0 ){
					swal({
						title : "민턴in",
						text : "출전 "+str+"  되었습니다.",
						type : "success"
					})
					.then((value) =>{
						location.href="/Game/selfMatchRegister.techni?cs_idx=${cs_idx}"
					})
				}else{
					swal("민턴in", "죄송합니다. 다시 시도 해주세요.");
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}
		});
	
	}
	function multiDelete(){
		var u_id=[];
		$('input[class="li_check ck_rt y"]:checkbox:checked').each(function(){u_id.push($(this).val());});
		$.ajax({
			type:"POST",
			url:"/Cfight/CfightUserDelete.techni",
			dataType:'json',
			data : JSON.stringify({"u_id" : u_id, "cs_idx" : cs_idx}),
			contentType : "application/json; charset=UTF-8",
			success:function(data){
				if(data.cnt > 0 ){
					swal({
						title : "민턴in",
						text : "출전 취소 되었습니다.",
						type : "success"
					})
					.then((value) =>{
						location.href="/Game/selfMatchMultiJoin?cs_idx="+cs_idx;
					})
				}else if(data.list_nm != null){
					swal("민턴in",data.list_nm+"이 현재 팀에 참여중 입니다.")
				}else{
					swal("민턴in", "죄송합니다. 다시 시도 해주세요.");
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}
		});
	}
	function matchSetting(){
		var path = "/Game/selfMatchTypeInsertForm.techni"
		var cs_kind = $("#cs_kind").text();
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
</script>
			<!-- InstanceBeginEditable name="container" -->
			<div class="cat_gray_area">
				<h4 class="title_s">
					<b class="item_divide">출전선수</b>${fn:length(list)} / ${count}
				</h4>
			</div>
			<c:if test="${fn:length(list) ne 0}">
				<div class="content white_bg">
					<div class="btn_full">
						<span class="btn_st btn_color1" onClick="multiInsert('y')">출전취소</span>
					</div>
					<ul class="li_name">
						<c:forEach items="${list }" var="list"><c:set var="j" value="${j+1}" />
							<li>
								<div class="photo_name">
									<div class="thum_area">
										<div class="thum" style="background-image: url(${list.u_photo});"></div>
									</div>
									<div class="text_area">
										<input type="checkbox" class="li_check ck_rt y" id="check_${j}" value="${list.u_id}">
										<label for="check_${j}">
											<span class="name3">${list.u_nm }</span>
											<span class="age_rank">(${fn:substring(list.u_age,0,2)}-${list.u_club_gd})</span>
										</label>
									</div>
								</div>
								<!--photo_name end-->
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<!-- content end -->
			<c:if test="${list2[0].u_id ne null}">
				<div class="content white_bg">
					<div class="btn_full">
						<span class="btn_st" onClick="multiInsert('n')">출전등록</span>
					</div>
					<ul class="li_name">
						<c:forEach items="${list2 }" var="list"><c:set var="i" value="${i+1}" />
							<li>
								<div class="photo_name">
									<div class="thum_area">
										<div class="thum" style="background-image: url(${list.u_photo});"></div>
									</div>
									<div class="text_area">
										<input type="checkbox" class="li_check ck_rt n"  id="register_${i}" value="${list.u_id}">
										<label for="register_${i}">
											<span class="name3">${list.u_nm}</span>
											<span class="age_rank">(${fn:substring(list.u_age,0,2)}-${list.u_club_gd})</span>
										</label>
									</div>
								</div>
								<!--photo_name end-->
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		