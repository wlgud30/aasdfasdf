<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
 $(document).ready(function() {
	 var msg = "${msg}";
	if(${msg != null} || ${msg eq ""}){
		swal("민턴in","${msg}");
	}
	if("${mng}" != "매니저")	{
		$("#ga").remove();
	}
			
});

function phoneFomatter(num){
		num.toString();
		var formatNum = "";
		if(num.length==11){
			formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/,"$1-$2-$3");
		}else{
			formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/,"$1-$2-$3");
		}
		$(".phone_data").val(formatNum);
}
 
function post1(c_idx,u_id){
	var method = method || "post"; 
	var path = "/UClub/UClubMemberJoin.techni";
	var form = document.createElement("form");

	form.setAttribute("method", method);
	form.setAttribute("action", path);
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "c_idx");
	hiddenField.setAttribute("value", c_idx);
	form.appendChild(hiddenField);
	var hiddenField2 = document.createElement("input");
	hiddenField2.setAttribute("type", "hidden");
	hiddenField2.setAttribute("name", "u_id");
	hiddenField2.setAttribute("value", u_id);
	form.appendChild(hiddenField2);
	
	
		    document.body.appendChild(form);
		    form.submit();
}
function chat(){
	swal("민턴in","서비스 준비중 입니다.")
}
</script>

			<!-- InstanceBeginEditable name="container" -->
			<div class="tab_btn_b_area">
			    <ul class="tab_btn_b">
			      <li>
			        <span onClick="location.href='/Club/ClubDetailMy.techni'">클럽정보</span>
			      </li>
			      <li class="active_tab" >
			        <span onClick="location.href='/UClub/UclubMUserList.techni'">회원</span>
			      </li>
			      <li>
			        <span onClick="chat()">채팅</span>
			      </li>
			    </ul>
			  </div>
			
			<div class="tab_bt_area white_bg mb_b0 mb_t">
				<div>
					<ul id="ga" class="tabs_cont tab_cont">
						<li class="active_tab" onclick="active_change(this)"><span>전체 (${fn:length(list)})</span></li>
						<li onclick="active_change(this)"><span>가입대기(${fn:length(list2)})</span></li>
						<li onclick="active_change(this)"><span>탈퇴대기(${fn:length(list3)})</span></li>
					</ul>
				</div>
				<!-- <div>
					<span class="btn_st btn_small" onclick="location.href='#;'">회원등록</span>
				</div> -->
			</div>
				<div class="tab_cont_con">
					<div class="content white_bg tab_con">
						<table class="thead_td game_td cet_lay td_pd_l0">
							<thead>
								<tr>
									<th>이름</th>
									<th class="td_2">직급</th>
									<th>가입일자
										<!-- <ul class="li_nol">
											<li class="phone_data">전화번호</li>
											<li class="in_data">가입일자</li>
										</ul> -->
									</th>
									<th class="more_btn_th">
										<!-- <div class="btn_more"> <i class="more_menu la la-ellipsis-v"></i>
								                <ul class="me_ul">
								                  <li onClick="location.href='#;'">가입순</li>
								                  <li onClick="location.href='#;'">성명순</li>
								                </ul>
								              </div> --></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<tr>
										<td class="name2_td popwin_btn1" onclick="modal('${list.u_id }','${list.u_nm }','${fn:substring(list.u_age,0,1)}0','${list.u_sex }','${list.u_photo }','${list.uc_mng }','${list.u_email }','${list.u_club_gd }','${list.u_join_date }','${list.u_birth }','all')">
											<div class="photo_name">
												<div class="thum_area">
										                  <div class="thum" style="background-image:url(${list.u_photo});"></div>
										                </div>
											<div class="text_area">
										                  <span class="name3">${list.u_nm }</span>
										                  <span class="age_rank">(${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd })</span>
										         </div>
										     </div>
										<%-- <span class="name3">${list.u_nm }</span>
										<span class="age_rank">(${list.u_age}살 ${list.u_club_gd })</span> --%>
										</td>
										<td class="td_2">${list.uc_mng }</td>
										<td>${list.u_join_date }
											<%-- <c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose> --%>
										<%-- <ul class="li_nol">
												<li class="phone_data">
												<c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose>
												</li>
												<li class="in_data">${list.u_join_date }</li>
											</ul> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- content end-->
					<div class="content white_bg tab_con">
						<table class="thead_td game_td cet_lay td_pd_l0">
							<thead>
								<tr>
									<th>이름</th>
									<th class="td_2">직급</th>
									<th>신청일자
										<!-- <ul class="li_nol">
											<li class="phone_data">전화번호</li>
											<li class="in_data">가입일자</li>
										</ul> -->
									</th>
									<th class="more_btn_th">
										<!-- <div class="btn_more"> <i class="more_menu la la-ellipsis-v"></i>
								                <ul class="me_ul">
								                  <li onClick="location.href='#;'">가입순</li>
								                  <li onClick="location.href='#;'">성명순</li>
								                </ul>
								              </div> --></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list2 }" var="list">
									<tr>
										<td class="name2_td popwin_btn1" onclick="modal('${list.u_id }','${list.u_nm }','${fn:substring(list.u_age,0,1)}0','${list.u_sex }','${list.u_photo }','${list.uc_mng }','${list.u_email }','${list.u_club_gd }','${list.u_join_date }','${list.u_birth }','join')">
											<div class="photo_name">
												<div class="thum_area">
										                  <div class="thum" style="background-image:url(${list.u_photo});"></div>
										                </div>
											<div class="text_area">
										                  <span class="name3">${list.u_nm }</span>
										                  <span class="age_rank">(${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd })</span>
										                  <input id="${list.u_id }" value="${list.u_push}" type="hidden">
										         </div>
										     </div>
										<%-- <span class="name3">${list.u_nm }</span>
										<span class="age_rank">(${list.u_age}살 ${list.u_club_gd })</span> --%>
										</td>
										<td class="td_2">${list.uc_mng }</td>
										<td>${list.u_join_date }
											<%-- <c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose> --%>
										<%-- <ul class="li_nol">
												<li class="phone_data">
												<c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose>
												</li>
												<li class="in_data">${list.u_join_date }</li>
											</ul> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- content end-->
					<div class="content white_bg tab_con">
						<table class="thead_td game_td cet_lay td_pd_l0">
							<thead>
								<tr>
									<th>이름</th>
									<th class="td_2">직급</th>
									<th>신청일자
										<!-- <ul class="li_nol">
											<li class="phone_data">전화번호</li>
											<li class="in_data">가입일자</li>
										</ul> -->
									</th>
									<th class="more_btn_th">
										<!-- <div class="btn_more"> <i class="more_menu la la-ellipsis-v"></i>
								                <ul class="me_ul">
								                  <li onClick="location.href='#;'">가입순</li>
								                  <li onClick="location.href='#;'">성명순</li>
								                </ul>
								              </div> --></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list3 }" var="list">
									<tr>
										<td class="name2_td popwin_btn1" onclick="modal('${list.u_id }','${list.u_nm }','${fn:substring(list.u_age,0,1)}0','${list.u_sex }','${list.u_photo }','${list.uc_mng }','${list.u_email }','${list.u_club_gd }','${list.u_join_date }','${list.u_birth }','exit')">
											<div class="photo_name">
												<div class="thum_area">
										                  <div class="thum" style="background-image:url(${list.u_photo});"></div>
										                </div>
											<div class="text_area">
										                  <span class="name3">${list.u_nm }</span>
										                  <span class="age_rank">(${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd })</span>
										         </div>
										     </div>
										<%-- <span class="name3">${list.u_nm }</span>
										<span class="age_rank">(${list.u_age}살 ${list.u_club_gd })</span> --%>
										</td>
										<td class="td_2">${list.uc_mng }</td>
										<td>${list.u_join_date }
											<%-- <c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose> --%>
										<%-- <ul class="li_nol">
												<li class="phone_data">
												<c:set var="string1" value="${list.u_tel }"></c:set>
												<c:choose>
													<c:when test="${fn:length(string1) eq 11 }">
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,7)}-${fn:substring(string1,7,11) }
													</c:when>
													<c:otherwise>
														${fn:substring(string1,0,3)}-${fn:substring(string1,3,6)}-${fn:substring(string1,6,10) }
													</c:otherwise>
												</c:choose>
												</li>
												<li class="in_data">${list.u_join_date }</li>
											</ul> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- content end-->
				</div>
				<!-- tab_con end-->
				<div class="popwin_size white_bg">
				    <div class="head_top title_popup">
				      <div class="tit_top">
				        <h1 class="game_title">회원정보</h1>
				      </div>
				      <div class="bt_top">
				        <span class="btn_i la la-close" onclick="location.href='#'"></span>
				        <input id="u_id" type="hidden" >
				      </div>
				    </div>
				    <!-- title_popupp end -->
				    <div class="popup_body">
				      <div class="photo-data">
				        <div class="img_upload_area">
				          <div id="photo"  onClick="location.href='#;'" class="img_upload" ></div>
				        </div>
				        <!-- img_upload_are end -->
				        <div class="tit_main">
				          <ul class="li_row">
				            <li><i class="icon-f i_font icon-man"></i>
				              <span id="nm" class="name3"></span>
				              <span id="age_sex"class="side_rt_db"></span>
				            </li>
				            <li id="mng_2"><i class="icon-f i_font icon-member_1"></i><span id="mng"></span></li>
				            <li><i class="icon-f i_font icon-enlist"></i><span id="date"></span></li>
				            <li><i class="icon-f i_font icon-cake"></i><span id="birth"></span></li>
				          </ul>
				        </div>
				        <div class="btn_td">
				          <span id="agree" class="btn_st btn_small vet_btn" onclick="userMngGd()">확인</span>
				          <span id="exit" class="btn_st btn_small vet_btn btn-gray" onclick="clubOut()">강퇴</span>
				          <span id="agree_2" class="btn_st btn_small vet_btn" onclick="join('Y')">승인</span>
				          <span id="exit_2" class="btn_st btn_small vet_btn btn-gray" onclick="join('N')">거절</span>
				          <span id="agree_3" class="btn_st btn_small vet_btn" onclick="exit('Y')">승인</span>
				          <span id="exit_3" class="btn_st btn_small vet_btn btn-gray" onclick="exit('N')">거절</span>
				        </div>
				        <!-- btn_td edn --> 
				      </div>
				      <!-- photo-data end -->
				      <hr class="line_div">
				      <table class="table_form i_font-data">
				        <tr>
				          <td><i class="icon-f i_font icon-email"></i><span id="mail"></span></td>
				          <td class="w10"><i class="icon-f i_font icon-class"></i><span id="gd"></span></td>
				        </tr>
				  	<tr>
				         <td colspan="1"><div class="col_2input wauto">
				              <div>
				                <select name="select" id="select_mng">
				                <option value="회원">회원</option>
				                  <option value="고문">고문</option>
				                  <option value="부회장">부회장</option>
				                  <option value="회장">회장</option>
				                  <option value="매니저">매니저</option>         
				                  <option value="감사">감사</option>
				                  <option value="총무">총무</option>
				                  <option value="재무">재무</option>
				                  <option value="경기이사">경기이사</option>
				                  <option value="관리이사">관리이사</option>
				                  <option value="홍보이사">홍보이사</option>
				                </select>
				              </div>
				              <div>
				                <select name="select" id="select_gd">
				                  <option value="자강">자강</option>
				                  <option value="A">A</option>
				                  <option value="B">B</option>
				                  <option value="C">C</option>
				                  <option value="D">D</option>
				                  <option value="초심" >초심</option>
				                  <option value="왕초">왕초</option>
				                </select>
				              </div>
				            </div></td>
				      	<td class="w10" id="tsize"><i class="icon-f i_font icon-t-size"></i>100</td>
				        </tr>
				      </table>
				    </div>
				    <!-- popup_body end--> 
				  </div>
			<!-- tab_cont_con -->
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
    function active_change(me){
		$(".tabs_cont li").each(function(){
			$(this).attr("class","");
		});
		$(me).attr("class","active_tab");
	}
    </script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li class="active_tab"  onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>
	<script>
		function modal(id,nm,age,sex,photo,mng,mail,gd,date,birth,kind){
			/* if("${mng}" != "매니저"){
				swal("민턴in","매니저를 수정할 수 없습니다.")
			} */
			if(mng=="가입대기"){
				mng="회원"
			}
			if(sex=="M"){
				sex="남"
			}else{
				sex="여"
			}
			$("#u_id").val(id);
			$("#nm").text(nm);
			$("#age_sex").text("("+age+"대/"+sex+")");
			$("#photo").attr("style","background-image:url("+photo+")")
			$("#mng").text(mng);
			if(mail==""){
				$("#mail").text("등록된 메일이 없습니다.")
			}else{
				$("#mail").text(mail) 	
			}
			$("#gd").text(gd);
			$("#date").text(date);
			$("#birth").text(birth.substr(0,4)+"."+birth.substr(4,2)+"."+birth.substr(6,2));
			$("#agree").removeAttr("style");
			$("#exit").removeAttr("style");
			$("#agree_2").removeAttr("style");
			$("#exit_2").removeAttr("style");
			if(kind=="all"){
				$("#agree_2").attr("style","display:none");
				$("#exit_2").attr("style","display:none");
				$("#agree_3").attr("style","display:none");
				$("#exit_3").attr("style","display:none");
				$("#mng_2").removeAttr("style");
				$(".prettydropdown:eq(0) .selected").removeAttr("class");
				$(".prettydropdown:eq(0) label").text(mng);
				$(".prettydropdown:eq(0) ul li").each(function(){
					var v = $(this).attr("data-value");
					if(v==mng){
						$(this).attr("class","selected");
					}
				})	
			}else if(kind=="join"){
				$("#mng_2").attr("style","display:none");
				$("#agree").attr("style","display:none");
				$("#exit").attr("style","display:none");
				$("#agree_3").attr("style","display:none");
				$("#exit_3").attr("style","display:none");
				$(".prettydropdown:eq(0) .selected").removeAttr("class");
				$(".prettydropdown:eq(0) label").text(mng);
				$(".prettydropdown:eq(0) ul li").each(function(){
					var v = $(this).attr("data-value");
					if(v==mng){
						$(this).attr("class","selected");
					}
				})
			}else{
				$("#mng_2").attr("style","display:none");
				$("#agree").attr("style","display:none");
				$("#exit").attr("style","display:none");
				$("#agree_2").attr("style","display:none");
				$("#exit_2").attr("style","display:none");
				$(".prettydropdown:eq(0) .selected").removeAttr("class");
				$(".prettydropdown:eq(0) label").text(mng);
				$(".prettydropdown:eq(0) ul li").each(function(){
					var v = $(this).attr("data-value");
					if(v==mng){
						$(this).attr("class","selected");
					}
				})
			}
			$(".prettydropdown:eq(1) .selected").removeAttr("class");
			$(".prettydropdown:eq(1) label").text(gd);
			$(".prettydropdown:eq(1) ul li").each(function(){
				var v = $(this).attr("data-value");
				if(v==gd){
					$(this).attr("class","selected");
				}
			})
			$("#select_gd option").each(function(){
				$(this).removeAttr("selected");
				var v =$(this).val();
				if(v==gd){
					$(this).attr("selected","selected");
				}
			})
		}
		
		function userMngGd(){
			var u_id = $("#u_id").val();
			var u_club_gd = $("#select_gd").val();
			var u_mng = $("#select_mng").val(); 
			var mng = $("#mng").text();
			if("${mng}" != "매니저" &&u_mng=="매니저" ){
					swal("민턴in","매니저를 수정 할 수 없습니다.")
					return false;
			}else if("${mng}" == "매니저" && mng == "매니저" && u_mng != "매니저"){
				swal("민턴in","매니저를 수정 할 수 없습니다.")
				return false;
			}
			$.ajax({
				type : "post",
				data : JSON.stringify({"uc_mng" : u_mng , "u_club_gd" : u_club_gd, "u_id" : u_id}),
				url : "/UClub/UClubMemberViewUpdateProc.techni",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					if(data.cnt>0){
						if($("#uc_mng").val() == "매니저"){
							location.href="/UClub/UClubUserList.techni"
						}else{
							location.href="/UClub/UclubMUserList.techni"
						}
					}else{
						swal("민턴in","죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error){
					swal("민턴in","error : " + error);
				}			
			})
					
		}
		function clubOut(){
			var u_id = $("#u_id").val();
			if($("#mng").text()=="매니저"){
				swal("민턴in","매니저는 강퇴 할 수 없습니다.")
				return false;
			}
			swal({
				title : "민턴in",
				text : "강퇴 하시겠습니까?",
				buttons : true
			})
			.then((value) =>{
					if(value){
						$.ajax({
							async : true,
							type : 'post',
							data : JSON.stringify({"u_id" : u_id,"u_mng" : "탈퇴"}),
							url : "/UClub/UClubOut.techni",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								if(data.cnt>0){
									swal({
										title:"민턴in",
										text : "추방 되었습니다."
									})
									.then((value) =>{
										location.href='/UClub/UclubMUserList.techni'
									})
								}else{
									swal("민턴in","죄송합니다. 다시 시도해 주세요.")
								}
								
							},
			error : function(error){
				swal("민턴in","error : " + error);
			}
		});
			};
		});
		}
		function join(YN){
			var method = method || "post"; 	
			var form = document.createElement("form");
			var u_id = $("#u_id").val();
			var c_idx = "${c_idx}";
			var u_nm = $("#nm").text();
			var uc_mng = $("#select_mng").val();
			if(YN=='Y'){
				var path = "/UClub/UclubMUserList.techni";
				var push = $("#"+u_id).val();
				$.ajax({
					async : true,
					type : 'post',
					data : JSON.stringify({"u_id" : u_id,"c_idx" : c_idx, "uc_mng" : uc_mng,"push_id" : push, "u_nm" : u_nm}),
					url : "/UClub/UClubJoinOK.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title:"민턴in",
								text : "가입이 승인 되었습니다.",
								type : "success"
							})
							.then((value) =>{
								pushTok(push,"${uvo.c_nm } 가입이 승인되었습니다.","${uvo.u_nm}","http://mgl.techni.co.kr:8081/UClub/UClubAllList.techni");
								
								form.setAttribute("method", method);
								form.setAttribute("action", path);
								var hiddenField = document.createElement("input");
								hiddenField.setAttribute("type", "hidden");
								hiddenField.setAttribute("name", "c_idx");
								hiddenField.setAttribute("value", c_idx);
								form.appendChild(hiddenField);
								
								document.body.appendChild(form);
							    form.submit();
							})
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
						
					},
					error : function(error){
						swal("민턴in","error : " + error);
					}
				});
			}else if(YN=='N'){
				$.ajax({
					async : true,
					type : 'post',
					data : JSON.stringify({"u_id" : u_id,"c_idx" : c_idx}),
					url : "/UClub/UClubJoinNO.techni",
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
		function exit(YN){
			var u_id = $("#u_id").val();
			var c_idx = "${c_idx}";
			if(YN=='Y'){
				$.ajax({
					async : true,
					type : 'post',
					data : JSON.stringify({"u_id" : u_id,"u_mng" : "탈퇴"}),
					url : "/UClub/UClubOut.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title:"민턴in",
								text : "탈퇴 승인 되었습니다."
							})
							.then((value) =>{
								location.href='/UClub/UclubMUserList.techni'
							})
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
						
					},
					error : function(error){
						swal("민턴in","error : " + error);
					}
				});
			}else if(YN=='N'){
				{
					$.ajax({
						async : true,
						type : 'post',
						data : JSON.stringify({"u_id" : u_id,"u_mng" : "회원"}),
						url : "/UClub/UClubOut.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt>0){
								swal({
									title:"민턴in",
									text : "탈퇴 거절 되었습니다."
								})
								.then((value) =>{
									location.href='/UClub/UclubMUserList.techni'
								})
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
		}
	</script>