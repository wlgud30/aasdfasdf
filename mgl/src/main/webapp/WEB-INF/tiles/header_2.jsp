<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%
Map<String,Object> map = (Map<String,Object>)session.getAttribute("cvo");

String c_nm = (String)map.get("c_nm");
int count = (int)map.get("count");
String cf_idx = (String)session.getAttribute("cf_idx");
String cf_nm=(String)session.getAttribute("cf_nm");
String cf_t_nm=(String)session.getAttribute("cf_t_nm");
String cs_nm=(String)session.getAttribute("cs_nm");
String cs_idx=(String)session.getAttribute("cs_idx");
String mng=(String)session.getAttribute("mng");
%>
<div class="title_head head_el" style="top:40px;">
	<div class="head_top" id="head_top">
      <div class="tit_top">
        <h1 class="el_club_side" id="sub_title"><% out.print(c_nm);%></h1>
        <div class="side_rt_db">
          <span class="side_right member_ub" id="sub_title_2"><% out.print(count);%>명</span>
          <span id="sub_title_3" class="" onclick="location.href='#;'"></span>
        </div>
      </div>
      <div class="bt_top" id="bt_top">
      
      </div>
    </div>
</div>   
<script>
$(document).ready(function(){
	var lo = window.location.pathname;
	var cf_idx = "<%out.print(cf_idx);%>";
	var cf_nm = "<%out.print(cf_nm);%>"
	var cs_nm = "<%out.print(cs_nm);%>"
	var cs_idx = "<%out.print(cs_idx);%>"
	var cf_t_nm = "<%out.print(cf_t_nm);%>"
	var mng = "<%out.print(mng);%>"
	var yn = "${listYN}";
	var b_nm = "${bvo.cb_title}"
	var b_yn = "${bbs_yn}"
	if(lo.includes("/Board/BoardList.techni")||lo.includes("/Board/BoardListRepresent.techni")){
		$("#bt_top").append("<span class='btn_st' onclick=\"location.href='/Board/BoardWriteForm.techni'\">글쓰기</span>");
	}else if(lo.includes("/UClub/GamePrivateStateInfo.techni")||lo.includes("/UClub/GameTeamStateInfo.techni")||lo.includes("/UClub/GameOKList.techni")||lo.includes("/Game/GameState.techni")||lo.includes("/Game/EndGame.techni")||lo.includes("/Game/GameTodayRank.techni")){
		$("#bt_top").append("<span class='btn_st' onclick='game_kind()'>대회개설</span>")
	}else if(lo.includes("/Cfight/CfightInsertForm.techni")){
		$("#sub_title").text("대회생성");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#bt_top").append("<span class='icon-save icon-f btn_i i-text' onclick='formSubmit()''>등록</span>");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
	}else if(lo.includes("/Cfight/CfightDetail.techni")){
		if("${join eq null or join eq ''}" == "true"){
			$("#sub_title").text(cf_nm);
			$("#sub_title_2").text("");
			$("#sub_title_2").removeAttr("class");
			$("#sub_title_3").removeAttr("class");
			$("#bt_top").append("<span class='icon-score icon-f btn_i i-text' onClick=\"location.href='/Cfight/CfightReferee.techni'\">심판</span>");
		}else{
			$("#sub_title").text("클럽교류전");
			$("#sub_title_2").text("");
			$("#sub_title_2").removeAttr("class");
			$("#sub_title_3").removeAttr("class");
			$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
			if("${join eq '참석'}"=="true"){
				$("#bt_top").append("<span class='icon-approval icon-f btn_i i-text'>참석</span>");
			}else if("${join eq '불참'}"=="true"){
				$("#bt_top").append("<span class='icon-delete icon-f btn_i i-text'>불참</span>");
			}else if("${cm eq '매니저' and cfm ne '매니저'}"=="true"){
				$("#bt_top").append("<span class='icon-approval icon-f btn_i i-text' onClick=\"ynChk('Y','"+cf_idx+"')\">참석</span><span class='icon-delete icon-f btn_i i-text' onClick=\"ynChk('N','"+cf_idx+"')\">불참</span>");
			}
			if("${cfm eq '매니저'}" =="true"){
				$("#bt_top").append("<span class='icon-group-set icon-f btn_i i-text' onclick=\"location.href='/Cfight/CfightGroup.techni?cf_idx="+cf_idx+"'\">대진표</span>");
				$("#bt_top").append("<span class='icon-delete icon-f btn_i i-text' onclick=\"cfightDel('"+cf_idx+"')\">삭제</span>");
			}
		}
	}else if(lo.includes("/Cfight/CfightTypeList.techni")||lo.includes("/Cfight/CfightCourtList.techni")){
		$("#sub_title").text(cf_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#bt_top").append("<span class='icon-score icon-f btn_i i-text' onClick=\"location.href='/Cfight/CfightReferee.techni'\">심판</span>");
	}else if(lo.includes("/Cfight/CfightTimeList.techni")){
		$("#sub_title").text(cf_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#bt_top").append("<span class='icon-score icon-f btn_i i-text' onClick=\"location.href='/Cfight/CfightReferee.techni'\">심판</span>");
		$("#bt_top").append("<span class='icon-excel icon-f btn_i i-text' onclick=\"location.href='/Cfight/ExcelTimeDownload.techni'\">엑셀</span>");
	}else if(lo.includes("/Cfight/CfightMyRank.techni")||lo.includes("/Cfight/CfightTypeRank.techni")||lo.includes("/Cfight/CfightClubRank.techni")||lo.includes("/Cfight/CfightEntryType.techni")||lo.includes("/Cfight/CfightEntryClub.techni")){
		$("#sub_title").text(cf_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
	}else if(lo.includes("/Cfight/CfightSummary.techni")){
		$("#sub_title").text("클럽 교류전");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		if("${cfm eq '매니저'}" =="true"&&"${yn eq N}"=="true"){
			$("#bt_top").append("<span class='icon-delete icon-f btn_i i-text' onclick=\"cfightDel('"+cf_idx+"')\">삭제</span>");
		}
	}else if(lo.includes("/Cfight/CfightMatchDetail.techni")){
		$("#sub_title").text(cf_t_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div class='btn_back' onclick=\"location.href='/Cfight/CfightTypeList.techni'\"></div>");
	}else if(lo.includes("/Cfight/CfightReferee.techni")){
		$("#sub_title").text(cf_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Cfight/CfightDetail.techni'\"></div>");
		$("#bt_top").append("<span class='icon-file-view icon-f btn_i i-text' onClick=\"location.href='/Cfight/CfightAllMatch.techni'\">전체보기</span>");
	}else if(lo.includes("/Cfight/CfightAllMatch.techni")){
		$("#sub_title").text(cf_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Cfight/CfightDetail.techni'\"></div>");
	}else if(lo.includes("/Game/selfMatchDetail.techni")){
		if(yn == "Y"){
			$("#sub_title").text(cs_nm);
			$("#sub_title_2").text("");
			$("#sub_title_2").removeAttr("class");
			$("#sub_title_3").removeAttr("class");
			$("#bt_top").append("<span class='icon-score icon-f btn_i i-text' onclick=\"location.href='/Game/selfMatchReferee.techni'\">심판</span>");
		}else{
			$("#sub_title").text("자체대회");
			$("#sub_title_2").text("");
			$("#sub_title_2").removeAttr("class");
			$("#sub_title_3").removeAttr("class");
			$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick='history.back();'></div>");
			/* if("${res eq 0}" == "true"){
				$("#bt_top").append("<span onclick=\"ynChk('Y')\"class='icon-approval icon-f btn_i i-text'>참석</span>")
			}else{
				$("#bt_top").append("<span onclick=\"ynChk('N')\"class='icon-approval icon-f btn_i i-text'>불참</span>")
			} */
			if( mng == '매니저'){
				$("#bt_top").append("<span class='btn_st' onclick=\"location.href='/Game/selfMatchRegister.techni'\">대회설정</span>");
			}
		}
	}else if(lo.includes("/Game/selfMatchTypeInsertForm.techni")){
		$("#sub_title").text("종목 설정");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Game/selfMatchRegister.techni'\"></div>");
		$("#bt_top").append("<span class='btn_st' onclick='formSubmit()'>팀 출전신청</span>");
	}else if(lo.includes("/Cfight/CfightGroup.techni")){
		$("#sub_title").text(cf_nm+" 그룹설정");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Board/BoardList.techni'\"></div>");
		$("#bt_top").append("<span onclick='bun()' class='icon-group-set icon-f btn_i i-text'>대진표 생성</span>")
	}else if(lo.includes("/Cfight/CfightRegister.techni")){
		$("#sub_title").text(cf_nm+"선수등록");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Board/BoardList.techni'\"></div>");
	}else if(lo.includes("/Cfight/CfightRegisterT.techni")){
		$("#sub_title").text(cf_nm+"팀등록");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Board/BoardList.techni'\"></div>");
	}else if(lo.includes("/Cfight/CfightTeamList.techni")){
		$("#sub_title").text(cf_nm+"팀 확인");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Board/BoardList.techni'\"></div>");
	}else if(lo.includes("/Game/selfMatchTypeList.techni")||lo.includes("/Game/selfMatchTimeList.techni")||lo.includes("/Game/selfMatchCourtList.techni")){
		$("#sub_title").text(cs_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#bt_top").append("<span class='icon-score icon-f btn_i i-text' onclick=\"location.href='/Game/selfMatchReferee.techni'\">심판</span>");
	}else if(lo.includes("/Game/selfMatchEntryType.techni")||lo.includes("/Game/selfMatchMyRank.techni")||lo.includes("/Game/selfMatchMyRank.techni")||lo.includes("/Game/selfMatchTypeRank.techni")){
		$("#sub_title").text(cs_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
	}else if(lo.includes("/UClub/UClubMemberDetail.techni")){
		$("#sub_title").remove();
		$("#sub_title_2").remove();
		$("#sub_title_3").remove();
	}else if(lo.includes("/Board/BoardWriteForm.techni")){
		$("#sub_title").text("글쓰기");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Board/BoardList.techni'\"></div>");
		$("#bt_top").append("<span class='la la-paperclip btn_i i-text' onclick=\"location.href='la la-paperclip btn_i i-text'\">첨부</span>");
		$("#bt_top").append("<span class='la la-paperclip btn_i i-text' onclick=\"confirm()\">등록</span>");
	}else if(lo.includes("/Board/BoardDetail.techni")){
		$("#sub_title").text(b_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Board/BoardList.techni'\"></div>");
		if(b_yn == "y"){
			$("#bt_top").append("<span class='icon-note btn_i i-text' onclick=\"location.href='/Board/BoardBbsUpdateForm.techni?cb_idx=${bvo.cb_idx}'\">수정</span>");
			$("#bt_top").append("<span class='icon-dump icon-f btn_i i-text' onclick=\"bbsDel()\">삭제</span>");
		}
	}else if(lo.includes("/Game/GameScoreRegistForm.techni")){
		$("#sub_title").text("점수등록");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Game/EndGame.techni'\"></div>");
	}else if(lo.includes("/Game/GameResult.techni")){
		$("#sub_title").text("게임결과");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
	}else if(lo.includes("/Club/ClubUpdateForm.techni")){
		$("#sub_title").text("클럽수정");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#bt_top").append("<span id='updateForm' class='icon-save icon-f btn_i i-text'>등록</span>");
		$("#bt_top").append("<span id='ClubInsert' class='icon-delete icon-f btn_i i-text'onClick='history.back()'>취소</span>");
	}else if(lo.includes("/Game/GameSelfMatchInsert.techni")){
		$("#sub_title").text("대회생성");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"history.back()\"></div>");
		$("#bt_top").append("<span class='icon-save icon-f btn_i i-text' onclick='formSubmit()'>등록</span>");
	}else if(lo.includes("/UClub/UClubMemberUpdate.techni")){
		$("#sub_title").text("내 정보 수정");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"history.back()\"></div>");
		$("#bt_top").append("<span class='icon-save icon-f btn_i i-text' onclick='update()'>저장</span>");
	}else if(lo.includes("/UClub/UClubMemberCompareTo.techni")){
		$("#sub_title").text("상대전적");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"history.back()\"></div>");
	}else if(lo.includes("/Member/Alarm.techni")){
		$("#sub_title").text("알림");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"history.back()\"></div>");
		$("#bt_top").append("<span class='icon-save icon-f btn_i i-text' onclick=\"alarmDel('all')\">전체삭제</span>");
	}else if(lo.includes("/Game/selfMatchMatchDetail.techni")){
		$("#sub_title").text(cs_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Game/selfMatchTypeList.techni'\"></div>");
	}else if(lo.includes("/Game/selfMatchReferee.techni")){
		$("#sub_title").text(cs_nm);
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"history.back()\"></div>");
	}else if(lo.includes("/Game/selfMatchRegister.techni")){
		$("#sub_title").text("선수 등록");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Game/selfMatchDetail.techni'\"></div>");
		$("#bt_top").append("<span class='btn_st' onclick='matchSetting()'>종목설정</span>");
	}else if(lo.includes("/Game/selfMatchTeamInsertForm.techni")){
		$("#sub_title").text("팀 등록");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Game/selfMatchTypeInsertForm.techni'\"></div>");
		$("#bt_top").append("<span class='btn_st' onclick=\"location.href='/Game/selfMatchGameInsert.techni'\">대진표 생성</span>");
	}else if(lo.includes("/Game/selfMatchTeamList.techni")){
		$("#sub_title").text("등록 팀 확인");
		$("#sub_title_2").text("");
		$("#sub_title_2").removeAttr("class");
		$("#sub_title_3").removeAttr("class");
		$("#head_top").prepend("<div id='btn_back' class='btn_back' onclick=\"location.href='/Game/selfMatchTeamInsertForm.techni'\"></div>");
	}
	
	
});
function game_kind(){
	swal("민턴in","게임의 종류를 선택해 주세요",{
		buttons:{
			"자체대회" :{
				text : "자체대회",
				value : "self",
			},
			"교류전" : {
				text : "교류전",
				value : "club_fight"
			},
			cancel : "취소",
		},
	})
	.then((value) => {
		switch (value)	{
		case "self":
			location.href="/Game/GameSelfMatchInsert.techni";
			break;
		case "club_fight":
			location.href="/Cfight/CfightInsertForm.techni?c_nm="+"<% out.print(c_nm);%>"
			break;
		}
	});
}
function formSubmit(){
	if($("#cf_nm").val()=="" || $("#cf_nm").val()==null){
		swal("민턴in","대회 명을 입력해 주세요.");
		return false;
	}
	if($("#cf_start").val()=="" || $("#cf_start").val()==null){
		swal("민턴in","대회 일자를 입력해 주세요.");
		return false;
	}
	if($("#cf_sTime1").val()=="" || $("#cf_sTime1").val()==null ||$("#cf_sTime2").val()=="" || $("#cf_sTime2").val()==null){
		swal("민턴in","대회 시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_eTime1").val()=="" || $("#cf_eTime1").val()==null ||$("#cf_eTime2").val()=="" || $("#cf_eTime2").val()==null){
		swal("민턴in","대회 시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_point").val()=="" || $("#cf_point").val()==null){
		swal("민턴in","점수를 입력해 주세요.");
		return false;
	}
	if($("#cf_time").val()=="" || $("#cf_time").val()==null){
		swal("민턴in","소요시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_end").val()=="" || $("#cf_end").val()==null){
		swal("민턴in","등록마감 시간을 입력해 주세요.");
		return false;
	}
	if($("#cf_cnm").val()=="" || $("#cf_cnm").val()==null){
		swal("민턴in","체육관 명을 입력해 주세요.");
		return false;
	}
	if($("#cf_location").val()=="" || $("#cf_location").val()==null){
		swal("민턴in","체육관 위치를 입력해 주세요.");
		return false;
	}
	if(!$('input:radio[name=cf_meth]').is(':checked')){
		swal("민턴in","대회 방식을 입력해 주세요.");
		return false;
	}
	if($("#c1_idx").val()=="" || $("#c1_idx").val()==null && $("#c2_idx").val()=="" || $("#c2_idx").val()==null &&$("#c3_idx").val()=="" || $("#c3_idx").val()==null ){
		swal("민턴in","참여 클럽을 입력해 주세요.");
		return false;
	}
	if($("#cf_body").val()=="" || $("#cf_body").val()==null){
		swal("민턴in","대회 소개를 입력해 주세요.");
		return false;
	}
	var b = $("#trAppend tr").length;
	for(var i = 1 ; i<b;i++){
		if($("#no_"+i).val() == "" || $("#no_"+i).val() == null){
			swal("민턴in","게임 순서를 입력해 주세요.");
			return false;
		}
		if($("#type_"+i).val() == "" || $("#type_"+i).val() == null){
			swal("민턴in","종목을 입력해 주세요.");
			return false;
		}
		if($("#kind_"+i).val() == "" || $("#kind_"+i).val() == null){
			swal("민턴in","종류를 입력해 주세요.");
			return false;
		}
	}
	var fs = $("#frm").serialize();
	swal({
		title : "민턴in",
		text : "대항전을 등록하시겠습니까?",
		buttons : {
			confirm : "OK",
			cancel : "NO"
		}
	})
	.then((value) => {
		if(value){
			$.ajax({
				type:"post",
				data : fs,
				url : "/Cfight/CfightInsert.techni",
				datatype : "json",
				success : function(data){
					if(data.cnt>0){
						swal({
							title : "민턴in",
							text : "대항전이 등록되었습니다.",
							type : "success"
						})
						.then((value) =>{
							 location.href="/Board/BoardList.techni";
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
</script>