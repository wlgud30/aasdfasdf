<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>
	function multiInsert(){
		var u_id=[];
		$('input[class="li_check ck_rt n"]:checkbox:checked').each(function(){u_id.push($(this).val());});
		$.ajax({
			type:"POST",
			url:"/Cfight/CfightUserInsert.techni",
			dataType:'json',
			data : JSON.stringify({"u_id" : u_id, "cf_idx" : "${cf_idx}"}),
			contentType : "application/json; charset=UTF-8",
			success:function(data){
				if(data.cnt > 0 ){
					swal({
						title : "MGL",
						text : "출전 등록 되었습니다.",
						type : "success"
					})
					.then((value) =>{
						location.href="/Cfight/CfightRegister.techni?cf_idx=${cf_idx}"
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
	function multiDelete(){
		var u_id=[];
		$('input[class="li_check ck_rt y"]:checkbox:checked').each(function(){u_id.push($(this).val());});
		$.ajax({
			type:"POST",
			url:"/Cfight/CfightUserDelete.techni",
			dataType:'json',
			data : JSON.stringify({"u_id" : u_id, "cf_idx" : "${cf_idx}"}),
			contentType : "application/json; charset=UTF-8",
			success:function(data){
				if(data.cnt > 0 ){
					swal({
						title : "MGL",
						text : "출전 취소 되었습니다.",
						type : "success"
					})
					.then((value) =>{
						location.href="/Cfight/CfightRegister.techni?cf_idx=${cf_idx}"
					})
				}else if(data.list_nm != null){
					swal("MGL",data.list_nm+"이 현재 팀에 참여중 입니다.")
				}else{
					swal("MGL", "죄송합니다. 다시 시도 해주세요.");
				}
			},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
	}
</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top">
					<h1 class="game_title">${list[0].cf_nm } 선수등록</h1>
				</div>
				<div class="bt_top">
					<span class="icon-save icon-f btn_i i-text" onClick="location.href='#;'">등록</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="cat_gray_area">
				<h4 class="title_s">
					<b class="item_divide">출전선수</b>${fn:length(list2)} / ${list[0].c_count }
				</h4>
			</div>
			<c:if test="${fn:length(list2) ne 0}">
				<div class="content white_bg">
					<div class="btn_full">
						<span class="btn_st btn_color1" onClick="multiDelete()">출전취소</span>
					</div>
					<ul class="li_name">
						<c:forEach items="${list2 }" var="list"><c:set var="j" value="${j+1}" />
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
			<c:if test="${list[0].u_id ne null}">
				<div class="content white_bg">
					<div class="btn_full">
						<span class="btn_st" onClick="multiInsert()">출전등록</span>
					</div>
					<ul class="li_name">
						<c:forEach items="${list }" var="list"><c:set var="i" value="${i+1}" />
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
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>