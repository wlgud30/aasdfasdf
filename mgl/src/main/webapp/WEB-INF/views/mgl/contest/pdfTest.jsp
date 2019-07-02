<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html lang="ko">
<head>
<meta charset="utf-8" />
<title>민턴in</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/ct_css/print.css" type="text/css" />
<style type="text/css">
@page{
size: A5;
}
@font-face{font-family:'NanumBarunGothic'; src:url('/fonts/NanumBarunGothic.ttf')}
body{
	font-family: NanumBarunGothic;
}
</style>
</head>
<body>
	<div class="a5_sheet">
		<table class="nol_td big_font">
			<tr>
				<td>NO.$num</td>
				<td class="w10">$time</td>
				<td class="td_1 cet_lay">$ct_k_nm</td>
				<td class="td_2">$court 코트</td>
				<td class="td_2">$game 경기</td>
			</tr>
		</table>
		<table class="text_td cet_lay th_mix big_font">
			<tr onclick="window.print()" style="height: 30px;">
				<th style="width:26%">소속</th>
				<th style="width:40%">이름</th>
				<th style="width:18%">점수</th>
				<th style="width:18%">서명</th>
			</tr>
			<tr class=".tr_1" style="height: 70px;">
				<td class=".tr_1">$ateam</td>
				<td class="title_ms">$a1/$a2</td>
				<td class=".tr_1"></td>
				<td class=".tr_1"></td>
			</tr>
			<tr class=".tr_1" style="height: 75px;">
				<td>$bteam</td>
				<td class="title_ms">$b1/$b2</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>
