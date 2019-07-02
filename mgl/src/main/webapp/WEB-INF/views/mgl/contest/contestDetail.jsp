<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
<div class="content white_bg pt_00">
	<ul class="list_room white_bg">
		<li>
			<div class="room_photo">
				<c:choose>
					<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}">
						<span class="alarm_rally sub0_bg">예정</span>
					</c:when>
					<c:when test="${list.ct_match_yn eq 'Y' && list.ct_end > today}">
						<span class="alarm_rally main_bg">진행</span>
					</c:when>
					<c:otherwise>
						<span class="alarm_rally sub1_bg">종료</span>
					</c:otherwise>
				</c:choose>
				<div class="photo_area mask_big"
					style="background-image:url(${list.ct_st_img})"></div>
			</div>
			<div class="room_data">
				<ul class="li_row_s el_texts">
					<li><span class="guide_text">주관</span>${list.ct_supervision }
					</li>
					<li><span class="guide_text">일시</span>${fn:substring(list.ct_start,0,4)}년
						${fn:substring(list.ct_start,5,7)}월 <c:choose>
							<c:when
								test="${fn:substring(list.ct_start,8,10) eq fn:substring(list.ct_end,8,10)}">
								${fn:substring(list.ct_start,8,10)}일 
								(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분 ~ ${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
							</c:when>
						</c:choose> <c:choose>
							<c:when
								test="${fn:substring(list.ct_start,8,10) ne fn:substring(list.ct_end,8,10)}">
								${fn:substring(list.ct_start,8,10)}일 ~ ${fn:substring(list.ct_end,8,10)}일 
								(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분 ~ ${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
							</c:when>
						</c:choose></li>
					<li><span class="guide_text">장소</span>${list.ct_location}</li>
					<li><span class="guide_text">협찬</span>${list.ct_support}</li>
					<li><span class="bd_link main_color popwin_btn0"><i
							class="icon-f i_font_mrs icon-file-view"></i>개요보기</span></li>
				</ul>
			</div>
		</li>
	</ul>
	<!-- list_room end -->
	<div class="pd_lr">
		<hr class="line_one">
	</div>
	<c:choose>
		<c:when test="${list.ct_match_yn eq 'N' && list.ct_end > today}">
			<div class="pd_lrb td_st td2 btn_full btn_sml">
				<div>
					<%
						if (session.getAttribute("login") == null) {
					%>
					<span class="btn_st btn_color1 popwin_btn1">출전신청</span>
					<%
						} else {
					%>
					<span class="btn_st btn_color1 popwin_btn2">출전신청</span>
					<%
						}
					%>
				</div>
				<div>
					<span class="btn_st" onclick="testFc('step')">스텝</span>
				</div>
			</div>
		</c:when>
		<c:when test="${list.ct_match_yn eq 'Y' && list.ct_end > today}">
			<div class="pd_lrb td_st td2 btn_full btn_sml">
				<div>
					<span class="btn_st btn_color1"
						onclick="location.href='/Contest/ContestReferee.techni'">심판</span>
				</div>
				<div>
					<span class="btn_st"
						onclick="location.href='/Contest/ContestStep.techni'">스텝</span>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="pd_lrb btn_full btn_sml">
				<span class="btn_st"
					onclick="location.href='/Contest/ContestStep.techni'">스텝</span>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<!-- content end -->
<div class="pd_lr cont_mb_b white_bg">
	<table class="hue_td">
		<tr>
			<td style="width: 50%" onclick="testFc('league')"><h4
					class="bg_th round4">
					대진표<i class="icon-f icon-match bg_icon small_i"></i>
				</h4></td>
			<td rowspan="2"
				onclick="location.href='/Contest/ContestEventPlayer.techni'"><h4
					class="bg_th sub2_bg round_t2">
					출전선수<i class="icon-f icon-player bg_icon small_i"></i>
				</h4>
				<ul class="li_row pd_s">
					<c:forEach items="${ctTeamCount}" var="list">
						<li><span class="guide_text">출전팀수</span>${list.team_count}팀</li>
						<li><span class="guide_text">출전클럽</span>${list.club_count}클럽
						</li>
					</c:forEach>
				</ul></td>
		</tr>
		<tr>
			<td onclick="testFc('rank')"><h4 class="bg_th sub_bg round4">
					순위<i class="icon-f icon-ranking bg_icon small_i"></i>
				</h4></td>
		</tr>
	</table>
</div>
<div class="content white_bg">
    <h4 class="title_m tit_mb">문의처</h4>
    <ul class="li_line gray-dot-line">
      <li>${fn:replace(list.ct_inquiry, newLineChar, "<br/>")}</li>
    </ul>
</div>
<!-- content end -->
<!-- 		<div class="tab_btn_b_area tab_btn_bm">
			<ul class="tab_btn_b tab_cont">
				<li><span>게시(공지)</span> <i
					class="btn_i icon-f icon-write main_color right_rank"></i></li>
				<li><span>이의신청</span> <i
					class="btn_i icon-f icon-write main_color right_rank"></i></li>
			</ul>
		</div>
		tab_bt_area end
		<div class="tab_cont_con">
			<div class="content white_bg tab_con">
				<table class="board2">
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title"><span class="main_color">[교류전]</span>
							제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title"><span class="main_color">[자체대회]</span>
							제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title">제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
				</table>
			</div>
			tab_con end
			<div class="content white_bg tab_con">
				<table class="board2">
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title">제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title">제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title">제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title">제2회 누리체육관 레슨자 대회</td>
						<td class="date">2018.03.22</td>
					</tr>
					<tr onclick="location.href='03-02_game-view.html'">
						<td class="bd_title">전용구장,배드민턴샵 정보 등록 안내</td>
						<td class="date">2018.03.22</td>
					</tr>
				</table>
			</div>
			tab_con end
		</div> -->
<!-- tab_cont_con end -->
<script type="text/javascript">
	function file(s) {
		if (s == "file") {
			var form = document.createElement("form");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "/Contest/ContestFileDown.techni");
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "gubun");
			hiddenField.setAttribute("value", s);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
		} else {
			var form = document.createElement("form");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "/Contest/ContestFileDown.techni");
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "gubun");
			hiddenField.setAttribute("value", s);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
		}
	}
</script>
<div class="popwin_size white_bg">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="title_m">개요</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="popup_body">
		<table class="table_form">
			<tr>
				<td><h4 class="title_g">${list.ct_nm}</h4></td>
			</tr>
			<tr>
				<td><a href="${list.ct_homepage}">${list.ct_homepage}</a></td>
			</tr>
			<tr>
				<td><span class="guide_text">대회</span>${fn:substring(list.ct_start,0,4)}년
					${fn:substring(list.ct_start,5,7)}월 <c:choose>
						<c:when
							test="${fn:substring(list.ct_start,8,10) eq fn:substring(list.ct_end,8,10)}">
								${fn:substring(list.ct_start,8,10)}일 
								(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분
								<span class="time_line_i"></span>
								${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
							</c:when>
					</c:choose> <c:choose>
						<c:when
							test="${fn:substring(list.ct_start,8,10) ne fn:substring(list.ct_end,8,10)}">
								${fn:substring(list.ct_start,8,10)}일 ~ ${fn:substring(list.ct_end,8,10)}일 
								(${fn:substring(list.ct_start,11,13)}시${fn:substring(list.ct_start,14,16)}분
								<span class="time_line_i"></span>
								${fn:substring(list.ct_end,11,13)}시${fn:substring(list.ct_end,14,16)}분)
							</c:when>
					</c:choose></td>
			</tr>
			<tr>
				<td><span class="guide_text">접수</span>
					${fn:substring(list.ct_startline,0,4)}년
					${fn:substring(list.ct_startline,5,7)}월
					${fn:substring(list.ct_startline,8,10)}일 <span class="time_line_i"></span>
					${fn:substring(list.ct_deadline,0,4)}년
					${fn:substring(list.ct_deadline,5,7)}월
					${fn:substring(list.ct_deadline,8,10)}일</td>
			</tr>
			<tr>
				<td><span class="guide_text">이의신청기간</span>
					${fn:substring(list.ct_appeal,0,4)}년
					${fn:substring(list.ct_appeal,5,7)}월
					${fn:substring(list.ct_appeal,8,10)}일</td>
			</tr>
			<tr>
				<td><span class="guide_text">장소</span>${list.ct_location}</td>
			</tr>
			<tr>
				<td><span class="guide_text">주최</span>${list.ct_host}</td>
			</tr>
			<tr>
				<td><span class="guide_text">주관</span>${list.ct_supervision}</td>
			</tr>
			<tr>
				<td><span class="guide_text">후원</span>${list.ct_sponsor}</td>
			</tr>
			<tr>
				<td><span class="guide_text">문의처</span>${list.ct_inquiry}</td>
			</tr>
			<tr>
				<td><span class="guide_text">참가비</span>${list.ct_entry_fee}</td>
			</tr>
			<tr>
				<td><span class="guide_text">입금계좌</span>${list.ct_account}</td>
			</tr>
			<tr>
				<td><span class="guide_text">요강</span><span
					class="bd_link main_color" onclick="file('file')"><i
						class=" i_font_mrs"></i>다운로드</span></td>
			</tr>
			<tr>
				<td><span class="guide_text">대회 포스터</span><span
					class="bd_link main_color" onclick="file('img')"><i
						class=" i_font_mrs"></i>다운로드</span></td>
			</tr>
			<tr>
				<td class="img_view"><img src="${list.ct_st_img}"></td>
			</tr>
		</table>
	</div>
	<!-- popup_body end-->
</div>
<!-- popwin_size end -->
<script type="text/javascript">
	function frm() {
		if ($("#u_tel").val() == "") {
			swal("핸드폰 번호를 입력해주세요.")
			return false;
		} else if ($(':input[name=u_sex]:radio:checked').length < 1) {
			swal("성별을 선택해주세요.")
			return false;
		} else if ($("#u_nm").val() == "") {
			swal("이름을 입력해주세요.")
			return false;
		} else if ($("#u_birth").val() == "") {
			swal("생년월일을 입력해주세요.")
			return false;
		}
		var u_tel = $('input[name="u_tel"]').val();
		var u_nm = $('input[name="u_nm"]').val();
		var u_birth = $('input[name="u_birth"]').val();
		var u_club_nm = $('input[name="u_club_nm"]').val();
		var u_sex = $('input[name="u_sex"]:checked').val();
		$.ajax({
			async : true,
			type : 'post',
			url : "/Contest/ContestUserInsert.techni",
			data : JSON.stringify({
				"u_tel" : u_tel,
				"u_sex" : u_sex,
				"u_nm" : u_nm,
				"u_birth" : u_birth,
				"u_club_nm" : u_club_nm
			}),
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (data.cnt > 0) {
					swal("민턴in", "해당 정보로 등록된 아이디가 이미 있습니다.")
				} else {
					if (data.cntt > 0) {
						swal("등록")
					} else {
						swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
					}
				}
			},
			error : function(error) {
				swal("민턴in", "error : " + error);
			}
		});
	}
</script>
<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">대표자 등록</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="popup_body">
		<table class="table_form mb_m">
			<tr>
				<td><div class="col_2input">
						<div style="width: 48%">
							<input type="text" name="u_nm" id="u_nm" placeholder="이름(실명)">
						</div>
						<div>
							<ul class="list_check">
								<li><input type="radio" name="u_sex" class="check_circle"
									id="check_1" value="M"> <label for="check_1">남자</label>
								</li>
								<li><input type="radio" name="u_sex" class="check_circle"
									id="check_2" value="F"> <label for="check_2">여자</label>
								</li>
							</ul>
						</div>
					</div></td>
			</tr>
			<tr>
				<td><div class="col_2input">
						<div>
							<input type="text" name="u_birth" id="u_birth"
								placeholder="생년월일 ('-' 제외)" maxlength="8">
						</div>
						<div>
							<input type="text" name="u_tel" id="u_tel"
								placeholder="핸드폰 번호 ('-' 제외)" maxlength="11">
						</div>
					</div>
					<div>
						<input type="text" name="u_club_nm" id="u_club_nm"
							placeholder="클럽명">
					</div></td>
			</tr>
		</table>
		<hr class="line_both">
		<div class="btn_full">
			<span class="btn_st btn_sml close_popup" onClick="frm();">등록</span>
		</div>
		<!-- col2_lay end -->
	</div>
	<!-- popup_body end-->
</div>
<!-- popwin_size end -->
<script type="text/javascript">
	function ffrm(kind) {
		if ($("#m_club_nm").val() == "") {
			swal("클럽명을 입력해주세요.")
			return false;
		} else if ($(':input[name=kindAge]:radio:checked').length < 1) {
			swal("나이를 선택해주세요.")
			return false;
		} else if ($(':input[name=kind]:radio:checked').length < 1) {
			swal("구분을 선택해주세요.")
			return false;
		} else if ($(':input[name=kindGd]:radio:checked').length < 1) {
			swal("급수를 선택해주세요.")
			return false;
		} else if ($("#m_nm_A").val() == "") {
			swal("이름를 입력해주세요.")
			return false;
		} else if ($(':input[name=m_sex_A]:radio:checked').length < 1) {
			swal("성별을 선택해주세요.")
			return false;
		} else if ($("#m_nm_B").val() == "") {
			swal("이름를 입력해주세요.")
			return false;
		} else if ($(':input[name=m_sex_B]:radio:checked').length < 1) {
			swal("성별을 선택해주세요.")
			return false;
		}

		var m_club_nm = $('input[name="m_club_nm"]').val();
		var kind_age = $('input[name="kindAge"]:checked').val() + "대";
		var kind_nm = $('input[name="kindAge"]:checked').val() + "대 "
				+ $('input[name="kind"]:checked').val() + " "
				+ $('input[name="kindGd"]:checked').val() + "조";
		var kind_gd = $('input[name="kindGd"]:checked').val();
		var m_nm_A = $('input[name="m_nm_A"]').val();
		var m_sex_A = $('input[name="m_sex_A"]').val();
		var m_birth_A = $('input[name="m_birth_A"]').val();
		var m_tel_A = $('input[name="m_tel_A"]').val();
		var m_nm_B = $('input[name="m_nm_B"]').val();
		var m_sex_B = $('input[name="m_sex_B"]').val();
		var m_birth_B = $('input[name="m_birth_B"]').val();
		var m_tel_B = $('input[name="m_tel_B"]').val();
		var today = new Date();
		var yyyy = today.getFullYear();
		var i = Number($('input[name="kindAge"]:checked').val());

		if (m_birth_A == "") {
			m_birth_A = yyyy - i;
			m_birth_A += "0101";
		}
		if (m_birth_B == "") {
			m_birth_B = yyyy - i;
			m_birth_B += "0101";
		}
		$.ajax({
			async : true,
			type : 'post',
			url : "/Contest/ContestApplicationAct.techni",
			data : JSON.stringify({
				"m_club_nm" : m_club_nm,
				"kind_age" : kind_age,
				"kind_nm" : kind_nm,
				"kind_gd" : kind_gd,
				"m_nm_A" : m_nm_A,
				"m_sex_A" : m_sex_A,
				"m_birth_A" : m_birth_A,
				"m_tel_A" : m_tel_A,
				"m_nm_B" : m_nm_B,
				"m_sex_B" : m_sex_B,
				"m_birth_B" : m_birth_B,
				"m_tel_B" : m_tel_B
			}),
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (kind == 'end') {
					if (data.cnt == 1) {
						swal("민턴in", "등록되었습니다.")
						$("#m_club_nm").val("");
						$("#m_nm_A").val("");
						$("#m_nm_B").val("");
						$("#m_birth_A").val("");
						$("#m_birth_B").val("");
						$("#m_tel_A").val("");
						$("#m_tel_B").val("");
						$("input[name=kindAge]").prop('checked', false);
						$("input[name=kind]").prop('checked', false);
						$("input[name=kindGd]").prop('checked', false);
						$("input[name=m_sex_A]").prop('checked', false);
						$("input[name=m_sex_B]").prop('checked', false);
					} else if (data.cnt == 2) {
						swal("민턴in", m_nm_A + "님 등록된 아이디가 이미 있습니다.")
					} else if (data.cnt == 3) {
						swal("민턴in", m_nm_B + "님 등록된 아이디가 이미 있습니다.")
					} else {
						swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
					}
				} else {
					if (data.cnt == 1) {
						$("#m_club_nm").val("");
						$("#m_nm_A").val("");
						$("#m_nm_B").val("");
						$("#m_birth_A").val("");
						$("#m_birth_B").val("");
						$("#m_tel_A").val("");
						$("#m_tel_B").val("");
						$("input[name=kindAge]").prop('checked', false);
						$("input[name=kind]").prop('checked', false);
						$("input[name=kindGd]").prop('checked', false);
						$("input[name=m_sex_A]").prop('checked', false);
						$("input[name=m_sex_B]").prop('checked', false);
						$(".popwin_btn2").click();
					} else if (data.cnt == 2) {
						swal("민턴in", m_nm_A + "님 등록된 아이디가 이미 있습니다.")
					} else if (data.cnt == 3) {
						swal("민턴in", m_nm_B + "님 등록된 아이디가 이미 있습니다.")
					} else {
						swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
					}
				}

			},
			error : function(error) {
				swal("민턴in", "error : " + error);
			}
		});
	}
	$(document)
			.ready(
					function() {
						var age = "${age}".slice(0, -1).split(',');
						var kind = "${kind}".slice(0, -1).split(',');
						var gd = "${gd}".slice(0, -1).split(',');
						for (var i = 0; i < age.length; i++) {
							$('#ulAge')
									.append(
											'<li><input type="radio" name="kindAge" class="check_circle" id="age_'+i+'" value="'+age[i]+'"><label for="age_'+i+'">'
													+ age[i] + '</label></li>');
						}
						;
						for (var j = 0; j < kind.length; j++) {
							$('#ulKind')
									.append(
											'<li><input type="radio" name="kind" class="check_circle" id="sort_'+j+'" value="'+kind[j]+'"><label for="sort_'+j+'">'
													+ kind[j] + '</label></li>');
						}
						;
						for (var k = 0; k < gd.length; k++) {
							$('#ulGd')
									.append(
											'<li><input type="radio" name="kindGd" class="check_circle" id="rank_'+k+'" value="'+gd[k]+'"><label for="rank_'+k+'">'
													+ gd[k] + '</label></li>');
						}
						;
					});
</script>
<div class="popwin_size white_bg wsize-m">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">출전등록</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="popup_body">
		<table class="table_form mb_b">
			<tr>
				<td><input type="text" value="${list.ct_nm }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td><div class="pop_opt_input">
						<input type="text" name="m_club_nm" id="m_club_nm"
							placeholder="클럽명 (기본클럽 선택 or 입력)">
						<%
							if ((String) session.getAttribute("represent_idx") != null) {
						%>
						<i onclick="clubList();" class="opt_i"></i> <input type="hidden"
							class="popwin_btn3" id="Btn3">
						<%
							}
						%>
					</div></td>
			</tr>
			<tr>
				<td><div class="col-inputside">
						<div class="td_1">
							<p class="guide_text">나이</p>
						</div>
						<div>
							<ul class="list_check w100" id="ulAge">
							</ul>
						</div>
					</div></td>
			</tr>
			<tr>
				<td><div class="col-inputside">
						<div class="td_1">
							<p class="guide_text">구분</p>
						</div>
						<div>
							<ul class="list_check" id="ulKind">
							</ul>
						</div>
					</div></td>
			</tr>
			<tr>
				<td><div class="col-inputside">
						<div class="td_1">
							<p class="guide_text">급수</p>
						</div>
						<div>
							<ul class="list_check w100" id="ulGd">
							</ul>
						</div>
					</div></td>
			</tr>

		</table>
		<hr class="line_m_both">
		<div class="col_2line pd_tb">
			<div>
				<table class="table_form">
					<tr>
						<td><div class="col_2data">
								<div class="pop_opt_input">
									<input type="text" name="m_nm_A" id="m_nm_A" placeholder="이름">
									<%
										if ((String) session.getAttribute("represent_idx") != null) {
									%>
									<i class="opt_i popwin_btn4"></i>
									<%
										}
									%>
								</div>
								<div>
									<ul class="list_check">
										<li><input type="radio" name="m_sex_A"
											class="check_circle" id="sexa_1" value="M"> <label
											for="sexa_1">남</label></li>
										<li><input type="radio" name="m_sex_A"
											class="check_circle" id="sexa_2" value="F"> <label
											for="sexa_2">여</label></li>
									</ul>
								</div>
							</div></td>
					</tr>
					<tr>
						<td><input type="text" name="m_birth_A" id="m_birth_A"
							placeholder="생년월일 ('-' 제외)" maxlength="8"></td>
					</tr>
					<tr>
						<td><input type="text" name="m_tel_A" id="m_tel_A"
							placeholder="핸드폰 번호 ('-' 제외)" maxlength="11"></td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table_form">
					<tr>
						<td><div class="col_2data">
								<div class="pop_opt_input">
									<input type="text" name="m_nm_B" id="m_nm_B" placeholder="이름">
									<%
										if ((String) session.getAttribute("represent_idx") != null) {
									%>
									<i class="opt_i popwin_btn5"></i>
									<%
										}
									%>
								</div>
								<div>
									<ul class="list_check">
										<li><input type="radio" name="m_sex_B"
											class="check_circle" id="sexb_1" value="M"> <label
											for="sexa_1">남</label></li>
										<li><input type="radio" name="m_sex_B"
											class="check_circle" id="sexb_2" value="F"> <label
											for="sexa_2">여</label></li>
									</ul>
								</div>
							</div></td>
					</tr>
					<tr>
						<td><input type="text" name="m_birth_B" id="m_birth_B"
							placeholder="생년월일 ('-' 제외)" maxlength="8"></td>
					</tr>
					<tr>
						<td><input type="text" name="m_tel_B" id="m_tel_B"
							placeholder="핸드폰 번호 ('-' 제외)" maxlength="11"></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- col_2input end -->
		<hr class="line_m_both cont_mb_b">
		<p class="vital_text mb_b">핸드폰 번호와 생년월일을 등록하시면 임시회원으로 자동가입됩니다. 대회의
			메뉴와 클럽의 메뉴를 3개월간 사용할 수 있습니다.</p>
		<hr class="line_both">
		<div class="btn_full col2_lay">
			<div>
				<span class="btn_st close_popup " onClick="ffrm('end');">등록</span>
			</div>
			<div>
				<span class="btn_st btn_color1 close_popup"
					onClick="ffrm('continue')">등록후 계속</span>
			</div>
		</div>
		<!-- col2_lay end -->
	</div>
	<!-- popup_body end-->
</div>
<!-- popwin_size end -->

<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">클럽 선택</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" id="Btn3_close"
				onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="scroll_wrap ht-5">
		<ul class="line_bl_li" id="club_list">

		</ul>
	</div>
	<!--scroll_wrap end-->
</div>
<!-- popwin_size end -->

<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">선수 선택</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" id="Btn4_close"
				onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="scroll_wrap ht-5">
		<ul class="li_name line_tno" id="club_user_list">
		</ul>
	</div>
	<!--scroll_wrap end-->
</div>

<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">선수 선택</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" id="Btn5_close"
				onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="scroll_wrap ht-5">
		<ul class="li_name line_tno" id="club_user_list2">
		</ul>
	</div>
	<!--scroll_wrap end-->
</div>
<!-- popwin_size end -->


<script>
	function clubList() {
		var values = [];
		$.ajax({
			async : true,
			type : 'post',
			url : "/Contest/ContestClubList.techni",
			dataType : "json",
			success : function(data) {
				values = data.list
				$.each(values, function(index, value) {
					$("#club_list").append(
							"<li onclick=\"clubUserList('" + value.c_idx
									+ "','" + value.c_nm + "')\">" + value.c_nm
									+ "</li>");
				});
				$("#Btn3").click();
			},
			error : function(error) {
				swal("민턴in", "error : " + error);
			}
		});
	}
	function clubUserList(c_idx, c_nm) {
		var values = [];
		$
				.ajax({
					async : true,
					type : 'post',
					url : "/Contest/ContestClubUserList.techni",
					data : c_idx,
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						values = data.list
						$
								.each(
										values,
										function(index, value) {
											var age = String(value.u_age);
											age = age.substring(0, 1) + "0";
											$("#club_user_list")
													.append(
															"<li><div class='photo_name' onclick=\"user('a','"
																	+ value.u_nm
																	+ "','"
																	+ value.u_birth
																	+ "','"
																	+ value.u_tel
																	+ "','"
																	+ value.u_sex
																	+ "');\"><div class='thum_area'><div class='thum'style='background-image: url("
																	+ value.u_photo
																	+ ");'></div></div><div class='text_area'><span class='name3'>"
																	+ value.u_nm
																	+ "</span> <em class='game_nb-tiny'>65</em><span class='age_rank'>("
																	+ age
																	+ "-"
																	+ value.u_club_gd
																	+ ")</span></div></div></li>");
											$("#club_user_list2")
													.append(
															"<li><div class='photo_name'onclick=\"user('b','"
																	+ value.u_nm
																	+ "','"
																	+ value.u_birth
																	+ "','"
																	+ value.u_tel
																	+ "','"
																	+ value.u_sex
																	+ "');\"><div class='thum_area'><div class='thum'style='background-image: url("
																	+ value.u_photo
																	+ ");'></div></div><div class='text_area'><span class='name3'>"
																	+ value.u_nm
																	+ "</span> <em class='game_nb-tiny'>65</em><span class='age_rank'>("
																	+ age
																	+ "-"
																	+ value.u_club_gd
																	+ ")</span></div></div></li>");
										});
						$("#m_club_nm").val(c_nm);
						$("#Btn3_close").click();
					},
					error : function(error) {
						swal("민턴in", "error : " + error);
					}
				});
	}
	function user(kind, nm, birth, tel, sex) {
		if (kind == "a") {
			$("#m_nm_A").val(nm);
			$("#m_birth_A").val(birth);
			$("#m_tel_A").val(tel);
			if (sex == "M") {
				$("#sexa_1").attr("checked", true);
			} else {
				$("#sexa_2").attr("checked", true);
			}
			$("#Btn4_close").click();
		} else {
			$("#m_nm_B").val(nm);
			$("#m_birth_B").val(birth);
			$("#m_tel_B").val(tel);
			if (sex == "M") {
				$("#sexb_1").attr("checked", true);
			} else {
				$("#sexb_2").attr("checked", true);
			}
			$("#Btn5_close").click();
		}
	}
</script>