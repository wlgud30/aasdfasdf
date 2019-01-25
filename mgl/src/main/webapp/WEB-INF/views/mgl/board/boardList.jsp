<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

		<%-- <header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo" onclick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1><a href = "/Board/BoardList.techni" >${list[0].c_nm}</a></h1>
				</div>
				<div class="bt_top">
					<span class="icon-pencil btn_i i-text" onClick="location.href='/Board/BoardWriteForm.techni'">글쓰기</span>
					<span class="icon-outline_4 icon-f btn_i i-text" onclick="game_kind()">대회개설</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header> --%>
			<c:if test="${fn:length(list2) ne 0 }">
			 <div class="content white_bg line-tb">
				 <table class="board_td board2">
					 <c:forEach items="${list2 }" var="list">
					 	<tr onclick="location.href='/Cfight/CfightDetail.techni?cf_idx=${list.cf_idx}'">
					 		<td class="bd_title">
					 			<strong class="dark_font">
					 				<span class="main_color">[교류전]</span> ${list.cf_nm}
					 			</strong>
					 		</td>
					 		<td>
					 			<span class="date">${list.cf_start }</span>
					 		</td>
					 	</tr>
					 </c:forEach>
				 </table>
			 </div>
			</c:if>
			<c:if test="${fn:length(list3) ne 0 }">
			 <div class="content white_bg line-tb">
				 <table class="board_td board2">
					 <c:forEach items="${list3 }" var="list">
					 	<tr onclick="location.href='/Game/selfMatchDetail.techni?cs_idx=${list.cs_idx}'">
					 		<td class="bd_title">
					 			<strong class="dark_font">
					 				<span class="main_color">[자체대회]</span> ${list.cs_nm}
					 			</strong>
					 		</td>
					 		<td>
					 			<span class="date">${list.cs_start }</span>
					 		</td>
					 	</tr>
					 </c:forEach>
				 </table>
			 </div>
			</c:if>
			<!-- InstanceBeginEditable name="container" -->
			<c:choose>
				<c:when test="${sBbs == 0 && nBbs == 0 }">
				<div class="content white_bg">
				<h3 class="guide_big space_guide">
	 							<span class="icon-outline_4"></span>작성된 글이 없습니다.
	 						</h3>
	 			</div>			
				</c:when>
				<c:otherwise>
			<c:if test="${sBbs > 0}">
			<div class="cat_gray_area">
				<h4 class="title_m">중요공지</h4>
			</div>
			<div class="content white_bg line_dark line1_dark">
				<table class="board_td">
				<c:forEach var="list" items="${list}">
					<c:if test="${list.cb_yn eq 'Y' }">
					<tr onClick="location.href='/Board/BoardDetail.techni?cb_idx=${list.cb_idx}'">
						<td class="user_td">
							<div class="title_area">
								<div>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${list.u_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3"<c:if test="${list.h_chk eq 0 }">style="color:black;"</c:if>>${list.u_nm}</span>
											<span class="date">
											<c:set var="date" value="${list.cb_date }" />
											${fn:substring(date,0,16)}
											</span>
										</div>
									</div>
								</div>
								<div>
									<ul class="li_small">
										<li><i class="text_i icon-eye"></i><c:choose><c:when test="${list.h_cnt ne null}">${list.h_cnt}</c:when><c:otherwise>0</c:otherwise></c:choose></li>
										<li><i class="text_i icon-speech"></i>${list.cr_cnt }</li>
									</ul>
								</div>
							</div>
						</td>
						<td class="bd_title">${list.cb_title }</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
			</div>
		</c:if>
			<!-- content end -->
			<c:if test="${nBbs > 0}">
			<div class="content white_bg">
				<table class="board_td">
					<c:forEach var="list" items="${list}">
					<c:if test="${list.cb_yn eq 'N' }">
					<tr onClick="location.href='/Board/BoardDetail.techni?cb_idx=${list.cb_idx}'">
						<td class="user_td">
							<div class="title_area">
								<div>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${list.u_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3" <c:if test="${list.h_chk eq 0 }">style="color:black;"</c:if>>${list.u_nm }</span>
											<span class="date">
											<c:set var="date" value="${list.cb_date }" />
											${fn:substring(date,0,16)}
											</span>
										</div>
									</div>
								</div>
								<div>
									<ul class="li_small">
										<li><i class="text_i icon-eye"></i><c:choose><c:when test="${list.h_cnt ne null}">${list.h_cnt }</c:when><c:otherwise>0</c:otherwise></c:choose></li>
										<li><i class="text_i icon-speech"></i>${list.cr_cnt }</li>
									</ul>
								</div>
							</div>
						</td>
						<td class="bd_title">${list.cb_title }</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
			</div>
			</c:if>
			<!-- content end -->
			<%-- <c:if test="${list[0].cb_title ne null}">
			<div class="btn_full pd_lrb">
				<span class="btn_st more_btn" onclick="location.href='#;'">더보기</span>
			</div>
			</c:if> --%>
			<!-- InstanceEndEditable -->
				</c:otherwise>
			</c:choose>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('.ft_menu').navi_depth({pageNum:aa})
     });
    </script>
			<ul class="ft_menu">
				<li class="active_tab"  onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li onClick="location.href='/UClub/GamePrivateStateInfo.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>

		</div>
	<script>
		function game_kind(){
			swal("MGL","게임의 종류를 선택해 주세요",{
				buttons:{
					"자체대회" :{
						text : "자체대회",
						value : "self",
					},
					"교류전" : {
						text : "교류전",
						value : "club_fight"
					},
					cancel : "취소",
				},
			})
			.then((value) => {
				switch (value)	{
				case "self":
					location.href="/Game/GameSelfMatchInsert.techni";
					break;
				case "club_fight":
					location.href="/Cfight/CfightInsertForm.techni?c_nm=${list[0].c_nm}";
					break;
				}
			});
		}
	</script>