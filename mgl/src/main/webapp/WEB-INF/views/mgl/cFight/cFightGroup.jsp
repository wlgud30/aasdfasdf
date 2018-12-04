<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
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
<script type="text/javascript">
function bun(){
	var json = new Array();
	var r = $("#trow tbody tr").length;
	for(var i =1 ; i<=r ; i++){
		var data = new Object();
		var da = new Object();
		var cou = Number($("#count_"+i).text());
		var tcou = Number($("#tCount_"+i).val());
		var grc = parseInt(cou/tcou);
		var tgrc = cou/tcou;
		if(grc != tgrc){
			grc = grc+1;
		}
		var arr = new Array();
		for(var j = 0 ; j<grc ; j++){
			arr.push(1);
		}
		cou = cou-grc;
		for(var k = 0 ; cou >= 0 ;k++){
			arr[k] = arr[k]+1;
			cou --;
			if(k+1==arr.length){
				k=-1;
			}
			if(cou==0){
				break;
			}
		}
		arr.unshift($("#idx_"+i).val());
		
		var q = "a"+i.toString();
		eval("data."+q+"="+"arr");
		json.push(data);
	}
	alert(json);
	var jsonData = JSON.stringify(json);
	alert(jsonData);
	 $.ajax({
		async : true,
		type:"post",
		data : jsonData,
		url : "/Cfight/CfightGroupInsert.techni",
		datatype : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data.cnt>0){
				swal({
					title : "MGL",
					text : "d",
					type : "success"
				})
				.then((value) =>{
					
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
</script>
<body>
	<div id="wrap">
		<header>
		<div class="head_top">
			<!-- InstanceBeginEditable name="head_top" -->
			<div class="btn_back" onClick="location.href='/Board/BoardList.techni'"></div>
			<div class="tit_top">
				<h1 class="game_title">${list[0].cf_nm } 그룹 설정</h1>
			</div>
			<div class="bt_top">
				<span onclick=" bun()" class="icon-arrow-o-right icon-f btn_i"></span>
			</div>
			<!-- InstanceEndEditable -->
		</div>
		<!-- head_top end --> </header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<table id="trow"class="game_td thead_td cet_lay td_pd_l0">
					<thead>
						<tr>
							<th class="no_td">No</th>
							<th>구분(종목)</th>
							<th class="team_nb">종류</th>
							<th class="team_nb rowfont">참여<br>팀수</th>
							<th class="team_nb rowfont">그룹별<br>희망 팀수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list"><c:set var="i"  value="${i+1}"/>
							<tr>
								<td class="no_td">${list.cf_t_num }</td>
								<td class="ga_title">${list.cf_t_nm }</td>
								<td>${list.cf_t_kind }</td>
								<td id="count_${i}">${list.t_count }<c:if test="${list.t_count eq null }">0</c:if></td>
								<td>
									<input id="tCount_${i}" type="text"  class="cet_lay">
									<input id="idx_${i}" type="hidden" value="${list.cf_t_idx}">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>