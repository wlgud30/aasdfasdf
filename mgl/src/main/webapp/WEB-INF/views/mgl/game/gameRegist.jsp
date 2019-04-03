<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd ");
	Calendar cal = Calendar.getInstance();
	String Today = dateFormat.format(cal.getTime());
%>
<script type="text/javascript">
		var guestN = ["0","1","2"];
		var guestY = new Array();
    	var gnum = "";
		var guest_c = 0;
		var ach=0, bch = 0;
		var a1 = 0 ,a2 = 0 , b1 = 0, b2 = 0;
		
		function divDisplay(){
			var a = 0;
			$("#s li").each(function(){
				if($(this).is(":hidden")){
					a++;
				}
			});
			if(a==$("#s li").length){
				$("#v_all").attr("style","display:none");
			}
		}
		
		function divNone(){
			if($("#v_all").is(":hidden")){
				$("#v_all").attr("style","display:''");
				
			}
		}
		
		function teamA(id,nm,photo,gd,age,push){
			
			if(a1 == 1  && a2 == 1){
				swal("민턴in","A팀은 더이상 선택할 수 없습니다,");
				return;
			}
			
			if(a1 == 0){
				a1 = 1;
				$("#a1_nm").text(nm)
				$("#a1_photo").attr("style","background-image: url("+photo+")");
				$("#a1_age_gd").text("("+age+"-"+gd+")");
				$("#a1").val(id);
				$("#pa1").val(push);
				$("#a1_bar").attr("style","display:''");
				ach++
			}else{
				a2=1;
				$("#a2_nm").text(nm)
				$("#a2_photo").attr("style","background-image: url("+photo+")");
				$("#a2_age_gd").text("("+age+"-"+gd+")");
				$("#a2").val(id);
				$("#pa2").val(push);
				$("#a2_bar").attr("style","display:''");
				ach++
			}
			
			$(event.target).closest('li').hide();
			
			divDisplay();
		}
		
		function teamB(id,nm,photo,gd,age,push){
			
			if(b1 == 1  && b2 == 1 ){
				swal("민턴in","B팀은 더이상 선택할 수 없습니다,");
				return;
			}
			
			if(b1 == 0){
				b1 = 1;
				$("#b1_nm").text(nm)
				$("#b1_photo").attr("style","background-image: url("+photo+")");
				$("#b1_age_gd").text("("+age+"- "+gd+")");
				$("#b1").val(id)
				$("#pb1").val(push);
				$("#b1_bar").attr("style","display:''");
				bch++
			}else{
				b2=1;
				$("#b2_nm").text(nm)
				$("#b2_photo").attr("style","background-image: url("+photo+")");
				$("#b2_age_gd").text("("+age+"-"+gd+")");
				$("#b2").val(id)
				$("#pb2").val(push);
				$("#b2_bar").attr("style","display:''");
				bch++
			}
			
			$(event.target).closest('li').hide();
			
			divDisplay();
		}
		
		function vacate(team){
			var team_id = $("#"+team).val();
			var team_nm = $("#"+team+"_nm").text();
			if(team_nm=="게스트"){
				guest_c--;
				guestN.push($("#"+team).val().substr(6));
			}
			
			$("#"+team_id).show();
			$("#"+team+"_nm").text("");
			$("#"+team+"_photo").attr("style","");
			$("#"+team+"_age_gd").text("");
			$("#"+team).val("");
			$("#p"+team).val("");
			
			if(team=="a1"){
				a1 = 0;
				ach--
				$("#a1_").attr("class","photo_name popwin_btn1")
			}else if(team=="a2"){
				a2 = 0;
				ach--
				$("#a2_").attr("class","photo_name popwin_btn1")
			}else if(team =="b1"){
				b1 = 0;
				bch--
				$("#b1_").attr("class","photo_name popwin_btn1")
			}else{
				b2 = 0;
				bch--
				$("#b2_").attr("class","photo_name popwin_btn1")
			}
			
			divNone();
		}
		
		function changeTeamB(team){
			var b1_nm = $("#b1_nm").text();
			var b2_nm = $("#b2_nm").text();
			
			var bg = $("#"+team+"_photo").css('background-image');
			var cleanup = /\"|\'|\)/g;
			
			bg = bg.split('/').pop().replace(cleanup, '');
			var team_id = $("#"+team).val();
			var team_push=$("#p"+team).val();
			var team_nm = $("#"+team+"_nm").text();
			var age_gd = $("#"+team+"_age_gd").text();
			
			if(team_nm == "" || team_nm == null){
				return;
			}
			var n = team.includes("1")
			
			if(b1==1&&b2==1){
			swal("민턴in","누구와 팀을 바꾸시겠습니까?", {
				  buttons: {
				    b1_nm : {
				    	text : b1_nm,
				    	value : b1_nm,
				    },
				    b2_nm : {
				    	text : b2_nm,
				    	value : b2_nm,
				    },
				    cancel: "cancel",
				  },
				})
				.then((value) => {
				  switch (value) {
				 
				    case b1_nm:
				    	var b1_bg = $("#b1_photo").css('background-image');
						b1_bg = b1_bg.split('/').pop().replace(cleanup, '');
				    	$("#"+team+"_nm").text($("#b1_nm").text());
						$("#"+team+"_photo").attr("style","background-image: url(/resources/img/"+b1_bg+")");
						$("#"+team+"_age_gd").text($("#b1_age_gd").text());
						$("#"+team).val($("#b1").val());
						$("#p"+team).val($("#pb1").val());
						$("#b1_nm").text(team_nm)
						$("#b1_photo").attr("style","background-image: url(/resources/img/"+bg+")");
						$("#b1_age_gd").text(age_gd)
						$("#b1").val(team_id)
						$("#pb1").val(team_push);
				      break;
				 
				    case b2_nm:
				    	var b2_bg = $("#b2_photo").css('background-image');
						b2_bg = b2_bg.split('/').pop().replace(cleanup, '');
						
				    	$("#"+team+"_nm").text($("#b2_nm").text());
						$("#"+team+"_photo").attr("style","background-image: url(/resources/img/"+b2_bg+")");
						$("#"+team+"_age_gd").text($("#b2_age_gd").text());
						$("#"+team).val($("#b2").val());
						$("#p"+team).val($("#pb2").val());
						$("#b2_nm").text(team_nm)
						$("#b2_photo").attr("style","background-image: url(/resources/img/"+bg+")");
						$("#b2_age_gd").text(age_gd)
						$("#b2").val(team_id)
						$("#pb2").val(team_push);
				      break;
				 
				  }
				});
		}else if(b1 == 0){
			var b1_bg = $("#b1_photo").css('background-image');
			b1_bg = b1_bg.split('/').pop().replace(cleanup, '');
			
	    	$("#"+team+"_nm").text("");
			$("#"+team+"_photo").attr("style","");
			$("#"+team+"_age_gd").text("");
			$("#"+team).val("");
			$("#p"+team).val("");
			$("#b1_nm").text(team_nm)
			$("#b1_photo").attr("style","background-image: url(/resources/img/"+bg+")");
			$("#b1_age_gd").text(age_gd)
			$("#b1").val(team_id)
			$("#pb1").val(team_push);
			b1 = 1;
			alert(n);
			if(n){
				a1=0;
			}else{
				a2=0;
			}
		}else if (b2==0){
			var b2_bg = $("#b2_photo").css('background-image');
			b2_bg = b2_bg.split('/').pop().replace(cleanup, '');
			
	    	$("#"+team+"_nm").text("");
			$("#"+team+"_photo").attr("style","");
			$("#"+team+"_age_gd").text("");
			$("#"+team).val("");
			$("#p"+team).val("");
			$("#b2_nm").text(team_nm)
			$("#b2_photo").attr("style","background-image: url(/resources/img/"+bg+")");
			$("#b2_age_gd").text(age_gd)
			$("#b2").val(team_id)
			$("#pb2").val(team_push);
			b2 =1;
			if(n){
				a1=0;
			}else{
				a2=0;
			}
		}
			
		}
		
		function changeTeamA(team){
			var a1_nm = $("#a1_nm").text();
			var a2_nm = $("#a2_nm").text();
			
			var bg = $("#"+team+"_photo").css('background-image');
			var cleanup = /\"|\'|\)/g;
			
			bg = bg.split('/').pop().replace(cleanup, '');
			var team_id = $("#"+team).val();
			var team_push = $("#p"+team).val();
			var team_nm = $("#"+team+"_nm").text();
			var age_gd = $("#"+team+"_age_gd").text();
			
			if(team_nm == "" || team_nm == null){
				return;
			}
			
			var n = team.includes("1")
			
			if(a1==1&&a2==1){
			swal("민턴in","누구와 팀을 바꾸시겠습니까?", {
				  buttons: {
				    a1_nm : {
				    	text : a1_nm,
				    	value : a1_nm,
				    },
				    a2_nm : {
				    	text : a2_nm,
				    	value : a2_nm,
				    },
				    cancel: "cancel",
				  },
				})
				.then((value) => {
				  switch (value) {
				    case a1_nm:
				    	var a1_bg = $("#a1_photo").css('background-image');
						a1_bg = a1_bg.split('/').pop().replace(cleanup, '');
						
				    	$("#"+team+"_nm").text($("#a1_nm").text());
						$("#"+team+"_photo").attr("style","background-image: url(/resources/img/"+a1_bg+")");
						$("#"+team+"_age_gd").text($("#a1_age_gd").text());
						$("#"+team).val($("#a1").val());
						$("#p"+team).val($("#pa1").val());
						$("#a1_nm").text(team_nm)
						$("#a1_photo").attr("style","background-image: url(/resources/img/"+bg+")");
						$("#a1_age_gd").text(age_gd)
						$("#a1").val(team_id)
						$("#pa1").val(team_push);
				      break;
				 
				    case a2_nm:
				    	var a2_bg = $("#a2_photo").css('background-image');
						a2_bg = a2_bg.split('/').pop().replace(cleanup, '');
						
				    	$("#"+team+"_nm").text($("#a2_nm").text());
						$("#"+team+"_photo").attr("style","background-image: url(/resources/img/"+a2_bg+")");
						$("#"+team+"_age_gd").text($("#a2_age_gd").text());
						$("#"+team).val($("#a2").val());
						$("#p"+team).val($("#pa2").val());
						$("#a2_nm").text(team_nm)
						$("#a2_photo").attr("style","background-image: url(/resources/img/"+bg+")");
						$("#a2_age_gd").text(age_gd)
						$("#a2").val(team_id)
						$("#pa2").val(team_push)
				      break;
				 
				  }
				});
			}else if(a1 == 0){
				var a1_bg = $("#a1_photo").css('background-image');
				a1_bg = a1_bg.split('/').pop().replace(cleanup, '');
				
		    	$("#"+team+"_nm").text("");
				$("#"+team+"_photo").attr("style","");
				$("#"+team+"_age_gd").text("");
				$("#"+team).val("");
				$("#p"+team).val("");
				$("#a1_nm").text(team_nm)
				$("#a1_photo").attr("style","background-image: url(/resources/img/"+bg+")");
				$("#a1_age_gd").text(age_gd)
				$("#a1").val(team_id)
				$("#pa1").val(team_push);
				a1 = 1;
				alert(n);
				if(n){
					b1=0;
				}else{
					b2=0;
				}
				alert(b1);
			}else{
				var a2_bg = $("#a2_photo").css('background-image');
				a2_bg = a2_bg.split('/').pop().replace(cleanup, '');
				
		    	$("#"+team+"_nm").text("");
				$("#"+team+"_photo").attr("style","");
				$("#"+team+"_age_gd").text("");
				$("#"+team).val("");
				$("#p"+team).val("");
				$("#a2_nm").text(team_nm)
				$("#a2_photo").attr("style","background-image: url(/resources/img/"+bg+")");
				$("#a2_age_gd").text(age_gd)
				$("#a2").val(team_id)
				$("#pa2").val(team_push);
				a2 =1;
				if(n){
					b1=0;
				}else{
					b2=0;
				}
			}
		}
		
		/* function teamMake(t, id, nm){
			if(t == 'A'){
				if(ach >= 2  || a.lenght >= 2){
					alert("A팀은 더이상 선택할 수 없습니다.");
					return;
				} else if( ach == 0 || a.lenght == 0){
					$("#Ateam").empty();					
				}
				var aStr = "";
				a[ach] = id;
				ach++;
				aStr = "<li><input type='hidden' value="+id+"/><div class='photo_name'><div class='thum_area'><div class='thum' style='background-image: url(/resources/img/member_photo_01.jpg);'></div></div>";
				aStr += "<div class=text_area'><span class='name3'> " + nm + " </span></div></div><div class='circle_i_area'>";
				aStr += "<i class='dark_circle_i bteam_icon' onclick='location.href='#;'' title='Bteam move'></i>";
				aStr += "<i class='light_circle_i guest_icon' onclick='location.href='#;'' title='guest'></i>";
				aStr += "<i class='light_circle_i delete_icon' onclick='location.href='#;'' title='delete'></i></div></li>";
			
				$("#Ateam").append(aStr);
				
				$(event.target).closest('li').hide();
			}else{
				if(bch >= 2 || b.length >= 2){
					alert("B팀은 더이상 선택할 수 없습니다.");
					return;
				} else if(bch == 0 || b.lenght == 0){
					$("#Bteam").empty();
				}
				var bStr = "";
				b[bch] = id;
				bch++;
				
				bStr = "<li><div class='photo_name'><div class='thum_area'><div class='thum' style='background-image: url(/resources/img/member_photo_01.jpg);'></div></div>";
				bStr += "<div class=text_area'><span class='name3'> " + nm + " </span></div></div><div class='circle_i_area'>";
				bStr += "<i class='dark_circle_i ateam_icon' onclick='location.href='#;'' title='Ateam move'></i>";
				bStr += "<i class='light_circle_i guest_icon' onclick='location.href='#;'' title='guest'></i>";
				bStr += "<i class='light_circle_i delete_icon' onclick='location.href='#;'' title='delete'></i></div></li>";
				$("#Bteam").append(bStr);
				
				$(event.target).closest('li').hide();
			}	
		} */
		function guest(team){
			
				if(team == "a1"){
					if(a1 == 1){
						swal("민턴in","자리를 비워주세요.")
						return;
					}
				}else if(team == "a2"){
					if(a2 == 1){
						swal("민턴in","자리를 비워주세요.")
						return;
					}
				}else if(team =="b1"){
					if(b1 == 1){
						swal("민턴in","자리를 비워주세요.")
						return;
					}
				}else{
					if(b2 == 1){
						swal("민턴in","자리를 비워주세요.")
						return;
					}
				}
				if(guest_c<3){
			swal("민턴in","게스트의 성별을 선택해 주세요.", {
				  buttons: {
				    "남자": {
				      text: "남자",
				      value: "M",
				    },
				    "여자": {
				      text: "여자",
				      value: "F",
					},
				    cancel: "cancel",
				  },
				})
				.then((value) => {
				  switch (value) {
				 
				    case "M":
				    	$("#"+team+"_nm").text("게스트")
				    	$("#"+team+"_photo").attr("style","background-image: url(/resources/img/man_face.svg)");
				    	$("#"+team).val("guestM"+guestN[0])
				    	guestN.shift();
				    	 if(team == "a1"){
							  a1=1;
							  ach++
						  }else if(team=="a2"){
							 a2=1;
							 ach++
						  }else if(team=="b1"){
							 b1=1;
							 bch++
						  }else{
							  b2=1;
							  bch++
						  }
				    	 guest_c++;
				    	break;
				 
				    case "F":
				    	$("#"+team+"_nm").text("게스트")
				    	$("#"+team+"_photo").attr("style","background-image: url(/resources/img/woman_face.svg)");
				    	$("#"+team).val("guestF"+guestN[0])
				    	guestN.shift();
				    	if(team == "a1"){
							  a1=1;
							  ach++
						  }else if(team=="a2"){
							 a2=1;
							 ach++
						  }else if(team=="b1"){
							 b1=1;
							 bch++
						  }else{
							  b2=1;
							  bch++
						  }
				    	guest_c++;
				    	break;
				 
				  }
				 
				});
			}else{
				swal("민턴in","게스트는 최대 3명까지 가능합니다.");
			}
		}
		
		function onSubmit(){
			var p = $("#pa1").val()
			var n = $("#a1_nm").text()
			var al, bl;
			if(ach == 2 && bch == 2){
				swal({
					title : "민턴in",
					text : "게임을 등록하시겠습니까?",
					buttons : true
				})
				.then((value) =>{
					if(value){
						$.ajax({
							async : true,
							type : 'post',
							data : JSON.stringify({"cm_a1_id" : $("#a1").val(),"cm_a2_id" : $("#a2").val(), "cm_b1_id" : $("#b1").val(),"cm_b2_id" : $("#b2").val()}),
							url : "/Game/GameInsert.techni",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								if(data.cnt>0){
									if($("#a1_nm").text() != "게스트"){
										pushTok(p,n+"님 게임에 등록되었습니다.","http://mgl.techni.co.kr:8081/Member/HandlerIndex.techni?c_idx=${list[0].c_idx}");
									}if($("#a2_nm").text() != "게스트"){
										pushTok($("#pa2").val(),$("#a2_nm").text()+"님 게임에 등록되었습니다.","http://mgl.techni.co.kr:8081/Member/HandlerIndex.techni?c_idx=${list[0].c_idx}");
									}if($("#b1_nm").text() != "게스트"){
										pushTok($("#pb1").val(),$("#b1_nm").text()+"님 게임에 등록되었습니다.","http://mgl.techni.co.kr:8081/Member/HandlerIndex.techni?c_idx=${list[0].c_idx}");
									}if($("#b2_nm").text() != "게스트"){
										pushTok($("#pb2").val(),$("#b2_nm").text()+"님 게임에 등록되었습니다.","http://mgl.techni.co.kr:8081/Member/HandlerIndex.techni?c_idx=${list[0].c_idx}");
									}											
											location.href = "/Game/GameState.techni"
										}else{
											swal("민턴in","죄송합니다. 다시 시도해 주세요.")
										}
										
									},
					error : function(error){
						swal("민턴in","error : " + error);
					}			
					})
				}
				});
				
			}else{
				swal("민턴in","게임 등록은 각팀당 두명씩 선택 후 가능합니다.");
				return;
			}
		}
		function attend(){
			$.ajax({
				type:"POST",
				url:"/UClub/AttendInsert.techni",
				success:function(data){
					if(data.cnt > 0 ){
						location.href="/UClub/AttendList.techni"
					}else{
						swal("민턴in", "이미 출석된 회원입니다.");
					}
				},
				error : function(error){
					swal("민턴in","error : " + error);
				}
			});
		}

		function attendOut(){
			$.ajax({
				type:"POST",
				url:"/UClub/attendOut.techni",
				success:function(data){
					if(data.cnt > 0 ){
						location.href="/UClub/AttendList.techni"
					}else{
						swal("민턴in", "이미 퇴실 상태입니다.");
					}
				},
				error : function(error){
					swal("민턴in","error : " + error);
				}
			});
		}
		function allShow(){
			$(".v_all").attr("style","display:''");
			$("#v_all").attr("style","display:''");
			$("input[type=checkbox]").prop("checked",false);
			$("#st").text("");
			checkV();
		}
		function checkV(){
			var s_test = "";
			var gd_test = "";
			var age_test = "";
			var la = " : ";
			$("#v_all").attr("style","display:''");
			$(".v_all").attr("style","display:none");
			$(".li_check:checked").each(function() {
				la += $("label[for="+this.id+"]").text()+",";
				if($(this).val() == "M" || $(this).val()=="F" &&s_test.length==0){
					s_test += "."+$(this).val();
				}else if(s_test.length !=0 && $(this).val() == "M" || $(this).val()=="F"){
					s_test += ",."+$(this).val()
				}else if(isNaN($(this).val()) && gd_test.length==0 && $(this).val() != "M" && $(this).val() != "F" ) {
					gd_test += "."+$(this).val()
				}else if(isNaN($(this).val()) && gd_test.length!=0 && $(this).val() != "M" && $(this).val() != "F" ){
				  	gd_test += ",."+$(this).val();
				}else if(!isNaN($(this).val()) && age_test ==0){
					age_test +="."+$(this).val();
				}else if(!isNaN($(this).val()) && age_test !=0){
					age_test += ",."+$(this).val();
				}
				})
			$(".v_all").attr("style","display:''");
			if(s_test != ""){
				$("#s").find("li").not(s_test).attr("style","display:none");
			}
			if(gd_test != ""){
				$("#s").find("li").not(gd_test).attr("style","display:none");
			}
			if(age_test !=""){
				$("#s").find("li").not(age_test).attr("style","display:none");
			}
			$("#st").text(la.substring(0,la.length-1))
			
			$("#s li").each(function(){
				if($(this).attr("id")==$("#a1").val()){
					$(this).css("display","none");
				}else if($(this).attr("id")==$("#a2").val()){
					$(this).css("display","none");
				}else if($(this).attr("id")==$("#b1").val()){
					$(this).css("display","none");
				}else if($(this).attr("id")==$("#b2").val()){
					$(this).css("display","none");
				}
			})
			
			var a = 0;
			$("#s li").each(function(){
				if($(this).is(":hidden")){
					a++;
				}
			});
			if(a==$("#s li").length){
				$("#v_all").attr("style","display:none");
			}
		}
		function guestInsert(){
			var g_id = $("#g_id").val();
			var g_sex = $('input[name="choice"]:checked').val();
			var g_age = $("#g_age").val();
			var g_gd = $("#g_gd").val();
			
			var today = new Date();
			
			var yyyy = today.getFullYear();
			
			g_age = yyyy-g_age;
			if(g_id == null || g_id ==""){
				swal("민턴in","이름을 입력해주세요.")
			}else if(g_sex == null || g_sex ==""){
				swal("민턴in","성별을 입력해주세요.")
			}else if(g_age == null || g_age ==""){
				swal("민턴in","연령대를 입력해주세요.")
			}else if(g_gd == null || g_gd ==""){
				swal("민턴in","급수를 입력해주세요.")
			}else{
				$.ajax({
					async : true,
					type:"post",
					datatype : 'json',
					url : "/Member/GuestInsert.techni",
					data : JSON.stringify({"g_id" : g_id, "g_sex" : g_sex , "g_age" : g_age+"", "g_gd" : g_gd}),
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							location.href="/UClub/GameOKList.techni"
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
					},
					error : function(error){
						swal("민턴in","error : "+error);
					}
				}); 
			}
		}
</script>
<%-- <header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="민턴in" class="logo"
						onclick="location.href='/UClub/UClubAllList.techni'">
				</div>
				<div class="tit_top">
					<h1>
						<a href='/Board/BoardList.techni'>${list[0].c_nm }</a>
					</h1>
				</div>
				<div class="bt_top"></div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header> --%>
<!-- InstanceBeginEditable name="container" -->
<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-8, -7);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					})
				});
			</script>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li class="active_tab"><span
			onClick="location.href='/UClub/GamePrivateStateInfo.techni'">게임짜기</span></li>
		<li><span onClick="location.href='/Game/GameState.techni'">진행게임</span>
		<li><span onClick="location.href='/Game/EndGame.techni '">끝난게임</span></li>
	</ul>
</div>
<div class="tab_bt_area white_bg">
	<div>
		<ul class="tabs_cont">
			<li><span
				onClick="location.href='/UClub/GamePrivateStateInfo.techni'">개인리그</span>
			</li>
			<li><span
				onClick="location.href='/UClub/GameTeamStateInfo.techni'">팀리그</span>
			</li>
			<li class="active_tab"><span
				onClick="location.href='/UClub/GameOKList.techni'">한 게임</span></li>
		</ul>
	</div>
</div>
<div class="content white_bg">
	<form action="/Game/GameRegistProc.techni" id="frm" method='post'>
		<input type="hidden" id="a1" name="cm_a1_id" value="" /> <input
			type="hidden" id="a2" name="cm_a2_id" value="" /> <input
			type="hidden" id="b1" name="cm_b1_id" value="" /> <input
			type="hidden" id="b2" name="cm_b2_id" value="" /> <input
			type="hidden" id="pa1" value="" /> <input type="hidden" id="pa2"
			value="" /> <input type="hidden" id="pb1" value="" /> <input
			type="hidden" id="pb2" value="" /> <input type="hidden" id="date"
			name="date" value="<%=Today%>" />
		<table class="game_td box_td">
			<tr>
				<td class="td_tie">A팀</td>
				<td>
					<ul class="col_21 stand_li" id="Ateam">
						<li class="a1"><input type="hidden" id="a1_id">
							<div class="photo_name popwin_btn1" onclick="ctest('a1')" id="a1_">
								<div class="thum_area">
									<div id="a1_photo" class="thum"></div>
								</div>
								<div class="text_area">
									<span id="a1_nm" class="name3"></span> <span id="a1_age_gd"
										class="age_rank"></span>
								</div>
							</div>
							<div id="a1_bar" class="circle_i_area">
								<i class="dark_circle_i bteam_icon" onclick="changeTeamB('a1')"
									title="Bteam move"></i> <i class="light_circle_i delete_icon"
									onclick="vacate('a1')" title="delete"></i>
							</div></li>
						<li class="a2"><input type="hidden" id="a2_id">
							<div class="photo_name popwin_btn1" onclick="ctest('a2')" id="a2_">
								<div class="thum_area">
									<div id="a2_photo" class="thum"></div>
								</div>
								<div class="text_area">
									<span id="a2_nm" class="name3"></span> <span id="a2_age_gd"
										class="age_rank"></span>
								</div>
							</div>
							<div id="a2_bar" class="circle_i_area">
								<i class="dark_circle_i bteam_icon" onclick="changeTeamB('a2')"
									title="Bteam move"></i> <i class="light_circle_i delete_icon"
									onclick="vacate('a2')" title="delete"></i>
							</div></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="td_tie">B 팀</td>
				<td>
					<ul class="col_21 stand_li" id="Bteam">
						<li class="b1"><input type="hidden" id="b1_id">
							<div class="photo_name popwin_btn1" onclick="ctest('b1')" id="b1_">
								<div class="thum_area">
									<div id="b1_photo" class="thum"></div>
								</div>
								<div class="text_area">
									<span id="b1_nm" class="name3"></span> <span id="b1_age_gd"
										class="age_rank"></span>
								</div>
							</div>
							<div id="b1_bar" class="circle_i_area">
								<i class="dark_circle_i ateam_icon" onclick="changeTeamA('b1')"
									title="Ateam move"></i> <i class="light_circle_i delete_icon"
									onclick="vacate('b1')" title="delete"></i>
							</div></li>
						<li class="b2"><input type="hidden" id="a2_id">
							<div class="photo_name popwin_btn1" onclick="ctest('b2')" id="b2_">
								<div class="thum_area">
									<div id="b2_photo" class="thum"></div>
								</div>
								<div class="text_area">
									<span id="b2_nm" class="name3"></span> <span id="b2_age_gd"
										class="age_rank"></span>
								</div>
							</div>
							<div id="b2_bar" class="circle_i_area">
								<i class="dark_circle_i ateam_icon" onclick="changeTeamA('b2')"
									title="Ateam move"></i> <i class="light_circle_i delete_icon"
									onclick="vacate('b2')" title="delete"></i>
							</div></li>
					</ul>
				</td>
			</tr>
		</table>
		<div class="td_st td4 btn_full">
			<div>
				<span class="btn_st btn_colorg popwin_btn2"
					onclick="location.href='#;'">게스트 등록</span>
			</div>
			<div class="bin_space"></div>
			<div class="bin_space"></div>
			<div>
				<span class="btn_st" onClick="onSubmit()">게임등록</span>
			</div>
		</div>
	</form>
</div>
<!-- content end -->
<c:if test="${list2[0].u_nm ne null}">
	<div class="content white_bg acd_area">
		<div class="acd-head">
			<h4 class="title_s">
				<b>출전선수 구분</b><b id="st"></b>
			</h4>
		</div>
		<!-- acd-head end-->
		<div class="acd-cont">
			<ul class="list_check">
				<li><input type="radio" class="check_circle" id="check_all"
					name="option_add" checked="checked" onclick="allShow()"> <label
					for="check_all">전체</label></li>
				<li><input type="radio" class="check_circle" id="check_detail"
					name="option_add"> <label for="check_detail">상세</label></li>
			</ul>
			<div class="check_ul_area">
				<table class="table_form line_no" id="ckTable">
					<tr>
						<td class="td_ti"><b>성별</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="check_man"
									onclick="checkV()" value="M"> <label for="check_man">남</label></li>
								<li><input type="checkbox" class="li_check"
									id="check_woman" onclick="checkV()" value="F"> <label
									for="check_woman">여</label></li>
							</ul></td>
					</tr>
					<tr>
						<td class="td_ti"><b>급수</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="check_1_1"
									value="자강" onclick="checkV()"> <label for="check_1_1">자강</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_2"
									value="A" onclick="checkV()"> <label for="check_1_2">A</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_3"
									value="B" onclick="checkV()"> <label for="check_1_3">B</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_4"
									value="C" onclick="checkV()"> <label for="check_1_4">C</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_5"
									value="D" onclick="checkV()"> <label for="check_1_5">D</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_6"
									value="초심" onclick="checkV()"> <label for="check_1_6">초심</label></li>
								<li><input type="checkbox" class="li_check" id="check_1_7"
									value="왕초" onclick="checkV()"> <label for="check_1_7">왕초</label></li>
							</ul></td>
					</tr>
					<tr>
						<td class="td_ti"><b>나이</b></td>
						<td><ul class="list_check li_lot">
								<li><input type="checkbox" class="li_check" id="check_10"
									value="10" onclick="checkV()"> <label for="check_10">10대</label></li>
								<li><input type="checkbox" class="li_check" id="check_20"
									value="20" onclick="checkV()"> <label for="check_20">20대</label></li>
								<li><input type="checkbox" class="li_check" id="check_30"
									value="30" onclick="checkV()"> <label for="check_30">30대</label></li>
								<li><input type="checkbox" class="li_check" id="check_40"
									value="40" onclick="checkV()"> <label for="check_40">40대</label></li>
								<li><input type="checkbox" class="li_check" id="check_50"
									value="50" onclick="checkV()"> <label for="check_50">50대</label></li>
								<li><input type="checkbox" class="li_check" id="check_60"
									value="60" onclick="checkV()"> <label for="check_60">60대</label></li>
								<li><input type="checkbox" class="li_check" id="check_70"
									value="70" onclick="checkV()"> <label for="check_70">70대</label></li>
							</ul></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- acd cont end-->
	</div>
	<div id="v_all" class="content white_bg">
		<ul id="s" class="col_21 stand_li">
			<c:forEach var="canData" items="${list2}">
				<li id="${canData.u_id }"
					class="v_all ${canData.u_sex } ${fn:substring(canData.u_age,0,1)}0 ${canData.u_club_gd }">
					<div class="photo_name">
						<div class="thum_area">
							<div class="thum"
								style="background-image: url(${canData.u_photo});"></div>
						</div>
						<div class="text_area">
							<span class="name3">${canData.u_nm }</span> <c:choose>
									<c:when test="${canData.end_count ne 0}"><em class="game_nb-tiny">${canData.end_count }</em></c:when>
									<c:when test="${canData.wait_count > 0 }"><em class="game_nb-tiny">0</em></c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							<span class="age_rank">(${fn:substring(canData.u_age,0,1)}0
								${canData.u_club_gd })</span>
						</div>
					</div> <!--photo_name end-->
					<div class="btns_box" id="divide">
						<span
							onClick="teamA('${canData.u_id}','${canData.u_nm }' ,'${canData.u_photo}','${canData.u_club_gd }','${fn:substring(canData.u_age,0,1)}0' ,'${canData.u_push }')"
							id="ateam">A팀</span> <span
							onClick="teamB('${canData.u_id}','${canData.u_nm }' ,'${canData.u_photo}','${canData.u_club_gd }','${fn:substring(canData.u_age,0,1)}0','${canData.u_push }')"
							id="bteam">B팀</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</c:if>
<!-- content end -->
<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">선수 선택</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="scroll_wrap ht-5">
		<ul class="li_name line_tno" id="ctest">
		</ul>
	</div>
	<!--scroll_wrap end-->
</div>
<div class="popwin_size white_bg wsize-300">
	<div class="head_top title_popup">
		<div class="tit_top">
			<h1 class="game_title">게스트 등록</h1>
		</div>
		<div class="bt_top">
			<span class="btn_i la la-close" onclick="location.href='#'"></span>
		</div>
	</div>
	<!-- title_popupp end -->
	<div class="popup_body">
		<table class="table_form mb_m">
			<tr>
				<td><input type="text" placeholder="이름(실명)" id="g_id"></td>
			</tr>
			<tr>
				<td><ul class="list_check">
						<li><input type="radio" name="choice" class="check_circle"
							id="check_1" value="M"> <label for="check_1">남자</label></li>
						<li><input type="radio" name="choice" class="check_circle"
							id="check_2" value="F"> <label for="check_2">여자</label></li>
					</ul></td>
			</tr>
			<tr>
				<td><div class="col_2input">
						<div>
							<select id="g_age">
								<option value="연령" selected="selected">연령</option>
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="50">60대</option>
								<option value="50">70대</option>
							</select>
						</div>
						<div>
							<select name="select" id="g_gd">
								<option value="급수" selected="selected">급수</option>
								<option value="자강">자강</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="D">D</option>
								<option value="초심">초심</option>
								<option value="왕초">왕초</option>
							</select>
						</div>
					</div></td>
			</tr>
		</table>
		<hr class="line_both">
		<div class="btn_full col2_lay">
			<div>
				<span class="btn_st btn_colorg close_popup " onclick="">취소</span>
			</div>
			<div>
				<span class="btn_st close_popup" onClick="guestInsert();">등록</span>
			</div>
		</div>
		<!-- col2_lay end -->
	</div>
	<!-- popup_body end-->
</div>

<%-- <div class="content white_bg">
				<ul class="col_21 stand_li">
					<c:forEach var="dontData" items="${list }">
					<li>
						<div class="photo_name">
								<div class="thum_area">
									<div class="thum" style="background-image: url(/resources/img/member_photo_01.jpg);"></div>
								</div>
								<div class="text_area">
									<span>${dontData.u_nm }</span>
								</div>
						</div>
						<!--photo_name end--> 
						<span class="state_text"></span>
					</li>
					</c:forEach>
				</ul>
			</div> --%>
<!-- content end -->
<!-- InstanceEndEditable -->
<!-- container end -->
<div id="ft_area">
	<!-- InstanceBeginEditable name="ft_tag" -->
	<!-- InstanceEndEditable -->
	<script>	
    $(document).ready(function(){	
    var aa = $(location).attr('pathname').slice(-6, -5); 
	$('.ft_menu').navi_depth({pageNum:aa})
     });
    function ctest(n){
    	$("#ctest li").each(function(){
    		$(this).remove();
    	})
    	$("#s li").each(function(){
    		var c = $(this).clone();
    		var o = c.find("div.btns_box").find("span").attr("onclick");
    		c.find("div.photo_name").attr("onclick",n+"_"+o)
    		c.find("div.btns_box").remove();
    		c.appendTo($("#ctest"));
    	})
    	$('.la-close').click();
    }
    function a1_teamA(id,nm,photo,gd,age,push){
		a1 = 1;
		$("#a1_nm").text(nm)
		$("#a1_photo").attr("style","background-image: url("+photo+")");
		$("#a1_age_gd").text("("+age+"-"+gd+")");
		$("#a1").val(id);
		$("#pa1").val(push);
		$("#a1_bar").attr("style","display:''");
		ach++
		$("#a1_").attr("class","photo_name")
		$("#"+id).hide();
		divDisplay();
		$('.la-close').click();
    }
    function a2_teamA(id,nm,photo,gd,age,push){
    	a2=1;
		$("#a2_nm").text(nm)
		$("#a2_photo").attr("style","background-image: url("+photo+")");
		$("#a2_age_gd").text("("+age+"-"+gd+")");
		$("#a2").val(id);
		$("#pa2").val(push);
		$("#a2_bar").attr("style","display:''");
		ach++
		$("#a2_").attr("class","photo_name")
		$("#"+id).hide();
		divDisplay();
		$('.la-close').click();
    }
	function b1_teamA(id,nm,photo,gd,age,push){
		b1 = 1;
		$("#b1_nm").text(nm)
		$("#b1_photo").attr("style","background-image: url("+photo+")");
		$("#b1_age_gd").text("("+age+"- "+gd+")");
		$("#b1").val(id)
		$("#pb1").val(push);
		$("#b1_bar").attr("style","display:''");
		bch++
		$("#b1_").attr("class","photo_name")
		$("#"+id).hide();
		divDisplay();
		$('.la-close').click();
	}
	function b2_teamA(id,nm,photo,gd,age,push){
		b2=1;
		$("#b2_nm").text(nm)
		$("#b2_photo").attr("style","background-image: url("+photo+")");
		$("#b2_age_gd").text("("+age+"-"+gd+")");
		$("#b2").val(id)
		$("#pb2").val(push);
		$("#b2_bar").attr("style","display:''");
		bch++
		$("#b2_").attr("class","photo_name")
		$("#"+id).hide();
		divDisplay();
		$('.la-close').click();	
	}
    </script>
	<ul class="ft_menu">
		<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
		<li class="active_tab"
			onClick="location.href='/UClub/GamePrivateStateInfo.techni'"><span>게임</span></li>
		<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
		<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
	</ul>

</div>