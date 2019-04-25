<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${!empty list }">
		<div class="content pt_00">
			<ul class="list_room white_bg">
				<c:forEach items="${list}" var="list">
					<li <c:if test="${list.al_read eq 'N' }"> class="read_no"</c:if>>
						<div class="room_photo">
							<c:choose>
								<c:when test="${list.al_division eq '공지' or list.al_division eq '주요공지' }">
									<div class="photo_area radius_mask alarm_photo notice_i"></div>
								</c:when>
								<c:when test="${list.al_division eq '게임'}">
									<div class="photo_area radius_mask alarm_photo game_i"></div>
								</c:when>
								<c:when test="${list.al_division eq '가입신청' or list.al_division eq '가입승인' }">
									<div class="photo_area radius_mask alarm_photo club_i"></div>
								</c:when>
							</c:choose>
						</div>
						<div class="room_data">
							<h4 onclick="alarmHref('${list.al_idx}')">${list.al_division}</h4>
							<span class="gray_color small_font fl_right" onclick="alarmHref('${list.al_idx}')">${list.al_date }</span>
							<div class="col_2data">
								<div class="max-ws_td el_date" onclick="alarmHref('${list.al_idx}')">${list.al_msg }</div>
								<div class="td_1">
									<i class="icon-minus btn_i sub_color" onclick="alarmDel('${list.al_idx}')"></i>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="content white_bg">
			<h3 class="guide_big space_guide">
				<span class="icon-outline_4"></span>알림이 없습니다.
			</h3>
		</div>
	</c:otherwise>
</c:choose>
<script>
function alarmDel(kind){
	if(kind=="all"){
		$.ajax({
			async : true,
			type : 'post',
			data : JSON.stringify({"al_idx" : ""}),
			url : "/Member/AlarmDel.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
					location.href='/UClub/UclubMUserList.techni'
				}else{
					swal("민턴in","죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}
			});
	}else{
		$.ajax({
		async : true,
		type : 'post',
		data : JSON.stringify({"al_idx" : kind}),
		url : "/Member/AlarmDel.techni",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data.cnt>0){
				location.href='/UClub/UclubMUserList.techni'
			}else{
				swal("민턴in","죄송합니다. 다시 시도해 주세요.")
			}
			
		},
		error : function(error){
			swal("민턴in","error : " + error);
		}
		});
	}
}

function alarmHref(al_idx){
	var method = method || "post"; 
	var path = "/Member/PushController.techni";
	var form = document.createElement("form");

	form.setAttribute("method", method);
	form.setAttribute("action", path);
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "al_idx");
	hiddenField.setAttribute("value", al_idx);
	form.appendChild(hiddenField);
	document.body.appendChild(form);
	form.submit();
}
</script>