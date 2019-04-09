<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<script type="text/javascript">
	String.prototype.sTrim = function(){
		return this.replace(/^\s+|\s+$/g, "");
	}

	function confirm(){
		
		var title = $("#b_title").val().sTrim();
		var content = $("#b_content").val().sTrim();
		
		if(title == ""){
			swal("민턴in","제목을 입력해주세요");
			return false;
		}
		if(content == ""){
			swal("민턴in","내용을 입력해주세요");
			return false;
		}
		
		swal({
			title : "민턴in",
			text : "글을 저장 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
			if(value){
				$.ajax({
					type : 'post',
					data : JSON.stringify({"cb_title" : $("#b_title").val(),"cb_content" : $("#b_content").val(),"cb_idx" : "${bvo.cb_idx}"}),
					url : "/Board/BoardBbsUpdate.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title:"민턴in",
								text : "글이 수정 되었습니다."
							})
							.then((value) =>{
								location.href='/Board/BoardList.techni'
							})
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
						
					},
			error : function(error){
				swal("민턴in","error : " + error);
			}
		});
			};
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
					<h1>글 수정하기</h1>
				</div>
				<div class="bt_top">
					<span class="la la-paperclip btn_i" onclick="location.href='#'"></span>
					<span class="btn_st btn_wh" onClick="confirm()">저장</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<form id="frm" action="" method="post">		
		<input type="hidden" id="b_regdate" name="cb_date" value=""/>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="title_area col-inputside col2s">
				<div>
					<input type="text" id="b_title" name="cb_title" value="${bvo.cb_title }">
				</div>
			</div>
			<!-- title_area end -->
			<div class="content white_bg write_h100">
				<textarea id="b_content" name="cb_content">${bvo.cb_content }</textarea>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
	</form>
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