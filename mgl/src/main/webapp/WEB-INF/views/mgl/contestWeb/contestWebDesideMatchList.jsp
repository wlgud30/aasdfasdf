<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="tab_btn_b_area col_2data ver_lay_m">
	<div>
		<ul class="tab_btn_b wauto">
			<li onclick="location.href='06_decide-matches-time_3-3.html'"
				class="active_tab"><span>시간대별</span></li>
			<li onclick="location.href='06_decide-matches-type_3-3.html'"><span>종목별</span>
			</li>
		</ul>
	</div>
	<div>
		<ul class="li_col-nol li_dot">
			<li><b>게임수</b>${fn:length(matchList)}</li>
			<li><b>출전팀수</b>${t_cnt }</li>
			<li><b>종목수</b>${type_cnt }</li>
		</ul>
	</div>
</div>
<div class="content white_bg">
	<!-- <span class="btn_st btn_sml" onclick="location.href='#;'">예선전 출력</span>
	<span class="btn_st btn_sml btn_color1" onclick="location.href='#;'">추점지
		출력</span> -->
	<hr class="gap_s">
	<table class="text_td cet_lay th_mix">
		<thead>
			<tr>
				<th rowspan="2" class="no_td">게임<br> 번호
				</th>
				<th rowspan="2">시작<br> 시간
				</th>
				<th colspan="2">코트</th>
				<th rowspan="2">종목</th>
				<th rowspan="2">그룹</th>
				<th colspan="3">A팀</th>
				<th rowspan="2">점수</th>
				<th rowspan="2">점수</th>
				<th colspan="3">B팀</th>
				<th rowspan="2">게임<br> 상태
				</th>
				<th rowspan="2">게임지<br> 출력
				</th>
			</tr>
			<tr>
				<th>번호</th>
				<th>순번</th>
				<th>소속팀</th>
				<th>선수</th>
				<th>선수</th>
				<th>소속팀</th>
				<th>선수</th>
				<th>선수</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="i" value="1" />
			<c:forEach var="list" items="${matchList}">
				<tr
					class="${list.ct_gidx} ${list.team_a_idx} ${list.team_b_idx} ${list.ct_at_id1} ${list.ct_at_id2} ${list.ct_bt_id1} ${list.ct_bt_id2}">
					<td class="no_td">${list.ct_num}</td>
					<td class="ct_w_dat popwin_btn0">${fn:substring(list.ct_w_dat,0,5)}</td>
					<td class="ct_court popwin_btn0">${list.ct_court }</td>
					<td class="popwin_btn0"><c:out value="${i }"></c:out> <c:if
							test="${list.ct_num % courtCnt == 0  }">

							<c:set var="i" value="${i+1}" />

						</c:if></td>
					<td class="ct_k_nm popwin_btn0">${list.ct_k_nm }</td>
					<td class="popwin_btn0"><c:choose>
							<c:when test="${!fn:contains(list.ct_gidx,'win')}">
								${fn:substring(list.ct_gidx,14,15 ) } 그룹 
								</c:when>

							<c:when test="${fn:contains(list.ct_gidx,'win')}">
								${list.ct_kind }
							</c:when>

						</c:choose></td>
					<td class="team_a_nm popwin_btn0"><p class="club_name">${list.team_a_nm }</p></td>
					<td class="a1_nm popwin_btn0" id="${list.a1_age}-${list.a1_gd }"><p
							class="name3">${fn:replace(list.a1_nm,"1","")}</p></td>
					<td class="a2_nm popwin_btn0" id="${list.a2_age}-${list.a2_gd }"><p
							class="name3">${fn:replace(list.a2_nm,"1","")}</p></td>

					<td class="team_a_score popwin_btn0"><c:choose>
							<c:when test="${list.ct_status eq '대기'}">
							</c:when>

							<c:when test="${list.ct_status eq '종료'}">
								${list.team_a_score }
							</c:when>
						</c:choose></td>
					<td class="team_b_score popwin_btn0"><c:choose>
							<c:when test="${list.ct_status eq '대기'}">
							</c:when>

							<c:when test="${list.ct_status eq '종료'}">
								${list.team_b_score }
							</c:when>
						</c:choose></td>

					<td class="team_b_nm popwin_btn0"><p class="club_name">${list.team_b_nm }</p></td>
					<td class="b1_nm popwin_btn0" id="${list.b1_age}-${list.b1_gd }"><p
							class="name3">${fn:replace(list.b1_nm,"1","")}</p></td>
					<td class="b2_nm popwin_btn0" id="${list.b2_age}-${list.b2_gd }"><p
							class="name3">${fn:replace(list.b2_nm,"1","")}</p></td>

					<td class="ct_status popwin_btn0">${list.ct_status }</td>
					<td onclick="print('${list.ct_gidx}')" title="출력"><i
						class="icon-printer title_ms main_color"></i></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	function print(ct_gidx) {
		

		var url = "/ContestWeb/PrintTest.techni?ct_gidx=" + ct_gidx;
		var name = "popup";
		var option = "width = 1000, height = 500, top = 100, left =200 , location = no"

		window.open(url, name, option).print();

	}
</script>
