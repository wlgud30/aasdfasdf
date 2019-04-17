<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<title>민턴in</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="/resources/css/login.css?ver4" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
</head>
<body>
	<div id="wrap">
    	<header id="header" class="head_el">
    		<tiles:insertAttribute name="header" ignore="true"/>
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