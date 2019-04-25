<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function ctForm() {
		/* var queryString = $("#ctFrm").serialize();
		alert(queryString); */
		var form = $("form")[0];
		var formData = new FormData(form);

		$.ajax({
			type : "post",
			data : formData,
			url : "/Contest/ContestInsert.techni",
			dataType : "json",
			contentType : false,
			processData : false,
			success : function(data) {
				if (data.cnt > 0) {
					form.setAttribute("method", "POST");
					form
							.setAttribute("action",
									"/Contest/ContestDetail.techni");
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "ct_idx");
					hiddenField.setAttribute("value", data.ct_idx);
					form.appendChild(hiddenField);
					document.body.appendChild(form);
					form.submit();
				} else {
					swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
				}
			},
			error : function(error) {
				swal("민턴in", "error : " + error);
			}
		});
		/* $.ajax({
			type : 'post',
			data : FormData,
			url : "/Contest/ContestInsert.techni",
			dataType : "json",
			contentType: false,
		    processData: false, 
			success : function(data){
				if(data.cnt>0){
					alert(data);
				}else{
					alert(data)
				}
			},
			error : function(error){
				swal("민턴in","error : " + error);
			}
		}); */
	}
</script>
<form id="ctFrm" enctype="multipart/form-data" method="post">
	<div class="content white_bg">

		<table class="table_form">
			<tbody>
				<tr>
					<td><input type="text" id="ct_nm" name="ct_nm"
						placeholder="대회명칭"></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_homepage" name="ct_homepage"
						placeholder="홈페이지"></td>
				</tr>
				<tr>
					<td><p class="guide_text">대회</p> <input type="text"
						value="2017.06.09 (화)" id="ct_start" name="ct_start"
						class="date_pick"> <span class="date_icon_btn"
						onclick="location.href='#;'"></span> <span class="time_line_i"></span>
						<input type="text" value="2017.06.09 (화)" id="ct_end"
						name="ct_end" class="date_pick"> <span
						class="date_icon_btn" onclick="location.href='#;'"></span></td>
				</tr>
				<tr>
					<td><p class="guide_text">접수</p> <input type="text"
						value="2017.06.09 (화)" id="ct_startline" name="ct_startline"
						class="date_pick"> <span class="date_icon_btn"
						onclick="location.href='#;'"></span> <span class="time_line_i"></span>
						<input type="text" value="2017.06.09 (토)" id="ct_deadline"
						name="ct_deadline" class="date_pick"> <span
						class="date_icon_btn" onclick="location.href='#;'"></span></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_location" name="ct_location"
						placeholder="대회장소 (체육관)"></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_host" name="ct_host"
						placeholder="주최"></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_supervision"
						name="ct_supervision" placeholder="주관"></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_support" name="ct_support"
						placeholder="협찬"></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_sponsor" name="ct_sponsor"
						placeholder="후원"></td>
					<td><input type="hidden" id="ct_point" name="ct_point"
						value="15"></td>
					<td><input type="hidden" id="ct_time" name="ct_time"
						value="25"></td>
					<td><input type="hidden" id="ct_court" name="ct_court"
						value="8"></td>
				</tr>
				<tr>
					<td><div class="filebox col-inputside">
							<div>
								<input class="upload-name" value="요강" id="ct_points"
									name="ct_points" disabled="disabled"> <input
									type="file" id="filename" name="filename" class="upload-hidden">
							</div>
							<div class="side_data">
								<label for="filename" class="btn_st">첨부</label>
							</div>
						</div> <!-- filebox end--></td>
				</tr>
				<tr>
					<td><input type="text" id="ct_inquiry" name="ct_inquiry"
						placeholder="문의처 (전화 or 이메일)"></td>
				</tr>
				<!-- <tr>
					<td><p class="guide_text">선택사항</p>
						<ul class="list_check li_lot">
							<li><input type="checkbox" class="li_check" id="check_1">
								<label for="check_1">홍보요청</label></li>
							<li><input type="checkbox" class="li_check" id="check_2">
								<label for="check_2">출전자 접수</label></li>
							<li><input type="checkbox" class="li_check" id="check_3">
								<label for="check_3">출전비 접수</label></li>
							<li><input type="checkbox" class="li_check" id="check_4">
								<label for="check_4">대진표 요청</label></li>
							<li><input type="checkbox" class="li_check" id="check_5">
								<label for="check_5">대회진행</label></li>
							<li><input type="checkbox" class="li_check" id="check_6">
								<label for="check_6">심판요청</label></li>
						</ul></td>
				</tr> -->
			</tbody>
		</table>
	</div>
	<!-- content end -->
	<div class="cat_area">
		<h4 class="title_m">종목설정</h4>
	</div>
	<div class="content white_bg">
		<table class="table_form">
			<tbody>
				<tr>
					<td><span class="guide_text">연령</span>
						<ul class="list_check li_lot">
							<li><input type="checkbox" class="li_check" name="age"
								id="age_1" value="20"> <label for="age_1">20대</label></li>
							<!-- <li><input type="checkbox" class="li_check" name="age"
								id="age_2" value="25"> <label for="age_2">25대</label></li> -->
							<li><input type="checkbox" class="li_check" name="age"
								id="age_3" value="30"> <label for="age_3">30대</label></li>
							<!-- <li><input type="checkbox" class="li_check" name="age"
								id="age_4" value="35"> <label for="age_4">35대</label></li> -->
							<li><input type="checkbox" class="li_check" name="age"
								id="age_5" value="40"> <label for="age_5">40대</label></li>
							<!-- <li><input type="checkbox" class="li_check" name="age"
								id="age_6" value="45"> <label for="age_6">45대</label></li> -->
							<li><input type="checkbox" class="li_check" name="age"
								id="age_7" value="50"> <label for="age_7">50대</label></li>
							<!-- <li><input type="checkbox" class="li_check" name="age"
								id="age_8" value="55"> <label for="age_8">55대</label></li> -->
							<li><input type="checkbox" class="li_check" name="age"
								id="age_9" value="60"> <label for="age_9">60대</label></li>
							<!-- <li><input type="checkbox" class="li_check" name="age"
								id="age_10" value="65"> <label for="age_10">65대</label>
							</li> -->
							<li><input type="checkbox" class="li_check" name="age"
								id="age_11" value="70"> <label for="age_11">70대</label>
							</li>
							<!-- <li><input type="checkbox" class="li_check" name="age"
								id="age_12" value="75"> <label for="age_12">75대</label>
							</li> -->
						</ul></td>
				</tr>
				<tr>
					<td><span class="guide_text">구분</span>
						<ul class="list_check li_lot">
							<li><input type="checkbox" class="li_check" name="ctk_kind"
								id="sort_1" value="혼복"> <label for="sort_1">혼복</label></li>
							<li><input type="checkbox" class="li_check" name="ctk_kind"
								id="sort_2" value="여복"> <label for="sort_2">여복</label></li>
							<li><input type="checkbox" class="li_check" name="ctk_kind"
								id="sort_3" value="남복"> <label for="sort_3">남복</label></li>
						</ul></td>
				</tr>
				<tr>
					<td><span class="guide_text">급수</span>
						<ul class="list_check li_lot">
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_1" value="자강"> <label for="grade_1">자강</label>
							</li>
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_2" value="A"> <label for="grade_2">A</label></li>
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_3" value="B"> <label for="grade_3">B</label></li>
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_4" value="C"> <label for="grade_4">C</label></li>
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_5" value="D"> <label for="grade_5">D</label></li>
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_6" value="초심"> <label for="grade_6">초심</label>
							</li>
							<li><input type="checkbox" class="li_check" name="guide"
								id="grade_7" value="왕초"> <label for="grade_7">왕초</label>
							</li>
						</ul></td>
				</tr>

			</tbody>

		</table>
		<span id="button1" onclick="ctForm();">버튼1</span>
	</div>
</form>