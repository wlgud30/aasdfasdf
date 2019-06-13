<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<script>
</script>

			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<table class="table_form">
					<tr>
						<td><h4 class="title_g">${list.cs_nm}</h4></td>
					</tr>
					<tr>
						<td>
							<div class="col_2input">
								<div>
									<p class="guide_text">대회일자</p>${list.cs_start }
								</div>
								<div>
									<p class="guide_text">대회시간</p>${fn:substring(list.cs_sTime,0,5)}~${fn:substring(list.cs_eTime,0,5)}
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="col_2input wauto">
								<div>
									<span class="guide_text left_guide">점수</span>${list.cs_point }
								</div>
								<div>
									<span class="guide_text left_guide">소요분</span>${list.cs_time }
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<span class="guide_text left_guide">등록마감</span>${list.cs_end }
						</td>
					</tr>
					<tr>
						<td>
							${list.cs_cnm }
						</td>
					</tr>
					<tr>
						<td>
							<span class="guide_text">대회방식</span>
							<ul class="list_check">
								<li id = "cs_kind">${list.cs_kind }</li>
							</ul>
						</td>
					</tr>
				</table>
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td>
							${fn:replace(list.cs_content, newLineChar, "<br/>")}
						</td>
					</tr>
				</table>
			
		<div id="ft_area">
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Game/selfMatchSummary.techni'" class="active_tab"><span>개요</span></li>
				<li onClick="location.href='/Game/selfMatchEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Game/selfMatchDetail.techni'" ><span>대진표</span></li>
				<li onClick="location.href='/Game/selfMatchMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>