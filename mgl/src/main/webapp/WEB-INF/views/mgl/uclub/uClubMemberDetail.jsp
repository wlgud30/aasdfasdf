<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function clubOut(){
		swal({
			title : "민턴in",
			text : "클럽을 탈퇴 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
			if(value){
				$.ajax({
					async : true,
					type : 'post',
					url : "/UClub/UClubOut.techni",
					contentType : "application/json; charset=UTF-8",
					dataType : "json",
					success : function(data){
						if(data.cnt>0){
							swal({
								title : "민턴in",
								text : "매니저의 승인 후 탈퇴 됩니다."
							})
							.then((value)=>{
									location.href='/UClub/UClubAllList.techni'
							})
						}else{
							swal("민턴in" , "다시 시도해 주세요.")
						}
					},
					error : function(error){
						swal("민턴in","error : "+error);
					}
				})
			}
		})
	}
	function gdChange(c_idx){
		var u_club_gd = $("#"+c_idx+"_gd").val();
		$.ajax({
			type : "post",
			data : JSON.stringify({"u_club_gd" : u_club_gd	, "c_idx" : c_idx}),
			url : "/UClub/gdChange.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
					
				}else{
					swal("민턴in","죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}			
		})
	}
</script>

<!-- InstanceBeginEditable name="container" -->
<div class="content white_bg">
	<div class="photo-data">
		<div class="img_upload_area">
			<div onClick="location.href='#;'" class="img_upload"
				style="background-image: url(${uvo.u_photo})"></div>
		</div>
		<!-- img_upload_are end -->
		<div class="tit_main">
			<ul class="li_row">
				<li><i class="icon-f i_font icon-man"></i>${uvo.u_nm}(${uvo.u_age}세/${uvo.u_sex == 'M' ? '남':'여'})</li>
				<%-- <li><i class="icon-f i_font icon-member_1"></i>${uvo.uc_mng }</li> --%>
				<li><i class="icon-f i_font icon-enlist"></i>${uvo.u_c_indat }</li>
				<li><i class="icon-f i_font icon-cake"></i>${fn:substring(uvo.u_birth,0,4) }.${fn:substring(uvo.u_birth,4,6) }.${fn:substring(uvo.u_birth,6,8) }</li>
			</ul>
		</div>
		<div class="btn_td">
			<span class="btn_st btn_small vet_btn btn-gray"
				onclick="location.href='/UClub/UClubMemberUpdate.techni'">수정</span>
			<!-- <span class="btn_st btn_small vet_btn" onclick='clubOut()' id="clubOut">탈퇴</span> -->
		</div>
	</div>
	<!-- photo-data end -->
	<hr class="line_div">
	<table class="table_form i_font-data">
		<tr>
			<td><i class="icon-f i_font icon-mobile"></i>${fn:substring(uvo.u_tel,0,3) }<span
				class="line_i"></span> ${fn:substring(uvo.u_tel,3,7) }<span
				class="line_i"></span> ${fn:substring(uvo.u_tel,7,11) }</td>
			<%-- <td class="w10"><i class="icon-f i_font icon-class"></i>${uvo.u_club_gd }</td> --%>
		</tr>
		<tr>
			<td><i class="icon-f i_font icon-email"></i> <c:choose>
					<c:when test="${uvo.u_email == '' }">이메일을 등록해주세요.
								</c:when>
					<c:otherwise>
									${uvo.u_email }
								</c:otherwise>
				</c:choose></td>
			<td class="w10"><i class="icon-f i_font icon-t-size"></i>${uvo.u_tsize }</td>
		</tr>
	</table>
	<hr class="line_div">
</div>
<!-- content end -->
<div class="scroll_nv_area bg_gray">
    <div class="ct_sd white_bg pt_00">
      <table class="td_m cet_lay td_pd_l0">
        <tr class="tab_cont">
          <td class="" onclick="location.href='#;'"><i class="icon-f btn_i icon-class "></i>
            <span class="item_text">클럽급수</span></td>
          <td class="" onclick="location.href='#;'"><i class="btn_i icon-calendar"></i>
            <span class="item_text">월별게임</span></td>
          <td class="" onclick="location.href='#;'"><i class="icon-f btn_i icon-match"></i>
            <span class="item_text">대회순위</span></td>
          <td class="" onclick="location.href='#;'"><i class="icon-f btn_i icon-ranking"></i>
            <span class="item_text">전체순위</span></td>
        </tr>
      </table>
    </div>
    <div class="tab_cont_con">
      <div class="tab_con">
        <div class="content pt_00">
          <ul class="list_room white_bg">
	          <c:forEach items="${list2}" var="list">
	            <li>
	              <div class="room_photo">
	                <div class="photo_area" style="background-image:url(${list.c_photo})"></div>
	              </div>
	              <div class="room_data">
	                <h4>${list.c_nm}</h4>
	                <p class="el_date">${list.c_location}</p>
	              </div>
	              <div class="cet_lay rank_db"><i class="icon-f icon-class sub_color"></i>
	                <select id="${list.c_idx}_gd" onchange="gdChange('${list.c_idx}')">
	                  <option value="자강" ${list.u_club_gd == '자강' ? 'selected="selected"' : '' }>자강</option>
	                  <option value="A" ${list.u_club_gd == 'A' ? 'selected="selected"' : '' }>A</option>
	                  <option value="B" ${list.u_club_gd == 'B' ? 'selected="selected"' : '' }>B</option>
	                  <option value="C" ${list.u_club_gd == 'C' ? 'selected="selected"' : '' }>C</option>
	                  <option value="D" ${list.u_club_gd == 'D' ? 'selected="selected"' : '' }>D</option>
	                  <option value="초심" ${list.u_club_gd == '초심' ? 'selected="selected"' : '' }>초심</option>
	                  <option value="왕초" ${list.u_club_gd == '왕초' ? 'selected="selected"' : '' }>왕초</option>
	                </select>
	              </div>
	            </li>
	           </c:forEach>
          </ul>
        </div>
        <!-- content end --> 
      </div>
      <!-- tab_con end -->
      <div class="tab_con bg_gray">
        <ul class="accordion_ul">
	        <c:forEach items="${list3}" var="list">
	          <li>
	            <ul class="accd_head" onclick="trChange('${list.c_mm}')">
	              <li>20${fn:substring(list.c_mm,0,2) }년 ${fn:substring(list.c_mm,2,4) }월</li>
	              <li>${list.my_win + list.my_lose }전 ${list.my_win}승 ${list.my_lose}패</li>
	              <li><c:choose><c:when test="${list.my_win ne 0 }"><fmt:formatNumber value="${list.my_win/(list.my_win+list.my_lose) *100}" pattern=".00"/></c:when><c:otherwise>0</c:otherwise> </c:choose>%</li>
	            </ul>
	            <div class="accd_a pd_lrtb white_bg">
	              <table class="game_td" id="${list.c_mm }">
	              </table>
	            </div>
	            <!-- accd_a end--> 
	          </li>
	        </c:forEach>
        </ul>
      </div>
      <!-- tab_con end -->
      <div class="tab_con">
        <div class="content white_bg">
          <table class="game_td cet_lay td_pd_l0">
           <c:forEach items="${list4}" var="list">
            <tr onclick="rankHref('${list.cf_idx}')">
              <td class="ga_title"><div class="el_date">
                  <span class="main_color" style="">[교류전]</span>
                  ${list.cf_nm }</div>
                <p class="date">${list.cf_start}</p></td>
              <td class="td_1 small_font"><ul class="li_row_nol">
                  <li class="gray1_color">${list.cf_t_nm}</li>
                </ul></td>
              <td class="td_1 small_font"><ul class="li_row_nol">
                  <li>${list.rnum }위</li>
                  <li class="gray1_color">${list.team_count}팀</li>
                </ul></td>
            </tr>
           </c:forEach>
          </table>
        </div>
        <!-- content end --> 
      </div>
      <!-- tab_con end -->
      <div class="tab_con">
        <div class="content white_bg">
          <p class="dot_long-tit sm_font bold_text tit_mb">급수 랭킹</p>
          <table class="table_nol">
            <tr>
              <td class="ga_title">${list5[3].c_nm}</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>${list5[3].rnum}위</li>
                  <li class="gray1_color">${list5[3].team_count}명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title">연령대</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>${list5[1].rnum}위</li>
                  <li class="gray1_color">${list5[1].team_count}명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title">성별</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>${list5[2].rnum}위</li>
                  <li class="gray1_color">${list5[2].team_count}명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title">전국</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>${list5[0].rnum}위</li>
                  <li class="gray1_color">${list5[0].team_count}명</li>
                </ul></td>
            </tr>
          </table>
          <hr class="line_div">
          <!-- <p class="dot_long-tit sm_font bold_text tit_mb">클럽(모임)</p>
          <table class="table_nol">
            <tr>
              <td class="ga_title">리더아머마르스입니다</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>4위</li>
                  <li class="gray1_color">85명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title">YD텐션＆라인업</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>4위</li>
                  <li class="gray1_color">85명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title">스펙트럼</td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>4위</li>
                  <li class="gray1_color">85명</li>
                </ul></td>
            </tr>
          </table>
          <hr class="line_div">
          <table class="table_nol">
            <tr>
              <td class="ga_title"><span class="dot_long-tit sm_font bold_text">동일연령대</span></td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>4,500위 </li>
                  <li class="gray1_color"> 36,800명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title"><span class="dot_long-tit sm_font bold_text">성별</span></td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>19,899위 </li>
                  <li class="gray1_color"> 158,561명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title"><span class="dot_long-tit sm_font bold_text">지역–소속구(시) 이름</span></td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>876위 </li>
                  <li class="gray1_color">2,215명</li>
                </ul></td>
            </tr>
            <tr>
              <td class="ga_title"><span class="dot_long-tit sm_font bold_text">전국</span></td>
              <td class="td_2"><ul class="divide_li fl_right">
                  <li>89,218위 </li>
                  <li class="gray1_color">225,876명</li>
                </ul></td>
            </tr>
          </table> -->
        </div>
      </div>
      <!-- tab_con end --> 
    </div>
    <!-- tab_cont_con end --> 
    
  </div>
  <!-- scroll_nv_area end -->
  
  <div class="popwin_size white_bg">
    <div class="head_top title_popup">
      <div class="tit_top">
        <h1 class="game_title">게임결과</h1>
      </div>
      <div class="bt_top">
        <span class="btn_i la la-close" onclick="location.href='#'"></span>
      </div>
    </div>
    <!-- title_popupp end -->
    <div class="popup_body">
      <div class="bd_cat col_2-1">
        <div>
          <h4 class="title_m" id="c_court"></h4>
        </div>
        <div>
          <ul class="li_small">
            <li><b>날짜</b><p id="cm_date"></p></li>
            <li><b>시작</b><p id="cm_start"></p></li>
            <li><b>종료</b><p id="cm_end"></p></li>
          </ul>
        </div>
      </div>
      <table class="col_score">
        <tr>
          <td rowspan="2" class="team_td">A 팀</td>
          <td class="player_td"><div class="photo_name">
              <div class="thum_area">
                <div id="c_a1_photo" class="thum" style="background-image:url(img/member_photo_04.jpg);"></div>
              </div>
              <div class="text_area">
                <span class="name3" id="c_a1_name"></span>
                <span class="age_rank" id="c_a1_age_Gd"></span>
              </div>
            </div>
            
            <!--photo_name end--></td>
          <td class="victory_td" id="c_a1_total"></td>
          <td class="point_td" id="c_a1_point"></td>
        </tr>
        <tr>
          <td class="player_td"><div class="photo_name">
              <div class="thum_area">
                <div id="c_a2_photo" class="thum" style="background-image:url(img/member_photo_02.jpg);"></div>
              </div>
              <div class="text_area">
                <span class="name3" id="c_a2_name">가길</span>
                <span class="age_rank" id="c_a2_age_Gd">(40-자강)</span>
              </div>
            </div>
            
            <!--photo_name end--></td>
          <td class="victory_td" id="c_a2_total">25(승) +4</td>
          <td class="point_td" id="c_a2_point">+2.5 P</td>
        </tr>
        <tr>
          <td rowspan="2" class="team_td">B 팀</td>
          <td class="player_td"><div class="photo_name">
              <div class="thum_area">
                <div id="c_b1_photo" class="thum" style="background-image:url(img/member_photo_06.jpg);"></div>
              </div>
              <div class="text_area">
                <span class="name3" id="c_b1_name">가길동입니다.</span>
                <span class="age_rank" id="c_b1_age_Gd">(40-왕초)</span>
              </div>
            </div>
            
            <!--photo_name end--></td>
          <td class="victory_td" id="c_b1_total">25(승) -4</td>
          <td class="point_td" id="c_b1_point">+0.5 P</td>
        </tr>
        <tr>
          <td class="player_td"><div class="photo_name">
              <div class="thum_area">
                <div id="c_b2_photo" class="thum" style="background-image:url(img/member_photo_02.jpg);"></div>
              </div>
              <div class="text_area">
                <span class="name3" id="c_b2_name"></span>
                <span class="age_rank" id="c_b2_age_Gd"></span>
              </div>
            </div>
            
            <!--photo_name end--></td>
          <td class="victory_td" id="c_b2_total"></td>
          <td class="point_td" id="c_b2_point"></td>
        </tr>
      </table>
    </div>
    <!-- popup_body end--> 
  </div>
<!-- content end -->
<!-- InstanceEndEditable -->

<!-- container end -->
<div id="ft_area">
	<!-- InstanceBeginEditable name="ft_area" -->
	<!-- InstanceEndEditable -->
</div>
<script>
var yy = new Date().getFullYear().toString().substr(-2)
	$(document).ready(function(){
		var arr = new Array();
		<c:forEach items="${list}" var = "list">
			arr.push("${list.c_mm}");
			arr.push("${list.c_gameC}")
			arr.push("${list.cm_p_total}")
		</c:forEach>
		var q = arr.length
		q= q/3
		var z = 0;
		for(var i = 0; q >= z;i++){
			var j = (i+1).toString();
			if(j.length==1){
				j="0"+j;
			}
			if(arr[0] == yy+j){
				var a = arr.shift();
				var k = arr.shift();
				var f = arr.shift();
				$("#c_"+j).text(k+"회")
				$("#t_"+j).text(f)
				z++;
			}
			if(z==q){
				break;
			}
		}
		
	})
	function mm(mm){
		mm = mm.toString();
		if(mm.length<2){
			mm="0"+mm.toString();
		}
		if($("#c_"+mm).text()=="0회"){
			
		}else{
			location.href="/Game/PointDetail.techni?ym="+yy+mm;
		}
		
	}
	function trChange(ym){
		$.ajax({
			type : "post",
			data : JSON.stringify({"ym" : ym , "kind" : "월별디테일"}),
			url : "/UClub/UClubMemberDetail2.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
					$("#"+ym).empty();
					var list = data.list;
					var appendTr = "";
					$.each(list,function(idx,value){
						appendTr += "<tr onclick=\"popupChange('"+value.c_gidx+"','"+value.c_idx+"')\" class='popwin_btn1' id='"+value.c_gidx+"'><td class='ga_title'>"+value.cm_match_date+" "+value.cm_end+"</td><td class='w20'>"+value.cm_win+"</td><td class='w10'>"+value.cm_aptn+"</td></tr>"
					})
					$("#"+ym).append(appendTr);
					clickEv();
				}else{
					swal("민턴in","죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}			
		})
	}
	function popupChange(gidx,cidx){
		$.ajax({
			type : "post",
			data : JSON.stringify({"c_idx" : cidx,"c_gidx" : gidx,"kind" : "매치디테일"}),
			url : "/UClub/UClubMemberDetail2.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
					var list = data.list;
					$("#c_court").text(data.list[0].cm_order+"코트");
					$("#cm_date").text(data.list[0].cm_match_date);
					$("#cm_start").text(data.list[0].cm_start);
					$("#cm_end").text(data.list[0].cm_end);
					$("#c_a1_photo").attr("style","background-image: url("+data.list[0].u_photo+")");
					$("#c_a1_name").text(data.list[0].u_nm);
					$("#c_a1_age_Gd").text(data.list[0].u_club_gd+"-"+data.list[0].u_age);
					$("#c_a1_total").text(data.list[0].cm_total+"("+data.list[0].cm_win+")"+" "+data.list[0].cm_sc_gap);
					$("#c_a1_point").text("+"+data.list[0].cm_aptn+"p");
					$("#c_a2_photo").attr("style","background-image: url("+data.list[1].u_photo+")");
					$("#c_a2_name").text(data.list[1].u_nm);
					$("#c_a2_age_Gd").text(data.list[1].u_club_gd+"-"+data.list[1].u_age);
					$("#c_a2_total").text(data.list[1].cm_total+"("+data.list[1].cm_win+")"+" "+data.list[1].cm_sc_gap);
					$("#c_a2_point").text("+"+data.list[1].cm_aptn+"p");
					$("#c_b1_photo").attr("style","background-image: url("+data.list[2].u_photo+")");
					$("#c_b1_name").text(data.list[2].u_nm);
					$("#c_b1_age_Gd").text(data.list[2].u_club_gd+"-"+data.list[2].u_age);
					$("#c_b1_total").text(data.list[2].cm_total+"("+data.list[2].cm_win+")"+" "+data.list[2].cm_sc_gap);
					$("#c_b1_point").text("+"+data.list[2].cm_aptn+"p");
					$("#c_b2_photo").attr("style","background-image: url("+data.list[3].u_photo+")");
					$("#c_b2_name").text(data.list[3].u_nm);
					$("#c_b2_age_Gd").text(data.list[3].u_club_gd+"-"+data.list[3].u_age);
					$("#c_b2_total").text(data.list[3].cm_total+"("+data.list[3].cm_win+")"+" "+data.list[3].cm_sc_gap);
					$("#c_b2_point").text("+"+data.list[3].cm_aptn+"p");
				}else{
					swal("민턴in","죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}			
		})
	}
	function rankHref(cf_idx){
		var path = "/Cfight/CfightMyRank.techni";
		var form = document.createElement("form");
		
		form.setAttribute("method","POST");
		form.setAttribute("action",path);
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type","hidden");
		hiddenField.setAttribute("name","cf_idx");
		hiddenField.setAttribute("value",cf_idx);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
</script>