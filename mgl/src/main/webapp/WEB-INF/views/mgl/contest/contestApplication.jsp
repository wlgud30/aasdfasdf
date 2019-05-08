<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="content white_bg">
	<table class="game_td cet_lay td_pd_l0">
		<tr>
			<td class="no_td">1</td>
			<td class="ga_title">혼복-40-왕초</td>
			<td class="w20">
				<ul class="name_row">
					<li>
						<span class="name3">김남</span>
					</li>
					<li>
						<span class="name3">홍이</span>
					</li>
				</ul>
			</td>
			<td class="w20">
				<i class="icon-note btn_i main_color" title="수정"></i>
				<i class="icon-f icon-delete btn_i sub_color" title="삭제"></i>
			</td>
			<td class="w10">입금확인</td>
		</tr>
	</table>
</div>
<!-- content end -->
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
		<table class="table_fo	rm mb_b">
			<tr>
				<td><input type="text" placeholder="대회명"></td>
			</tr>
			<tr>
				<td><div class="pop_opt_input">
					<input type="text" placeholder="클럽명 (기본클럽 선택 or 입력)">
					<i class="opt_i popwin_btn2"></i></div>
				</td>
			</tr>
			<tr>
				<td><span class="guide_text">종목</span>
					<select name="select">
						<option value="혼복" selected>혼복</option>
						<option value="남복">남복</option>
						<option value="여복">여복</option>
						<option value="단식">단식</option>
					</select>
				</td>
			</tr>
		</table>
		<hr class="line_m_both">
		<div class="col_2input pd_tb">
			<div>
				<table class="table_form">
					<tr>
						<td><div class="pop_opt_input">
							<input type="text" placeholder="이름 (입력 or 선택)">
							<i class="opt_i popwin_btn3"></i></div>
						</td>
					</tr>
					<tr>
						<td><input type="text" placeholder="생년월일 ('-' 제외)" maxlength="8"></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="핸드폰 번호 ('-' 제외)" maxlength="11"></td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table_form">
					<tr>
						<td><div class="pop_opt_input">
							<input type="text" placeholder="이름 (입력 or 선택)">
							<i class="opt_i popwin_btn3"></i></div>
						</td>
					</tr>
					<tr>
						<td><input type="text" placeholder="생년월일 ('-' 제외)" maxlength="8"></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="핸드폰 번호 ('-' 제외)" maxlength="11"></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- col_2input end -->
		<hr class="line_m_both cont_mb_b">
		<p class="vital_text mb_b"> 핸드폰 번호와 생년월일을 등록하시면 임시회원으로 자동가입됩니다.
		대회의 메뉴와 클럽의 메뉴를 3개월간 사용할 수 있습니다. </p>
		<hr class="line_both">
		<div class="btn_full col2_lay">
			<div>
				<span class="btn_st close_popup " onclick="location.href='#;'">등록</span>
			</div>
			<div>
				<span class="btn_st btn_color1 close_popup" onClick="location.href='#;'">등록후 계속</span>
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
						<div class="thum" style="background-image:url(img/member_photo_01.jpg);"></div>
					</div>
					<div class="text_area">
						<span class="name3">가길동입니다.</span>
						<em class="game_nb-tiny">65</em>
						<span class="age_rank">(50-자강)</span>
					</div>
				</div>
				<!--photo_name end-->
			</li>
		</ul>
	</div>
	<!--scroll_wrap end--> 
</div>
<!-- popwin_size end --> 