<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<div class="content white_bg pt_00">
			<ul class="list_room white_bg">
			
					<li>
						<div class="room_photo">
							<span class="alarm_rally sub0_bg">예정</span>
							<div class="photo_area mask_big"></div>
						</div>
						<div class="room_data">
							<ul class="li_row_s el_texts">
								<li><span class="guide_text">주관</span>
									${list.ct_supervision }</li>
								<li><span class="guide_text">일시</span> 2019.03.23 AM
									10:00~PM 4:30</li>
								<li><span class="guide_text">장소</span> 구로누리배드민턴장</li>
								<li><span class="guide_text">협찬</span> 구로구 서울특별시체육회,
									구로구체육진흥회</li>
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
			<div class="pd_lrb td_st td2 btn_full btn_sml">
				<div>
					<%
						if (session.getAttribute("login") == null) {
					%>
					<span class="btn_st btn_color1 popwin_btn1">출전신청</span>
					<!-- <span class="btn_st btn_color1" onclick="ab()">출전신청</span>
        <input type="hidden" class="popwin_btn1"> -->
					<%
						} else {
					%>
					<span class="btn_st btn_color1 popwin_btn2">출전신청</span>
					<%
						}
					%>
				</div>
				<div>
					<span class="btn_st"
						onclick="location.href='/Contest/ContestStep.techni'">스텝</span>
				</div>
			</div>
		</div>
		<!-- content end -->
		<div class="pd_lr cont_mb_b white_bg">
			<table class="hue_td">
				<tr>
					<td style="width: 50%"
						onclick="location.href='/Contest/ContestMyGame.techni'"><h4
							class="bg_th round4">
							대진표<i class="icon-f icon-match bg_icon small_i"></i>
						</h4></td>
					<td rowspan="2"
						onclick="location.href='/Contest/ContestEventPlayer.techni'"><h4
							class="bg_th sub2_bg round_t2">
							출전선수<i class="icon-f icon-player bg_icon small_i"></i>
						</h4>
						<ul class="li_row pd_s">
							<li><span class="guide_text">출전팀수</span> 580팀</li>
							<li><span class="guide_text">출전클럽</span> 61클럽</li>
						</ul></td>
				</tr>
				<tr>
					<td onclick="location.href='/Contest/ContestMyRanking.techni'"><h4
							class="bg_th sub_bg round4">
							순위<i class="icon-f icon-ranking bg_icon small_i"></i>
						</h4></td>
				</tr>
			</table>
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

		<div class="popwin_size white_bg">
			<div class="head_top title_popup">
				<div class="tit_top">
					<h1 class="game_title">개요</h1>
				</div>
				<div class="bt_top">
					<span class="btn_i la la-close" onclick="location.href='#'"></span>
				</div>
			</div>
			<!-- title_popupp end -->
			<div class="popup_body">
				<table class="table_form">
					<tr>
						<td><h4 class="title_g">2018년 제2회 누리 체유관 레슨자 대회</h4></td>
					</tr>
					<tr>
						<td>http://www.badmintongame.co.kr/</td>
					</tr>
					<tr>
						<td><span class="guide_text">대회</span> 2018.08.10 (일) <span
							class="time_line_i"></span> 2018.08.14 (금)</td>
					</tr>
					<tr>
						<td><span class="guide_text">접수</span> 2018.06.11 (월) <span
							class="time_line_i"></span> 2018.06.17 (목)</td>
					</tr>
					<tr>
						<td><span class="guide_text">장소</span> 구로구 실내 배드민턴장</td>
					</tr>
					<tr>
						<td><span class="guide_text">주최</span> 구로구 체육회</td>
					</tr>
					<tr>
						<td><span class="guide_text">주관</span> 구로구 배드민턴협회</td>
					</tr>
					<tr>
						<td><span class="guide_text">후원</span> 구로구 서울특별시체육회, 구로구체육진흥회</td>
					</tr>
					<tr>
						<td><span class="guide_text">문의처</span> 010-2000-0000</td>
					</tr>
					<tr>
						<td><span class="guide_text">요강</span> <a
							href="img/2018슈퍼오닝대회요강(안).hwp">2018슈퍼오닝대회요강(안).hwp</a></td>
					</tr>
					<tr>
						<td class="img_view"><img src="img/cal_20180623_sejong.jpg"></td>
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
			function ffrm() {
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
				
				if(m_birth_A == ""){
					m_birth_A = yyyy-i;
					m_birth_A += "0101";
				}
				if(m_birth_B==""){
					m_birth_B = yyyy-i;
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
						if (data.cnt == 1) {
							swal("등록")
						} else if (data.cnt == 2) {
							swal("민턴in", m_nm_A + "님 등록된 아이디가 이미 있습니다.")
						} else if (data.cnt == 3) {
							swal("민턴in", m_nm_B + "님 등록된 아이디가 이미 있습니다.")
						} else {
							swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
						}
					},
					error : function(error) {
						swal("민턴in", "error : " + error);
					}
				});
			}
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
						<td><input type="text" value="${list.ct_nm }"readonly="readonly"></td>
					</tr>
					<tr>
						<td><div class="pop_opt_input">
								<input type="text" name="m_club_nm" id="m_club_nm"
									placeholder="클럽명 (기본클럽 선택 or 입력)"> <i
									class="opt_i popwin_btn3"></i>
							</div></td>
					</tr>
					<tr>
						<td><div class="col-inputside">
								<div class="td_1">
									<p class="guide_text">나이</p>
								</div>
								<div>
									<ul class="list_check w100">
										<li><input type="radio" name="kindAge"
											class="check_circle" id="age_1" value="20"> <label
											for="age_1">20</label></li>
										<li><input type="radio" name="kindAge"
											class="check_circle" id="age_2" value="30"> <label
											for="age_2">30</label></li>
										<li><input type="radio" name="kindAge"
											class="check_circle" id="age_3" value="40"> <label
											for="age_3">40</label></li>
										<li><input type="radio" name="kindAge"
											class="check_circle" id="age_4" value="50"> <label
											for="age_4">50</label></li>
										<li><input type="radio" name="kindAge"
											class="check_circle" id="age_5" value="60"> <label
											for="age_5">60</label></li>
										<li><input type="radio" name="kindAge"
											class="check_circle" id="age_6" value="70"> <label
											for="age_6">70</label></li>
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
									<ul class="list_check">
										<li><input type="radio" name="kind" class="check_circle"
											id="sort_1" value="혼복"> <label for="sort_1">혼복</label>
										</li>
										<li><input type="radio" name="kind" class="check_circle"
											id="sort_2" value="남복"> <label for="sort_2">남복</label>
										</li>
										<li><input type="radio" name="kind" class="check_circle"
											id="sort_3" value="여복"> <label for="sort_3">여복</label>
										</li>
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
									<ul class="list_check w100">
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_1" value="자강"> <label
											for="rank_1">자강</label></li>
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_2" value="A"> <label
											for="rank_2">A</label></li>
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_3" value="B"> <label
											for="rank_3">B</label></li>
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_4" value="C"> <label
											for="rank_4">C</label></li>
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_5" value="D"> <label
											for="rank_5">D</label></li>
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_6" value="초심"> <label
											for="rank_6">초심</label></li>
										<li><input type="radio" name="kindGd"
											class="check_circle" id="rank_7" value="왕초"> <label
											for="rank_7">왕초</label></li>
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
											<i class="opt_i popwin_btn4"></i>
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
											<i class="opt_i popwin_btn4"></i>
										</div>
										<div>
											<ul class="list_check">
												<li><input type="radio" name="m_sex_B"
													class="check_circle" id="sexa_1" value="M"> <label
													for="sexa_1">남</label></li>
												<li><input type="radio" name="m_sex_B"
													class="check_circle" id="sexa_2" value="F"> <label
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
				<p class="vital_text mb_b">핸드폰 번호와 생년월일을 등록하시면 임시회원으로 자동가입됩니다.
					대회의 메뉴와 클럽의 메뉴를 3개월간 사용할 수 있습니다.</p>
				<hr class="line_both">
				<div class="btn_full col2_lay">
					<div>
						<span class="btn_st close_popup " onClick="ffrm();">등록</span>
					</div>
					<div>
						<span class="btn_st btn_color1 close_popup"
							onClick="location.href='#;'">등록후 계속</span>
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
					<span class="btn_i la la-close" onclick="location.href='#'"></span>
				</div>
			</div>
			<!-- title_popupp end -->
			<div class="scroll_wrap ht-5">
				<ul class="line_bl_li">
					<li>흑산문암체육관클럽</li>
					<li>굿프랜드클럽</li>
					<li>나이스클럽</li>
					<li>어울림</li>
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
					<span class="btn_i la la-close" onclick="location.href='#'"></span>
				</div>
			</div>
			<!-- title_popupp end -->
			<div class="scroll_wrap ht-5">
				<ul class="li_name line_tno">
					<li>
						<div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(img/member_photo_01.jpg);"></div>
							</div>
							<div class="text_area">
								<span class="name3">가길동입니다.</span> <em class="game_nb-tiny">65</em>
								<span class="age_rank">(50-자강)</span>
							</div>
						</div> <!--photo_name end-->
					</li>
				</ul>
			</div>
			<!--scroll_wrap end-->
		</div>
		<!-- popwin_size end -->