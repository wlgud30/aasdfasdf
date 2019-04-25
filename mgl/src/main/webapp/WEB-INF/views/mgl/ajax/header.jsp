<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="152x152" href="/resources/img/favicon_152.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon_32.png">        
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<link rel="icon" type="image/png" sizes="196x196" href="/resources/img/favicon_196.png">
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="/resources/img/favicon_144.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/css.css?ver3" type="text/css" />
<link rel="stylesheet" href="/resources/css/swiper.css">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js_st.js?ver4"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/Navi.js?ver5"></script>
<script src="/resources/js/sweetalert.min.js?ver2"></script>
<link rel="stylesheet" href="/resources/css/prettydropdowns.css?ver3" type="text/css" />
<script src="/resources/js/jquery.prettydropdowns.js?ver3"></script>
<%
if(session.getAttribute("login")==null){
%>
<script>
var ua = navigator.userAgent
var a = navigator.userAgent.indexOf("AL:");
var b = navigator.userAgent.indexOf("ID:");
var c = navigator.userAgent.indexOf("PW:")
var d = navigator.userAgent.indexOf("TOKEN:")
var au = "${au}";
if(au != "1"){
	location.href='/Member/pushLogin.techni?m_push='+ua.substr(d+6,a-d-6)
}else{
	location.href='/Member/LoginForm.techni'
}
</script>
<%
}
%>
<script type="text/javascript">
function pushTok(token,msg,url){
	var PostString_link ="";
	
	PostString_link = "sendtype=push"
	PostString_link = PostString_link+"&appcode=techni_mglb"
	PostString_link = PostString_link+"&notitype=noti"
	PostString_link = PostString_link+"&oscode=a"
	PostString_link = PostString_link+"&token="+token
	PostString_link = PostString_link+"&title=MGL"
	PostString_link = PostString_link+"&desc="+encodeURI(msg)
	PostString_link = PostString_link+"&dataval="+encodeURI(url)
	
	$.ajax({
		url : "/Member/token.techni",
		type : 'post',
		data : PostString_link,
		contentType : "application/x-www-form-urlencoded",
		charset : "UTF-8",
		success : function(){
		}
	})

}
</script>

