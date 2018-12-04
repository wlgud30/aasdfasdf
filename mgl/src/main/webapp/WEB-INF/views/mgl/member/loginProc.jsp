<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
	<c:if test="${isLogin eq true}">
		<c:redirect url="/UClub/UClubList.techni" />
	</c:if>
	<c:if test="${isLogin eq false}">
		<c:redirect url="/Member/LoginForm.techni" />
	</c:if>