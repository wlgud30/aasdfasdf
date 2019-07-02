<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="tab_btn_b_area col_2data ver_lay_m">
	<div>
		<ul class="tab_btn_b wauto">
			<li onclick="location.href='/ContestWeb/ContestWebStayMatchList.techni'"
				class="active_tab"><span>대기게임</span></li>
			<li onclick="location.href='/ContestWeb/ContestWebEndMatchList.techni'"><span>종료게임(점수수정)</span>
			</li>
			<li onclick="location.href='08_score-ranking_4-0.html'"><span>종목별
					순위(점수출력)</span></li>
		</ul>
	</div>
	<div>
		<ul class="li_col-nol li_dot">
			<li><b>게임수</b>${g_cnt.game_count } </li>
			<li><b>완료게임</b>${g_cnt.end_count } </li>
			<li><b>잔여게임</b>${g_cnt.game_count-g_cnt.end_count}</li>
			<li><b>진행률</b>${g_cnt.end_count / g_cnt.game_count  * 100 } %</li>
		</ul>
	</div>
</div>
<div class="content white_bg">
	
	<hr class="gap_s">
	<table class="text_td cet_lay th_mix">
		<thead>
			<tr>
				<th rowspan="2" class="no_td">게임<br> 번호
				</th>
				<th rowspan="2">시작<br> 시간
				</th>
				<th colspan="2">코트</th>
				<th rowspan="2">종목</th>
				<th rowspan="2">그룹</th>
				<th colspan="3">A팀</th>
				<th rowspan="2">점수</th>
				<th rowspan="2">점수</th>
				<th colspan="3">B팀</th>
				<th rowspan="2">게임<br> 상태
				</th>
				<th rowspan="2">게임지<br> 출력
				</th>
			</tr>
			<tr>
				<th>번호</th>
				<th>순번</th>
				<th>소속팀</th>
				<th>선수</th>
				<th>선수</th>
				<th>소속팀</th>
				<th>선수</th>
				<th>선수</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="i" value="1" />
			<c:forEach var="list" items="${matchList}">
			<c:if test="${fn:contains(list.ct_gidx,'win')}">
				<tr class="${list.ct_gidx}" id="${list.ct_gidx}">
					<td class="no_td ct_num">${list.ct_num}</td>
					<td class="ct_w_dat popwin_btn0">${fn:substring(list.ct_w_dat,0,5)}</td>
					<td class="ct_court popwin_btn0">${list.ct_court }</td>
					<td class="popwin_btn0">${list.ct_order } <c:if
							test="${list.ct_num % courtCnt == 0  }">
							<c:set var="i" value="${i+1}" />
						</c:if></td>
					<td class="ct_k_nm popwin_btn0">${list.ct_k_nm }</td>
					<td class="popwin_btn0">${list.ct_kind }</td>
					<td class="team_a_nm popwin_btn0"><p class="club_name">${list.team_a_nm }</p></td>
					<td class="a1_nm popwin_btn0" id="${list.a1_age}-${list.a1_gd }"><p
							class="name3">${fn:replace(list.a1_nm,"1","")}</p></td>
					<td class="a2_nm popwin_btn0" id="${list.a2_age}-${list.a2_gd }"><p
							class="name3">${fn:replace(list.a2_nm,"1","")}</p></td>

					<td class="popwin_btn0">${list.team_a_score }</td>
					<td class="popwin_btn0">${list.team_b_score }</td>

					<td class="team_b_nm popwin_btn0"><p class="club_name">${list.team_b_nm }</p></td>
					<td class="b1_nm popwin_btn0" id="${list.b1_age}-${list.b1_gd }"><p
							class="name3">${fn:replace(list.b1_nm,"1","")}</p></td>
					<td class="b2_nm popwin_btn0" id="${list.b2_age}-${list.b2_gd }"><p
							class="name3">${fn:replace(list.b2_nm,"1","")}</p></td>

					<td class="popwin_btn0">${list.ct_status }</td>
					<td onclick="print('${list.ct_gidx}')" title="출력"><i
						class="icon-printer title_ms main_color"></i></td>

				</tr>
				<input type="hidden"
					value="${list.ct_at_id1},${list.ct_at_id2},${list.ct_bt_id1},${list.ct_bt_id2},${list.ct_gidx},${list.team_a_idx},${list.team_b_idx}" />
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- content end  -->
<!--상세보기 팝업  -->
<div class="popwin_size white_bg">
	<div class="head_top title_popup">
		<div class="tit_top">
			<ul class="li_col-nol game_title">
				<li id="ct_w_dat"></li>
				<li id="ct_court"></li>
				<li id="ct_k_nm"></li>
				<li id="ct_kind"></li>
			</ul>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="popup_body">
		<table class="score-result3 cet_lay mb_b">
			<tbody>
				<tr>
					<td class="club_name32"><span class="club_name" id="team_a_nm">리더아머마르스</span>
						<ul class="name_col">
							<li><span class="name3" id="a1_nm">남홍길</span> <span
								class="age_rank" id="a1_age_nm">(40-왕초)</span></li>
							<li><span class="name3" id="a2_nm">김남홍</span> <span
								class="age_rank" id="a2_age_nm">(40-A)</span></li>
						</ul>
						<div class="score_input_area">
							<input type="text" id="aScore" class="box_input cet_lay"
								placeholder="00" maxlength="2">
							<p class="tip">점수를 입력하세요</p>
						</div></td>
					<td class="score2_td"><span class="sign-round color3">진행</span>
					</td>
					<td class="club_name32"><span class="club_name" id="team_b_nm">TeamB.S.</span>
						<ul class="name_col">
							<li><span class="name3" id="b1_nm">남홍길</span> <span
								class="age_rank" id="b1_age_nm">(40-왕초)</span></li>
							<li><span class="name3" id="b2_nm">김남홍</span> <span
								class="age_rank" id="b2_age_nm">(40-A)</span></li>
						</ul>
						<div class="score_input_area">
							<input type="text" id="bScore" class="box_input cet_lay"
								placeholder="00" maxlength="2">
							<p class="tip">점수를 입력하세요</p>
						</div></td>
				</tr>
			</tbody>
		</table>
		<hr class="line_both mb_b">
		<div class="btn_full">
			<span class="btn_st close_popup" onclick="pSubmit()">점수등록</span>
			<!-- onclick="pSubmit()" -->
		</div>
	</div>
	<!-- popup_body end-->
</div>
<input type="hidden" value="${list.ct_at_id1}" name="a1_id" id="a1_id">
<input type="hidden" value="${list.ct_at_id2}" name="a2_id" id="a2_id">
<input type="hidden" value="${list.ct_bt_id1}" name="b1_id" id="b1_id">
<input type="hidden" value="${list.ct_bt_id2}" name="b2_id" id="b2_id">
<input type="hidden" value="${list.ct_gidx}" name="ct_gidx" id="ct_gidx">
<input type="hidden" value="${list.team_a_idx}" name="aTeam" id="aTeam">
<input type="hidden" value="${list.team_b_idx}" name="bTeam" id="bTeam">
<script type="text/javascript">
	$(".popwin_btn0").click(function() {

		var tr_ = $(this).closest("tr");
		var age_gd = tr_.children(".a1_nm").attr("id");
		var ad = tr_.next("input").val().split(",");
		$("#a1_id").val(ad[0]);
		$("#a2_id").val(ad[1]);
		$("#b1_id").val(ad[2]);
		$("#b2_id").val(ad[3]);
		$("#ct_gidx").val(ad[4]);
		$("#aTeam").val(ad[5]);
		$("#bTeam").val(ad[6]);

		$("#ct_w_dat").text(tr_.children(".ct_w_dat").text())
		$("#ct_court").text(tr_.children(".ct_court").text() + "코트")
		$("#ct_k_nm").text(tr_.children(".ct_k_nm").text())

		$("#team_a_nm").text(tr_.children(".team_a_nm").text())
		$("#a1_nm").text(tr_.children(".a1_nm").text())
		$("#a2_nm").text(tr_.children(".a2_nm").text())
		$("#a1_age_nm").text(tr_.children(".a1_nm").attr("id"));
		$("#a2_age_nm").text(tr_.children(".a2_nm").attr("id"));

		$("#team_b_nm").text(tr_.children(".team_b_nm").text())
		$("#b1_nm").text(tr_.children(".b1_nm").text())
		$("#b2_nm").text(tr_.children(".b2_nm").text())
		$("#b1_age_nm").text(tr_.children(".b1_nm").attr("id"));
		$("#b2_age_nm").text(tr_.children(".b2_nm").attr("id"));
		
		var a_score = $.trim(tr_.children(".team_a_score").text());
		var b_score = $.trim(tr_.children(".team_b_score").text());
		$("#a_score").attr("placeholder",a_score); 
		$("#b_score").attr("placeholder",b_score);
		return false;

	});
	function pSubmit() {

		var aScore = $("#aScore").val();
		var bScore = $("#bScore").val();
		if (aScore == "" || bScore == "" || aScore == null || bScore == null) {
			swal({
				title : "민턴in",
				text : "점수를 입력해주세요."
			})
		} else if (aScore == bScore) {
			swal({
				title : "민턴in",
				text : "점수가 같습니다. 다시 확인해주세요."
			})
		} else {
			$.ajax({
				async : true,
				type : "post",
				data : JSON.stringify({
					"a1_id" : $("#a1_id").val(),
					"a2_id" : $("#a2_id").val(),
					"b1_id" : $("#b1_id").val(),
					"b2_id" : $("#b2_id").val(),
					"ct_gidx" : $("#ct_gidx").val(),
					"aScore" : aScore,
					"bScore" : bScore,
					"aTeam" : $("#aTeam").val(),
					"bTeam" : $("#bTeam").val()
				}),
				url : "/Contest/ContestPointInsert.techni",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						location.reload();
					} else {
						swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error) {
					swal("민턴in", "error : " + error);
					alert("code:" + error.status + "\n" + "message:"
							+ error.responseText + "\n" + "error:" + error);
				}
			})

		}
	}
	
	function print(ct_gidx){
		//alert(ct_gidx);
		 
		var url = "/ContestWeb/PrintTest.techni?ct_gidx="+ct_gidx;
	    var name = "popup";
	    var option = "width = 1000, height = 500, top = 100, left =200 , location = no"
	  	
	    $("#"+ct_gidx).attr("style","background-color:blue")

	    window.open(url, name, option).print();
	   
	}
</script>




