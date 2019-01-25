<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<div class="content white_bg">
				<table class="thead_td game_td cet_lay tr_line">
					<thead>
						<tr>
							<th class="sub_td"></th>
							<c:forEach items="${list }" var="list">
								<th>${list.cs_court }코트</th>
							</c:forEach>
						</tr>
					</thead>
					<c:forEach items="${list2}" var="list">
						<tr>
							<td class="sub_td">${fn:substring(list.cs_w_date,0,5)}</td>
							<c:forEach items="${list3}" var="list3">
								<c:if test="${list.cs_w_date eq list3.cs_w_date }">
									<td>${list3.cs_status }</td>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
		</div>