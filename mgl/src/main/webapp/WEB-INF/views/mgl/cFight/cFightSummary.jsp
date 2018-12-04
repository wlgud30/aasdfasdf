<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
	<div id="wrap">
		<header>
		<div class="head_top">
			<!-- InstanceBeginEditable name="head_top" -->
			<div class="tit_top">
				<h1>클럽교류전</h1>
			</div>
			<div class="bt_top">
				<c:choose>
					<c:when test="${join eq '참석' }">
						<span class="icon-approval icon-f btn_i i-text">참석</span>
					</c:when>
					<c:when test="${join eq '불참' }">
						<span class="icon-delete icon-f btn_i i-text">불참</span>
					</c:when>
					<c:when test="${cm eq '매니저' and cfm ne '매니저'}">
						<span class="icon-approval icon-f btn_i i-text" onClick="ynChk('Y','${list[0].cf_idx}')">참석</span>
						<span class="icon-delete icon-f btn_i i-text" onClick="ynChk('N','${list[0].cf_idx}')">불참</span>
					</c:when>
				</c:choose>
				<c:set var="today" value="<%=new Date()%>"/>
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
				<c:if test="${cfm eq '매니저' }">
					<span class="icon-group-set icon-f btn_i i-text" onclick="location.href='/Cfight/CfightGroup.techni?cf_idx=${list2[0].cf_idx}'">그룹설정</span>
				</c:if>
				<%-- 날짜비교 --%>
				<%-- <c:if test="${today >= list[0].cf_end }">투데이가큽니다</c:if> --%>
			</div>
			<!-- InstanceEndEditable -->
		</div>
		<!-- head_top end --> </header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<table class="table_form">
					<tr>
						<td><h4 class="title_g">${list[0].cf_nm }</h4></td>
					</tr>
					<tr>
						<td>
							<div class="col_2input">
								<div>
									<p class="guide_text">대회일자</p>${list[0].cf_start }
								</div>
								<div>
									<p class="guide_text">대회시간</p>${fn:substring(list[0].cf_sTime,0,5)}~${fn:substring(list[0].cf_eTime,0,5)}
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="col_2input wauto">
								<div>
									<span class="guide_text left_guide">점수</span>${list[0].cf_point }
								</div>
								<div>
									<span class="guide_text left_guide">소요분</span>${list[0].cf_time }
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<span class="guide_text left_guide">등록마감</span>${list[0].cf_end }
						</td>
					</tr>
					<tr>
						<td>
							${list[0].cf_cnm }
						</td>
					</tr>
					<tr>
						<td>
							<span class="guide_text">대회방식</span>
							<ul class="list_check">
								<li>${list[0].cf_meth }</li>
							</ul>
						</td>
					</tr>
				</table>
				<p class="guide_text">주최클럽</p>
				<table class="line_no_t_td">
					<tr>
						<td>
							<span class="club_name-long">${list2[0].c_nm}</span>
							<span class="name3 bracket">${list2[0].c_count }명)</span>
						</td>
						<c:if test="${cfm eq '매니저'}">
							<td class="btn_td">
								<span class="btn_st btn_wh btn_small" onclick="location.href='/Cfight/CfightRegister.techni?cf_idx=${list2[0].cf_idx}'">선수등록</span>
								<span class="btn_st btn_wh btn_small"onclick="location.href='/Cfight/CfightRegisterT.techni?cf_idx=${list2[0].cf_idx}&cf_t_kind=${list2[0].cf_t_kind }&cf_t_idx=${list2[0].cf_t_idx }'">팀등록</span>
							</td>
						</c:if>
					</tr>
				</table>
				<p class="guide_text">참여클럽</p>
				<table class="line_no_t_td">
					<c:forEach items="${list }" var="list">
					<c:if test="${list.cf_yn eq null or list.cf_yn eq 'Y' }">
						<tr>
							<td class="club_long">
								<span class="club_name-long">${list.c_nm }</span> (${list.c_count }명)
							</td>
							<c:if test="${mYn eq list.c_u_mid and list.cf_yn eq 'Y'}">
								<td class="btn_td">
									<span class="btn_st btn_wh btn_small" onclick="location.href='/Cfight/CfightRegister.techni?cf_idx=${list.cf_idx}'">선수등록</span>
									<span class="btn_st btn_wh btn_small"onclick="location.href='/Cfight/CfightRegisterT.techni?cf_idx=${list.cf_idx}&cf_t_kind=${list.cf_t_kind }&cf_t_idx=${list.cf_t_idx }'">팀등록</span>
								</td>
							</c:if>
						</tr>
					</c:if>
					</c:forEach>
				</table>
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td>
							${fn:replace(list[0].cf_body, newLineChar, "<br/>")}
						</td>
					</tr>
				</table>
				<hr class="gap_m">
				<table class="game_td thead_td cet_lay">
					<thead>
						<tr>
							<th class="no_td">No</th>
							<th>구분(종목)</th>
							<th class="team_nb">종류</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list2 }" var="list">
							<tr>
								<td class="no_td">${list.cf_t_num }</td>
								<td class="ga_title">${list.cf_t_nm }</td>
								<td>${list.cf_t_kind }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Cfight/CfightSummary.techni'" class="active_tab"><span>개요</span></li>
				<li onClick="location.href='/Cfight/CfightEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Cfight/CfightDetail.techni'"><span>대진표</span></li>
				<li onClick="location.href='/Cfight/CfightMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>