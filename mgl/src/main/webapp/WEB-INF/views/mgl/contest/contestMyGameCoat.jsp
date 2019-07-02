<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b"><!-- 
		<li onClick="location.href='/Contest/ContestMyGame.techni'">
			<span>나의 게임</span>
		</li> -->
		<li onClick="location.href='/Contest/ContestMyGameEvent.techni'">
			<span>종목</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameTime.techni'">
			<span>시간</span>
		</li>
		<li class="active_tab" onClick="location.href='/Contest/ContestMyGameCoat.techni'">
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
				<li onclick="add('${list.ct_court}')"><ul class="accd_head">
						<li>${list.ct_court } 코트</li>
					</ul>
					<div class="accd_a" id="ct_${list.ct_court }">
						<%-- <c:forEach items="${list2}" var="list2">
							<c:if test="${list.ct_court eq list2.ct_court }">
								<div class="head-data">
									<div>
										<ul class="li_col-nol impot">
											<li>${fn:substring(list2.ct_w_dat,0,5)}</li>
											<fmt:parseNumber var="pages" integerOnly="true" value="${list2.ct_num/all_court+(1-(list2.ct_num/all_court%1))%1}"/>
											<li>${pages}경기</li>
											<li>${list2.ct_k_nm } - ${fn:substring(list2.ct_gidx,14,15)}조</li>
											<li>토너먼트</li>
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
											<td class="club_td"><span class="club_name">${list2.team_a_nm }</span></td>
											<td class="name3-2_td"><ul class="name_row">
													<li><span class="name3 name_max">${list2.a1_id }</span> <span
														class="age_rank side_right">(${fn:substring(list2.a1_age,0,1)}0-${list2.a1_gd })</span></li>
													<li><span class="name3 name_max">${list2.a2_id }</span> <span
														class="age_rank side_right">(${fn:substring(list2.a2_age,0,1)}0-${list2.a2_gd })</span></li>
												</ul></td>
											<td class="game_score">
												<c:choose>
													<c:when test="${list2.team_a_score ne null }">${list2.team_a_score }</c:when>
													<c:otherwise>0</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td class="club_td"><span class="club_name">${list2.team_b_nm }</span></td>
											<td class="name3-2_td"><ul class="name_row">
													<li><span class="name3 name_max">${list2.b1_id }</span> <span
														class="age_rank side_right">(${fn:substring(list2.b1_age,0,1)}0-${list2.b1_gd })</span></li>
													<li><span class="name3 name_max">${list2.b2_id }</span> <span
														class="age_rank side_right">(${fn:substring(list2.b2_age,0,1)}0-${list2.b2_gd })</span></li>
												</ul></td>
											<td class="game_score">
												<c:choose>
													<c:when test="${list2.team_b_score ne null }">${list2.team_b_score }</c:when>
													<c:otherwise>0</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</table>
								</c:if>
							</c:forEach> --%>
						</div>
					</li>
				</c:forEach>
	<%-- <c:forEach items="${list2 }" var="list2"> --%>
	
</ul>

<script>
function add(court){
	$.ajax({
		async : true,
		type:"post",
		data : court,
		url : "/Contest/ContestMyGameCoat2.techni",
		datatype : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$("#ct_"+court).empty();
			$("#ct_"+court).append(data.str);
		},
		error : function(error){
			swal("민턴in","error : "+error);
		}
	}) 
}
</script>


