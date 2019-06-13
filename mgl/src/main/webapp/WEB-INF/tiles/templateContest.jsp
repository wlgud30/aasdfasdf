<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<title>민턴in</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="/resources/ct_css/login.css?ver5" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="152x152" href="/resources/img/favicon_152.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon_32.png">        
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<link rel="icon" type="image/png" sizes="196x196" href="/resources/img/favicon_196.png">
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="/resources/img/favicon_144.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/ct_css/css.css?ver8" type="text/css" />
<link rel="stylesheet" href="/resources/ct_css/swiper.css?ver7">
<script src="/resources/ct_js/jquery-3.3.1.min.js"></script>
<script src="/resources/ct_js/swiper.min.js?ver2"></script>
<script src="/resources/ct_js/js_st.js?ver6"></script>
<script src="/resources/ct_js/jquery.form.min.js"></script>
<script src="/resources/ct_js/Navi.js?ver5"></script>
<script src="/resources/ct_js/sweetalert.min.js?ver3"></script>
<link rel="stylesheet" href="/resources/ct_css/prettydropdowns.css?ver3" type="text/css" />
<script src="/resources/ct_js/jquery.prettydropdowns.js?ver3"></script>
<link href="/resources/dist/css/material_blue.css?ver3" rel="stylesheet" type="text/css">
<script src="/resources/dist/js/flatpickr.js?ver3"></script>
<link  href="/resources/dist/css/picker.css?ver3" rel="stylesheet">
<script src="/resources/dist/js/picker.js?ver3"></script>

</head>
<body>
	<div id="wrap">
    	<header id="header" class="head_el">
    		<tiles:insertAttribute name="header_ct" ignore="true"/>
    	</header>
    	<tiles:insertAttribute name="contestHeader" ignore="true"/>
    	<div id="container">
	    	<tiles:insertAttribute name="body" ignore="true"/>
	    </div>
	</div>
 
    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>
</html>