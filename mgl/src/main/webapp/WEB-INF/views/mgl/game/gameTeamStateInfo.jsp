<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
<div id="wrap">
  <header>
    <div class="head_top"> <!-- InstanceBeginEditable name="head_top" -->
    	<div class="logo_top">
			<img src="/resources/img/logo.svg" alt="MGL" class="logo" onClick="location.href='/UClub/UClubAllList.techni'">
		</div>
		<div class="tit_top">
        	<h1>${list[0].c_nm }</h1>
      	</div>
      <div class="bt_top">
        <c:choose>
			<c:when test="${u_status eq '게임중'}">
				<span class="icon-playing icon-f btn_i i-text">게임중</span>
			</c:when>
			<c:when test="${u_status eq '대기중' }">
				<span class="icon-expect icon-f btn_i i-text">대기중</span>
			</c:when>
			<c:when test="${u_status eq '게임가능'}">
				<span class="icon-out icon-f btn_i i-text" onClick=attendOut();>퇴실</span>
			</c:when>
			<c:otherwise>
				<span class="icon-enter icon-f btn_i i-text" onClick=attend();>출석</span>
			</c:otherwise>
		</c:choose>
      </div>
      <!-- InstanceEndEditable --> </div>
    <!-- head_top end --> 
  </header>
  <div id="container"> <!-- InstanceBeginEditable name="container" --> 
    <script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-8, -7); 
	$('.tab_btn_b').navi_depth({pageNum:aa})
    var tab_s_no = $(location).attr('pathname').slice(-10, -9); 
	$('.tabs_cont').navi_depth({pageNum:tab_s_no});		
     });
    </script>
    <div class="tab_btn_b_area">
      <ul class="tab_btn_b">
        <li onClick="location.href='/Game/GameState.techni'"><span>게임현황판</span></li>
		<li class="active_tab" onClick="location.href='/UClub/GameOKList.techni'"><span>게임등록</span></li>
		<li onClick="location.href='/UClub/AttendList.techni '"><span>출석확인</span></li>
      </ul>
    </div>
    <!-- tab_btn_b_area end -->     
    <div class="tab_bt_area white_bg">
      <div>
        <ul class="tabs_cont">
          <li>
            <span onClick="location.href='/UClub/GameOKList.techni'">수동등록</span>
          </li>
          <li>
            <span onClick="location.href='/UClub/GamePrivateStateInfo.techni'">개인리그등록</span>
          </li>
          <li class="active_tab">
            <span onClick="location.href='/UClub/GameTeamStateInfo.techni'">팀리그등록</span>
          </li>          
        </ul>
      </div>
    </div>
    <!-- tab_bt_area end -->    
    <div class="btn_full pd_lrb" id="gameInsert" style="display: none">
      <span class="btn_st btn_color1" onclick="gameInsert()">게임등록</span>
    </div>    
    <div class="content white_bg pt_00 visible_area_td" style="display: none">
      <table class="mix3_td" id="teamTable">
      </table>
    </div>
    <!-- content end-->
    <div class="content white_bg line1_dark pt_00">
      <div class="btn_full pd_lrtb mb_b0">
        <span class="btn_st creat_btn" onClick="appendTable()">팀 생성</span>
        <hr class="line_div mb_b0">
      </div>
      <table class="line_no">
					<tr>
						<td class="name_ph" id="td_1">
							<div class="photo_name">
								<input type="hidden" id="id_1">
								<input type="hidden" id="sex_1">
								<div class="thum_area">
									<div class="thum" id="photo_1" style="background-image: url(img/member_photo_06.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3" id="nm_1" ></span> <span class="age_rank" id="age_gd_1" ></span>
								</div>
							</div> <!--photo_name end-->
						</td>
						<td class="btn_icons_td">
							<div class="icon_btn">
								<span id="re1" onclick="remove('1',this)" class="icon-remove re1" title="remove"></span>
							</div>
						</td>
						<td class="name_ph" id="td_2">
							<div class="photo_name">
								<input type="hidden" id="id_2">
								<input type="hidden" id="sex_2">
								<div class="thum_area">
									<div class="thum" id="photo_2"  style="background-image: url(img/member_photo_05.jpg);"></div>
								</div>
								<div class="text_area">
									<span class="name3" id="nm_2" ></span> <span class="age_rank" id="age_gd_2" ></span>
								</div>
							</div> <!--photo_name end-->
						</td>
						<td class="btn_icons_td">
							<div class="icon_btn">
								<span id="re2" onclick="remove('2',this)" class="icon-remove re2" title="remove"></span>
							</div>
						</td>
					</tr>
				</table>
    </div>
    <!-- content end -->
    <c:if test="${list[0].u_nm ne null}">
    <div class="content white_bg acd_area">
      <div class="acd-head">
      <h4 class="title_s"><b>출전선수 구분</b><b id="st"> : 전체</b></h4>
      </div>
      <!-- acd-head end-->
       <div class="acd-cont">
      <ul class="list_check">
        <li>
          <input type="radio" class="check_circle" id="check_all" name="option_add" checked="checked" onclick="allShow()">
          <label for="check_all">전체</label>
        </li>
        <li>
          <input type="radio" class="check_circle" id="check_detail"  name="option_add" >
          <label for="check_detail">상세</label>
        </li>
      </ul>
      <div class="check_ul_area">
        <table class="table_form line_no" id="ckTable">
          <tr>
            <td class="td_ti"><b>성별</b></td>
            <td><ul class="list_check li_lot">
                <li>
                  <input type="checkbox" class="li_check" id="check_man" onclick="checkV()" value="M">
                  <label for="check_man">남</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_woman" onclick="checkV()" value="F">
                  <label for="check_woman">여</label>
                </li>
              </ul></td>
          </tr>
          <tr>
            <td class="td_ti"><b>급수</b></td>
            <td><ul class="list_check li_lot">
                <li>
                  <input type="checkbox" class="li_check" id="check_1_1" value="자강" onclick="checkV()">
                  <label for="check_1_1">자강</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_1_2" value="A" onclick="checkV()">
                  <label for="check_1_2">A</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_1_3" value="B" onclick="checkV()">
                  <label for="check_1_3">B</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_1_4" value="C" onclick="checkV()">
                  <label for="check_1_4">C</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_1_5" value="D" onclick="checkV()">
                  <label for="check_1_5">D</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_1_6" value="초심" onclick="checkV()">
                  <label for="check_1_6">초심</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_1_7" value="왕초" onclick="checkV()">
                  <label for="check_1_7">왕초</label>
                </li>
              </ul></td>
          </tr>
          <tr>
            <td class="td_ti"><b>나이</b></td>
            <td><ul class="list_check li_lot">
                <li>
                  <input type="checkbox" class="li_check" id="check_10" value="10" onclick="checkV()">
                  <label for="check_10">10대</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_20" value="20" onclick="checkV()">
                  <label for="check_20">20대</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_30" value="30" onclick="checkV()">
                  <label for="check_30">30대</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_40" value="40" onclick="checkV()">
                  <label for="check_40">40대</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_50" value="50" onclick="checkV()">
                  <label for="check_50">50대</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_60" value="60" onclick="checkV()">
                  <label for="check_60">60대</label>
                </li>
                <li>
                  <input type="checkbox" class="li_check" id="check_70" value="70" onclick="checkV()">
                  <label for="check_70">70대</label>
                </li>
              </ul></td>
          </tr>
        </table>
      </div>
      </div><!-- acd cont end-->
    </div>
    <!-- content acd_area end -->    
    <div class="content white_bg" id="v_all" >
      <ul class="li_name line_tno" id="pre"><c:set var="i"  value="${i}"/>
      	<c:forEach items="${list}" var="list"><c:set var="i"  value="${i+1}"/>
	        <li onclick="te('${list.u_id }','${list.u_nm}','${list.u_photo}','${fn:substring(list.u_age,0,1)}0대','${list.u_club_gd}','${list.u_sex }','${i}')" id="${list.u_id }" class="no_${i} v_all ${list.u_sex } ${fn:substring(list.u_age,0,1)}0 ${list.u_club_gd }">
	          <div class="photo_name">
	            <div class="thum_area">
	              <div class="thum" style="background-image:url(${list.u_photo});"></div>
	            </div>
	            <div class="text_area">
	                <span class="name3">${list.u_nm }</span>
	                <span class="age_rank">(${fn:substring(list.u_age,0,1)}0대-${list.u_club_gd})</span>
	            </div>
	          </div>
	          <!--photo_name end-->
	        </li>
		</c:forEach>
      </ul>
    </div>
    </c:if>
    <!-- content end --> 
    <!-- InstanceEndEditable --> </div>
  <!-- container end -->
  <div id="ft_area">
    <!-- InstanceBeginEditable name="ft_tag" --> <!-- InstanceEndEditable -->
     <script>	
    $(document).ready(function(){	
    var ft_nv = $(location).attr('pathname').slice(-6, -5); 
	$('.ft_menu').navi_depth({pageNum:ft_nv})
     });
    </script>
  <ul id="ft_nv1" class="ft_menu">
  	<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
	<li class="active_tab"  onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
	<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
	<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
  </ul>
 </div>
</div>
<script>
var team1 = 0;
var team2 = 0;
var no_1 = 0;
var cut_1 = "";
var no_2 = 0;
var cut_2 = "";
var no = 1;
var cut ="";

function te(idd,nm,photo,age,gd,sex,i){
	if(team1 == 0){
		no_1 = i-1;
		$("#"+idd).attr('style','display:none');
		$("#photo_1").attr('style','background-image: url('+photo+')');
		$("#nm_1").text(nm);
		$("#age_gd_1").text("("+age+"-"+gd+")");
		$("#re1").attr("id","re_"+idd);
		$("#sex_1").val(sex);
		$("#id_1").val(idd)
		team1++;
		checkV()
	}else if(team2 == 0){
		no_2 = i-1;
		$("#"+idd).attr('style','display:none');
		$("#photo_2").attr('style','background-image: url('+photo+')');
		$("#nm_2").text(nm);
		$("#age_gd_2").text("("+age+"-"+gd+")");
		$("#re2").attr("id","re_"+idd);
		$("#sex_2").val(sex);
		$("#id_2").val(idd)
		team2++;
		checkV()
	}else{
		swal("MGL","자리가 꽉 찼습니다.")
	}
}
function remove(i,t){
	if($(t).attr("id")=="re"+i){
		return;
	}else{
		$("#photo_"+i).attr('style','background-image: url()');
		$("#nm_"+i).text("");
		$("#age_gd_"+i).text("");
		$("#"+$(t).attr("id").substring(3,$(t).attr("id").length)).css('display','');
		$(t).attr("id","re"+i);
		$("#id_"+i).val("");
		$("#sex_"+i).val("");
		if(i==1){
			team1=0;
		}else{
			team2=0;
		}
		checkV();
	}
}
function allShow(){
	$("input[type=checkbox]").prop("checked",false);
	$("#st").text("");
	checkV();
}
function checkV(){
	var s_test = "";
	var gd_test = "";
	var age_test = "";
	var la = " : ";
	$("#v_all").attr("style","display:''");
	$(".v_all").attr("style","display:none");
	$(".li_check:checked").each(function() {
		la += $("label[for="+this.id+"]").text()+",";
		if($(this).val() == "M" || $(this).val()=="F" &&s_test.length==0){
			s_test += "."+$(this).val();
		}else if(s_test.length !=0 && $(this).val() == "M" || $(this).val()=="F"){
			s_test += ",."+$(this).val()
		}else if(isNaN($(this).val()) && gd_test.length==0 && $(this).val() != "M" && $(this).val() != "F" ) {
			gd_test += "."+$(this).val()
		}else if(isNaN($(this).val()) && gd_test.length!=0 && $(this).val() != "M" && $(this).val() != "F" ){
		  	gd_test += ",."+$(this).val();
		}else if(!isNaN($(this).val()) && age_test ==0){
			age_test +="."+$(this).val();
		}else if(!isNaN($(this).val()) && age_test !=0){
			age_test += ",."+$(this).val();
		}
		})
	$(".v_all").attr("style","display:''");
	if(s_test != ""){
		$("#pre").find("li").not(s_test).attr("style","display:none");
	}
	if(gd_test != ""){
		$("#pre").find("li").not(gd_test).attr("style","display:none");
	}
	if(age_test !=""){
		$("#pre").find("li").not(age_test).attr("style","display:none");
	}
	$("#st").text(la.substring(0,la.length-1))
	
	$("input[name=team_1]").each(function(){
		$("#"+$(this).val()).css('display','none');
	});
	$("input[name=team_2]").each(function(){
		$("#"+$(this).val()).css('display','none');
	});
	var id1 = $("#id_1").val();
	var id2 = $("#id_2").val();
	if(id1 !=""){
		$("#"+id1).css("display","none");
	}
	if(id2 != ""){
		$("#"+id2).css("display","none");
	}
	
	
	
	var a = 0;
	$("#pre li").each(function(){
		if($(this).is(":hidden")){
			a++;
		}
	});
	if(a==$("#pre li").length){
		$("#v_all").attr("style","display:none");
	}
	
}

function appendTable(){
	if(no > 1){
		$("#gameInsert").attr("style","display:''");
	}
	
	if(team1 != 0  && team2 !=0){
		if(no==6){
			swal("MGL","최대 5팀까지 선택 가능합니다.")
		}else{
			team1 = 0;
			team2 = 0;
			$("#teamTable").append("<tr id='tt"+no+"'>");
			$("#tt"+no).append("<td class='cot2 order_td'>"+no+"</td>")
			$("#tt"+no).append("<td class='name_ph'><div class='photo_name'><input type='hidden' name='team_1' value="+$("#id_1").val()+"><div class='thum_area'>"
								+"<div class='thum' style='"+$("#photo_1").attr("style")+"'></div></div>"		
								+"<div class='text_area'><span class='name3'>"+$("#nm_1").text()+"</span>"
								+"<span class='age_rank'>"+$("#age_gd_1").text()+"</span></div></div></td>");
			$("#tt"+no).append("<td class='name_ph'><div class='photo_name'><input type='hidden' name='team_2' value='"+$("#id_2").val()+"'><div class='thum_area'>"
					+"<div class='thum' style='"+$("#photo_2").attr("style")+"'></div></div>"		
					+"<div class='text_area'><span class='name3'>"+$("#nm_2").text()+"</span>"
					+"<span class='age_rank'>"+$("#age_gd_2").text()+"</span></div></div></td>");
			$("#tt"+no).append("<td class='btn_icons_td'><div class='icon_btn'>"+
		              "<span class='icon-remove' onclick=\"deleteTable('tt"+no+"')\" title='remove'></span>"+
		              "</div></td>");
			$("#teamTable").append("</tr>")
			no++;
			$("#photo_1").attr('style','background-image: url()');
			$("#nm_1").text("");
			$("#age_gd_1").text("");
			$("id_1").val("");
			$("#sex_1").val("");
			$("#photo_2").attr('style','background-image: url()');
			$("#nm_2").text("");
			$("#age_gd_2").text("");
			$("id_2").val("");
			$("#sex_2").val("");
			$(".re1").attr("id","re1");
			$(".re2").attr("id","re2");
		}
	}else{
		swal("MGL","팀원을 선택해 주세요.")
	}
}
function deleteTable(tid){
	no--;
	$("#"+$("#"+tid+" input[name=team_1]").val()).css("display","");
	$("#"+$("#"+tid+" input[name=team_2]").val()).css("display","");
	$("#"+tid).remove();
	$("#teamTable tr").each(function(i){
		$(this).attr("id","tt"+(i+1));
		$(this).find("td").eq(0).text(i+1);
		$(this).find("span").eq(4).attr("onclick","deleteTable('tt"+(i+1)+"')")
	});
	if($("#v_all").is(":hidden")){
		$("#v_all").attr("style","display:''");
	}
	if(no <= 2){
		$("#gameInsert").attr("style","display:none");
	}
}
function gameInsert(){
	var team_a ="";
	var json = new Array();
	$("input[name=team_1]").each(function (i){
		team_a = $("input[name=team_1]").eq(i).val()+","+$("input[name=team_2]").eq(i).val()
		var arr = new Array();
		var data = new Object();
		arr.unshift(team_a)
		var q = "a"+i;
		eval("data."+q+"="+"arr"	);
		json.push(data);
	})
	var jsonData = JSON.stringify(json);
	alert(jsonData);
	 $.ajax({
			async : true,
			type:"post",
			data : jsonData,
			url : "/Game/TeamLeagueInsert.techni",
			datatype : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt>0){
					location.href="/Game/GameState.techni"
				}else{
					swal("MGL","죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error){
				swal("MGL","error : "+error);
			}
		}); 
	
}
function attend(){
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
}
</script>
<!-- wrap end -->
</body>
</html>