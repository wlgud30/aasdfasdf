<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>


<%-- </head>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="location.href='/Cfight/CfightTypeList.techni';"></div>
				<div class="tit_top">
					<h1 class="game_title">
						<span class="item_divide">종목</span>${list2[0].cf_t_nm }
					</h1>
				</div>
				<div class="bt_top">
					<c:if test="${cfm eq '매니저' }">
						<a id="exto"  class="icon-excel icon-f btn_i i-text">엑셀</a>
					</c:if>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container"> --%>
			<!-- InstanceBeginEditable name="container" -->
			<!-- Swiper JS -->
			<script src="/resources/js/swiper.min.js"></script>
			<!-- Initialize Swiper -->
<%-- 			<div class="content white_bg pt_00">
				<div class="cat_s_area">
					<h4 class="title_ms">대진표</h4>
				</div>
				<div id ="tt">
				<c:choose>
					<c:when test="${fn:length(list) eq 10}">
						<table class="td_small cet_lay td_tiny" id="toex">
							<thead>
								<tr>
									<th>구분
										<p class="club_name">코트-경기</p>
									</th>
									<th><span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></th>
									<th><span class="name3">${list[4].a1_id }</span><span class="name3">${list[4].a2_id }</span></th>
									<th><span class="name3">${list[7].a1_id }</span><span class="name3">${list[7].a2_id }</span></th>
									<th><span class="name3">${list[9].a1_id }</span><span class="name3">${list[9].a2_id }</span></th>
									<th><span class="name3">${list[9].b1_id }</span><span class="name3">${list[9].b2_id }</span></th>
							</thead>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[0].team_a_score > list[0].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[0].team_a_score < list[0].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
												${list[0].team_a_score }-${list[0].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[1].team_a_score ne null && list[1].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[1].team_a_score > list[1].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[1].team_a_score < list[1].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[1].team_a_score ne null && list[1].team_b_score ne null }">
												${list[1].team_a_score }-${list[1].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose></p></td>
								<td>
									<c:choose>
										<c:when test="${list[2].team_a_score ne null && list[2].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[2].team_a_score > list[2].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[2].team_a_score < list[2].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[2].team_a_score ne null && list[2].team_b_score ne null }">
												${list[2].team_a_score }-${list[2].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[3].team_a_score ne null && list[3].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[3].team_a_score > list[3].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[3].team_a_score < list[3].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[3].team_a_score ne null && list[3].team_b_score ne null }">
												${list[3].team_a_score }-${list[3].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[4].a1_id }</span><span class="name3">${list[4].a2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[0].cf_w_date,0,5)}</p>
									<p class="score-2">${list[0].cs_court }-${list[0].cs_no }</p></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[4].team_a_score ne null && list[4].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[4].team_a_score > list[4].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[4].team_a_score < list[4].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[4].team_a_score ne null && list[4].team_b_score ne null }">
												${list[4].team_a_score }-${list[4].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[5].team_a_score ne null && list[5].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[5].team_a_score > list[5].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[5].team_a_score < list[5].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[5].team_a_score ne null && list[5].team_b_score ne null }">
												${list[5].team_a_score }-${list[5].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[6].team_a_score ne null && list[6].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[6].team_a_score > list[6].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[6].team_a_score < list[6].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[6].team_a_score ne null && list[6].team_b_score ne null }">
												${list[6].team_a_score }-${list[6].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[7].a1_id }</span><span class="name3">${list[7].a2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[1].cs_w_date,0,5)}</p>
									<p class="score-2">${list[1].cs_court }-${list[1].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[4].cs_w_date,0,5)}</p>
									<p class="score-2">${list[4].cs_court }-${list[4].cs_no }</p></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[7].team_a_score ne null && list[7].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[7].team_a_score > list[7].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[7].team_a_score < list[7].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[7].team_a_score ne null && list[7].team_b_score ne null }">
												${list[7].team_a_score }-${list[7].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[8].team_a_score ne null && list[8].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[8].team_a_score > list[8].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[8].team_a_score < list[8].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[8].team_a_score ne null && list[8].team_b_score ne null }">
												${list[8].team_a_score }-${list[8].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[9].a1_id }</span><span class="name3">${list[9].a2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[2].cs_w_date,0,5)}</p>
									<p class="score-2">${list[2].cs_court }-${list[2].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[5].cs_w_date,0,5)}</p>
									<p class="score-2">${list[5].cs_court }-${list[5].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[7].cs_w_date,0,5)}</p>
									<p class="score-2">${list[7].cs_court }-${list[7].cs_no }</p></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[9].team_a_score ne null && list[9].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[9].team_a_score > list[9].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[9].team_a_score < list[9].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[9].team_a_score ne null && list[9].team_b_score ne null }">
												${list[9].team_a_score }-${list[9].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span> 
									<span class="name3">${list[9].b1_id }</span><span class="name3">${list[9].b2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[3].cs_w_date,0,5)}</p>
									<p class="score-2">${list[3].cs_court }-${list[3].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[6].cs_w_date,0,5)}</p>
									<p class="score-2">${list[6].cs_court }-${list[6].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[8].cs_w_date,0,5)}</p>
									<p class="score-2">${list[8].cs_court }-${list[8].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[9].cs_w_date,0,5)}</p>
									<p class="score-2">${list[9].cs_court }-${list[9].cs_no }</p></td>
								<td>-</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${fn:length(list) eq 6}">
						<table class="td_small cet_lay td_tiny" id="toex">
							<thead>
								<tr>
									<th>구분
										<p class="club_name">코트-경기</p>
									</th>
									<th><span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></th>
									<th><span class="name3">${list[3].a1_id }</span><span class="name3">${list[3].a2_id }</span></th>
									<th><span class="name3">${list[5].a1_id }</span><span class="name3">${list[5].a2_id }</span></th>
									<th><span class="name3">${list[5].b1_id }</span><span class="name3">${list[5].b2_id }</span></th>
							</thead>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[0].team_a_score > list[0].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[0].team_a_score < list[0].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
												${list[0].team_a_score }-${list[0].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[1].team_a_score ne null && list[1].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[1].team_a_score > list[1].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[1].team_a_score < list[1].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[1].team_a_score ne null && list[1].team_b_score ne null }">
												${list[1].team_a_score }-${list[1].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[2].team_a_score ne null && list[2].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[2].team_a_score > list[2].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[2].team_a_score < list[2].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[2].team_a_score ne null && list[2].team_b_score ne null }">
												${list[2].team_a_score }-${list[2].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[3].a1_id }</span><span class="name3">${list[3].a2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[0].cs_w_date,0,5)}</p>
									<p class="score-2">${list[0].cs_court }-${list[0].cs_no }</p></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[3].team_a_score ne null && list[3].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[3].team_a_score > list[3].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[3].team_a_score < list[3].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[3].team_a_score ne null && list[3].team_b_score ne null }">
												${list[3].team_a_score }-${list[3].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[4].team_a_score ne null && list[4].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[4].team_a_score > list[4].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[4].team_a_score < list[4].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[4].team_a_score ne null && list[4].team_b_score ne null }">
												${list[4].team_a_score }-${list[4].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[5].a1_id }</span><span class="name3">${list[5].a2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[1].cs_w_date,0,5)}</p>
									<p class="score-2">${list[1].cs_court }-${list[1].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[3].cs_w_date,0,5)}</p>
									<p class="score-2">${list[3].cs_court }-${list[3].cs_no }</p></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[5].team_a_score ne null && list[5].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[5].team_a_score > list[5].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[5].team_a_score < list[5].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[5].team_a_score ne null && list[5].team_b_score ne null }">
												${list[5].team_a_score }-${list[5].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span> 
									<span class="name3">${list[5].b1_id }</span><span class="name3">${list[5].b2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[2].cs_w_date,0,5)}</p>
									<p class="score-2">${list[2].cs_court }-${list[2].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[4].cs_w_date,0,5)}</p>
									<p class="score-2">${list[4].cs_court }-${list[4].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[5].cs_w_date,0,5)}</p>
									<p class="score-2">${list[5].cs_court }-${list[5].cs_no }</p></td>
								<td>-</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${fn:length(list) eq 3}">
						<table class="td_small cet_lay td_tiny" id="toex">
							<thead>
								<tr>
									<th>구분
										<p class="club_name">코트-경기</p>
									</th>
									<th><span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></th>
									<th><span class="name3">${list[2].a1_id }</span><span class="name3">${list[2].a2_id }</span></th>
									<th><span class="name3">${list[2].b1_id }</span><span class="name3">${list[2].b2_id }</span></th>
							</thead>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[0].team_a_score > list[0].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[0].team_a_score < list[0].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
												${list[0].team_a_score }-${list[0].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
								<td>
									<c:choose>
										<c:when test="${list[1].team_a_score ne null && list[1].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[1].team_a_score > list[1].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[1].team_a_score < list[1].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[1].team_a_score ne null && list[1].team_b_score ne null }">
												${list[1].team_a_score }-${list[1].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[2].a1_id }</span><span class="name3">${list[2].a2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[0].cs_w_date,0,5)}</p>
									<p class="score-2">${list[0].cs_court }-${list[0].cs_no }</p></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[2].team_a_score ne null && list[2].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[2].team_a_score > list[2].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[2].team_a_score < list[2].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[2].team_a_score ne null && list[2].team_b_score ne null }">
												${list[2].team_a_score }-${list[2].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span> 
									<span class="name3">${list[2].b1_id }</span><span class="name3">${list[2].b2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[1].cs_w_date,0,5)}</p>
									<p class="score-2">${list[1].cs_court }-${list[1].cs_no }</p></td>
								<td><p class="time_s main_color">${fn:substring(list[2].cs_w_date,0,5)}</p>
									<p class="score-2">${list[2].cs_court }-${list[2].cs_no }</p></td>
								<td>-</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${fn:length(list) eq 1}">
						<table class="td_small cet_lay td_tiny" id="toex">
							<thead>
								<tr>
									<th>구분
										<p class="club_name">코트-경기</p>
									</th>
									<th><span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></th>
									<th><span class="name3">${list[0].b1_id }</span><span class="name3">${list[0].b2_id }</span></th>
							</thead>
							<tr>
								<td class="club-name_td"><span class="club_name"></span>
									<span class="name3">${list[0].a1_id }</span><span class="name3">${list[0].a2_id }</span></td>
								<td>-</td>
								<td>
									<c:choose>
										<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
											<c:choose>
												<c:when test="${list[0].team_a_score > list[0].team_b_score }">
													<p class="victory sub1_color">승</p>
												</c:when>
												<c:when test="${list[0].team_a_score < list[0].team_b_score }">
													<p class="victory sub_color">패</p>
												</c:when>
												<c:otherwise>
													<p>무</p>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<p></p>
										</c:otherwise>
									</c:choose>
									<p class="score-2">
										<c:choose>
											<c:when test="${list[0].team_a_score ne null && list[0].team_b_score ne null }">
												${list[0].team_a_score }-${list[0].team_b_score }
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</p></td>
							</tr>
							<tr>
								<td class="club-name_td"><span class="club_name"></span> 
									<span class="name3">${list[0].b1_id }</span><span class="name3">${list[0].b2_id }</span></td>
								<td><p class="time_s main_color">${fn:substring(list[0].cs_w_date,0,5)}</p>
									<p class="score-2">${list[0].cs_court }-${list[0].cs_no }</p></td>
								<td>-</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				</div>
			</div> --%>
			<!-- content end-->
			<div class="content white_bg pt_00">
				<div class="cat_s_area">
					<h4 class="title_ms">랭킹</h4>
				</div>
				<table class="td_small cet_lay">
					<thead class="pd_left0">
						<tr>
							<th>순위</th>
							<th>선수</th>
							<th>승</th>
							<th>패</th>
							<th>득</th>
							<th>실</th>
							<th>차</th>
						</tr>
					</thead>
					<c:forEach items="${list3}" var="list">
						<c:set var="i" value="${i+1}" />
						<tr>
							<td class="no_td">${i}</td>
							<td class="na_row_td"><span class="name3">${list.a1_id }</span><span class="name3">${list.b1_id }</span></td>
							<td class="td_1"><fmt:parseNumber var="var3" value="${list.win_count/2}" integerOnly="true" />${var3 }</td>
							<td class="td_1"><fmt:parseNumber var="var3" value="${list.lose_count/2}" integerOnly="true" />${var3 }</td>
							<td class="td_2"><fmt:parseNumber var="var3" value="${list.total_sum/2}" integerOnly="true" />${var3 }</td>
							<td class="td_2"><fmt:parseNumber var="var3" value="${list.total_sum/2-list.gap_sum/2}" integerOnly="true" />${var3 }</td>
							<td class="td_2"><fmt:parseNumber var="var3" value="${list.gap_sum/2}" integerOnly="true" />${var3 }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- content end-->
			<div class="cat_s_area white_bg">
				<h4 class="title_ms">일정</h4>
			</div>
			<div class="content white_bg pt_00">
			<c:forEach items="${list2}" var="list">			
				<div class="head-data">
					<div>
						<ul class="li_col-nol impot">
							<li>${fn:substring(list.cs_w_date,0,5)}</li>
							<li>${list.cs_court }코트 230</li>
							<li>${list.cs_k_nm }</li>
							<li>토너먼트</li>
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
								<li><span class="name3 name_max">${list.a1_id }</span> <span
									class="age_rank side_right">(${list.a1_age }-${list.a1_gd })</span></li>
								<li><span class="name3 name_max">${list.a2_id }</span> <span
									class="age_rank side_right">(${list.a2_age }-${list.a2_gd })</span></li>
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
			</div>
			<!-- content end-->
			<!-- InstanceEndEditable -->
<!-- 		</div> -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
<!-- 	</div> -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#exto").click(function(){
				$('#toex > thead:first').append("<tr><th colspan='4'>${list2[0].cs_k_nm }</th></tr>");
				$("#toex").attr("border","1")
				alert("a")
				window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('#tt').html()));
    			$("#toex").attr("border","0")
    			$('#toex > thead:first > tr:last').remove();
			})
		})
	</script>
	<!-- wrap end -->