package com.techni.mgl.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sun.org.apache.xpath.internal.operations.Gte;
import com.techni.mgl.domain.CStadiumVO;
import com.techni.mgl.domain.ClubMatchVO;
import com.techni.mgl.domain.GTempTeamVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.service.GameService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class GameController {
	
	@Autowired
	public GameService gService;
	@Autowired
	public MemberService mService;
	@Autowired
	public UClubService ucService;
	
	//게임등록
	@RequestMapping("/Game/GameInsert.techni")
	@ResponseBody
	public Map<Object,Object> gameInsert(HttpSession session, Model mode, @RequestBody String json) throws ParseException{
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String> map2 = new HashMap<String,String>();
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
        
        String cm_a1_id = (String) json2.get("cm_a1_id");
        String cm_a2_id = (String) json2.get("cm_a2_id");
        String cm_b1_id = (String) json2.get("cm_b1_id");
        String cm_b2_id = (String) json2.get("cm_b2_id");
        
		String c_idx = (String) session.getAttribute("c_idx");
		
		ClubMatchVO cmVO = gService.clubUseCourt(c_idx);
		
		map2.put("c_idx", c_idx);
		map2.put("cm_a1_id", cm_a1_id);
		map2.put("cm_a2_id", cm_a2_id);
		map2.put("cm_b1_id", cm_b1_id);
		map2.put("cm_b2_id", cm_b2_id);
		
		cmVO.setC_idx(c_idx);
		cmVO.setCm_a1_id(cm_a1_id);
		cmVO.setCm_a2_id(cm_a2_id);
		cmVO.setCm_b1_id(cm_b1_id);
		cmVO.setCm_b2_id(cm_b2_id);
		
		System.out.println(cmVO);
		
		int gc = cmVO.getCm_gc();
		int wc = cmVO.getCm_wc();
		int su = cmVO.getC_court_su();
		String sa = cmVO.getC_court_sa();
		String [] cm_sa = sa.split(",");
		
		String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		if(gc<cm_sa.length){
			cmVO.setCm_status("게임");
			cmVO.setCm_order(Integer.parseInt(cm_sa[gc]));
			cmVO.setCm_start(curTime);
			System.out.println(cm_sa[gc]);
			map2.put("u_status", "게임중");
		}else{
			cmVO.setCm_status("대기");
			cmVO.setCm_order(wc+1);
			cmVO.setCm_start(null);
			System.out.println(wc+1);
			map2.put("u_status", "게임대기");
		}
		
		int res = gService.clubGameSet(cmVO, map2);
		
		if(res>0){
			map.put("cnt", 1);
			map.put("m", "test");
			
			return map;
		}else{
			map.put("cnt", 0);
			
			return map;
		}
		
		
	}
	//게임 현황판
	@RequestMapping("/Game/GameState.techni")
	public String gameState(Model model, HttpSession session){
		
		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";
		
		List<ClubMatchVO> list = gService.gameingList(c_idx);
		List<ClubMatchVO> list2 = gService.waitingList(c_idx);
		
		List<UClubVO> uvo2 = ucService.attendY(c_idx);


		for (UClubVO i : uvo2){
					if(i.getU_id().equals(u_id)){
						u_status = 	i.getU_status();
						System.out.println("ustatus"+u_status);
					}
					
				}
		
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("u_status", u_status);
		
		return "game/gameStateInfo";
	}
	//점수 버튼을 누르면 현재 게임중인 게임과 대기중인 게임이 업데이트
	@RequestMapping("/Game/GameScoreRegist.techni")
	@ResponseBody
	public Map<Object,Object> gameScoreRegist(Model model, HttpSession session , @RequestBody String json) throws ParseException{
		
		Map<String,String> map = new HashMap<String,String>();
		Map<Object,Object> map2 = new HashMap<Object,Object>();
		Map<String,String> map3 = new HashMap<String,String>();
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
		
		int res = 0;
		
		String c_idx = (String) session.getAttribute("c_idx");
		String c_gidx = (String) json2.get("c_gidx");
		String cm_a1_id = (String) json2.get("cm_a1_id");
		String cm_a2_id = (String) json2.get("cm_a2_id");
		String cm_b1_id = (String) json2.get("cm_b1_id");
		String cm_b2_id = (String) json2.get("cm_b2_id");
		String cm_order = (String) json2.get("cm_order");
		
		ClubMatchVO cmVO = gService.clubUseCourt(c_idx);
		
		int wc = cmVO.getCm_wc();
		
		map.put("c_idx", c_idx);
		map.put("c_gidx", c_gidx);
		
		map3.put("cm_a1_id",cm_a1_id);
		map3.put("cm_a2_id",cm_a2_id);
		map3.put("cm_b1_id",cm_b1_id);
		map3.put("cm_b2_id",cm_b2_id);
		map3.put("c_idx", c_idx);
		map3.put("u_status", "게임가능");
		
		String id [] = {cm_a1_id,cm_a2_id,cm_b1_id,cm_b2_id};
		
		res = gService.gameEndUpdate(c_gidx,c_idx,id,Integer.parseInt(cm_order),map3);
		
		if(res>0){

			/*if(wc>0){
				int res2 = gService.gameWaitUpdate(map);
				if(res2>0){
					map2.put("cnt", 1);
			
					return map2;
				}
			}*/
			map2.put("cnt", 1);
			
			return map2;
		}else{
			
			map2.put("cnt", 0);
			
			return map2;
		}
		
		
	}
	//대기명단 위치변경
	@RequestMapping("/Game/ChangeW.techni")
	@ResponseBody
	public Map<Object,Object> changeW(Model model, HttpSession session , @RequestBody String json ) throws ParseException{
		Map<String,String> map = new HashMap<String,String>();
		Map<Object,Object> map1 = new HashMap<Object,Object>();
		
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
        
        String c_gidx = (String) json2.get("c_gidx");
        String c_gidx_c = (String) json2.get("c_gidx_c");
        
		map.put("c_gidx", c_gidx);
		map.put("c_gidx_c", c_gidx_c);
		
		int res = gService.changeW(map);
		
		if(res > 0){
			map1.put("cnt", 1);
		}else{
			map1.put("cnt", 0);
		}
		
		
		return map1;
	}
	//대기명단 삭제
	@RequestMapping("/Game/DeleteW.techni")
	@ResponseBody
	public Map<Object,Object> deleteW(HttpSession session , @RequestBody String json) throws ParseException{
		
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String>map1 = new HashMap<String,String>();
		
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
        
        String c_gidx = (String) json2.get("c_gidx");
        String cm_a1_id = (String) json2.get("a1");
        String cm_a2_id = (String) json2.get("a2");
        String cm_b1_id = (String) json2.get("b1");
        String cm_b2_id = (String) json2.get("b2");
        String c_idx = (String) session.getAttribute("c_idx");
        map1.put("cm_a1_id", cm_a1_id);
        map1.put("cm_a2_id", cm_a2_id);
        map1.put("cm_b1_id", cm_b1_id);
        map1.put("cm_b2_id", cm_b2_id);
        map1.put("u_status", "게임가능");
        map1.put("c_idx", c_idx);
        
		int res = gService.deleteW(c_gidx,map1);
		
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		
		return map;
	}
	
	@RequestMapping("/Game/GameScoreRegistForm.techni")
	public String gameScoreRegistForm(Model model, HttpSession session,@RequestParam String c_gidx){
		
		ClubMatchVO cmvo = gService.scoreInsertForm(c_gidx);
		
		model.addAttribute("cmvo", cmvo);
		
		return "game/gameScoreRegist";
	}
	
	@RequestMapping("/Game/GameScoreInsert.techni")
	@ResponseBody
	public Map<Object,Object> gameScoreInsert(Model model, HttpSession session, @RequestBody String json) throws ParseException{
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String> map2 = new HashMap<String,String>();
		
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
        
        String cm_a1_id = (String) json2.get("cm_a1_id");
        String cm_a2_id = (String) json2.get("cm_a2_id");
        String cm_b1_id = (String) json2.get("cm_b1_id");
        String cm_b2_id = (String) json2.get("cm_b2_id");
        String aScore = (String) json2.get("aScore");
        String bScore = (String) json2.get("bScore");
        String c_gidx = (String) json2.get("c_gidx");
        String c_idx = (String) session.getAttribute("c_idx");
        System.out.println(cm_a1_id+"  "+cm_a2_id +" "+cm_b1_id+" "+cm_b2_id);
        String id [] = {cm_a1_id,cm_a2_id,cm_b1_id,cm_b2_id};
        int j = 0;
        
        int aS = Integer.parseInt(aScore);
        int bS = Integer.parseInt(bScore);
        
        map2.put("cm_a1_id", cm_a1_id);
        map2.put("cm_a2_id", cm_a2_id);
        map2.put("cm_b1_id", cm_b1_id);
        map2.put("cm_b2_id", cm_b2_id);
        map2.put("c_idx", c_idx);
        
        List<ClubMatchVO> list = gService.pointUser(map2);
        
        int hon = 0;
        for(int i = 0; i<list.size();i++){
        	if(list.get(i).getU_sex().equals("M")){
        	hon++;
        	}
        }
        System.out.println("hon"+hon);
        
        double Tgr =0.0;
        for(int i =0;i<list.size();i++){
        	double gr = 0;
        	if(hon != 0 || hon != 4){
        		switch (list.get(i).getU_sex()) {
				case "F":
					gr=gr+0.5;
					break;
				default:
					break;
				}
        	}
        		System.out.println(i+"  :  "+"성별 : "+list.get(i).getU_sex()+"   공력  : "+gr);
        		if(list.get(i).getU_club_gd() == null){
        			list.get(i).setU_club_gd("왕초");
        		}
        		switch(list.get(i).getU_club_gd()){
        		case "S" :
        			gr=gr+0;
        			break;
        		case "자강" :
        			gr=gr+0;
        			break;
        		case "A" :
        			gr=gr+1;
        			break;
        		case "B" :
        			gr=gr+3;
        			break;
        		case "C" :
        			gr=gr+5;
        			break;
        		case "D" :
        			gr=gr+7;
        			break;
        		case "초심" :
        			gr=gr+9;
        			break;
        		case "왕초" :
        			gr=gr+10;
        			break;
        		case "무급" :
        			gr=gr+10;
        			break;
        		}
        		System.out.println(i+"  :  "+"성별 : "+list.get(i).getU_sex()+"급수 :  "+list.get(i).getU_club_gd()+"   공력  : "+gr);
        		double age2 = Math.floor(list.get(i).getU_age()/5) *5;
        		int age = (int)age2;
        		String ageG = age+"대";
        		System.out.println(i+"  :  "+ageG);
        		list.get(i).setU_ageG(ageG);
        		switch (ageG) {
        		case "0대":
					gr=gr+1;
					break;
        		case "5대":
					gr=gr+1;
					break;
        		case "10대":
					gr=gr+1;
					break;
        		case "15대":
					gr=gr+1;
					break;
				case "20대":
					gr=gr+1;
					break;
				case "25대":
					gr=gr+2;
					break;
				case "30대":
					gr=gr+3;
					break;
				case "35대":
					gr=gr+4;
					break;
				case "40대":
					gr=gr+5;
					break;
				case "45대":
					gr=gr+6;
					break;
				case "50대":
					gr=gr+7;
					break;
				case "55대":
					gr=gr+8;
					break;
				case "60대":
					gr=gr+9;
					break;
				case "65대":
					gr=gr+9;
					break;
				case "70대":
					gr=gr+10;
					break;
				case "75대":
					gr=gr+10;
					break;
				case "80대":
					gr=gr+10;
					break;
				default:
					gr=gr+0;
					break;
				}
        		System.out.println(i+"  :  "+"성별 : "+list.get(i).getU_sex()+"급수 :  "+list.get(i).getU_club_gd()+"  나이대  :"+ageG+"대"+ "공력  : "+gr);
        		
        		if(hon != 0 && hon != 4){
        			gr = gr/(double)3;
        		}else{
        			gr=gr/(double)2;
        		}
        		list.get(i).setU_gr(Math.round(gr*100d)/100d);
        		
        		Tgr =Tgr+gr;
        		
        		
        	}
        System.out.println("총공력 : "+Tgr);
        System.out.println(list.get(0).getU_id()+ " 의 손실공력은 " +list.get(0).getU_gr() +" 이고 게임 포인트는 "+Math.round(((list.get(0).getU_gr()/Tgr)*10)*100d)/100d);
        System.out.println(list.get(1).getU_id()+ " 의 손실공력은 " +list.get(1).getU_gr() +" 이고 게임 포인트는 "+Math.round(((list.get(1).getU_gr()/Tgr)*10)*100d)/100d);
        System.out.println(list.get(2).getU_id()+ " 의 손실공력은 " +list.get(2).getU_gr() +" 이고 게임 포인트는 "+Math.round(((list.get(2).getU_gr()/Tgr)*10)*100d)/100d);
        System.out.println(list.get(3).getU_id()+ " 의 손실공력은 " +list.get(3).getU_gr() +" 이고 게임 포인트는 "+Math.round(((list.get(3).getU_gr()/Tgr)*10)*100d)/100d);
		
        int totalP;
		String aWin = "";
		String bWin = "";
		if(aS>bS){
			list.get(0).setCm_vp(1.0);
			list.get(1).setCm_vp(1.0);
			list.get(2).setCm_vp(0.0);
			list.get(3).setCm_vp(0.0);
			totalP = aS*2;
			aWin = "승";
			bWin = "패";
		}else{
			list.get(0).setCm_vp(0.0);
			list.get(1).setCm_vp(0.0);
			list.get(2).setCm_vp(1.0);
			list.get(3).setCm_vp(1.0);
			totalP = bS*2;
			aWin = "패";
			bWin = "승";
		}
	
		double a_pp = Math.round((aS/(double)(totalP))*100d)/100d;
		System.out.println(a_pp);
		double b_pp = Math.round((bS/(double)(totalP))*100d)/100d;
		System.out.println(b_pp);
		for(int i = 0 ; i<2;i++){
			list.get(i).setCm_pp(a_pp);
			list.get(i).setCm_gp(Math.round(((list.get(i).getU_gr()/Tgr)*10)*100d)/100d);
			list.get(i).setCm_ap(Math.round(((list.get(i).getU_gr()/Tgr)*10)*100d)/100d+a_pp+list.get(i).getCm_vp());
			list.get(i).setCm_total(aS);
			list.get(i).setCm_sc_gap(aS-bS);
			list.get(i).setCm_win(aWin);
		}
		for(int i =2;i<4;i++){
			list.get(i).setCm_pp(b_pp);
			list.get(i).setCm_gp(Math.round(((list.get(i).getU_gr()/Tgr)*10)*100d)/100d);
			list.get(i).setCm_ap(Math.round(((list.get(i).getU_gr()/Tgr)*10)*100d)/100d+b_pp+list.get(i).getCm_vp());
			list.get(i).setCm_total(bS);
			list.get(i).setCm_sc_gap(bS-aS);
			list.get(i).setCm_win(bWin);
		}
		int res = 0;
		for(ClubMatchVO cmvo: list){
			cmvo.setU_id(id[j]);
			cmvo.setC_gidx(c_gidx);
			System.out.println(cmvo.getU_id());
			res = gService.clubMatchPointInsert(cmvo);
			j++;
		}
		
		
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		
		
		return map;
	}
	
	@RequestMapping("/Game/GameResult.techni")
	public String gameResult(Model model,HttpSession session,@RequestParam String c_gidx){
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("c_idx", (String)session.getAttribute("c_idx"));
		map.put("c_gidx", c_gidx);
		List<ClubMatchVO> list = gService.gameResult(map);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		
		return "game/gameResult";
	}
	
	@RequestMapping("/Game/EndGame.techni")
	public String endGame(Model model,HttpSession session,@RequestParam(required = false) String cm_ymd){
		
		Map<String,String> map = new HashMap<String,String>();
		
		 String c_idx = (String) session.getAttribute("c_idx");
		 MemberVO mvo = (MemberVO) session.getAttribute("login");
		 String u_id = mvo.getM_id();
		 String u_status = "";
		 
		 if(cm_ymd == null || cm_ymd == ""){
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		        Calendar c1 = Calendar.getInstance();

			 cm_ymd = sdf.format(c1.getTime());
			 System.out.println("today"+cm_ymd);
		 }
		 
		 map.put("c_idx", c_idx);
		 map.put("cm_ymd", cm_ymd);
		 
		 List<ClubMatchVO> list = gService.endGameGidx(map);
		 List<List<ClubMatchVO>> list2 = new ArrayList<List<ClubMatchVO>>();
		 System.out.println("list  :  "+list);
		 for(ClubMatchVO cmvo : list){
			String j = cmvo.getC_gidx();
			map.remove("c_gidx");
			map.put("c_gidx", j);
			list2.add(gService.gameResult(map));
		 }
		 
		 List<UClubVO> uvo2 = ucService.attendY(c_idx);
		 for (UClubVO i : uvo2){
		 			if(i.getU_id().equals(u_id)){
		 				u_status = 	i.getU_status();
		 				System.out.println("ustatus"+u_status);
		 			}
		 			
		 }

		 System.out.println("list2  :  "+list2);
		 model.addAttribute("list", list);
		 model.addAttribute("list2", list2);
		 model.addAttribute("cm_ymd", cm_ymd);
		 System.out.println("씨엠와엠디" + cm_ymd);
		 model.addAttribute("u_status", u_status);
		
		return "game/gameStateInfoEnd";
	}
	//포인트 요약
	@RequestMapping("/Game/PointDetail.techni")
	public String pointDetail(Model model, HttpSession session,@RequestParam(required=false) String ym){
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String c_idx = (String) session.getAttribute("c_idx");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyMM");
		Date currentTime = new Date();
		
		if(ym == null){
			ym = formatter.format(currentTime);
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("u_id", u_id);
		map.put("c_idx", c_idx);
		map.put("ym", ym);
		
		List<ClubMatchVO> list = gService.pointDetail(map);
		
		model.addAttribute("list", list);
		
		return "uclub/uClubMemberPoint";
	}
	
	//포인트 총합
		@RequestMapping("/Game/PointDetailAll.techni")
		public String pointDetailAll(Model model, HttpSession session){
			
			MemberVO mvo = (MemberVO) session.getAttribute("login");
			String u_id = mvo.getM_id();
			String c_idx = (String) session.getAttribute("c_idx");
			
			Map<String,String> map = new HashMap<String,String>();
			
			map.put("u_id", u_id);
			map.put("c_idx", c_idx);
			
			List<ClubMatchVO> list = gService.pointDetailAll(map);
			
			model.addAttribute("list", list);
			
			return "uclub/uClubMemberPoint";
		}
		
	//팀리그 등록
		@RequestMapping("/Game/TeamLeagueInsert.techni")
		@ResponseBody
		public Map<Object,Object> teamLeageInsert(HttpSession session , @RequestBody String json) throws ParseException{
			
			Map<Object, Object> map = new HashMap<Object, Object>();

			JSONParser parser = new JSONParser();
			JSONArray json2 = (JSONArray) parser.parse(json);
			
			String c_idx = (String) session.getAttribute("c_idx");
			
			ClubMatchVO cmVO = gService.clubUseCourt(c_idx);
			
			List<Object> list = new ArrayList<Object>();
			List<Object> InsertList = new ArrayList<Object>();
			
			for (int i = 0; i < json2.size(); i++) {
				JSONObject j = (JSONObject) json2.get(i);
				String u = "a" + i;
				String arr = j.get(u).toString().replace("[", "").replace("]", "").replace("\"", "");
				Object array[] = arr.split(",");
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("cm_a1_id", array[0].toString());
					map3.put("cm_a2_id", array[1].toString());
					list.add(map3);
			}
			String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			System.out.println(list);
			System.out.println(list.size());
			int k = 0 ;
				for(int i = 0 ; i<list.size()-1;i++){
					Map<String, Object> newM = new HashMap<String, Object>();
					newM = (Map<String, Object>) list.get(i);
					for(int j = k ;j<=list.size()-1;j++ ){
						if(j !=0 && j != i){
							Map<String, Object> newM2 = new HashMap<String, Object>();
							newM2 = (Map<String, Object>) list.get(j);
							Map<String, String> M = new HashMap<String, String>();
							M.put("cm_a1_id", (String)newM.get("cm_a1_id"));
							M.put("cm_a2_id", (String)newM.get("cm_a2_id"));
							M.put("cm_b1_id", (String)newM2.get("cm_a1_id"));
							M.put("cm_b2_id", (String)newM2.get("cm_a2_id"));
							M.put("c_idx", c_idx);
							cmVO.setC_idx(c_idx);
							cmVO.setCm_a1_id((String)newM.get("cm_a1_id"));
							cmVO.setCm_a2_id((String)newM.get("cm_a2_id"));
							cmVO.setCm_b1_id((String)newM2.get("cm_a1_id"));
							cmVO.setCm_b2_id((String)newM2.get("cm_a2_id"));
							cmVO.setCm_status("게임");
							cmVO.setCm_start(curTime);
							M.put("u_status", "게임중");
							int res = gService.clubGameSet(cmVO, M);
							if(res == 0){
								
								map.put("cnt", 0);
								
								return map;
							}else{
								map.put("cnt", 1);
							}
						}
					}
					k++;
				}
			System.out.println(InsertList);
			System.out.println(InsertList.size());
			
			return map;
		}
		//개인리그등록
		@RequestMapping("/Game/PrivateLeagueInsert.techni")
		@ResponseBody
		public Map<Object, Object> privateLeageInsert(HttpSession session, @RequestBody String json) throws ParseException{
			Map<Object, Object> map2 = new HashMap<Object, Object>();
			
			JSONParser parser = new JSONParser();
	        JSONObject json2 = (JSONObject) parser.parse(json);
			String user_id = (String) json2.get("user_id");
			String private_no = (String) json2.get("private_no");
			String[] arr = user_id.split(",");
			
			List<Object> teamList = new ArrayList<Object>();
			
			List<Object> tList = new ArrayList<Object>();
			
			
			
			for(int i = 0 ;i<arr.length;i++) {
				for(int j=i+1; j<arr.length;j++) {
					Map<String,String> map = new HashMap<String,String>();
					System.out.println(arr[i]+","+arr[j]);
					System.out.println(i+","+j);
					map.put("team1", arr[i]);
					map.put("team2", arr[j]);
					teamList.add(map);
				}
			}
			
			int e = 0;
			for(;;) {
				String[] ar = new String[arr.length * Integer.parseInt(private_no)];
				int v = 0;
				int p = 0;
				int q = 0;
				if(e == 1) {
					break;
				}else {
					
					tList.clear();
					
					Collections.shuffle(teamList);
			
					for(int i = 0; i<teamList.size();i++) {
						int count = 0;
						int count_1 = 0;
						int count_2 = 0;
						int count_3 = 0;
						
						Map<String, Object> newM = new HashMap<String, Object>();
						newM = (Map<String, Object>) teamList.get(i-q);
						
						
						Map<String, Object> newM2 = new HashMap<String, Object>();
						newM2 = (Map<String, Object>) teamList.get(teamList.size()-i-1+p);
						
						
						String team1 = (String) newM.get("team1");
						String team2 = (String) newM.get("team2");
						
						String team1_1 = (String) newM2.get("team1");
						String team2_1 = (String) newM2.get("team2");
						
						int a = 0;
						int b = 0;
						
						for(int j = 0; j<ar.length;j++) {
							if(ar[j] != null) {
								if(ar[j].equals(team1)) {
									count ++;
								}
								if(ar[j].equals(team2)) {
									count_1 ++;
								}
							}
						}
						
						if(team2 != team1_1 && team2 != team2_1&&team1 != team1_1 && team1 != team2_1 &&count < Integer.parseInt(private_no) && count_1 < Integer.parseInt(private_no)) {
							ar[v] = team1;
							ar[v+1] = team2;
							a=1;
						}
						for(int j = 0; j<ar.length;j++) {
							if(ar[j] != null) {
								if(ar[j].equals(team1_1)) {
									count_2 ++;
								}
								if(ar[j].equals(team2_1)) {
									count_3 ++;
								}
							}
						}
						if(team1_1 != team2 && team1_1 != team2&&team2_1 != team1 && team2_1 != team2 &&count_2 < Integer.parseInt(private_no) && count_3 < Integer.parseInt(private_no)) {
							ar[v+2] = team1_1;
							ar[v+3] = team2_1;
							b=1;
						}
						
						if(count>= Integer.parseInt(private_no) || count_1 >= Integer.parseInt(private_no)) {
							if(count_2 < Integer.parseInt(private_no) && count_3 < Integer.parseInt(private_no) ) {
								p++;
							}
							
						}
						
						if(count_2 >= Integer.parseInt(private_no) || count_3 >= Integer.parseInt(private_no)) {
							if(count < Integer.parseInt(private_no) || count_1 < Integer.parseInt(private_no)) {
								q++;	
							}
						}
						
						if(a == 1&&b==1) {
							tList.add(newM);
							tList.add(newM2);
							v = v+4;
						}else if(a==1&&b==0) {
							ar[v] = "";
							ar[v+1] ="";
						}else if(a==0&&b==1) {
							ar[v+2] = "";
							ar[v+3] = "";
						}
						
						if(tList.size()/2 == arr.length*Integer.parseInt(private_no)/4&&tList.size() > 1) {
							e=1;
							break;
						}
						
					}
				}
			}
			System.out.println(teamList);
			System.out.println(tList);
			System.out.println(tList.size());
			System.out.println(Integer.parseInt(private_no));
			
			System.out.println("팀의 총 경우의수 : " + teamList.size());
			System.out.println("팀의수 : "+tList.size());
			System.out.println("총인원수*게임수 : " +arr.length*Integer.parseInt(private_no));
			
			String c_idx = (String) session.getAttribute("c_idx");
			
			ClubMatchVO cmVO = gService.clubUseCourt(c_idx);
			
			
			String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
				for(int i = 0 ; i<tList.size();i++){
					Map<String, Object> newM = new HashMap<String, Object>();
					newM = (Map<String, Object>) tList.get(i);
					i++;
					Map<String, Object> newM2 = new HashMap<String, Object>();
					newM2 = (Map<String, Object>) tList.get(i);
							Map<String, String> M = new HashMap<String, String>();
							M.put("cm_a1_id", (String)newM.get("team1"));
							M.put("cm_a2_id", (String)newM.get("team2"));
							M.put("cm_b1_id", (String)newM2.get("team1"));
							M.put("cm_b2_id", (String)newM2.get("team2"));
							M.put("c_idx", c_idx);
							cmVO.setC_idx(c_idx);
							cmVO.setCm_a1_id((String)newM.get("team1"));
							cmVO.setCm_a2_id((String)newM.get("team2"));
							cmVO.setCm_b1_id((String)newM2.get("team1"));
							cmVO.setCm_b2_id((String)newM2.get("team2"));
							cmVO.setCm_status("게임");
							cmVO.setCm_start(curTime);
							M.put("u_status", "게임중");
							int res = gService.clubGameSet(cmVO, M);
							if(res == 0){
								
								map2.put("cnt", 0);
								
								return map2;
							}else{
								map2.put("cnt", 1);
							}
				}
			
			
			
			
			return map2;
		}
	
	@RequestMapping("/Game/GameTodayRank.techni")
	public String gameTodayRank(Model model, HttpSession session,@RequestParam(required = false) String cm_ymd){
		Map<String,String> map = new HashMap<String,String>();
		
		 String c_idx = (String) session.getAttribute("c_idx");
		 MemberVO mvo = (MemberVO) session.getAttribute("login");
		 String u_id = mvo.getM_id();
		 String u_status = "";
		 
		 if(cm_ymd == null || cm_ymd == ""){
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		        Calendar c1 = Calendar.getInstance();

			 cm_ymd = sdf.format(c1.getTime());
			 System.out.println("today"+cm_ymd);
		 }
		 
		 map.put("c_idx", c_idx);
		 map.put("cm_ymd", cm_ymd);
		 
		 List<UClubVO> list = ucService.todayRank(map);
		 
		 List<UClubVO> uvo2 = ucService.attendY(c_idx);
		 for (UClubVO i : uvo2){
		 			if(i.getU_id().equals(u_id)){
		 				u_status = 	i.getU_status();
		 				System.out.println("ustatus"+u_status);
		 			}
		 			
		 }
		 
		 model.addAttribute("cm_ymd", cm_ymd);
		 model.addAttribute("u_status", u_status);
		 model.addAttribute("list",list);
		 
		return "game/gameTodayRank";
	}
	
	
	
	
	
	
	//	게임현황판화면 처리
	@RequestMapping("/Game/GameStateInfo.techni")
	public ModelAndView getGameStateInfo(HttpSession session, ModelAndView mv, ServletRequest req){
		ArrayList<GTempTeamVO> gameMemberDateList = null;	// 진행중 리스트
		ArrayList<GTempTeamVO> gameMemberTempList = null;	// 대기중 리스트
		ArrayList<CStadiumVO> clubStadiumCoatList = null;		// 클럽에서 사용가능한 코트 리스트 mgl_stadium.mgl_stadium_coat_yn = Y
		try{
			
			clubStadiumCoatList = gService.getClubStadiumCoatList(session);
			
			String matchDate = req.getParameter("matchDate");
			
			if((matchDate == null) || matchDate.equals("")){
				DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd ");
				Calendar cal = Calendar.getInstance();
				matchDate = dateFormat.format(cal.getTime());
			}
			String tempyn = "N";
			gameMemberDateList = gService.getGameStateTempInfo(session, matchDate, tempyn);			// 진행중 멤버
			tempyn = "Y";
			gameMemberTempList = gService.getGameStateTempInfo(session, matchDate, tempyn);		// 대기중 멤버
			
		}catch(Exception e){
			e.printStackTrace();
		}
		Object DispYn = null;
		if(gameMemberDateList.size() > 0){
			
			for(int i = 0; i < clubStadiumCoatList.size(); i++){
				String a = clubStadiumCoatList.get(i).getCst_coat();

				for(int j = 0; j < gameMemberDateList.size(); j++){				
					String b = gameMemberDateList.get(j).getTemp_coat();
					// 현재 경기장 코트 리스트를 출력하면서 그곳과 매칭된 GTempTeam객체 정보 하나를 넣어준다.
					if( a.equals(b) ){
						clubStadiumCoatList.get(i).setGttVO(gameMemberDateList.get(j));
						DispYn = gameMemberDateList.get(j);
					}
				}
			}
		}
		
		mv.addObject("DispYn", DispYn);
		mv.addObject("COATLIST", clubStadiumCoatList);
		mv.addObject("TEMPLIST", gameMemberTempList);
		mv.setViewName("game/gameStateInfo");
		return mv;
	}
	
	//게임현황판 > 종료게임 명령 처리
	@RequestMapping("/Game/GameStateInfoEnd.techni")
	public ModelAndView getGameStateInfoEnd(HttpSession session, ModelAndView mv, ServletRequest req){
		mv.setViewName("game/gameStateInfoEnd");
		return mv;
	}
	
	// 게임현황판 > 대기중 순위 올리기 명령 처리
	@RequestMapping("/Game/GameStateInfoRankUp.techni")
	public ModelAndView setGameStateInfoRankUp(HttpSession session, ServletRequest req, ModelAndView mv){
			
		String rank = (String) req.getParameter("num");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd ");
		Calendar cal = Calendar.getInstance();
		String matchDate = dateFormat.format(cal.getTime());
		
		
		gService.setGameStateInfoRankUp(session, rank, matchDate);
				
		RedirectView rv = new RedirectView();
		rv.setUrl("/Game/GameStateInfo.techni");
		mv.setView(rv);
		return mv;
	}
	
	// 게임결과 스코어등록화면
	/*@RequestMapping("/Game/GameScoreRegist.techni")
	public ModelAndView getGemeScoreRegist(HttpSession session, ModelAndView mv, ServletRequest req){
		String gtIdx = (String) req.getParameter("gtIdx");
		GTempTeamVO gttVO = null;
		ClubMatchVO cmVO = null;
		try{
			// 단일 임시저장테이블에서 데이터 추출(향후 삭제권장)
			gttVO = gService.getGameScoreRegist(gtIdx, session);
		
			// temp_teamgroup 테이블의 각각의 회원정보를 불러와서 화면 하단에 지난기록을 출력(미작업)
			// ClubMatchVO cmVO = gService.getGameScoreRegist(gIdx, session);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("gttVO", gttVO); //mgl_temp_teamgroup 사용(비권장)
		// mv.addObject("cmVO", gttVO);	//mgl_club_match 사용(권장)
		mv.setViewName("game/gameScoreRegist");
		return mv;
	}*/
	/*
	 * 게임등록화면 호출
	*/
	@RequestMapping("/Game/GameRegist.techni")
	public ModelAndView gameRegist(HttpSession session, ModelAndView mv){
		// 게임대기는 MGL_ATTEND_STATUS 컬럼에서 G GAME-READY / A ATTEND / R REST 로 구분
		// 출석하기 DEFAULT = A
		// 출석된 회원들 불러오기
		ArrayList canDoGameList = null;
		// 출석된 회원중 게임등록불가(게임대기/휴식중) 회원 불러오기
		ArrayList dontGameList = null;
		
		try{
			canDoGameList = gService.getGameRegist(session, "A");			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		try{
			dontGameList = gService.getGameRegist(session, "G");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		mv.addObject("CANDOLIST", canDoGameList);
		mv.addObject("DONTLIST", dontGameList);
		mv.setViewName("game/gameRegist");
		return mv;
	}
	/*
	 * 게임등록화면 >> 게임등록 액션
	*/
	@RequestMapping("/Game/GameRegistProc.techni")
	public ModelAndView gameRegistProc(HttpSession session, ModelAndView mv, ServletRequest req){
		String a_1 = (String) req.getParameter("a_1");
		String a_2 = (String) req.getParameter("a_2");
		String b_1 = (String) req.getParameter("b_1");
		String b_2 = (String) req.getParameter("b_2");
		String date = (String) req.getParameter("date");
		
		HashMap map = new HashMap();
		map.put("U_1", a_1);
		map.put("U_2", a_2);
		map.put("U_3", b_1);
		map.put("U_4", b_2);
		map.put("TEMPYN", "Y");
		map.put("DATE", date.replace(".", "-"));
		try{
			// set 작업을 두번함, service단(attend 수정, match 등록) 처리 
			gService.setMultiGameRegist(session, map);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		RedirectView rv = new RedirectView();
		rv.setUrl("/Game/GameStateInfo.techni");
		mv.addObject("matchDate", date.replace(".", "-"));
		mv.setView(rv);
		return mv;
	}
	
	// 출석화면 처리
	/*@RequestMapping("/Game/GameAttend.techni")
	public ModelAndView gameAttend(HttpSession session, ModelAndView mv){
		
		ArrayList attendMemberDataList = null;
		ArrayList<MemberVO> memberDataList = null;
		int mCnt = 0;
		int aCnt = 0;
		try{
			//--------------------------------------------------------------------------화면 상단 출력
			attendMemberDataList = gService.getAttendMemberList(session);
			aCnt = attendMemberDataList.size();	// 출석한 회원수
			//--------------------------------------------------------------------------화면 하단 출력
			//이것은 단일클럽의 회원들의 정보를 가지고 온다// 그래서 mService로...
			memberDataList = mService.getMemberList(session);
			mCnt = memberDataList.size();		//전체 회원수
		}catch(Exception e){
			e.printStackTrace();
		}
		mv.addObject("ACNT", aCnt);
		mv.addObject("MCNT", mCnt);		
		mv.addObject("MEMBERLIST", memberDataList);
		mv.addObject("ATTENDLIST", attendMemberDataList);
		mv.setViewName("game/gameAttend");
		return mv;
	}*/
	/*
	 * 게임하자 >> 게임준비 버튼 클릭시 
	 * 로그인한 회원에게 '출석 확인했습니다.’ 메시지와 함께 
         출석확인 목록에 게임가능 회원으로 등록됨
        (출석확인 페이지로 이동)
	*/
	@RequestMapping("/Game/GameMemberAttend.techni")
	public ModelAndView setGameMemberAttend(ModelAndView mv){
		
		RedirectView rv = new RedirectView();
		rv.setUrl("/Game/GameAttend.techni");
		mv.setView(rv);
		return mv;
	}
	/*
	 * 출석화인 >> 출석등록 버튼 클릭시
	*/
	@RequestMapping("/Ajax/AJax4GameAttend.techni")
	public void setAjax4GameAttend(HttpSession session, ServletRequest req, ModelAndView mv){
		try{
			String uId = req.getParameter("uId");
			String today = req.getParameter("today");
			
			gService.setGameMemberAttend(uId, today, session);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		//RedirectView rv = new RedirectView();
		//rv.setUrl("/Game/GameAttend.techni");
		//mv.setView(rv);
		//mv.setViewName("ajax/attendMemberForUClub");
		//return mv;
	}
	/*
	 * 자체게임> 진행중 리스트
	*/
	@RequestMapping("/Game/GameSelfMatchIngList.techni")
	public String getGameSelfMatchIngList(){
		return "game/gameSelfMatchIngList";
	}
	/*
	 * 자체게임> 예정 리스트
	*/
	@RequestMapping("/Game/GameSelfMatchPreList.techni")
	public String getGameSelfMatchPreList(){
		return "game/gameSelfMatchPreList";
	}
	/*
	 * 자체게임> 종료된 리스트
	*/
	@RequestMapping("/Game/GameSelfMatchLastList.techni")
	public String getGameSelfMatchLastList(){
		return "game/gameSelfMatchLastList";
	}
	/*
	 * 자체게임> 과거대회목록 > 청백전
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteDetail.techni")
	public String getGameSelfMatchBlueAndWhiteDetail(){
		return "game/gameSelfMatchBlueAndWhiteDetail";
	}
	/*
	 * 자체게임> 과거대회목록 > 청백전 검색
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteDetailSearch.techni")
	public String getGameSelfMatchBlueAndWhiteDetailSearch(){
		return "game/gameSelfMatchBlueAndWhiteDetailSearch";
	}
	/*
	 * 자체게임> 청백전 > 조별(종목, 환경설정)
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteEnvir.techni")
	public String getGameSelfMatchBlueAndWhiteEnvir(){
		return "game/gameSelfMatchBlueAndWhiteEnvir";
	}
	/*
	 * 자체게임> 청백전 > 선수구분
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhitePlayerDiv.techni")
	public String getGameSelfMatchBlueAndWhitePlayerDiv(){
		return "game/gameSelfMatchBlueAndWhitePlayerDiv";
	}
	/*
	 * 자체게임> 청백전 > 출전신청
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteEntry.techni")
	public String getGameSelfMatchBlueAndWhiteEntry(){
		return "game/gameSelfMatchBlueAndWhiteEntry";
	}
	/*
	 * 자체게임> 청백전 > 대진표(대진환경)
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteMap.techni")
	public String getGameSelfMatchBlueAndWhiteMap(){
		return "game/gameSelfMatchBlueAndWhiteMap";
	}
	/*
	 * 자체게임> 청백전 > 대진표(대진생성)
	*/
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteMap2.techni")
	public String getGameSelfMatchBlueAndWhiteMap2(){
		return "game/gameSelfMatchBlueAndWhiteMap2";
	}
	/*
	 * 자체게임> 과거대회목록 > 개인리그전
	*/
	@RequestMapping("/Game/GameSelfMatchPersonalDetail.techni")
	public String getGameSelfMatchPersonalDetail(){
		return "game/gameSelfMatchPersonalDetail";
	}
	/*
	 * 자체게임> 과거대회목록 > 개인리그전 검색
	*/
	@RequestMapping("/Game/GameSelfMatchPersonalDetailSearch.techni")
	public String getGameSelfMatchPersonalDetailSearch(){
		return "game/gameSelfMatchPersonalDetailSearch";
	}
	/*
	 * 자체게임> 리그개인전 > 조별 환경설정
	*/
	@RequestMapping("/Game/GameSelfMatchPersonalEnvir.techni")
	public String getGameSelfMatchPersonalEnvir(){
		return "game/gameSelfMatchPersonalEnvir";
	}
	/*
	 * 자체게임> 리그개인전 > 선수구분
	*/
	@RequestMapping("/Game/GameSelfMatchPersonalPlayerDiv.techni")
	public String getGameSelfMatchPersonalPlayerDiv(){
		return "game/gameSelfMatchPersonalPlayerDiv";
	}
	/*
	 * 자체게임> 리그개인전 > 대진표(대진환경)
	*/
	@RequestMapping("/Game/GameSelfMatchPersonalMap.techni")
	public String getGameSelfMatchPersonalMap(){
		return "game/gameSelfMatchPersonalMap";
	}
	/*
	 * 자체게임> 리그개인전 > 대진표(대진생성)
	*/
	@RequestMapping("/Game/GameSelfMatchPersonalMap2.techni")
	public String getGameSelfMatchPersonalMap2(){
		return "game/gameSelfMatchPersonalMap2";
	}
	/*
	 * 자체게임> 등록 화면호출
	*/
	@RequestMapping("/Game/GameSelfMatchWrite.techni")
	public String getGameSelfMatchWrite(){
		return "cFight/cFightInsert";
	}
	/*
	 * 자체게임> 등록 액션처리
	*/
	@RequestMapping("/Game/GameSelfMatchWriteAct.techni")
	public String getGameSelfMatchWriteAct(){
		return "location-href='/game/gameSelfMatchView'";
	}
	/*
	 * 자체게임> 보기
	*/
	@RequestMapping("/Game/GameSelfMatchView.techni")
	public String getGameSelfMatchView(){
		return "game/gameSelfMatchView";
	}
	/*
	 * 자체게임> 출석 화면
	*/
	@RequestMapping("/Game/GameSelfMatchAttend.techni")
	public String getGameSelfMatchAttend(){
		return "game/gameSelfMatchAttend";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}