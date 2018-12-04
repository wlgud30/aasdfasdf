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
			swal("MGL","제목을 입력해주세요");
			return false;
		}
		if(content == ""){
			swal("MGL","내용을 입력해주세요");
			return false;
		}
		
		$("#b_toti_yn").val("N");
		if($("#check_a").is(":checked")==true){
			$("#b_toti_yn").val("Y");
		}
		swal({
			title : "MGL",
			text : "글을 등록 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
			if(value){
				$.ajax({
					type : 'post',
					data : JSON.stringify({"cb_title" : $("#b_title").val(),"cb_content" : $("#b_content").val() , "cb_yn" : $("#b_toti_yn").val()}),
					url : "/Board/BoardWriteProc.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title:"MGL",
								text : "글이 등록 되었습니다."
							})
							.then((value) =>{
								if($("#b_toti_yn").val()=="Y"){
									location.href="/Board/BoardPush.techni";
								}else{
								location.href='/Board/BoardList.techni'
								}
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
</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top">
					<h1>글쓰기</h1>
				</div>
				<div class="bt_top">
					<span class="la la-paperclip btn_i i-text" onclick="location.href='#'">첨부</span>
					<span class="icon-save icon-f btn_i i-text" onClick="confirm()">등록</span>
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
					<input type="text" placeholder="제목을 입력하세요" id="b_title" name="cb_title">
				</div>
				<div class="side_data">
					<input type="hidden" id="b_toti_yn" name="cb_yn" >
					<input type="checkbox" class="li_check" id="check_a"><label for="check_a">중요공지</label>
				</div>
			</div>
			<!-- title_area end -->
			<div class="content white_bg write_h100">
				<textarea placeholder="회원들에게 전달할 내용을 입력하세요" id="b_content" name="cb_content"></textarea>
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