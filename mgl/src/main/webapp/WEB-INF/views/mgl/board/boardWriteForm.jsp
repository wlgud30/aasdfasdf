<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
		
		$("#b_toti_yn").val("N");
		if($("#check_a").is(":checked")==true){
			$("#b_toti_yn").val("Y");
		}
		swal({
			title : "민턴in",
			text : "글을 등록 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
			if(value){
				$.ajax({
					type : 'post',
					data : JSON.stringify({"cb_title" : $("#b_title").val(),"cb_content" : $("#b_content").val() , "cb_yn" : $("#b_toti_yn").val(),"c_idx" : "${CIDX}"}),
					url : "/Board/BoardWriteProc.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
								location.href='/Board/BoardList.techni'
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
	
		<form id="frm" action="" method="post" style="height: 800px;">		
		<input type="hidden" id="b_regdate" name="cb_date" value=""/>

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
			<div class="content white_bg write_h100 write_board">
				<textarea placeholder="회원들에게 전달할 내용을 입력하세요" id="b_content" name="cb_content"></textarea>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
	</form>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>