<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="location.href='/UClub/UClubAllList.techni'"><span>������
				Ŭ��</span></li>
		<li class="active_tab"
			onClick="location.href='/UClub/UClubSearch.techni'"><span>Ŭ��
				�˻�</span></li>
		<li onclick="location.href='/UClub/UClubWrite.techni'"><span>Ŭ��
				����</span></li>
	</ul>
</div>
<script>
	$(document).ready(function() {
		var aa = $(location).attr('pathname').slice(-8, -7);
		$('.tab_btn_b').navi_depth({
			pageNum : aa
		})
	});
</script>
<!-- tab_btn_b_area end -->
<div id="search_area" class="pd_lrtb">
	<div class="search_bar">
		<div class="search_input">
			<form method="post" id="frm">
				<input id='keyword' name='keyword' type="text"
					placeholder="Ŭ������ �˻��ϼ���." value="${keyword}">
			</form>
		</div>
		<div class="search_btn">
			<span id="btn_search" class="icon-magnifier btn_i i-text">�˻�</span> <span
				class="icon-location-pin btn_i i-text">����ġ</span>
		</div>
	</div>
	<!-- search_bar end -->
</div>
<form method="post" action="/Club/ClubDetail.techni" id="frm2">
	<input type="hidden" name="c_idx" id="c_idx">
</form>
<c:choose>
	<c:when test="${list == null || list.size()==0 }">
		<div class="content white_bg">
			<h4 class="title_m">Ŭ�� �˻�</h4>
			<ol>
				<li>�˻� ���� ã���ô� Ŭ������ �Է��մϴ�.</li>
				<li><span class="icon-search icon-f main_color"></span> <span
					class="main_color">�˻�</span> �������� Ŭ���մϴ�.</li>
			</ol>
			<hr class="line_div">
			<h4 class="title_m">���� ����</h4>
			<ol>
				<li>�������� �ֺ� Ŭ���� ã���÷��� <span
					class="icon-location-pin main_color"></span> <span
					class="main_color">����ġ</span> �������� Ŭ���մϴ�.
				</li>
				<li>�������� �˻��� Ŭ���� Ŭ���ϸ� �ּ� �� �󼼳����� Ȯ���� �� �ֽ��ϴ�.</li>
			</ol>
		</div>
	</c:when>
	<c:otherwise>
		<div class="content pt_00">
			<ul class="list_room white_bg">
				<c:forEach var="data" items="${list}">
					<li class="post1" value=${data.c_idx }>
						<div class="room_photo">
							<div class="photo_area"
								style="background-image: url(${data.c_photo})"></div>
						</div>
						<div class="room_data">
							<h4>${data.c_nm }</h4>
							<p class="el_date">
								<c:set var="location" value="${data.c_location}" />${data.c_location}</p>
						</div>
						<div class="btn_td">
							<span class="members"><i class="icon-user"></i>${data.cu_cnt}</span>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</c:otherwise>
</c:choose>
<div id="ft_area">
	<!-- InstanceBeginEditable name="ft_area" -->
	<!-- InstanceEndEditable -->
</div>
<script>
	$(document).ready(function() {
		$("#club").attr("class", "active_tab");
		var msg = "${msg}";
		if (msg == 1) {
			swal("����in", "�˻� ����� �����ϴ�.")
		}
		$(".post1").click(function() {
			var c_idx = $(this).attr("value");
			$("#c_idx").val(c_idx);
			$("#frm2").submit();
		});
	});

	$("#btn_search").click(function() {
		var keyword = $("#keyword").val();
		if (keyword == "" || null) {
			swal("����in", "�˻�� �Է����ּ���.");
		} else {
			$("#frm").attr("action", "/UClub/SearchList.techni").submit();
		}
	})
</script>