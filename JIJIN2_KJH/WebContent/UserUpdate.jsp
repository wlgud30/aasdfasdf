<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
		
	}
	function jusoCallBack(roadAddrPart1, addrDetail) {
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
	}
	$(function(){
		var a ="";
		 a = ""+${dto.phone};
		 alert(typeof(a));
		$("input").eq(7).val(a.toString().substr(0,3));
		$("input").eq(8).val(a.toString().substr(4,7));
		$("input").eq(9).val(a.toString().substr(8,11));
		
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="controller.do" method="post" name="form" id="form">
		<input type="hidden" name="command" value="update"> <input
			type="hidden" name="no" value="${dto.no }"> <input
			type="hidden" name="id" value="${dto.id }"> <input
			type="hidden" name="pw" value="${dto.pw }">
		<div id="callBackDiv">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>${dto.id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.name }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" minLength="6"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="pw" minLength="6">
						<div class="pw"></div></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${dto.nikname }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="${dto.email }" name="email">
						<div class="emailchk"></div></td>
				</tr>
				<tr>
					<th>전화번호</th>
					
					<td><input type="text" name="phone" maxlength="3">
						- <input type="text" name="phone2" required="required" maxlength="4" minlength="3"> 
						- <input type="text" name="phone3" required="required" maxlength="4" minlength="4">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" value="${dto.addr }" id="roadAddrPart1"
						onClick="goPopup();" name="addr"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" value="${dto.subaddr }" name="subaddr"
						id="addrDetail"></td>
				</tr>
				<tr>
					<th>인풋12</th>
					<td><input type="text"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="수정완료"></td>
				</tr>
			</table>
		</div>
	</form>

</body>
</html>