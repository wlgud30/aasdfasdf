<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<aside id="headzone">
    <div class="logo_top"><img src="img/logo1.svg" alt="민턴in" class="logo" onclick="location.href='02_board_list1.html'"></div>
    <div class="col_2data bg_light_gr pd_lrtb admin_box">
      <div><i class="icon-f i_font_mrs icon-member sub_color title_ms"></i><strong class="inline_st title_ms">홍길동</strong>님</div>
      <div><i class="icon-f i_font_mrs icon-out sub_color"></i>로그아웃</div>
    </div>
    <nav><!-- InstanceBeginEditable name="nav_etc" --> <!-- InstanceEndEditable -->
      <ul id="navi">
        <li>
          <p><i class="icon-outline_4 icon-f"></i>대회정보</p>
          <ul class="nav_sub">
            <li>
              <p onclick="location.href='ContestWebSummaryUpdateForm.techni'">개요(수정)</p>
            </li>
            <li>
              <p onclick="location.href='02_list-expected_2-2.html'">대회설정</p>
            </li>
            <li>
              <p onclick="location.href='02_list-end_2-3.html'">종료 (8)</p>
            </li>
            <li>
              <p onclick="location.href='02_list-request_2-4.html'">신청 중 (1)</p>
            </li>
          </ul>
        </li>
        <li>
          <p><i class="icon-player icon-f"></i>선수정보</p>
          <ul class="nav_sub">
            <li>
              <p onclick="location.href='04_player-enroll_2-1.html'">선수등록/수정</p>
            </li>
            <li>
              <p onclick="location.href='05_credit_2-2.html'">입금확인</p>
            </li>
          </ul>
        </li>
        <li>
          <p><i class="icon-match icon-f"></i>대진표</p>
          <ul class="nav_sub">
            <li>
              <p onclick="location.href='08_score_4-0.html'">가 대진표 생성</p>
            </li>
            <li>
              <p onclick="location.href='06_matches-time_3-2.html'">가 대진표</p>
            </li>
            <li>
              <p onclick="location.href='ContestWebDesideMatchList.techni'">확정대진표</p>
            </li>
          </ul>
        </li>
        <li>
          <p onclick="location.href='ContestWebStayMatchList.techni'"><i class="icon-score icon-f"></i>대회진행(점수)</p>
        </li>
        <li>
          <p onclick="location.href='/ContestWeb/ContestWebWinner.techni'"><i class="icon-ranking icon-f"></i>대회결과(순위)</p>
        </li>
      </ul>
      </nav>
    <div class="bg_light_gr pd_lrtb call_box">
      <h4 class="inline_st title_g tit_mbt">연락처</h4>
      <ul class="li_row_s gray_text">
        <li><i class="icon-f icon-email sub_color i_font_mrs"></i>insport@techin.co.kr</li>
        <li><i class="icon-f icon-mobile sub_color i_font_mrs"></i>070-4772-3930</li>
      </ul>
    </div>
  </aside>

  
</script>
