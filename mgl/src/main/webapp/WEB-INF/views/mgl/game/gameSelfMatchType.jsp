<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- InstanceBeginEditable name="container" -->
<form id="frm">
	<div class="content white_bg">
		<hr class="gap_m">
		<c:choose>
			<c:when test="${list ne null }">
				<table class="game_td thead_td cet_lay td_pd_l0">
					<thead>
						<tr>
							<th class="no_td">게임순서</th>
							<th>구분(종목)</th>
							<th class="i_btn_td"></th>
						</tr>
					</thead>
					<tbody id="trAppend">
					<c:set var="i" value="0" />
					<c:forEach items="${list}" var="list">
						<c:set var="i" value="${i+1}" />
						<tr id="abcd_${i}">
							<td class="no_td"><input type="text" class='no cet_lay'  name="no" id="no_${i}" value="${list.cs_k_num }"></td>
							<td class="ga_title"><input type="text" class='type'
								placeholder="구분(종목) 입력" id="type_${i}" name="type" value="${list.cs_k_nm }"></td>
							<td class="i_btn_td"><span id="ad_${i}" onclick="minus(this,${i})"
								class="i_btn i-minus"></span></td>
						</tr>
					</c:forEach>
						<tr id="abcd_${i+1}">
							<td class="no_td"><input type="text" class='no cet_lay'
								value="${i+1}" name="no" id="no_${i+1}"></td>
							<td class="ga_title"><input type="text" class='type'
								placeholder="구분(종목) 입력" id="type_${i+1}" name="type"></td>
							<td class="i_btn_td"><span id="ad_${i+1}" onclick="append(${i+1},this)"
								class="i_btn i-plus"></span></td>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<table class="game_td thead_td cet_lay td_pd_l0">
					<thead>
						<tr>
							<th class="no_td">게임순서</th>
							<th>구분(종목)</th>
							<th class="i_btn_td"></th>
						</tr>
					</thead>
					<tbody id="trAppend">
						<tr id="abcd_1">
							<td class="no_td"><input type="text" class='no cet_lay'
								value="1" name="no" id="no_1"></td>
							<td class="ga_title"><input type="text" class='type'
								placeholder="구분(종목) 입력" id="type_1" name="type"></td>
							<td class="i_btn_td"><span id="ad_1" onclick="append(1,this)"
								class="i_btn i-plus"></span></td>
						</tr>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- content end -->
	<!-- InstanceEndEditable -->
</form>
<!-- container end -->
<div id="ft_area">
	<!-- InstanceBeginEditable name="ft_area" -->
	<!-- InstanceEndEditable -->
</div>
<script>
	$(document).ready(function() {

	});
	var q = ${i+1}
	function append(i, t) {
		q++;
		t.className = "i_btn i-minus"
		$(t).attr("onclick", "minus(this," + (q - 1) + ")");
		$("#trAppend")
				.append(
						"<tr id='abcd_"
								+ (q)
								+ "'><td class='no_td'><input id='no_"+q+"' class='no cet_lay' name='no' type='number' value="+q+"></td><td class='ga_title'><input type='text' class='type' id ='type_"
								+ q
								+ "' name='type' placeholder='구분(종목) 입력'></td><td class='i_btn_td'><span id ='ad_"
								+ q
								+ "' onclick='append("
								+ q
								+ ",this)' class='i_btn i-plus'></span></td></tr>");
	}

	function minus(t, i) {
		$("#abcd_" + i).remove();
		var a = i;
		var b = $("#trAppend tr").length;
		for (var j = a; j <= b; j++) {
			$("#abcd_" + (j + 1)).attr("id", "abcd_" + j);
			$("#no_" + (j + 1)).attr("value", j);
			$("#no_" + (j + 1)).attr("id", "no_" + j);
			$("#type_" + (j + 1)).attr("id", "type_" + j);
			$("#ad_" + (j + 1)).attr("onclick", "minus(this," + j + ")")
			$("#ad_" + (j + 1)).attr("id", "ad_" + j);
		}
		$("#abcd_" + (b)).attr("id", "abcd_" + b);
		$("#no_" + (b)).attr("value", b);
		$("#no_" + (b)).attr("id", "no_" + b);
		$("#type_" + (b)).attr("id", "type_" + b);
		$("#ad_" + (b)).attr("onclick", "append(" + b + ",this)")
		$("#ad_" + (b)).attr("id", "ad_" + b);
		q--
	}

	function formSubmit() {
		var b = $("#trAppend tr").length;
		var no = "";
		var type = "";
		for (var i = 1; i < b + 1; i++) {
			if ($("#no_" + i).val() == "" || $("#no_" + i).val() == null) {
				swal("민턴in", "게임 순서를 입력해 주세요.");
				return false;
			}
			if ($("#type_" + i).val() == "" || $("#type_" + i).val() == null) {
				swal("민턴in", "종목을 입력해 주세요.");
				return false;
			}
			if (i == b) {
				no = no + $("#no_" + i).val();
				type = type + $("#type_" + i).val();
			} else {
				no = no + $("#no_" + i).val() + ",";
				type = type + $("#type_" + i).val() + ",";
			}
		}
		$.ajax({
			async : true,
			type : 'post',
			data : JSON.stringify({
				"cs_idx" : "${cs_idx}",
				"no" : no,
				"type" : type
			}),
			url : "/Game/selfMatchTypeInsert.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (data.cnt > 0) {
					location.href = "/Game/selfMatchWBInsertForm.techni" 
				} else {
					swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error) {
				swal("민턴in", "error : " + error);
			}
		})

	}
</script>