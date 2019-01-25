<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
/*  $(document).ready(function() {
	 var u_status = "${u_status}";
	 if(u_status != '게임중' && u_status !="게임가능"){
		swal("MGL","오늘 게임에 참석 하시겠습니까?");
		swal({
			title : "MGL",
			text : "오늘 게임에 참석 하시겠습니까?",
			buttons : true
		})
		.then((value)=>{
			if(value){
				attend2();
			}
		})
 	}
});  */
	/* function upTeam(i,c_gidx){
		if(i == 1){
			swal("MGL","첫번째 대기순번 입니다.")
		}else{
			var c_gidx_c = $("#cg_"+(i-1)).val();
			swal({
				title : "MGL",
				text : "대기 순번을 위로 올리시겠습니까?",
				buttons : true
			})
			.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : JSON.stringify({"c_gidx" : c_gidx , "c_gidx_c" : c_gidx_c}),
						url : "/Game/ChangeW.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt > 0){
								location.href = "/Game/GameState.techni"
							}else{
								swal("MGL","죄송합니다. 다시 시도해 주세요.")
							}
						},
						error : function(error){
							swal("MGL","error : "+error);
						}
					})
				}
			})
			
		}
	} */
/* 	function downTeam(i,c_gidx){
		var c_gidx_c = $("#cg_"+(i+1)).val();
		if(i == ${fn:length(list2)}){
			swal("MGL","마지막 대기순번 입니다.")
		}else{
			swal({
				title : "MGL",
				text : "대기 순번을 내리시겠습니까?",
				buttons : true
			})
			.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : JSON.stringify({"c_gidx" : c_gidx , "c_gidx_c" : c_gidx_c}),
						url : "/Game/ChangeW.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt > 0){
								location.href = "/Game/GameState.techni"
							}else{
								swal("MGL","죄송합니다. 다시 시도해 주세요.")
							}
						},
						error : function(error){
							swal("MGL","error : "+error);
						}
					})
				}
			})
		}
	} */
	function deleteW(c_gidx,a1,a2,b1,b2){
		swal({
			title : "MGL",
			text : "대기를 취소 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : JSON.stringify({"c_gidx" : c_gidx , "a1" : a1,"a2": a2,"b1":b1,"b2" : b2}),
						url : "/Game/DeleteW.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt > 0){
								location.href = "/Game/GameState.techni"
							}else{
								swal("MGL","죄송합니다. 다시 시도해 주세요.")
							}
						},
						error : function(error){
							swal("MGL","error : "+error);
						}
					})
				}
			})
	}
	/* function attend(){
		$.ajax({
			type:"POST",
			url:"/UClub/AttendInsert.techni",
			success:function(data){
				if(data.cnt > 0 ){
					location.href="/UClub/AttendList.techni"
				}else{
					swal("MGL", "이미 출석된 회원입니다.");
				}
			},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
	}
	
	function attend2(){
		$.ajax({
			type:"POST",
			url:"/UClub/AttendInsert.techni",
			success:function(data){
				if(data.cnt > 0 ){
					location.href="/UClub/Attend.techni"
				}else{
					swal("MGL", "이미 출석된 회원입니다.");
				}
			},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
	}
	
	function attendOut(){
		$.ajax({
			type:"POST",
			url:"/UClub/attendOut.techni",
			success:function(data){
				if(data.cnt > 0 ){
					location.href="/UClub/AttendList.techni"
				}else{
					swal("MGL", "이미 퇴실 상태입니다.");
				}
			},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
	} */
/* 	function upTempTeam(num){
		if(confirm("현재 대기순위를 올리시겠습니까?")){
			location.href="/Game/GameStateInfoRankUp.techni?num="+num;
		}
	} */
	function gameEnd(c_gidx,cm_a1_id,cm_a2_id,cm_b1_id,cm_b2_id,cm_order){
		swal({
			title : "MGL",
			text : "게임을 끝내고 점수를 등록 하시겠습니까?",
			buttons : {
				confirm : "OK",
				cancel : "NO"
			}
		})
		.then((value)=>{
			if(value){
				$.ajax({
					type:"POST",
					url:"/Game/GameScoreRegist.techni",
					dataType:"json",
					data:JSON.stringify({"c_gidx":c_gidx,"cm_a1_id":cm_a1_id,"cm_a2_id":cm_a2_id,"cm_b1_id":cm_b1_id,"cm_b2_id":cm_b2_id,"cm_order":cm_order}),
					contentType : "application/json; charset=UTF-8",
					success:function(data){
						if(data.cnt>0){
							var path = "/Game/GameScoreRegistForm.techni"
							var form = document.createElement("form");
							form.setAttribute("method","POST");
							form.setAttribute("action",path)
							var hiddenField = document.createElement("input");
							hiddenField.setAttribute("type","hidden");
							hiddenField.setAttribute("name","c_gidx");
							hiddenField.setAttribute("value",c_gidx);
							form.appendChild(hiddenField);
							document.body.appendChild(form);
							form.submit();
						}else{
							swal({
								title : "MGL",
								text : "죄송합니다. 다시 시도해 주세요."
							})
							.then((value) =>{
								window.location.reload();
							})
						}
					},
					error : function(error){
						swal("MGL","error : "+error);
					}
				});
			}else{
				
			}
		})
	}
</script>
<%-- 		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo"
						onClick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>
						<a href='/Board/BoardList.techni'>${list[0].c_nm }</a>
					</h1>
				</div>
				<div class="bt_top">
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header> --%>
			<!-- InstanceBeginEditable name="container" -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-8, -7);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					})
					var tab_s_no = $(location).attr('pathname').slice(-10, -9);
					$('.tabs_cont').navi_depth({
						pageNum : tab_s_no
					});
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li><span
						onClick="location.href='/UClub/GamePrivateStateInfo.techni'">게임등록</span></li>
					<li class="active_tab"><span onClick="location.href='/Game/GameState.techni'">게임현황</span>
						<span onClick="location.href='#'" class="sm_font">Live</span></li>
					<li><span onClick="location.href='/Game/EndGame.techni '">종료게임</span></li>
				</ul>
			</div>
			
			<!-- tab_bt_area end -->
			<c:if test="${list[0].c_gidx eq null }">
				<div class="content white_bg pt_00">
					<h3 class="guide_big space_guide">
						<span class="icon-outline_4"></span>진행중인 게임이 없습니다.
					</h3>
				</div>
			</c:if>
			<c:if test="${list[0].c_gidx ne null}">
				<div class="content white_bg pt_00">
					<table class="mix3_td">
						<c:forEach var="list" items="${list }">
							<input type="hidden" name="c_gidx" value=" ${list.c_gidx }" />
							<c:set var="CoatNumber" value="${list.cm_order }" />
							<tr>
								<td class="cot2">${list.cm_order} 게임</td>
								<td class="ga_title">
									<ul class="col_21">
										<li><div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_a1_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_a1_nm }</span> <input
														type="hidden" name="cm_a1_id" value=" ${list.cm_a1_id}" />
												</div>
											</div>
											<div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_a2_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_a2_nm }</span> <input
														type="hidden" name="cm_a2_id" value=" ${list.cm_a2_id}" />
												</div>
											</div></li>
										<li><div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_b1_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_b1_nm }</span> <input
														type="hidden" name="cm_b1_id" value=" ${list.cm_b1_id}" />
												</div>
											</div>
											<div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_b2_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_b2_nm }</span> <input
														type="hidden" name="cm_b2_id" value=" ${list.cm_b2_id}" />
												</div>
											</div></li>
									</ul>
								</td>
								<td class="ga_btn_s">
										<span class="line_btn vet_btn sub1_color" onclick="gameEnd('${list.c_gidx}','${list.cm_a1_id }','${list.cm_a2_id }','${list.cm_b1_id }','${list.cm_b2_id }','${list.cm_order }')">점수</span>
										<span class="line_btn vet_btn" onclick="deleteW('${list.c_gidx }','${list.cm_a1_id}','${list.cm_a2_id}','${list.cm_b1_id}','${list.cm_b2_id}')">취소</span>

								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
			<!-- content end -->
			<%-- <c:if test="${list2[0].cm_a1_nm ne null }">
				<div class="cat_gray_area">
					<h4 class="title_m">대기중</h4>
				</div>
				<div class="content white_bg pt_00">
					<table class="mix3_td">
						<c:forEach var="list" items="${list2 }" varStatus="status">
							<tr>
								<td class="cot2 order_td"><c:set var="i" value="${i+1}" />${i}</td>
								<td class="ga_title">
									<ul class="col_21">
										<li><div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_a1_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_a1_nm }</span>
												</div>
											</div>
											<div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_a2_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_a2_nm}</span>
												</div>
											</div></li>
										<li><div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_b1_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_b1_nm}</span>
												</div>
											</div>
											<div class="photo_name">
												<div class="thum_area">
													<div class="thum"
														style="background-image: url(${list.cm_b2_photo });"></div>
												</div>
												<div class="text_area">
													<span class="name3">${list.cm_b2_nm}</span>
												</div>
											</div></li>
									</ul>
								</td>
								<td class="btn_icons_td">
									<div class="icon_btn">
										<span onclick="upTeam(${i},'${list.c_gidx }')" class="icon-arrow-up"></span> 
										<span class="icon-arrow-down" onclick="downTeam(${i},'${list.c_gidx }')"></span>
										<span  class="icon-remove" onclick="deleteW('${list.c_gidx }','${list.cm_a1_id}','${list.cm_a2_id}','${list.cm_b1_id}','${list.cm_b2_id}')"></span>
									</div>
								</td>
							</tr>
							<input type="hidden" value = "${list.c_gidx }" id="cg_${i}">
						</c:forEach>
					</table>
				</div>
			</c:if> --%>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('.ft_menu').navi_depth({pageNum:aa})
     });
    </script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li class="active_tab"
					onClick="location.href='/UClub/GamePrivateStateInfo.techni''"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>