<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>

	function bbsDel(){
		var cb_idx = "${bvo.cb_idx}";
		swal({
			title : "MGL",
			text : "글을 삭제 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : cb_idx,
						url : "/Board/BoardBbsDel.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt>0){
								swal({
									title:"MGL",
									text : "글이 삭제 되었습니다."
								})
								.then((value) =>{
									location.href='/Board/BoardList.techni'
								})
							}else{
								swal("MGL","죄송합니다. 다시 시도해 주세요.")
							}
							
						},
		error : function(error){
			swal("MGL","error : " + error);
		}
	});
		};
	});
		
	}
	
	function replyDel(cr_idx){
		swal({
			title : "MGL",
			text : "댓글을 삭제 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : cr_idx,
						url : "/Board/BoardReplyDel.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt>0){
								swal({
									title:"MGL",
									text : "댓글이 삭제 되었습니다."
								})
								.then((value) =>{
									location.href='/Board/BoardDetail.techni?cb_idx=${bvo.cb_idx}'
								})
							}else{
								swal("MGL","죄송합니다. 다시 시도해 주세요.")
							}
							
						},
		error : function(error){
			swal("MGL","error : " + error);
		}
	});
		};
	});
		
	}
	
	function reply(){
		if($("#cr_content").val() == "" ){
			swal("MGL","댓글을 입력해주세요.")
			return
		}else{
		$.ajax({
			type : 'post',
			data : JSON.stringify({"cb_idx" : "${bvo.cb_idx}","cr_content" : $("#cr_content").val()}),
			url : "/Board/ReplyInsert.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
						location.href='/Board/BoardDetail.techni?cb_idx=${bvo.cb_idx}'
				}else{
					swal("MGL","죄송합니다. 다시 시도해 주세요.")
				}
				
				},
		error : function(error){
		swal("MGL","error : " + error);
		}
	});
	}
	}
</script>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="location.href='/Board/BoardList.techni'"></div>
				<div class="tit_top"><h2 class="write_title">${bvo.cb_title }</h2></div>
				<!-- InstanceEndEditable -->
				<c:if test="${bvo.u_id == id }">
					<div class="bt_top">
							<span class="icon-note btn_i i-text" onclick="location.href='/Board/BoardBbsUpdateForm.techni?cb_idx=${bvo.cb_idx}'">수정</span>
							<span class="icon-dump icon-f btn_i i-text" onclick="bbsDel()">삭제</span>
					</div>
				</c:if>
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="title_area">
				<div>
					<div class="photo_name">
						<div class="thum_area">
							<div class="thum" style="background-image: url(${bvo.u_photo});"></div>
						</div>
						<div class="text_area">
							<span class="name3">${bvo.u_nm }</span> 
							<span class="date">${bvo.cb_date }</span>
						</div>
					</div>
					<!-- photo_name end-->
				</div>
				<div>
					<ul class="li_small">
						<li><i class="text_i icon-eye"></i>${bvo.h_cnt }</li>
						<li><i class="text_i icon-speech"></i>${fn:length(list) }</li>
					</ul>
				</div>
			</div>
			<!-- title_area end -->
			<div class="content white_bg write_cont">
			${fn:replace(bvo.cb_content, newLineChar, "<br/>")}
			</div>
			<!-- content end -->
			<c:if test="${fn:length(list) ne 0}">
			<div class="content white_bg">
				<ul class="list_st comment_li">
					<c:forEach items="${list }" var="list">
						<li>
							<div class="thum_area">
								<div class="thum" style="background-image: url(${list.u_photo});"></div>
							</div>
							<div class="comment_text">
								<div class="info_li">
									<span class="name3">${list.u_nm}</span>
									<span class="date">${list.cr_date}</span>
									<c:if test="${id eq list.u_id }">
										<span onclick="replyDel('${list.cr_idx}')" class="btn_st btn_wh btn_wh_color1 btn_mini">삭제</span>
									</c:if>
								</div>
								<div class="me_text">${fn:replace(list.cr_content, newLineChar, "<br/>")}</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<div class="talk_feed comment_write">
				<div class="writewrap">
					<textarea rows="1" name = "cr_content" id="cr_content" class="write_text" placeholder="댓글을 남겨주세요."></textarea>
				</div>
				<span class="btn_st" onclick="reply()">댓글</span>
			</div>
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>