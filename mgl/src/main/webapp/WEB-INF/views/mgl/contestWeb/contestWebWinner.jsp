<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
   $(function() {
      var sort_id = "��ü";
      var rank_id = "��ü";
      var sort_b = true; 
      var rank_b = true;

      $("[name = 'choice_sort']").click(function() {
         sort_id = $(this).attr("id");

         $("#k_nm li").each(function() {
            sort_b = $(this).text().indexOf(sort_id);
            rank_b = $(this).text().indexOf(rank_id);
         
            if (sort_b == -1) { // ��ġ�ϴ� ���� ����
               sort_b = false;
               if (sort_id == "��ü") {
                  sort_b = true;
               }
            }
            if (rank_b == -1) { // ��ġ�ϴ� ���� ����
               rank_b = false;
               if (rank_id == "��ü") {
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

            if (sort_b == -1) { // ��ġ�ϴ� ���� ����
               sort_b = false;
               if (sort_id == "��ü") {
                  sort_b = true;
               }
            }
            if (rank_b == -1) { // ��ġ�ϴ� ���� ����
               rank_b = false;
               if (rank_id == "��ü") {
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
            <span>�Ի���</span>
          </li>
          <li onclick="location.href='09_ranking-club_5-0.html'">
            <span>Ŭ������</span>
          </li>
        </ul>
      </div>
      <!-- tab_btn_b_area end -->
      <div class="cont_s white_bg" style="padding:5px 5px 5px 5px">
        <div class="col-inputside">
          <div class="td_1">
            <ul class="list_check radio_ul">
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="��ü" value="check" checked="">
                <label for="sort_0">��ü</label>
              </li>
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="ȥ��" value="check">
                <label for="sort_1">ȥ��</label>
              </li>
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="����" value="check">
                <label for="sort_2">����</label>
              </li>
              <li>
                <input type="radio" name="choice_sort" class="check_circle" id="����" value="check">
                <label for="sort_3">����</label>
              </li>
            </ul>
          </div> 
          <div>
            <ul class="list_check radio_ul">
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="��ü" value="check" checked="">
                <label for="rank_1">��ü</label>
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
                <input type="radio" name="choice_rank" class="check_circle" id="�ʽ�" value="check">
                <label for="rank_6">�ʽ�</label>
              </li>
              <li>
                <input type="radio" name="choice_rank" class="check_circle" id="����" value="check">
                <label for="rank_7">����</label>
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
            
            <li>��� :
              <ul class="name_row">
                <li>
                  <span class="name3">ȫ�浿</span> 
                </li>
                <li>
                  <span class="name3">���浿</span>
                </li>
              </ul>
            </li>
          </ul>
          <div class="accd_a white_bg" style="display: none;padding:5px 0px 0px 0px;">
            <div class="col_2input wauto pd_gap">
              <div>
                <dl class="prize_box prize1 cet_lay">
                  <dt class="main_bg">1��</dt>
                  <dd>
                    <p class="club_name el_date">�����ƸӸ�����Ŭ</p>
                    <ul class="name_col">
       
                      <li>
                        <span class="name3">��ȫ��</span>
                      </li>
                      <li>
                        <span class="name3">�賲ȫ</span>
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
							alert("����")
						} else {
							alert("���� ��� ��Ⱑ ������ �ʾҽ��ϴ�.")
						}
					},
					error : function(error) {
						swal("����in", "error : " + error);
					}
				})
	}
 </script>