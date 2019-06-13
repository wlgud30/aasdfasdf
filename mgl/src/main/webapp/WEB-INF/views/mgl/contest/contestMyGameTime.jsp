<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="location.href='/Contest/ContestMyGame.techni'">
			<span>나의 게임</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameEvent.techni'">
			<span>종목</span>
		</li>
		<li class="active_tab" onClick="location.href='/Contest/ContestMyGameTime.techni'">
			<span>시간</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameCoat.techni'">
			<span>코트</span>
		</li>
	</ul>
</div>
<div class="pd_lrtb white_bg">
	<ul class="li_col-nol">
		<li><b>게임수</b>${all_game}</li>
		<li><b>완료게임</b>${end_game }</li>
		<li><b>잔여게임</b>${all_game - end_game }</li>
		<li><b>진행율</b>${persent}%</li>
	</ul>
</div> 
<ul class="accordion_ul">
<c:forEach items="${list }" var="list">
				<li onclick="add('${fn:replace(list.ct_w_dat,':','')}')">
					<ul class="accd_head">
						<li>${fn:substring(list.ct_w_dat,0,5)}</li>
					</ul>
					<div class="accd_a" id="${fn:replace(list.ct_w_dat,':','')}">
					<%-- <c:forEach items="${list2}" var="list2">
					<c:if test="${list.ct_w_dat eq list2.ct_w_dat }">
						<div class="head-data">
							<div>
								<ul class="li_col-nol impot">
									<li>${list2.ct_court }코트</li>
									<fmt:parseNumber var="pages" integerOnly="true" value="${list2.ct_num/all_court+(1-(list2.ct_num/all_court%1))%1}"/>
									<li>${pages}경기</li>
									<li>${list2.ct_k_nm } - <c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }">본선</c:when><c:otherwise> ${fn:substring(list2.ct_gidx,14,15)}그룹</c:otherwise> </c:choose></li>
									<li><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>예선</c:otherwise> </c:choose></li>
								</ul>
							</div>
							<div>
								<c:choose>
									<c:when test="${list2.ct_status eq '대기' }">
										<span class="sign-round color2">${list2.ct_status }</span>
									</c:when>
									<c:otherwise>
										<span class="sign-round color3">${list2.ct_status }</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- head-data end-->
						<table class="line_no td-pt">
							<tr>
								<td class="club_td"><span ><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"> ${fn:substring(list2.team_a_idx,14,15)+1}그룹 1위</c:when><c:otherwise>${list2.team_a_nm }</c:otherwise> </c:choose></span></td>
								<td class="name3-2_td">
									<ul class="name_row">
										<li>
											<span class="name3 name_max">${list2.a1_nm }</span> 
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.a1_age,0,1)}0-${list2.a1_gd })</c:otherwise> </c:choose></span>
										</li>
										<li>
											<span class="name3 name_max">${list2.a2_nm }</span>
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.a2_age,0,1)}0-${list2.a2_gd })</c:otherwise> </c:choose></span>
										</li>
									</ul>
								</td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list2.team_a_score ne null }">${list2.team_a_score }</c:when>
										<c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="club_td">
									<span ><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }">${fn:substring(list2.team_b_idx,14,15)+1}그룹 1위</c:when><c:otherwise>${list2.team_b_nm }</c:otherwise></c:choose> </span>
								</td>
								<td class="name3-2_td">
									<ul class="name_row">
										<li>
											<span class="name3 name_max">${list2.b1_nm }</span>
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.b1_age,0,1)}0-${list2.b2_gd })</c:otherwise> </c:choose></span>
										</li>
										<li>
											<span class="name3 name_max">${list2.b2_nm }</span>
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.b2_age,0,1)}0-${list2.b2_gd })</c:otherwise> </c:choose></span>
										</li>
									</ul>
								</td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list2.team_b_score ne null }">${list2.team_b_score }</c:when>
										<c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
						</c:if>
						</c:forEach> --%>
					</div>
					<!-- accd_a end-->
				</li>
				</c:forEach>
	<%-- <c:forEach items="${list2 }" var="list2"> --%>
	<%-- <li>
		<ul class="accd_head">
			<li>${list2. }PM 07:00</li>
			<li>
				<span class="guide-left">게임수</span>${list2. }45
			</li>	
		</ul>
		<div class="accd_a">
			<div class="head-data">
				<div>
					<ul class="li_col-nol impot">
						<li>${list2. }4코트 230</li>
						<li>${list2. }혼복-40-자강</li>
						<li>${list2. }토너먼트</li>
					</ul>
				</div>
				<div>
					<span class="sign-round color3">${list2. }완료</span>
				</div>
			</div>
			<!-- head-data end-->
			<table class="line_no td-pt">
				<tr>
					<td class="club_td"><span class="club_name">${list2. }TeamB.S.F＆SPROS</span></td>
					<td class="name3-2_td">
						<ul class="name_row">
							<li>
								<span class="name3 name_max">${list2. }남길</span>
								<span class="age_rank side_right">${list2. }(30-A)</span>
							</li>
							<li>
								<span class="name3 name_max">${list2. }남홍</span>
								<span class="age_rank side_right">${list2. }(30-자강)</span>
							</li>
						</ul>
					</td>
					<td class="game_score">0</td>
				</tr>
				<tr class="color3">
					<td class="club_td"><span class="club_name">${list2. }리더아머마르스</span></td>
					<td class="name3-2_td">
						<ul class="name_row">
							<li>
								<span class="name3 name_max">${list2. }남홍길</span>
								<span class="age_rank side_right">${list2. }(30-A)</span>
							</li>
							<li>
								<span class="name3 name_max">${list2. }김남홍길입니다.</span>
								<span class="age_rank side_right">${list2. }(30-자강)</span>
							</li>
						</ul>
					</td>
					<td class="game_score">${list2. }30</td>
				</tr>
			</table>
		</div>
		<!-- accd_a end--> 
	</li> --%>
	<%-- </c:forEach> --%>
</ul>

<script>
function add(time){
	$.ajax({
		async : true,
		type:"post",
		data : time,
		url : "/Contest/ContestMyGameTime2.techni",
		datatype : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$("#"+time).empty();
			$("#"+time).append(data.str);
		},
		error : function(error){
			swal("민턴in","error : "+error);
		}
	}) 
}
</script>
