<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content white_bg">
    <table class="table_form">
      <tbody><tr>
        <td><input type="text" placeholder="대회명칭"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="홈페이지"></td>
      </tr>
      <tr>
        <td><p class="guide_text">대회</p>
          <input type="text" value="2017.06.09 (화)" class="date_pick">
          <span class="date_icon_btn" onclick="location.href='#;'"></span>
          <span class="time_line_i"></span>
          <input type="text" value="2017.06.09 (화)" class="date_pick">
          <span class="date_icon_btn" onclick="location.href='#;'"></span></td>
      </tr>
      <tr>
        <td><p class="guide_text">접수</p>
          <input type="text" value="2017.06.09 (화)" class="date_pick">
          <span class="date_icon_btn" onclick="location.href='#;'"></span>
          <span class="time_line_i"></span>
          <input type="text" value="2017.06.09 (토)" class="date_pick">
          <span class="date_icon_btn" onclick="location.href='#;'"></span></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="대회장소 (체육관)"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="주최"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="주관"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="협찬"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="후원"></td>
      </tr>
      <tr>
        <td><div class="filebox col-inputside">
            <div>
              <input class="upload-name" value="요강" disabled="disabled">
              <input type="file" id="filename" class="upload-hidden">
            </div>
            <div class="side_data">
              <label for="filename" class="btn_st">첨부</label>
            </div>
          </div>
          
          <!-- filebox end--></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="문의처 (전화 or 이메일)"></td>
      </tr>
      <tr>
        <td><p class="guide_text">선택사항</p>
          <ul class="list_check li_lot">
            <li>
              <input type="checkbox" class="li_check" id="check_1">
              <label for="check_1">홍보요청</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="check_2">
              <label for="check_2">출전자 접수</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="check_3">
              <label for="check_3">출전비 접수</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="check_4">
              <label for="check_4">대진표 요청</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="check_5">
              <label for="check_5">대회진행</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="check_6">
              <label for="check_6">심판요청</label>
            </li>
          </ul></td>
      </tr>
    </tbody></table>
  </div>
  <!-- content end -->
  <div class="cat_area">
    <h4 class="title_m">종목설정</h4>
  </div>
  <div class="content white_bg">
    <table class="table_form">
      <tbody><tr>
        <td><span class="guide_text">연령</span>
          <ul class="list_check li_lot">
            <li>
              <input type="checkbox" class="li_check" id="age_1">
              <label for="age_1">20대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_2">
              <label for="age_2">25대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_3">
              <label for="age_3">30대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_4">
              <label for="age_4">35대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_5">
              <label for="age_5">40대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">45대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">50대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">55대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">60대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">65대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">70대</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="age_6">
              <label for="age_6">75대</label>
            </li>
          </ul></td>
      </tr>
      <tr>
        <td><span class="guide_text">구분</span>
          <ul class="list_check li_lot">
            <li>
              <input type="checkbox" class="li_check" id="sort_1">
              <label for="sort_1">혼복</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="sort_2">
              <label for="sort_2">여복</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="sort_3">
              <label for="sort_3">남복</label>
            </li>
          </ul></td>
      </tr>
      <tr>
        <td><span class="guide_text">급수</span>
          <ul class="list_check li_lot">
            <li>
              <input type="checkbox" class="li_check" id="grade_1">
              <label for="grade_1">자강</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="grade_2">
              <label for="grade_2">A</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="grade_3">
              <label for="grade_3">B</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="grade_4">
              <label for="grade_4">C</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="grade_5">
              <label for="grade_5">D</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="grade_6">
              <label for="grade_6">초심</label>
            </li>
            <li>
              <input type="checkbox" class="li_check" id="grade_7">
              <label for="grade_7">왕초</label>
            </li>
          </ul></td>
      </tr>
    </tbody></table>
  </div>