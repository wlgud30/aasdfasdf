<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%><html lang="ko">
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
<head>
<meta charset="utf-8" />
<title>민턴in</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/ct_css/print2.css?6" type="text/css" />
<style type="text/css" >
@page{
size: A5;
}
@font-face{font-family:'NanumBarunGothic'; src:url('/fonts/NanumBarunGothic.ttf')}

body{
   font-family: NanumBarunGothic;  
}
body,div,h1,h2,h3,h4,h5,h6,table,th,td{margin:0; padding:0;font-size: 25px;}
h1,h2,h3,h4,h5,h6{font-weight:300;line-height:1.4;color:#111;font-size: 15px;}
table {width: 100%;border-collapse: collapse;}

.cet_lay {text-align: center}
.th_mix{ border: 0.5pt solid black;border-top-width:0.5pt}
.th_mix td, .th_mix th{border:0.5pt solid black; padding: 4mm 3mm;white-space: nowrap;}
.th_mix thead th {padding: 3mm;background: #FAFAFA; font-weight:normal}

.nol_td td {padding: 10px 8px;}
.nol_td {white-space: nowrap;}

.td_1 {width: 5%; font-size: 80%; word-spacing: -5px; }.w10 {width: 5%; font-size: 80%; }.td_2 {width: 5%;font-size: 80%; word-spacing: -5px;}.td_3 {width: 5%;font-size: 80%;}

.tr_1{
height:90px;
}
</style>
</head>
<body>
   <div class="a5_sheet"> 
      <table class="nol_td">
         <tr style="height: 50px;">    
            <td style="font-size: 80%">NO.${gInfo.ct_num }</td>
            <td class="w10">${fn:substring(gInfo.ct_w_dat,0,5) }</td>
            <td class="td_1 cet_lay">${gInfo.ct_k_nm}</td>
            <td class="td_3">${gInfo.ct_kind } </td>
            <td class="td_2">${gInfo.ct_court} 코트</td>
            <td class="td_2">${gInfo.ct_order } 경기</td>
         </tr>
      </table>
      
      <table class="text_td cet_lay th_mix big_font" >
         <thead>
            <tr onclick="window.print()" style="height: 20px;" >
               <th style="width:26%">소속</th>
               <th style="width:40%">이름</th>
               <th style="width:18%">점수</th>
               <th style="width:18%">서명</th>
            </tr>
         </thead>
         <tr class="tr_1">
            <td><span class="club_name-long">${gInfo.team_a_nm }</span></td>
            <td class="title_ms">
               <span>${fn:replace(gInfo.a1_nm,"1","")}/${fn:replace(gInfo.a2_nm,"1","")}</span>   
            </td>
            <td>${gInfo.team_a_score }</td>
            <td></td>
         </tr>
         <tr class="tr_1">
            <td><span class="club_name-long">${gInfo.team_b_nm }</span></td>
            <td class="title_ms">
               <span>${fn:replace(gInfo.b1_nm,"1","")}/${fn:replace(gInfo.b2_nm,"1","")}</span>
            </td>
            <td>${gInfo.team_b_score }</td>
            <td></td>
         </tr>
      </table>
   </div>
</body>
</html>