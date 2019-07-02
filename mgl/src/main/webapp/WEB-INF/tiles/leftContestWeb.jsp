<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<aside id="headzone">
    <div class="logo_top"><img src="img/logo1.svg" alt="민턴in" class="logo" onclick="location.href='02_board_list1.html'"></div>
    <div class="col_2data bg_light_gr pd_lrtb admin_box">
      <div><i class="icon-f i_font_mrs icon-member sub_color title_ms"></i><strong class="inline_st title_ms">홍길동</strong>님</div>
      <div><i class="icon-f i_font_mrs icon-out sub_color"></i>로그아웃</div>
    </div>
    <nav> <!-- InstanceBeginEditable name="nav_etc" --> <!-- InstanceEndEditable -->
      <ul id="navi">
        <li><p onclick="location.href='03_application.html'"><i class="icon-game-ask icon-f"></i>대회신청</p></li>
        <li><p onclick="location.href='#;'" class="active_nav"><i class="icon-playing icon-f"></i>대회</p>
          <ul class="nav_sub">
            <li><p onclick="location.href='02_list-progress.html'" class="active_navs">진행 중 (2)</p></li>
            <li><p onclick="location.href='02_list-expected.html'">예정 (3)</p></li>
            <li><p onclick="location.href='02_list-end.html'">종료 (8)</p></li>
            <li><p onclick="location.href='02_list-request.html'">신청 중 (1)</p></li>
          </ul>
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