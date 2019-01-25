<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
</head>
<body>
			<!-- InstanceBeginEditable name="container" -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-6, -5);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					})
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/selfMatchTypeInsertForm.techni'"><span>조별(종목)</span></li>
					<li class="active_tab" onClick="location.href='/Game/selfMatchWBInsertForm.techni'"><span>선수구분</span></li>
					<li onClick="location.href='/Game/selfMatchBlueTeamInsertForm.techni'"><span>출전신청</span></li>
				</ul>
			</div>
			<div class="content white_bg line_dark">
			<c:choose>
				<c:when test="${blueList eq null && whiteList eq null }">
					<div class="col_2line">
						<div>
							<h4 class="th_st">
								청팀<span class="nb_data" id="blueSpan">(${list2.size()}명)</span>
							</h4>
							<table class="game_td ell_td" id="blue">
								<tbody>
									<c:forEach items="${list2}" var="list">
										<tr id="${list.u_id }">
											<td><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(${list.u_photo});"></div>
													</div>
													<div class="text_area">
														<span class="name3">${list.u_nm }</span>
													</div>
												</div>
												<!--photo_name end--></td>
											<td class="btn_td"><span class="bd_link btn_gray"
												onclick="changeTeam('${list.u_id}','${list.u_photo }','${list.u_nm}','W')">백팀</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div>
							<h4 class="th_st">
								백팀<span class="nb_data" id="whiteSpan">(${list3.size()}명)</span>
							</h4>
							<table class="game_td ell_td" id="white">
								<tbody>
									<c:forEach items="${list3}" var="list">
										<tr id="${list.u_id }">
											<td><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(${list.u_photo})"></div>
													</div>
													<div class="text_area">
														<span class="name3">${list.u_nm}</span>
													</div>
												</div>
												<!--photo_name end--></td>
											<td class="btn_td"><span class="bd_link btn_gray"
												onclick="changeTeam('${list.u_id}','${list.u_photo }','${list.u_nm}','B')">청팀</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col_2line">
						<div>
							<h4 class="th_st">
								청팀<span class="nb_data" id="blueSpan">(${blueList.size()}명)</span>
							</h4>
							<table class="game_td ell_td" id="blue">
								<tbody>
									<c:forEach items="${blueList}" var="list">
										<tr id="${list.u_id }">
											<td><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(${list.u_photo});"></div>
													</div>
													<div class="text_area">
														<span class="name3">${list.u_nm }</span>
													</div>
												</div>
												<!--photo_name end--></td>
											<td class="btn_td"><span class="bd_link btn_gray"
												onclick="changeTeam('${list.u_id}','${list.u_photo }','${list.u_nm}','W')">백팀</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div>
							<h4 class="th_st">
								백팀<span class="nb_data" id="whiteSpan">(${whiteList.size()}명)</span>
							</h4>
							<table class="game_td ell_td" id="white">
								<tbody>
									<c:forEach items="${whiteList}" var="list">
										<tr id="${list.u_id }">
											<td><div class="photo_name">
													<div class="thum_area">
														<div class="thum"
															style="background-image: url(${list.u_photo})"></div>
													</div>
													<div class="text_area">
														<span class="name3">${list.u_nm}</span>
													</div>
												</div>
												<!--photo_name end--></td>
											<td class="btn_td"><span class="bd_link btn_gray"
												onclick="changeTeam('${list.u_id}','${list.u_photo }','${list.u_nm}','B')">청팀</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
<div class="content white_bg">
				<div class="btn_full">
					<span class="btn_st" onClick="WBupdate()">등록</span>
				</div>
				<!-- <ul class="li_name">
					<li><div class="photo_name">
							<div class="thum_area">
								<div class="thum"
									style="background-image: url(img/member_photo_01.jpg);"></div>
							</div>
							<div class="text_area">
								<input type="checkbox" class="li_check ck_rt" id="check_1"><label
									for="check_1"><span class="name3">가길동입니다.</span></label>
							</div>
						</div>
						photo_name end</li>
				</ul> -->
			</div>
	
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>


	<!-- wrap end -->
	<script>
	function changeTeam(u_id,u_photo,u_nm,kind){
		if(kind == "B"){
			$("#"+u_id).remove();
			$("#blue > tbody:last").append("<tr id='"+u_id+"'><td><div class='photo_name'><div class='thum_area'><div class='thum'style='background-image: url("+u_photo+")'></div></div><div class='text_area'><span class='name3'>"+u_nm+"</span></div></div></td><td class='btn_td'><span class='bd_link btn_gray' onclick=\"changeTeam('"+u_id+"','"+u_photo+"','"+u_nm+"','W')\">백팀</span></td></tr>")
		}else{
			$("#"+u_id).remove();
			$("#white > tbody:last").append("<tr id='"+u_id+"'><td><div class='photo_name'><div class='thum_area'><div class='thum'style='background-image: url("+u_photo+")'></div></div><div class='text_area'><span class='name3'>"+u_nm+"</span></div></div></td><td class='btn_td'><span class='bd_link btn_gray' onclick=\"changeTeam('"+u_id+"','"+u_photo+"','"+u_nm+"','B')\">청팀</span></td></tr>")
		}
		$("#blueSpan").text("("+$("#blue tr").length+"명)");
		$("#whiteSpan").text("("+$("#white tr").length+"명)");
	}
	function WBupdate(){
		var blueTeam = "";
		var whiteTeam = "";
		var blueTotal = $("#blue tr").length;
		var whiteTotal = $("#white tr").length;
		$("#blue tr").each(function(index){
			if( index == blueTotal -1	){
				blueTeam = blueTeam+$(this).attr("id")
			}else{
				blueTeam = blueTeam+$(this).attr("id")+","
			}
		});
		$("#white tr").each(function(index){
			if( index == whiteTotal -1	){
				whiteTeam = whiteTeam+$(this).attr("id")
			}else{
				whiteTeam = whiteTeam+$(this).attr("id")+","
			}
		});
		$.ajax({
			async : true,
			type : 'post',
			data : JSON.stringify({"cs_idx" : "${cs_idx}" , "blueTeam" : blueTeam , "whiteTeam" : whiteTeam}),
			url : "/Game/selfMatchWBInsert.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt > 0){
					/* location.href = "/Game/GameState.techni" */
				}else{
					swal("MGL","죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error){
				swal("MGL","error : "+error);
			}
		})
		
	}
	</script>
</body>
<!-- InstanceEnd -->
</html>
