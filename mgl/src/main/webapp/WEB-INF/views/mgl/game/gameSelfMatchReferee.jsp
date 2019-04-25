<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(document).ready(function() {
	$('#court_${cs_court}').attr('selected','selected');
});
function courtChange(t){
	$("#cs_court").val(t.replace("코트",""));
	$("#frm").submit();
}
function onlyNumber(){
	if((event.keyCode<48)||(event.keyCode>57))
   		event.returnValue=false;
}

function pSubmit(){
	var aScore = $("#aScore").val();
	var bScore = $("#bScore").val();

	if(aScore == ""||bScore ==""||aScore == null||bScore==null){
		swal({
			title : "민턴in",
			text : "점수를 입력해주세요."
		})
	}else if(aScore == bScore){
		swal({
			title : "민턴in",
			text : "점수가 같습니다. 다시 확인해주세요."
		})
	}else{
		swal({
			title : "민턴in",
			text : "점수를 등록하시겠습니까?",
			buttons : {
				confirm : "OK",
				cancel : "NO"
			}
		})
		.then((value) => {
			if(value){
				$.ajax({
					async : true,
					type:"post",
					data : JSON.stringify({"a1_id" :"${list[0].cs_at_id1}","a2_id":"${list[0].cs_at_id2}","b1_id":"${list[0].cs_bt_id1}","b2_id":"${list[0].cs_bt_id2}","cs_gidx":"${list[0].cs_gidx}","aScore":aScore,"bScore":bScore}),
					url:"/Game/selfScoreInsert.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title : "민턴in",
								text : "점수가 등록되었습니다.",
								type : "success"
							})
							.then((value) =>{
								location.href='/Game/selfMatchReferee.techni'
							})
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
					},
					error : function(error){
						swal("민턴in","error : "+error);
					}
				}) 
			}
		})
	}
}

</script>
<!-- InstanceBeginEditable name="container" -->
<div class="pd_lrtb white_bg tit_select">
	<ul class="li_col-nol">
		<li>
			<h4 class="title_s">
				<b>코트선택</b>
			</h4> <select onchange="courtChange(this.value)">
				<c:forEach begin="1" end="${court}">
					<c:set var="i" value="${i+1}" />
					<option id="court_${i}">${i}코트</option>
				</c:forEach>
		</select>
		</li>
		<!-- 	<li><ul class="li_col-nol title_s">
							<li><b>전체</b>600</li>
							<li><b>완료</b>201</li>
							<li><b>잔여</b>0</li>
							<li><b>진행율</b>100%</li>
						</ul></li> -->
	</ul>
</div>
<form action="/Game/selfMatchReferee.techni" method="post" id="frm">
	<input type="hidden" name="cs_court" id="cs_court">
</form>
<c:if test="${list  ne null }">
	<c:set var="j" value="${j+1}" />
	<div class="content white_bg pd_0 cet_lay">
		<c:forEach items="${list}" var="list">
			<c:if test="${j eq 1 }">
				<div class="line_dark pd_0">
					<ul class="li_col-nol impot_bg">
						<li>${fn:substring(list.cs_w_date,0,5)}</li>
						<li>${list.cs_court}코트${list.cs_no}</li>
						<li>${list.cs_k_nm}</li>
					</ul>
					<table class="line_no td-pt score-result3">
						<tr>
							<td class="club_name32"><span class="club_name"></span>
								<ul class="name_col">
									<li><span class="name3">${list.a1_id }</span> <span
										class="age_rank">(${list.a1_age }-${list.a1_gd })</span></li>
									<li><span class="name3">${list.a2_id }</span> <span
										class="age_rank">(${list.a2_age }-${list.a2_gd })</span></li>
								</ul>
								<div class="score_input_area">
									<input type="number" placeholder="00" class="box_input cet_lay"
										id="aScore" maxlength="2" onkeypress="onlyNumber();">
								</div></td>
							<td class="score2_td"><span class="sign-round color3">진행</span>
							</td>
							<td class="club_name32"><span class="club_name"></span>
								<ul class="name_col">
									<li><span class="name3">${list.b1_id }</span> <span
										class="age_rank">(${list.b1_age }-${list.b1_gd })</span></li>
									<li><span class="name3">${list.b2_id }</span> <span
										class="age_rank">(${list.b2_age }-${list.b2_gd })</span></li>
								</ul>
								<div class="score_input_area">
									<input type="number" placeholder="00" class="box_input cet_lay"
										id="bScore" maxlength="2" onkeypress="onlyNumber();">
								</div></td>
						</tr>
					</table>
					<div class="btn_full pd_lrb">
						<span class="btn_st" onclick="pSubmit()">점수 등록</span>
					</div>
				</div>
			</c:if>
			<c:if test="${j ne 1 }">
				<ul class="li_col-nol impot_bg">
					<li>${fn:substring(list.cs_w_date,0,5)}</li>
					<li>${list.cs_court}코트${list.cs_no}</li>
					<li>${list.cs_k_nm}</li>
					<li><span onclick="pointInsert('${list.cs_gidx}','${list.a1_id}','${list.a1_age}-${list.a1_gd }','${list.a2_id}','${list.a2_age}-${list.a2_gd }','${list.b1_id}','${list.b1_age}-${list.b1_gd }','${list.b2_id}','${list.b2_age}-${list.b2_gd }','${list.a1 }','${list.a2 }','${list.b1 }','${list.b2 }')"
						class="line_btn vet_btn sub1_color m_size popwin_btn1"
						style="padding-bottom: 0px; padding-top: 0px;">점수</span></li>
				</ul>
				<table class="line_no td-pt score-result3">
					<tr>
						<td class="club_name32"><span class="club_name"></span>
							<ul class="name_col">
								<li><span class="name3">${list.a1_id }</span> <span
									class="age_rank">(${list.a1_age }-${list.a1_gd })</span></li>
								<li><span class="name3">${list.a2_id }</span> <span
									class="age_rank">(${list.a2_age }-${list.a2_gd })</span></li>
							</ul></td>
						<td class="score2_td"><span class="sign-round color2">${list.cs_status }</span>
						</td>
						<td class="club_name32"><span class="club_name"></span>
							<ul class="name_col">
								<li><span class="name3">${list.b1_id }</span> <span
									class="age_rank">(${list.b1_age }-${list.b1_gd })</span></li>
								<li><span class="name3">${list.b2_id }</span> <span
									class="age_rank">(${list.b2_age }-${list.b2_gd })</span></li>
							</ul></td>
					</tr>
				</table>
			</c:if>
			<c:set var="j" value="${j+1}" />
		</c:forEach>
	</div>
	<div class="popwin_size white_bg wsize-300">
    <div class="head_top title_popup">
      <div class="tit_top">
        <h1 class="game_title">점수입력(등록)</h1>
      </div>
      <div class="bt_top">
        <span class="btn_i la la-close" onclick="popClose()"></span>
      </div>
    </div>
    <!-- title_popupp end -->
    <div class="popup_body">
    <input type="hidden" id="gidx">
      <div class="col_2line mb_m mb_t">
        <div>
          <h4 class="th_st">A 팀</h4>
          <table class="game_td ell_td">
            <tbody>
              <tr>
                <td><div class="photo_name">
                    <div class="text_area">
                      <input type="hidden" id="a1_id">
                      <span class="name3" id="a1_id_"></span>
                      <span class="age_rank" id="a1_age_gd"></span>
                    </div>
                  </div>
                  </td>
              </tr>
              <tr>
                <td><div class="photo_name">
                    <div class="text_area">
                    <input type="hidden" id="a2_id">
                      <span class="name3" id="a2_id_"></span>
                      <span class="age_rank" id="a2_age_gd"></span>
                    </div>
                  </div>
                  
                  <!--photo_name end-->
                  
                  <div class="score_input_area">
                    <input id="a_score" type="number" placeholder="00" class="box_input cet_lay">
                  </div></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div>
          <h4 class="th_st">B 팀</h4>
          <table class="game_td ell_td">
            <tbody>
              <tr>
                <td><div class="photo_name">
                    <div class="text_area">
                    <input type="hidden" id="b1_id">
                      <span class="name3" id="b1_id_"></span>
                      <span class="age_rank" id="b1_age_gd"></span>
                    </div>
                  </div>
                  
                  <!--photo_name end--></td>
              </tr>
              <tr>
                <td><div class="photo_name">
                    <div class="text_area">
                    <input type="hidden" id="b2_id">
                      <span class="name3" id="b2_id_"></span>
                      <span class="age_rank" id="b2_age_gd"></span>
                    </div>
                  </div>
                  
                  <!--photo_name end-->
                  
                  <div class="score_input_area">
                    <input id="b_score" type="number" placeholder="00" class="box_input cet_lay">
                  </div></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- col_2line end-->
      <hr class="line_both mb_b">
      <div class="right_lay">
        <span class="btn_st close_popup" onClick="pointInsert2()">등록</span>
      </div>
    </div>
    <!-- popup_body end--> 
  </div>
</c:if>
<!-- content end-->
<!-- InstanceEndEditable -->
<!-- container end -->
<div id="ft_area">
	<!-- InstanceBeginEditable name="ft_area" -->
	<!-- InstanceEndEditable -->
</div>

<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<script>
		$(document).ready(function() {
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
			$(".prettydropdown:eq(0)  label:eq(0)").remove();
			var $menu = $('.btn_more');
			  $(".more_menu").each(function() {
			    $(this).click(function(e) {
			      e.stopPropagation();
			      var more_pt = $(this).closest($menu),
			        titlehead = $(this).closest('.title_head');
			      if (more_pt.hasClass('is-active')) {
			        more_pt.removeClass('is-active');
			        more_pt.children('.more_menu_bg').remove();
			        titlehead.prev('header').css('z-index', 11);
			      } else {
			        more_pt.addClass('is-active');
			        more_pt.append('<div class="more_menu_bg"></div>');
			        titlehead.prev('header').css('z-index', 10);
			        $(this).siblings().on('click', function(e) {
			          e.stopPropagation();
			        });
			      }
			      more_pt.children(".more_menu_bg").click(function() {
			        $(this).parent($menu).removeClass('is-active');
			        $(this).remove();
			        titlehead.prev('header').css('z-index', 11);
			      });
			    });
			  });
			  var href_over = document.getElementsByClassName('hrefover');
			  $(href_over).on('click', function(e) {
			    e.stopPropagation();
			  });
			  $($menu).each(function() {
			    $(this).parent().addClass('noti_btn_is');
			  });
			
			
			var acdtop = document.getElementsByClassName('move_ct_area'),
		    head1_h = $('#head1').outerHeight(true),
		    movect = $(acdtop).children('.move_ct'),
		    movect_h = movect.outerHeight(true);
		  movect.css('top', -movect_h);
		  $('#pr_up_btn').on('click', function() {
		    var move_cont = $(this).closest('#head1').next(acdtop);;
		    if (move_cont.hasClass('open')) {
		      move_cont.removeClass('open');
		      move_cont.closest('header').removeClass('acd2_vb');
		      $(move_cont).find('.move_ct').stop(true, false).animate({
		        'top': -movect_h,
		        opacity: 0
		      }, 200);
		      move_cont.children('.more_menu_bg').remove();
		    } else {
		      move_cont.addClass('open');
		      move_cont.closest('header').addClass('acd2_vb');
		      $(move_cont).find('.move_ct').stop(true, false).animate({
		        'top': head1_h,
		        opacity: 1
		      }, 200);
		      move_cont.append('<div class="more_menu_bg"></div>');
		    }
		    move_cont.children(".more_menu_bg").click(function() {
		      $(this).prev('.move_ct').stop(true, false).animate({
		        'top': -movect_h,
		        opacity: 0
		      }, 200);
		      $(this).parent('.move_ct_area').removeClass('open');
		      $(this).parents('header').removeClass('acd2_vb');
		      $(this).remove();
		    });
		  });
		});
		
		function pointInsert(gidx,a1_id,a1_age_gd,a2_id,a2_age_gd,b1_id,b1_age_gd,b2_id,b2_age_gd,a1,a2,b1,b2){
			$("#a1_id_").html(a1_id);
			$("#a1_age_gd").text(a1_age_gd);
			$("#a2_id_").html(a2_id);
			$("#a2_age_gd").text(a2_age_gd);
			$("#b1_id_").html(b1_id);
			$("#b1_age_gd").text(b1_age_gd);
			$("#b2_id_").html(b2_id);
			$("#b2_age_gd").text(b2_age_gd);
			$("#gidx").val(gidx);
			$("#a1_id").val(a1);
			$("#a2_id").val(a2);
			$("#b1_id").val(b1);
			$("#b2_id").val(b2);
		}
		function pointInsert2(){
			var aScore = $("#a_score").val();
			var bScore = $("#b_score").val();

			if(aScore == ""||bScore ==""||aScore == null||bScore==null){
				swal({
					title : "민턴in",
					text : "점수를 입력해주세요."
				})
			}else if(aScore == bScore){
				swal({
					title : "민턴in",
					text : "점수가 같습니다. 다시 확인해주세요."
				})
			}else{
						$.ajax({
							async : true,
							type:"post",
							data : JSON.stringify({"a1_id" :$("#a1_id").val(),"a2_id":$("#a2_id").val(),"b1_id":$("#b1_id").val(),"b2_id":$("#b2_id").val(),"cs_gidx":$("#gidx").val(),"aScore":aScore,"bScore":bScore}),
							url:"/Game/selfScoreInsert.techni",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								if(data.cnt>0){
									swal({
										title : "민턴in",
										text : "점수가 등록되었습니다.",
										type : "success"
									})
									.then((value) =>{
										location.href='/Game/selfMatchReferee.techni'
									})
								}else{
									swal("민턴in","죄송합니다. 다시 시도해 주세요.")
								}
							},
							error : function(error){
								swal("민턴in","error : "+error);
							}
						}) 
			}
		}
		function popClose(){
			$("#a1_id_").html();
			$("#a1_age_gd").text();
			$("#a2_id_").html();
			$("#a2_age_gd").text();
			$("#b1_id_").html();
			$("#b1_age_gd").text();
			$("#b2_id_").html();
			$("#b2_age_gd").text();
			$("#gidx").val();
			$("#a1_id").val();
			$("#a2_id").val();
			$("#b1_id").val();
			$("#b2_id").val();
		}
		</script>