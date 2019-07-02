<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>민턴in</title>
<!-- InstanceEndEditable -->
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="196x196" href="/resources/img/favicon_196.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon_32.png">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/ctW_css/css.css?ver2" type="text/css">
<script src="/resources/ctW_js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/ctW_css/prettydropdowns.css?ver1" type="text/css">
<script src="/resources/ctW_js/jquery.prettydropdowns.js"></script>
<script src="/resources/ctW_js/js_st.js?ver6"></script>
<script src="/resources/ctW_js/Navi.js?ver5"></script>
<script src="/resources/ct_js/hello.js?ver4"></script>

</head>

</head>
<body>
	<div id="wrap">
    	<tiles:insertAttribute name="leftWeb2" ignore="true"/>
    	<div id="bodyzone">
    		<tiles:insertAttribute name="headerWeb2" ignore="true"/>
    		<div id="container">
	    		<tiles:insertAttribute name="body2" ignore="true"/>
	    	</div>
    	</div>
	</div>

    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>

</html>