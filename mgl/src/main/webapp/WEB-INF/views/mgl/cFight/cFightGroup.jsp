<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

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
	var jsonData = JSON.stringify(json);
	alert(jsonData);
	return false;
	 $.ajax({
		async : true,
		type:"post",
		data : jsonData,
		url : "/Cfight/CfightGroupInsert.techni",
		datatype : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data.cnt>0){
				location.href="/Cfight/CfightTypeList.techni"
			}else{
				swal("민턴in","죄송합니다. 다시 시도해 주세요.")
			}
		},
		error : function(error){
			swal("민턴in","error : "+error);
		}
	})  
}
</script>

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
									<input id="tCount_${i}" type="number"  class="cet_lay">
									<input id="idx_${i}" type="hidden" value="${list.cf_t_idx}">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>