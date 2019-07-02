<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul class="accordion_ul">
	<c:forEach items="${list}" var="list">
		<li onclick="rank('${list.ct_kind}','${list.ct_k_nm }','${list.ct_g_idx}')">
			<ul class="accd_head">
				<li>${list.ct_k_nm}</li>
			</ul> <!-- accd_a end-->
			<div class="accd_a pd_lrtb white_bg">
				<table class="game_td">
					<tbody id="${list.ct_g_idx }">
					</tbody>
				</table>
			</div>
		</li>
	</c:forEach>
</ul>
<script>
function rank2(kind, nm, group) {
	$.ajax({
				async : true,
				type : "post",
				data : JSON.stringify({
					"kind" : kind,
					"ct_k_nm" : nm,
					"ct_g_idx" : group
				}),
				url : "/Contest/ContestPDF2Rank.techni",
				datatype : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						swal("성공");
					} else {
						swal("민턴in", "아직 해당 종목이 전부 끝나지 않았습니다.")
					}
				},
				error : function(error) {
					swal("민턴in", "error : " + error);
				}
			})
}
	function rank(kind, nm, group) {
		$.ajax({
					async : true,
					type : "post",
					data : JSON.stringify({
						"kind" : kind,
						"ct_k_nm" : nm,
						"ct_g_idx" : group
					}),
					url : "/Contest/leagueRank2.techni",
					datatype : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if (data.cnt > 0) {
							var str = "";
							var i = 0;
							$
									.each(
											data.list,
											function(i) {
												str += "<tr><td class='no_td'>"
														+ (i + 1)
														+ "</td><td class='club_td'><span class='club_name'>"
														+ data.list[i].ct_t_nm
														+ "</span></td><td class='n3_rank'><span class='name3'>"
														+ data.list[i].a1_nm
														+ "</span></td><td class='n3_rank'><span class='name3'>"
														+ data.list[i].b1_nm
														+ "</span></td></tr>"
											})
							$("#" + group).empty();
							$("#" + group).append(str);
						} else {
							swal("민턴in", "아직 해당 종목이 전부 끝나지 않았습니다.")
						}
					},
					error : function(error) {
						swal("민턴in", "error : " + error);
					}
				})
	}
</script>