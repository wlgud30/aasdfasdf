<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-8, -7);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					});
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/selfMatchDetail.techni'" class="active_tab"><span>나의게임</span></li>
					<li onClick="location.href='/Game/selfMatchTypeList.techni'"><span>종목</span></li>
					<li onClick="location.href='/Game/selfMatchTimeList.techni'"><span>시간</span></li>
					<li onClick="location.href='/Game/selfMatchCourtList.techni'"><span>코트</span></li>
				</ul>
			</div>
			<div class="content white_bg match_cont">
				<!--divide_li end-->
				<c:choose>
					<c:when test="${list ne null }">
						<c:forEach items="${list}"  var="list">
						<div class="head-data">
							<div>
								<ul class="li_col-nol impot">
									<li>${fn:substring(list.cs_w_date,0,5)}</li>
									<li>${list.cs_k_nm }</li>
									<li>
										<c:choose>
											<c:when test="${list.cs_no < 10}">
												00${list.cs_no }경기
											</c:when>
											<c:when test="${list.cs_no < 100 }">
												0${list.cs_no }경기
											</c:when>
											<c:otherwise>
												${list.cs_no}경기
											</c:otherwise>
										</c:choose>
									</li>
									<li>${list.cs_court }코트</li>
								</ul>
							</div>
							<div>
								<c:choose>
									<c:when test="${list.cs_status eq '대기' }">
										<span class="sign-round color2">${list.cs_status }</span>
									</c:when>
									<c:otherwise>
										<span class="sign-round color3">${list.cs_status }</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- head-data end-->
						<table class="line_no td-pt">
							<tr>
								<td class="club_td"><span class="club_name"></span></td>
								<td class="name3-2_td"><ul class="name_row">
										<li><span class="name3 name_max">${list.a1_id }</span> 
										<span class="age_rank side_right">(${list.a1_age }-${list.a1_gd })</span></li>
										<li><span class="name3 name_max">${list.a2_id }</span> 
										<span class="age_rank side_right">(${list.a2_age }-${list.a2_gd })</span></li>
									</ul></td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list.team_a_score ne null }">${list.team_a_score }</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="club_td"><span class="club_name"></span></td>
								<td class="name3-2_td"><ul class="name_row">
										<li><span class="name3 name_max">${list.b1_id }</span> <span
											class="age_rank side_right">(${list.b1_age }-${list.b1_gd })</span></li>
										<li><span class="name3 name_max">${list.b2_id }</span> <span
											class="age_rank side_right">(${list.b2_age }-${list.b2_gd })</span></li>
									</ul></td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list.team_b_score ne null }">${list.team_b_score }</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>				
				</c:forEach>
				</c:when>
					<c:otherwise>
					<div class="content white_bg">
	                  <h3 class="guide_big">
	                    <span class="icon-outline_4"></span>				
						참여한 게임이없습니다.
					  </h3>
					</div>	
					</c:otherwise>
				</c:choose>
			</div>
			<!-- match_cont end-->
			<!-- <div class="content white_bg match_cont">
				<div class="divide_li cet_lay">
					<h4 class="title_m">혼복-40-A</h4>
					<p class="bo_btn_area">
						<strong>예선</strong>리그전
					</p>
				</div>
				divide_li end
				<div class="line_dark">
					<div class="head-data">
						<div>
							<ul class="li_dot li_inline impot">
								<li>13:00</li>
								<li>2조</li>
								<li>299</li>
								<li>4코트 23</li>
							</ul>
						</div>
						<div>
							<span class="sign-round color3">완료</span>
						</div>
					</div>
					head-data end
					<table class="line_no td-pt">
						<tr>
							<td class="club_td"><span class="club_name">TeamB.S.F＆SPROS</span></td>
							<td class="name3-2_td"><ul class="name_row">
									<li><span class="name3 name_max">남길</span> <span
										class="age_rank side_right">(34-A)</span></li>
									<li><span class="name3 name_max">남홍</span> <span
										class="age_rank side_right">(34-자강)</span></li>
								</ul></td>
							<td class="game_score">0</td>
						</tr>
						<tr class="color3">
							<td class="club_td"><span class="club_name">리더아머마르스</span></td>
							<td class="name3-2_td"><ul class="name_row">
									<li><span class="name3 name_max">남홍길</span> <span
										class="age_rank side_right">(34-A)</span></li>
									<li><span class="name3 name_max">김남홍길입니다.</span> <span
										class="age_rank side_right">(34-자강)</span></li>
								</ul></td>
							<td class="game_score">30</td>
						</tr>
					</table>
					<div class="head-data">
						<div>
							<ul class="li_dot li_inline impot">
								<li>13:00</li>
								<li>2조</li>
								<li>299</li>
								<li>4코트 23</li>
							</ul>
						</div>
						<div>
							<span class="sign-round color2">예정</span>
						</div>
					</div>
					head-data end
					<table class="line_no td-pt">
						<tr>
							<td class="club_td"><span class="club_name">리더아머마르스</span></td>
							<td class="name3-2_td"><ul class="name_row">
									<li><span class="name3 name_max">남홍길</span> <span
										class="age_rank side_right">(34-A)</span></li>
									<li><span class="name3 name_max">홍길</span> <span
										class="age_rank side_right">(34-자강)</span></li>
								</ul></td>
							<td class="game_score">130</td>
						</tr>
						<tr>
							<td class="club_td"><span class="club_name">리더아머마르스</span></td>
							<td class="name3-2_td"><ul class="name_row">
									<li><span class="name3 name_max">명자</span> <span
										class="age_rank side_right">(34-A)</span></li>
									<li><span class="name3 name_max">김남홍길입니다.</span> <span
										class="age_rank side_right">(34-자강)</span></li>
								</ul></td>
							<td class="game_score">30</td>
						</tr>
					</table>
					<div class="head-data">
						<div>
							<ul class="li_dot li_inline impot">
								<li>13:00</li>
								<li>2조</li>
								<li>299</li>
								<li>4코트 23</li>
							</ul>
						</div>
						<div>
							<span class="sign-round color2">예정</span>
						</div>
					</div>
					head-data end
					<table class="line_no td-pt">
						<tr>
							<td class="club_td"><span class="club_name">리더아머마르스</span></td>
							<td class="name3-2_td"><ul class="name_row">
									<li><span class="name3 name_max">남홍길</span> <span
										class="age_rank side_right">(34-왕초)</span></li>
									<li><span class="name3 name_max">김남홍길입니다.</span> <span
										class="age_rank side_right">(34-자강)</span></li>
								</ul></td>
							<td class="game_score">30</td>
						</tr>
						<tr>
							<td class="club_td"><span class="club_name">리더아머마르스</span></td>
							<td class="name3-2_td"><ul class="name_row">
									<li><span class="name3 name_max">남홍길</span> <span
										class="age_rank side_right">(34-A)</span></li>
									<li><span class="name3 name_max">박길</span> <span
										class="age_rank side_right">(34-자강)</span></li>
								</ul></td>
							<td class="game_score">30</td>
						</tr>
					</table>
				</div>
				line_dark end
			</div> -->
			<!-- match_cont end-->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var ft_nv = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : ft_nv
					})
				});
			</script>
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Cfight/CfightSummary.techni'"><span>개요</span></li>
				<li onClick="location.href='/Game/selfMatchEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Game/selfMatchDetail.techni'" class="active_tab"><span>대진표</span></li>
				<li onClick="location.href='/Game/selfMatchMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>