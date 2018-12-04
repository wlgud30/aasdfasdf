<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="152x152"
	href="/resources/img/favicon_152.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/img/favicon_32.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/favicon.ico">
<meta name="msapplication

-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage"
	content="/resources/img/favicon_144.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>
	$(document).ready(function() {
		$("#c_court_su").change(function(){
			var  chk = $("#c_court_su").val();
			chk = Number(chk);
			for(var i = 1; i<=chk;i++){
				$("#dis_"+i+"").css("display","");
			}
			
			var chkk = 15-chk;
			var vv = chkk;
			var vvv = 0;
			for(var j = 0 ; j<chkk;j++	){
				vv= vv-1;
				vvv = 15-vv;
				$("#dis_"+vvv+"").css("display","none");
			}
			for(var k =1;k<16;k++){
				   $("input:checkbox[id='check_1_"+k+"']").attr("checked", false);
			}
		});
		$("#ClubInsert").click(function() {
			if($("#c_nm").val()==null||$("#c_nm").val()==""){
				swal("MGL","클럽 이름을 작성해 주세요.")
			}else if($("#c_info").val()==null||$("#c_info").val()==""){
				swal("MGL","클럽 소개를 작성해 주세요.")
			}else if($("#cst_nm").val()==null||$("#cst_nm").val()==""){
				swal("MGL","클럽 구장을 작성해 주세요.")
			}else if($("#c_location").val()==null||$("#c_location").val()==""){
				swal("MGL","클럽 모임 주소를 작성해 주세요.")
			}else if($("#c_court_sa").val() == null || $("#c_court_sa").val() == ""){
				swal("MGL","사용하실 코트를 체크해 주세요.")
			}else{
				$.ajax({
					type : 'post',
					data : JSON.stringify({"c_nm" : $("#c_nm").val() ,"c_info" : $("#c_info").val() ,"cst_nm" : $("#cst_nm").val() ,"c_location" : $("#c_location").val() ,"c_court_sa" : $("#c_court_sa").val() ,"c_court_su" : $("#c_court_su").val()}),
					url : "/Club/ClubInsert.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title:"MGL",
								text : "클럽이 생성 되었습니다."
							})
							.then((value) =>{
								location.href='/UClub/UClubAllList.techni';
							})
						}else{
							swal("MGL","죄송합니다. 다시 시도해 주세요.")
						}
						
					},
	error : function(error){
		swal("MGL","error : " + error);
	}
});
			}
		})
		$(".tes").click(function(){
			var str = new Array();
			$("input:checkbox:checked").each(function (index) {  
		        str.push($(this).val());  
		    });  
			$("#c_court_sa").val(str);
		   });
	})

</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo"
						onclick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>클럽생성</h1>
				</div>
				<div class="bt_top">
					<span class="btn_st btn_wh btn_series" onClick="location.href='/UClub/UClubAllList.techni'">취소</span>
					<span id="ClubInsert" class="btn_st btn_wh"
						onclick="location.href='#;'">등록</span>
				</div>
				
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<form id="frm" method="post">
					<table class="table_form">
						<tr>
							<td><input id="c_nm" name="c_nm" type="text" placeholder="클럽(모임) 이름"></td>
						</tr>
						<tr style="height: auto">
							<td><p class="guide_text">소개</p> 
							<textarea class="texbox" id="c_info" name="c_info" placeholder="클럽에 대한 소개를 입력하세요. 
- 클럽 소개 
- 운동시간 등"></textarea></td>
						</tr>
						<tr>
							<td><input  id="cst_nm" name="cst_nm" type="text"
								placeholder="클럽(모임) 홈구장"></td>
						</tr>
						<tr>
							<td><input  id="c_location" name="c_location" type="text"
								placeholder="클럽(모임) 주소"></td>
						</tr>
						<tr>
							<td><span class="guide_text left_guide">전체코트수</span> 
							<select name="c_court_su" id="c_court_su">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4" selected="selected">4</option>
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
							<td><p class="guide_text">사용코트</p>
								<ul class="list_check li_lot">
									<li id="dis_1" style="display:">
										<input type="checkbox" value = 1  class="li_check tes" id="check_1_1">
										<label for="check_1_1">1코트</label>
									</li>
									<li id="dis_2" style="display:">
										<input type="checkbox" value = 2  class="li_check tes" id="check_1_2">
										<label for="check_1_2">2코트</label>
									</li>
									<li id="dis_3" style="display:">
										<input type="checkbox" value = 3  class="li_check tes"  id="check_1_3">
										<label for="check_1_3">3코트</label>
									</li>
									<li id="dis_4" style="display:">
										<input type="checkbox" value = 4 class="li_check tes" id="check_1_4"> 
										<label for="check_1_4">4코트</label>
									</li>
									<li id="dis_5" style="display:none">
										<input type="checkbox" value = 5  class="li_check tes" id="check_1_5" >
										<label for="check_1_5">5코트</label>
									</li>
									<li id="dis_6" style="display:none">
										<input type="checkbox" value = 6  class="li_check tes" id="check_1_6">
										<label for="check_1_6">6코트</label>
									</li>
									<li id="dis_7" style="display:none">
										<input type="checkbox" value = 7  class="li_check tes"  id="check_1_7">
										<label for="check_1_7">7코트</label>
									</li>
									<li id="dis_8" style="display:none">
										<input type="checkbox" value = 8 class="li_check tes" id="check_1_8"> 
										<label for="check_1_8">8코트</label>
									</li>
									
									<li id="dis_9" style="display:none">
										<input type="checkbox" value = 9  class="li_check tes" id="check_1_9">
										<label for="check_1_9">9코트</label>
									</li>
									<li id="dis_10" style="display:none">
										<input type="checkbox" value = 10  class="li_check tes" id="check_1_10">
										<label for="check_1_10">10코트</label>
									</li>
									<li id="dis_11" style="display:none">
										<input type="checkbox" value = 11  class="li_check tes"  id="check_1_11">
										<label for="check_1_11">11코트</label>
									</li>
									<li id="dis_12" style="display:none">
										<input type="checkbox" value = 12 class="li_check tes" id="check_1_12"> 
										<label for="check_1_12">12코트</label>
									</li>
									<li id="dis_13" style="display:none">
										<input type="checkbox" value = 13  class="li_check tes" id="check_1_13">
										<label for="check_1_13">13코트</label>
									</li>
									<li id="dis_14" style="display:none">
										<input type="checkbox" value = 14 class="li_check tes" id="check_1_14">
										<label for="check_1_14">14코트</label>
									</li>
									<li id="dis_15" style="display:none">
										<input type="checkbox" value = 15  class="li_check tes"  id="check_1_15">
										<label for="check_1_15">15코트</label>
									</li>
								</ul></td>
						</tr>
					</table>
					<input type="hidden" name = "c_court_sa" id="c_court_sa">
				</form>
			</div>
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
<!-- InstanceEnd -->
</html>