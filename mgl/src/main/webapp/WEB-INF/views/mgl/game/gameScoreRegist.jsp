<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
		/* function startTime() {
		    var today = new Date();
		    var h = today.getHours();
		    var m = today.getMinutes();
		    var s = today.getSeconds();
		    var di = "";
		    m = checkTime(m);
		    s = checkTime(s);
		    if( h > 11 && h < 24 ){
		    	di = "PM";
		    	h = parseInt(h % 12);
		    	if(h == 0){
		    		h = 12;
		    	}
		    	h = parseInt(h % 12);
		    } else {
		   		di = "AM";
		    }
		    document.getElementById('time').innerHTML =
		    di + " " + h + ":" + m;
		    var t = setTimeout(startTime, 500);
		} */
		function checkTime(i) {
			if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
		return i;
		}
		
		function onlyNumber(){
        	if((event.keyCode<48)||(event.keyCode>57))
           		event.returnValue=false;
		}
		
		function goSubmit(){
		
			var aScore = $("#aScore").val();
			var bScore = $("#bScore").val();
			var cm_a1_id = "${cmvo.cm_a1_id}";
		
			if(aScore == ""||bScore ==""||aScore == null||bScore==null){
				swal({
					title : "민턴in",
					text : "점수를 입력해주세요."
				})
				return false;
			}else if(aScore == bScore){
				swal({
					title : "민턴in",
					text : "점수가 같습니다. 다시 확인해주세요."
				})
				return false;
			}else{
						$.ajax({
							async : true,
							type:"post",
							data : JSON.stringify({"cm_a1_id" :"${cmvo.cm_a1_id}","cm_a2_id":"${cmvo.cm_a2_id}","cm_b1_id":"${cmvo.cm_b1_id}","cm_b2_id":"${cmvo.cm_b2_id}","c_gidx":"${cmvo.c_gidx}","cm_order":"${cmvo.cm_order}","aScore":aScore,"bScore":bScore}),
							url:"/Game/GameScoreInsert.techni",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								if(data.cnt>0){
										 $("#frm").submit();
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
</script>
		<form id="frm" method="post" action="/Game/GameResult.techni" >
			<input type="hidden" name="c_gidx" value="${cmvo.c_gidx}"> 
		</form>
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<div class="bd_cat col_2-1">
					<div>
						<h4 class="title_m">${cmvo.cm_order}코트</h4>
					</div>
					<div>
						<ul class="li_small">
							<li><b>시작시간</b>${cmvo.cm_start}</li>
							<li><b>종료시간</b>${cmvo.cm_end}</li>
						</ul>
					</div>
				</div>
				<table class="game_td box_td">
					<tr>
						<td class="td_tie">A 팀</td>
						<td>
							<ul class="col_21">
								<li><div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${cmvo.cm_a1_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3">${cmvo.cm_a1_nm }</span>
										</div>
									</div>
									<!--photo_name end--></li>
								<li><div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${cmvo.cm_a2_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3">${cmvo.cm_a2_nm }</span>
										</div>
									</div>
									<!--photo_name end--></li>
							</ul>
						</td>
						<td class="score_td"><input type="text" placeholder="00" maxlength="2" id="aScore" onkeypress="onlyNumber();" /></td>
					</tr>
					<tr>
						<td class="td_tie">B 팀</td>
						<td>
							<ul class="col_21">
								<li><div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${cmvo.cm_b1_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3">${cmvo.cm_b1_nm }</span>
										</div>
									</div>
									<!--photo_name end--></li>
								<li><div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${cmvo.cm_b2_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3">${cmvo.cm_b2_nm }</span>
										</div>
									</div>
									<!--photo_name end--></li>
							</ul>
						</td>
						<td class="score_td"><input type="text" id ="bScore" placeholder="00" maxlength="2" onkeypress="onlyNumber();" /></td>
					</tr>
				</table>
				<div class="btn_full">
					<span class="btn_st" onClick="goSubmit()">확인</span>
				</div>
			</div>
			<!-- content end -->
			<!-- <div class="content white_bg pt_00">
				<table class="col_score">
					<tr>
						<td rowspan="2" class="team_td">A 팀</td>
						<td class="player_td"><span class="name3">홍길</span>
						<span class="rank_sp">B</span></td>
						<td class="victory_td">25(승) +4</td>
						<td class="point_td">+0.5 P</td>
					</tr>
					<tr>
						<td class="player_td"><span class="name3">김실동</span><span
							class="rank_sp">초</span></td>
						<td class="victory_td">25(승) +4</td>
						<td class="point_td">+2.5 P</td>
					</tr>
					<tr>e,
						<td rowspan="2" class="team_td">B 팀</td>
						<td class="player_td"><span class="name3">홍길</span><span
							class="rank_sp">B</span></td>
						<td class="victory_td">25(승) -4</td>
						<td class="point_td">+0.5 P</td>
					</tr>
					<tr>
						<td class="player_td"><span class="name3">김실동동동동~</span><span
							class="rank_sp">초</span></td>
						<td class="victory_td">25(승) -4</td>
						<td class="point_td">+2.5 P</td>
					</tr>
				</table>
			</div> -->
			<!-- content end -->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li class="active_tab" onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>