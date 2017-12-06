<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[name="phone"]{
width: 50px
}
input[name="phone2"]{
width: 50px
}
input[name="phone3"]{
width: 50px
}
</style>
<script type="text/javascript">
function confirm(bool){
	if(bool=="true"){
		opener.document.getElementsByName("pw")[0].focus();
		opener.document.getElementsByName("id")[0].title="y";
	}else{
		opener.document.getElementsByName("id")[0].focus();
	}
}


function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail){
	document.form.roadAddrPart1.value=roadAddrPart1;
	document.form.addrDetail.value=addrDetail;
}
</script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="js/js.js?var=1">
</script>
</head>
<body>
<h1>회원 가입</h1>
	
	<form action="controller.do" method="post" name="form" id="form">
		<input type = "hidden" name = "command" value= "insert">
		<div id="callBackDiv">
		<table border="1">
			<tr>
				<th>아이디</th>
					<td>
						<input type = "text" name = "id" placeholder = "아이디를 입력하세요." required="required" minLength="6">
						<div class="idchk">아이디는 영어나숫자로 만들어 주세요.</div>
					</td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td>
						<input type = "password" name="pw"  required="required" placeholder = "비밀번호를 입력하세요." minLength="6">
					</td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
					<td><input type = "password" name="pw" required="required" placeholder = "비밀번호를 확인해주세요." minLength="6">
					<div class="pw"></div></td>
			</tr>
			<tr>
				<th>이름</th>
					<td><input type = "text" name= "name" required="required" placeholder = "이름을 입력하세요."></td>
			</tr>
			<tr>
				<th>별명</th>
					<td>
						<input type = "text" name= "nikname" required="required" placeholder = "별명을 입력하세요.">
						<div class="nichk"></div>
					</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
					<input type = "text" id="roadAddrPart1" name= "addr" required="required" readonly="readonly" onClick="goPopup();" placeholder = "주소를 입력해주세요.">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type = "text" name= "subaddr" id="addrDetail" required="required" readonly="readonly" placeholder = "주소를 입력해주세요."></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type = "text" name= "phone"  required="required" placeholder = "전화번호를 입력하세요." maxlength="3">
					- <input type = "text" name= "phone2"  required="required" maxlength="4"minlength="3">
					- <input type = "text" name= "phone3"  required="required"maxlength="4"minlength="4">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type = "email" name= "email"  required="required" placeholder = "이메일을 입력하세요.">
				<div class="emailchk"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" ><input id="a" type ="submit" value="가입"></td>
			</tr>
			
		</table>
		</div>
	</form>
	
</body>
</html>