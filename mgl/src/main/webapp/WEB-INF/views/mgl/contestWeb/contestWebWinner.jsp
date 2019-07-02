<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
   $(function() {
      var sort_id = "전체";
      var rank_id = "전체";
      var sort_b = true; 
      var rank_b = true;

      $("[name = 'choice_sort']").click(function() {
         sort_id = $(this).attr("id");

         $("#k_nm li").each(function() {
            sort_b = $(this).text().indexOf(sort_id);
            rank_b = $(this).text().indexOf(rank_id);
         
            if (sort_b == -1) { // 일치하는 문자 없음
               sort_b = false;
               if (sort_id == "전체") {
                  sort_b = true;
               }
            }
            if (rank_b == -1) { // 일치하는 문자 없음
               rank_b = false;
               if (rank_id == "전체") {
                  rank_b = true;
               }
            }
            if (sort_b && rank_b) {
               $(this).css("display", "");
            } else {
               $(this).css("display", "none");
            }
         })
      })

      $("[name = 'choice_rank']").click(function() {
         rank_id = $(this).attr("id");

         $("#k_nm li").each(function() {

            sort_b = $(this).text().indexOf(sort_id);
            rank_b = $(this).text().indexOf(rank_id);

            if (sort_b == -1) { // 일치하는 문자 없음
               sort_b = false;
               if (sort_id == "전체") {
                  sort_b = true;
               }
            }
            if (rank_b == -1) { // 일치하는 문자 없음
               rank_b = false;
               if (rank_id == "전체") {
                  rank_b = true;
               }
            }

            if (sort_b && rank_b) {
               $(this).css("display", "");

            } else {
               $(this).css("display", "none");
            }
         })
      })
   });

   
</script>

 <!-- InstanceBeginEditable name="container" -->
      <div class="tab_btn_b_area">
        <ul class="tab_btn_b">
          <li onclick="location.href='09_ranking_5-0.html'" class="active_tab">
            <span>입상자</span>
          </li>
          <li onclick="location.href='09_ranking-club_5-0.html'">
            <span>클럽순위</span>
          </li>
        </ul>
      </div>
      <!-- tab_btn_b_area end -->
      <div class="cont_s white_bg" style="padding:5px 5px 5px 5px">
        <div class="col-inputside">
          <div class="td_1">
            <ul class="list_check radio_ul">
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="전체" value="check" checked="">
                <label for="sort_0">전체</label>
              </li>
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="혼복" value="check">
                <label for="sort_1">혼복</label>
              </li>
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="남복" value="check">
                <label for="sort_2">남복</label>
              </li>
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="여복" value="check">
                <label for="sort_3">여복</label>
              </li>
            </ul>
          </div> 
          <div>
            <ul class="list_check radio_ul">
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="전체" value="check" checked="">
                <label for="rank_1">전체</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="A" value="check">
                <label for="rank_2">A</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="B" value="check">
                <label for="rank_3">B</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="C" value="check">
                <label for="rank_4">C</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="D" value="check">
                <label for="rank_5">D</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="초심" value="check">
                <label for="rank_6">초심</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="왕초" value="check">
                <label for="rank_7">왕초</label>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- cont_s end -->
      
     <c:forEach items="${rankInfo}" var="list">
      <ul class="accordion_ul"  id="k_nm" onclick="rank2('${list.ct_kind}','${list.ct_k_nm}','${list.ct_g_idx }')">
        <li class=""> 
         <ul class="accd_head">  
            <li>${list.ct_k_nm }</li>
            
            <li>우승 :
              <ul class="name_row">
                <li>
                  <span class="name3">홍길동</span> 
                </li>
                <li>
                  <span class="name3">가길동</span>
                </li>
              </ul>
            </li>
          </ul>
          <div class="accd_a white_bg" style="display: none;padding:5px 0px 0px 0px;">
            <div class="col_2input wauto pd_gap">
              <div>
                <dl class="prize_box prize1 cet_lay">
                  <dt class="main_bg">1위</dt>
                  <dd>
                    <p class="club_name el_date">리더아머마르스클</p>
                    <ul class="name_col">
       
                      <li>
                        <span class="name3">남홍길</span>
                      </li>
                      <li>
                        <span class="name3">김남홍</span>
                      </li>
                    </ul>
                  </dd>
                </dl>
              </div>
          
            </div>
          </div>
        
          <!-- accd_a end--> 
     
        </li> 
      </ul>
          </c:forEach>
       
      <!-- InstanceEndEditable --> 
      
      
 <script>
 function rank2(kind, nm, group) {
		$.ajax({
					async : true,
					type : "post",
					data : JSON.stringify({
						"kind" : kind,
						"ct_k_nm" : nm,
						"ct_g_idx" : group
					}),
					url : "/Contest/ContestPDF2Rank.techni",
					datatype : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if (data.cnt > 0) {
							alert("성공")
						} else {
							alert("아직 모든 경기가 끝나지 않았습니다.")
						}
					},
					error : function(error) {
						swal("민턴in", "error : " + error);
					}
				})
	}
 </script>