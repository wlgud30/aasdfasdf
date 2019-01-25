<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<script>
	function ynChk(yn){
		var ynS = "";
		if(yn =="Y"){
			ynS="참석"
		}else{
			ynS="불참"
		}
		swal({
			title : "MGL",
			text : "자체대회에 "+ynS+"하시겠습니까?",
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
					data : JSON.stringify({"yn" : yn , "cs_idx" : "${list.cs_idx}"}),
					url : "/Game/selfMatchJoin.techni",
					datatype : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title : "MGL",
								text : "자체대회에"+ynS+"되었습니다.",
								type : "success"
							})
							.then((value) =>{
								 location.href="/Game/selfMatchDetail.techni?cs_idx=${list.cs_idx}"
							})
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
	
	function matchSetting(){
		var path = "/Game/selfMatchTypeInsertForm.techni"
		var cs_kind = $("#cs_kind").text();
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action",path)
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","cs_kind");
			hiddenField.setAttribute("value",cs_kind);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
	}
</script>

			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<table class="table_form">
					<tr>
						<td><h4 class="title_g">${list.cs_nm}</h4></td>
					</tr>
					<tr>
						<td>
							<div class="col_2input">
								<div>
									<p class="guide_text">대회일자</p>${list.cs_start }
								</div>
								<div>
									<p class="guide_text">대회시간</p>${fn:substring(list.cs_sTime,0,5)}~${fn:substring(list.cs_eTime,0,5)}
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="col_2input wauto">
								<div>
									<span class="guide_text left_guide">점수</span>${list.cs_point }
								</div>
								<div>
									<span class="guide_text left_guide">소요분</span>${list.cs_time }
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<span class="guide_text left_guide">등록마감</span>${list.cs_end }
						</td>
					</tr>
					<tr>
						<td>
							${list.cs_cnm }
						</td>
					</tr>
					<tr>
						<td>
							<span class="guide_text">대회방식</span>
							<ul class="list_check">
								<li id = "cs_kind">${list.cs_kind }</li>
							</ul>
						</td>
					</tr>
				</table>
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td>
							${fn:replace(list.cs_content, newLineChar, "<br/>")}
						</td>
					</tr>
					<tr>
						<td>
							<span class="btn_st btn_wh btn_small" onclick="location.href='/Game/selfMatchRegister.techni?cs_idx=${list.cs_idx}'">선수등록</span>
							<span class="btn_st btn_wh btn_small"onclick="location.href='/Game/selfMatchWBInsertForm.techni?cs_idx=${list.cs_idx}'">청백 설정</span>
							<span class="btn_st btn_wh btn_small"onclick="location.href='/Game/selfMatchTypeInsertForm.techni?cs_idx=${list.cs_idx}'">종목 설정</span>
							<span class="btn_st btn_wh btn_small"onclick="location.href='/Game/selfMatchTeamInsertForm.techni?cs_idx=${list.cs_idx}'">팀 설정</span>
							<span class="btn_st btn_wh btn_small"onclick="location.href='/Game/selfMatchPrivateInsertForm.techni?cs_idx=${list.cs_idx}'">개인 설정</span>
							<span class="btn_st btn_wh btn_small"onclick="location.href='/Game/selfPrivateLeagueInsert.techni?cs_idx=${list.cs_idx}'">개인표</span>
							<span class="btn_st btn_wh btn_small"onclick="location.href='/Game/selfMatchGameInsert.techni?cs_idx=${list.cs_idx}'">팀표</span>
						</td>
					</tr>
				</table>
				<hr class="gap_m">
				<%-- <table class="game_td thead_td cet_lay">
					<thead>
						<tr>
							<th class="no_td">No</th>
							<th>구분(종목)</th>
							<th class="team_nb">종류</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list2 }" var="list">
							<tr>
								<td class="no_td">${list.cf_t_num }</td>
								<td class="ga_title">${list.cf_t_nm }</td>
								<td>${list.cf_t_kind }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table> --%>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>