<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
{"club" : [
		<c:forEach var="data" items="${cList }" varStatus="st">
		<c:if test="${st.last eq false }">
		{ "code" : "${data.c_idx }", "name" : "${data.c_nm }", "info" : "${data.c_info }"},
		</c:if>
		<c:if test="${st.last eq true }">
		{ "code" : "${data.c_idx }", "name" : "${data.c_nm }", "info" : "${data.c_info }"}
		</c:if>
		</c:forEach>
]}