package com.techni.mgl.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.techni.mgl.domain.CfightVO;
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

	// 게임등록
	@RequestMapping("/Game/GameInsert.techni")
	@ResponseBody
	public Map<Object, Object> gameInsert(HttpSession session, Model mode, @RequestBody String json)
			throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String, String> map2 = new HashMap<String, String>();
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		MemberVO login = (MemberVO) session.getAttribute("login");

		String cm_a1_id = (String) json2.get("cm_a1_id");
		String cm_a2_id = (String) json2.get("cm_a2_id");
		String cm_b1_id = (String) json2.get("cm_b1_id");
		String cm_b2_id = (String) json2.get("cm_b2_id");

		List<String> list = new ArrayList<String>();

		if (!cm_a1_id.equals(login.getM_id())) {
			list.add(cm_a1_id);
		} else if (!cm_a2_id.equals(login.getM_id())) {
			list.add(cm_a2_id);
		} else if (!cm_b1_id.equals(login.getM_id())) {
			list.add(cm_b1_id);
		} else if (!cm_b2_id.equals(login.getM_id())) {
			list.add(cm_b2_id);
		}

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
		String[] cm_sa = sa.split(",");

		String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

		if (gc < cm_sa.length) {
			cmVO.setCm_status("게임");
			cmVO.setCm_order(Integer.parseInt(cm_sa[gc]));
			cmVO.setCm_start(curTime);
			System.out.println(cm_sa[gc]);
			map2.put("u_status", "게임중");
		} else {
			cmVO.setCm_status("대기");
			cmVO.setCm_order(wc + 1);
			cmVO.setCm_start(null);
			System.out.println(wc + 1);
			map2.put("u_status", "게임대기");
		}

		int res = gService.clubGameSet(cmVO, map2);

		if (res > 0) {
			Map<String, Object> param = new HashMap<String, Object>();

			param.put("list", list);
			param.put("c_idx", c_idx);
			param.put("c_nm", ucService.club_nm(c_idx));
			param.put("al_division", "클럽게임");
			param.put("al_url", "/Game/GameState.techni");

			mService.alarmInsert(session, param);

			map.put("cnt", 1);
			map.put("m", "test");

			return map;
		} else {
			map.put("cnt", 0);

			return map;
		}

	}

	// 게임 현황판
	@RequestMapping("/Game/GameState.techni")
	public String gameState(Model model, HttpSession session) {

		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";

		List<ClubMatchVO> list = gService.gameingList(c_idx);
		List<ClubMatchVO> list2 = gService.waitingList(c_idx);

		List<UClubVO> uvo2 = ucService.attendY(c_idx);

		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
				System.out.println("ustatus" + u_status);
			}

		}

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("u_status", u_status);

		return "game/gameStateInfo.pag";
	}

	// 점수 버튼을 누르면 현재 게임중인 게임과 대기중인 게임이 업데이트
	@RequestMapping("/Game/GameScoreRegist.techni")
	@ResponseBody
	public Map<Object, Object> gameScoreRegist(Model model, HttpSession session, @RequestBody String json)
			throws ParseException {

		Map<String, String> map = new HashMap<String, String>();
		Map<Object, Object> map2 = new HashMap<Object, Object>();
		Map<String, String> map3 = new HashMap<String, String>();
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

		map3.put("cm_a1_id", cm_a1_id);
		map3.put("cm_a2_id", cm_a2_id);
		map3.put("cm_b1_id", cm_b1_id);
		map3.put("cm_b2_id", cm_b2_id);
		map3.put("c_idx", c_idx);
		map3.put("u_status", "게임가능");

		String id[] = { cm_a1_id, cm_a2_id, cm_b1_id, cm_b2_id };

		res = gService.gameEndUpdate(c_gidx, c_idx, id, Integer.parseInt(cm_order), map3);

		if (res > 0) {

			/*
			 * if(wc>0){ int res2 = gService.gameWaitUpdate(map); if(res2>0){
			 * map2.put("cnt", 1);
			 * 
			 * return map2; } }
			 */
			map2.put("cnt", 1);

			return map2;
		} else {

			map2.put("cnt", 0);

			return map2;
		}

	}

	// 대기명단 위치변경
	@RequestMapping("/Game/ChangeW.techni")
	@ResponseBody
	public Map<Object, Object> changeW(Model model, HttpSession session, @RequestBody String json)
			throws ParseException {
		Map<String, String> map = new HashMap<String, String>();
		Map<Object, Object> map1 = new HashMap<Object, Object>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String c_gidx = (String) json2.get("c_gidx");
		String c_gidx_c = (String) json2.get("c_gidx_c");

		map.put("c_gidx", c_gidx);
		map.put("c_gidx_c", c_gidx_c);

		int res = gService.changeW(map);

		if (res > 0) {
			map1.put("cnt", 1);
		} else {
			map1.put("cnt", 0);
		}

		return map1;
	}

	// 대기명단 삭제
	@RequestMapping("/Game/DeleteW.techni")
	@ResponseBody
	public Map<Object, Object> deleteW(HttpSession session, @RequestBody String json) throws ParseException {

		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String, String> map1 = new HashMap<String, String>();

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

		int res = gService.deleteW(c_gidx, map1);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	@RequestMapping("/Game/GameScoreRegistForm.techni")
	public String gameScoreRegistForm(Model model, HttpSession session, @RequestParam String c_gidx) {

		ClubMatchVO cmvo = gService.scoreInsertForm(c_gidx);

		model.addAttribute("cmvo", cmvo);

		return "game/gameScoreRegist.pag";
	}

	@RequestMapping("/Game/GameScoreInsert.techni")
	@ResponseBody
	public Map<Object, Object> gameScoreInsert(Model model, HttpSession session, @RequestBody String json)
			throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String, String> map2 = new HashMap<String, String>();

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
		System.out.println(cm_a1_id + "  " + cm_a2_id + " " + cm_b1_id + " " + cm_b2_id);
		String id[] = { cm_a1_id, cm_a2_id, cm_b1_id, cm_b2_id };
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
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getU_sex().equals("M")) {
				hon++;
			}
		}
		System.out.println("hon" + hon);

		double Tgr = 0.0;
		for (int i = 0; i < list.size(); i++) {
			double gr = 0;
			if (hon != 0 || hon != 4) {
				switch (list.get(i).getU_sex()) {
				case "F":
					gr = gr + 0.5;
					break;
				default:
					break;
				}
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getU_sex() + "   공력  : " + gr);
			if (list.get(i).getU_club_gd() == null) {
				list.get(i).setU_club_gd("왕초");
			}
			switch (list.get(i).getU_club_gd()) {
			case "S":
				gr = gr + 0;
				break;
			case "자강":
				gr = gr + 0;
				break;
			case "A":
				gr = gr + 1;
				break;
			case "B":
				gr = gr + 3;
				break;
			case "C":
				gr = gr + 5;
				break;
			case "D":
				gr = gr + 7;
				break;
			case "초심":
				gr = gr + 9;
				break;
			case "왕초":
				gr = gr + 10;
				break;
			case "무급":
				gr = gr + 10;
				break;
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getU_sex() + "급수 :  " + list.get(i).getU_club_gd()
					+ "   공력  : " + gr);
			double age2 = Math.floor(list.get(i).getU_age() / 5) * 5;
			int age = (int) age2;
			String ageG = age + "대";
			System.out.println(i + "  :  " + ageG);
			list.get(i).setU_ageG(ageG);
			switch (ageG) {
			case "0대":
				gr = gr + 1;
				break;
			case "5대":
				gr = gr + 1;
				break;
			case "10대":
				gr = gr + 1;
				break;
			case "15대":
				gr = gr + 1;
				break;
			case "20대":
				gr = gr + 1;
				break;
			case "25대":
				gr = gr + 2;
				break;
			case "30대":
				gr = gr + 3;
				break;
			case "35대":
				gr = gr + 4;
				break;
			case "40대":
				gr = gr + 5;
				break;
			case "45대":
				gr = gr + 6;
				break;
			case "50대":
				gr = gr + 7;
				break;
			case "55대":
				gr = gr + 8;
				break;
			case "60대":
				gr = gr + 9;
				break;
			case "65대":
				gr = gr + 9;
				break;
			case "70대":
				gr = gr + 10;
				break;
			case "75대":
				gr = gr + 10;
				break;
			case "80대":
				gr = gr + 10;
				break;
			default:
				gr = gr + 0;
				break;
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getU_sex() + "급수 :  " + list.get(i).getU_club_gd()
					+ "  나이대  :" + ageG + "대" + "공력  : " + gr);

			if (hon != 0 && hon != 4) {
				gr = gr / (double) 3;
			} else {
				gr = gr / (double) 2;
			}
			list.get(i).setU_gr(Math.round(gr * 100d) / 100d);

			Tgr = Tgr + gr;

		}
		System.out.println("총공력 : " + Tgr);
		System.out.println(list.get(0).getU_id() + " 의 손실공력은 " + list.get(0).getU_gr() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(0).getU_gr() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(1).getU_id() + " 의 손실공력은 " + list.get(1).getU_gr() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(1).getU_gr() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(2).getU_id() + " 의 손실공력은 " + list.get(2).getU_gr() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(2).getU_gr() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(3).getU_id() + " 의 손실공력은 " + list.get(3).getU_gr() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(3).getU_gr() / Tgr) * 10) * 100d) / 100d);

		int totalP;
		String aWin = "";
		String bWin = "";
		if (aS > bS) {
			list.get(0).setCm_vp(1.0);
			list.get(1).setCm_vp(1.0);
			list.get(2).setCm_vp(0.0);
			list.get(3).setCm_vp(0.0);
			totalP = aS * 2;
			aWin = "승";
			bWin = "패";
		} else {
			list.get(0).setCm_vp(0.0);
			list.get(1).setCm_vp(0.0);
			list.get(2).setCm_vp(1.0);
			list.get(3).setCm_vp(1.0);
			totalP = bS * 2;
			aWin = "패";
			bWin = "승";
		}

		double a_pp = Math.round((aS / (double) (totalP)) * 100d) / 100d;
		System.out.println(a_pp);
		double b_pp = Math.round((bS / (double) (totalP)) * 100d) / 100d;
		System.out.println(b_pp);
		for (int i = 0; i < 2; i++) {
			list.get(i).setCm_pp(a_pp);
			list.get(i).setCm_gp(Math.round(((list.get(i).getU_gr() / Tgr) * 10) * 100d) / 100d);
			list.get(i).setCm_ap(
					Math.round(((list.get(i).getU_gr() / Tgr) * 10) * 100d) / 100d + a_pp + list.get(i).getCm_vp());
			list.get(i).setCm_total(aS);
			list.get(i).setCm_sc_gap(aS - bS);
			list.get(i).setCm_win(aWin);
		}
		for (int i = 2; i < 4; i++) {
			list.get(i).setCm_pp(b_pp);
			list.get(i).setCm_gp(Math.round(((list.get(i).getU_gr() / Tgr) * 10) * 100d) / 100d);
			list.get(i).setCm_ap(
					Math.round(((list.get(i).getU_gr() / Tgr) * 10) * 100d) / 100d + b_pp + list.get(i).getCm_vp());
			list.get(i).setCm_total(bS);
			list.get(i).setCm_sc_gap(bS - aS);
			list.get(i).setCm_win(bWin);
		}
		int res = 0;
		for (ClubMatchVO cmvo : list) {
			cmvo.setU_id(id[j]);
			cmvo.setC_gidx(c_gidx);
			System.out.println(cmvo.getU_id());
			res = gService.clubMatchPointInsert(cmvo);
			j++;
		}

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	@RequestMapping("/Game/GameResult.techni")
	public String gameResult(Model model, HttpSession session, @RequestParam String c_gidx) {
		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", (String) session.getAttribute("c_idx"));
		map.put("c_gidx", c_gidx);
		List<ClubMatchVO> list = gService.gameResult(map);
		System.out.println(list);

		model.addAttribute("list", list);

		return "game/gameResult.pag";
	}

	@RequestMapping("/Game/EndGame.techni")
	public String endGame(Model model, HttpSession session, @RequestParam(required = false) String cm_ymd) {

		Map<String, String> map = new HashMap<String, String>();

		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";

		if (cm_ymd == null || cm_ymd == "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Calendar c1 = Calendar.getInstance();

			cm_ymd = sdf.format(c1.getTime());
			System.out.println("today" + cm_ymd);
		}

		map.put("c_idx", c_idx);
		map.put("cm_ymd", cm_ymd);

		List<ClubMatchVO> list = gService.endGameGidx(map);
		List<List<ClubMatchVO>> list2 = new ArrayList<List<ClubMatchVO>>();
		System.out.println("list  :  " + list);
		for (ClubMatchVO cmvo : list) {
			String j = cmvo.getC_gidx();
			map.remove("c_gidx");
			map.put("c_gidx", j);
			list2.add(gService.gameResult(map));
		}

		List<UClubVO> uvo2 = ucService.attendY(c_idx);
		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
				System.out.println("ustatus" + u_status);
			}

		}

		System.out.println("list2  :  " + list2);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("cm_ymd", cm_ymd);
		System.out.println("씨엠와엠디" + cm_ymd);
		model.addAttribute("u_status", u_status);

		return "game/gameStateInfoEnd.pag";
	}

	// 포인트 요약
	@RequestMapping("/Game/PointDetail.techni")
	public String pointDetail(Model model, HttpSession session, @RequestParam(required = false) String ym) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String c_idx = (String) session.getAttribute("c_idx");

		SimpleDateFormat formatter = new SimpleDateFormat("yyMM");
		Date currentTime = new Date();

		if (ym == null) {
			ym = formatter.format(currentTime);
		}

		Map<String, String> map = new HashMap<String, String>();

		map.put("u_id", u_id);
		map.put("c_idx", c_idx);
		map.put("ym", ym);

		List<ClubMatchVO> list = gService.pointDetail(map);

		model.addAttribute("list", list);

		return "uclub/uClubMemberPoint.page";
	}

	// 포인트 총합
	@RequestMapping("/Game/PointDetailAll.techni")
	public String pointDetailAll(Model model, HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String c_idx = (String) session.getAttribute("c_idx");

		Map<String, String> map = new HashMap<String, String>();

		map.put("u_id", u_id);
		map.put("c_idx", c_idx);

		List<ClubMatchVO> list = gService.pointDetailAll(map);

		model.addAttribute("list", list);

		return "uclub/uClubMemberPoint.page";
	}

	// 팀리그 등록
	@RequestMapping("/Game/TeamLeagueInsert.techni")
	@ResponseBody
	public Map<Object, Object> teamLeageInsert(HttpSession session, @RequestBody String json) throws ParseException {

		Map<Object, Object> map = new HashMap<Object, Object>();

		JSONParser parser = new JSONParser();
		JSONArray json2 = (JSONArray) parser.parse(json);

		String c_idx = (String) session.getAttribute("c_idx");

		ClubMatchVO cmVO = gService.clubUseCourt(c_idx);

		List<Object> list = new ArrayList<Object>();
		List<Object> InsertList = new ArrayList<Object>();
		List<String> list2 = new ArrayList<String>();
		for (int i = 0; i < json2.size(); i++) {
			JSONObject j = (JSONObject) json2.get(i);
			String u = "a" + i;
			String arr = j.get(u).toString().replace("[", "").replace("]", "").replace("\"", "");
			Object array[] = arr.split(",");
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("cm_a1_id", array[0].toString());
			map3.put("cm_a2_id", array[1].toString());
			list.add(map3);
			list2.add(array[0].toString());
			list2.add(array[1].toString());
		}
		String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		System.out.println(list);
		System.out.println(list.size());
		int k = 0;
		for (int i = 0; i < list.size() - 1; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) list.get(i);
			for (int j = k; j <= list.size() - 1; j++) {
				if (j != 0 && j != i) {
					Map<String, Object> newM2 = new HashMap<String, Object>();
					newM2 = (Map<String, Object>) list.get(j);
					Map<String, String> M = new HashMap<String, String>();
					M.put("cm_a1_id", (String) newM.get("cm_a1_id"));
					M.put("cm_a2_id", (String) newM.get("cm_a2_id"));
					M.put("cm_b1_id", (String) newM2.get("cm_a1_id"));
					M.put("cm_b2_id", (String) newM2.get("cm_a2_id"));
					M.put("c_idx", c_idx);
					cmVO.setC_idx(c_idx);
					cmVO.setCm_a1_id((String) newM.get("cm_a1_id"));
					cmVO.setCm_a2_id((String) newM.get("cm_a2_id"));
					cmVO.setCm_b1_id((String) newM2.get("cm_a1_id"));
					cmVO.setCm_b2_id((String) newM2.get("cm_a2_id"));
					cmVO.setCm_status("게임");
					cmVO.setCm_start(curTime);
					M.put("u_status", "게임중");
					int res = gService.clubGameSet(cmVO, M);
					if (res == 0) {

						map.put("cnt", 0);

						return map;
					} else {
						Map<String, Object> param = new HashMap<String, Object>();
						param.put("list", list2);
						param.put("al_division", "클럽게임");
						param.put("al_url", "/Game/GameState.techni");
						param.put("c_idx", c_idx);
						param.put("c_nm", ucService.club_nm(c_idx));

						mService.alarmInsert(session, param);
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

	// 개인리그등록
	@RequestMapping("/Game/PrivateLeagueInsert.techni")
	@ResponseBody
	public Map<Object, Object> privateLeageInsert(HttpSession session, @RequestBody String json) throws ParseException {
		Map<Object, Object> map2 = new HashMap<Object, Object>();
		Map<String, Object> param = new HashMap<String, Object>();

		MemberVO mvo = (MemberVO) session.getAttribute("login");

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		String user_id = (String) json2.get("user_id");
		String private_no = (String) json2.get("private_no");
		String[] arr = user_id.split(",");

		ArrayList<String> list = new ArrayList<>(Arrays.asList(arr));
		System.out.println(list.toString());
		param.put("c_idx", session.getAttribute("c_idx").toString());
		param.put("list", list);
		param.put("al_division", "클럽게임");
		param.put("al_send", mvo.getM_id());
		param.put("al_url", "/Game/GameState.techni");
		param.put("c_nm", ucService.club_nm(session.getAttribute("c_idx").toString()));

		List<Object> teamList = new ArrayList<Object>();

		List<Object> tList = new ArrayList<Object>();

		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				Map<String, String> map = new HashMap<String, String>();
				System.out.println(arr[i] + "," + arr[j]);
				System.out.println(i + "," + j);
				map.put("team1", arr[i]);
				map.put("team2", arr[j]);
				teamList.add(map);
			}
		}

		int e = 0;
		for (;;) {
			String[] ar = new String[arr.length * Integer.parseInt(private_no)];
			int v = 0;
			int p = 0;
			int q = 0;
			if (e == 1) {
				break;
			} else {

				tList.clear();

				Collections.shuffle(teamList);

				for (int i = 0; i < teamList.size(); i++) {
					int count = 0;
					int count_1 = 0;
					int count_2 = 0;
					int count_3 = 0;

					Map<String, Object> newM = new HashMap<String, Object>();
					newM = (Map<String, Object>) teamList.get(i - q);

					Map<String, Object> newM2 = new HashMap<String, Object>();
					newM2 = (Map<String, Object>) teamList.get(teamList.size() - i - 1 + p);

					String team1 = (String) newM.get("team1");
					String team2 = (String) newM.get("team2");

					String team1_1 = (String) newM2.get("team1");
					String team2_1 = (String) newM2.get("team2");

					int a = 0;
					int b = 0;

					for (int j = 0; j < ar.length; j++) {
						if (ar[j] != null) {
							if (ar[j].equals(team1)) {
								count++;
							}
							if (ar[j].equals(team2)) {
								count_1++;
							}
						}
					}

					if (team2 != team1_1 && team2 != team2_1 && team1 != team1_1 && team1 != team2_1
							&& count < Integer.parseInt(private_no) && count_1 < Integer.parseInt(private_no)) {
						ar[v] = team1;
						ar[v + 1] = team2;
						a = 1;
					}
					for (int j = 0; j < ar.length; j++) {
						if (ar[j] != null) {
							if (ar[j].equals(team1_1)) {
								count_2++;
							}
							if (ar[j].equals(team2_1)) {
								count_3++;
							}
						}
					}
					if (team1_1 != team2 && team1_1 != team2 && team2_1 != team1 && team2_1 != team2
							&& count_2 < Integer.parseInt(private_no) && count_3 < Integer.parseInt(private_no)) {
						ar[v + 2] = team1_1;
						ar[v + 3] = team2_1;
						b = 1;
					}

					if (count >= Integer.parseInt(private_no) || count_1 >= Integer.parseInt(private_no)) {
						if (count_2 < Integer.parseInt(private_no) && count_3 < Integer.parseInt(private_no)) {
							p++;
						}

					}

					if (count_2 >= Integer.parseInt(private_no) || count_3 >= Integer.parseInt(private_no)) {
						if (count < Integer.parseInt(private_no) || count_1 < Integer.parseInt(private_no)) {
							q++;
						}
					}

					if (a == 1 && b == 1) {
						tList.add(newM);
						tList.add(newM2);
						v = v + 4;
					} else if (a == 1 && b == 0) {
						ar[v] = "";
						ar[v + 1] = "";
					} else if (a == 0 && b == 1) {
						ar[v + 2] = "";
						ar[v + 3] = "";
					}

					if (tList.size() / 2 == arr.length * Integer.parseInt(private_no) / 4 && tList.size() > 1) {
						e = 1;
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
		System.out.println("팀의수 : " + tList.size());
		System.out.println("총인원수*게임수 : " + arr.length * Integer.parseInt(private_no));

		String c_idx = (String) session.getAttribute("c_idx");

		ClubMatchVO cmVO = gService.clubUseCourt(c_idx);

		int res = 0;
		String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		for (int i = 0; i < tList.size(); i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) tList.get(i);
			i++;
			Map<String, Object> newM2 = new HashMap<String, Object>();
			newM2 = (Map<String, Object>) tList.get(i);
			Map<String, String> M = new HashMap<String, String>();
			M.put("cm_a1_id", (String) newM.get("team1"));
			M.put("cm_a2_id", (String) newM.get("team2"));
			M.put("cm_b1_id", (String) newM2.get("team1"));
			M.put("cm_b2_id", (String) newM2.get("team2"));
			M.put("c_idx", c_idx);
			cmVO.setC_idx(c_idx);
			cmVO.setCm_a1_id((String) newM.get("team1"));
			cmVO.setCm_a2_id((String) newM.get("team2"));
			cmVO.setCm_b1_id((String) newM2.get("team1"));
			cmVO.setCm_b2_id((String) newM2.get("team2"));
			cmVO.setCm_status("게임");
			cmVO.setCm_start(curTime);
			M.put("u_status", "게임중");
			res += gService.clubGameSet(cmVO, M);

		}

		if (res == 0) {

			map2.put("cnt", 0);

			return map2;
		} else {
			mService.alarmInsert(session, param);
			map2.put("cnt", 1);
		}

		return map2;
	}

	@RequestMapping("/Game/GameTodayRank.techni")
	public String gameTodayRank(Model model, HttpSession session, @RequestParam(required = false) String cm_ymd) {
		Map<String, String> map = new HashMap<String, String>();

		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";

		if (cm_ymd == null || cm_ymd == "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Calendar c1 = Calendar.getInstance();

			cm_ymd = sdf.format(c1.getTime());
			System.out.println("today" + cm_ymd);
		}

		map.put("c_idx", c_idx);
		map.put("cm_ymd", cm_ymd);

		List<UClubVO> list = ucService.todayRank(map);

		List<UClubVO> uvo2 = ucService.attendY(c_idx);
		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
				System.out.println("ustatus" + u_status);
			}

		}

		model.addAttribute("cm_ymd", cm_ymd);
		model.addAttribute("u_status", u_status);
		model.addAttribute("list", list);

		return "game/gameTodayRank.pag";
	}

	@RequestMapping("/Game/GameSelfMatchInsert.techni")
	public String gameSelfMatchInsert() {
		return "game/gameSelfMatch.pag";
	}

	@RequestMapping("Game/selfMatchInsert.techni")
	@ResponseBody
	public Map<Object, Object> cFightInsert(HttpSession session, ServletRequest req) {
		Map<Object, Object> map = new HashMap<Object, Object>();

		Map<String, String> map1 = new HashMap<String, String>();

		map1.put("cs_location", req.getParameter("cs_location"));
		map1.put("cs_start", req.getParameter("cs_start"));
		map1.put("cs_end", req.getParameter("cs_end"));
		map1.put("cs_sTime", req.getParameter("cs_sTime1") + req.getParameter("cs_sTime2") + "00");
		map1.put("cs_eTime", req.getParameter("cs_eTime1") + req.getParameter("cs_eTime2") + "00");
		map1.put("cs_point", req.getParameter("cs_point"));
		map1.put("cs_time", req.getParameter("cs_time"));
		map1.put("cs_cnm", req.getParameter("cs_cnm"));
		map1.put("cs_court", req.getParameter("cs_court"));
		map1.put("cs_meth", req.getParameter("cs_meth"));
		map1.put("cs_content", req.getParameter("cs_body"));
		map1.put("c_idx", (String) session.getAttribute("c_idx"));
		map1.put("cs_nm", req.getParameter("cs_nm"));
		map1.put("cs_kind", req.getParameter("cs_meth"));

		System.out.println(req.getParameter("cs_eTime1"));
		int res = gService.selfMatchInsert(map1);
		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	// 자체대회 디테일 화면
	@RequestMapping("Game/selfMatchDetail.techni")
	public String selfMatchDetail(Model model, @RequestParam(required = false) String cs_idx, HttpSession session) {

		if (cs_idx == null || cs_idx.isEmpty()) {
			cs_idx = (String) session.getAttribute("cs_idx");
		}
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();

		ClubMatchVO cmvo = gService.selfMatchDetail(cs_idx);

		Map<String, String> map = new HashMap<String, String>();

		map.put("cs_idx", cs_idx);
		map.put("u_id", u_id);

		int res = gService.selfMatchJoinYN(map);

		session.setAttribute("cs_nm", cmvo.getCs_nm());
		session.setAttribute("cs_idx", cs_idx);

		if (cmvo.getCs_match_list().equals("Y") && res != 0) {

			map.put("u_id", mvo.getM_id());

			List<ClubMatchVO> mList = gService.myMatchList(map);

			model.addAttribute("list", mList);
			model.addAttribute("listYN", "Y");
			model.addAttribute("c_nm", ucService.club_nm((String) session.getAttribute("c_idx")));
			return "game/gameSelfMatchMyGame.pag";
		} else {

			model.addAttribute("list", cmvo);

			return "game/gameSelfMatchDetail.pag";
		}

	}

	// 자체대회 참석 여부
	@RequestMapping("Game/selfMatchJoin.techni")
	@ResponseBody
	public Map<Object, Object> selfMatchJoin(Model model, @RequestBody String json, HttpSession session)
			throws ParseException {

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String cs_idx = (String) json2.get("cs_idx");
		String yn = (String) json2.get("yn");
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("cs_idx", cs_idx);
		map2.put("u_id", u_id);
		map2.put("c_idx", (String) session.getAttribute("c_idx"));

		int res = 0;

		if (yn.equals("Y")) {
			res = gService.selfMatchJoin(map2);
		} else {
			res = gService.selfMatchExit(map2);
		}
		if (res == 0) {
			map.put("cnt", 0);
		} else {
			map.put("cnt", 1);
		}
		System.out.println(res);
		return map;
	}

	// 자체대회 참석(게스트)
	@RequestMapping("Game/selfMatchGuestJoin.techni")
	public Map<String, String> selfMatchGuestJoin(Model model, HttpSession session, String u_id, String u_birth,
			String u_club_gd) {
		String cs_idx = (String) session.getAttribute("cs_idx");

		Map<String, String> map = new HashMap<String, String>();

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("cs_idx", cs_idx);
		map2.put("u_id", u_id);

		return map;
	}

	// 자체대회 대리신청페이지(회원외의등급)
	@RequestMapping("Game/selfMatchRegister.techni")
	public String selfMatchRegister(Model model, HttpSession session) {
		String cs_idx = (String) session.getAttribute("cs_idx");
		String c_idx = (String) session.getAttribute("c_idx");

		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", c_idx);
		map.put("cs_idx", cs_idx);

		List<ClubMatchVO> list = gService.selfMatchJoinList(cs_idx);
		List<ClubMatchVO> list2 = gService.selfMatchClubList(map);
		int count = ucService.clubCount(c_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("count", count);
		model.addAttribute("cs_idx", cs_idx);

		return "game/gameSelfMatchRegister.pag";
	}

	// 자체대회 다중 참석
	@RequestMapping("Game/selfMatchMultiJoin.techni")
	@ResponseBody
	public Map<Object, Object> selfMatchMultiJoin(HttpSession session, @RequestBody String json) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String c_idx = (String) session.getAttribute("c_idx");

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String arr = json2.get("u_id").toString().replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
		System.out.println(arr);
		String[] ar = arr.split(",");

		String kind = (String) json2.get("kind");
		Map<Object, Object> map2 = new HashMap<Object, Object>();

		int cnt = 0;

		if (kind.equals("n")) {
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();

			for (int i = 0; i < ar.length; i++) {
				Map<String, String> map1 = new HashMap<String, String>();
				map1.put("u_id", ar[i]);
				list.add(map1);
			}

			System.out.println(list);
			map2.put("list", list);
			map2.put("c_idx", c_idx);
			map2.put("cs_idx", (String) json2.get("cs_idx"));

			cnt = gService.selfMatchMultiJoin(map2);
		} else {
			map2.put("u_id", arr);
			map2.put("cs_idx", (String) json2.get("cs_idx"));

			cnt = gService.selfMatchMultiUnJoin(map2);
		}
		map.put("cnt", cnt);

		return map;
	}

	// 자체대회 종목 등록폼
	@RequestMapping("/Game/selfMatchTypeInsertForm.techni")
	public String selfMatchTypeForm(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");
		String cs_kind = gService.selfMatchDetail(cs_idx).getCs_kind();
		model.addAttribute("cs_idx", cs_idx);
		System.out.println("cs kind : " + cs_kind);
		if (cs_kind.equals("청백전")) {
			List<ClubMatchVO> list = gService.selfMatchKindList(cs_idx);

			model.addAttribute("list", list);

			return "game/gameSelfMatchType.pag";
		} else if (cs_kind.equals("개인리그전")) {
			List<ClubMatchVO> list = gService.selfMatchKindList(cs_idx);

			model.addAttribute("list", list);
			model.addAttribute("cs_kind", cs_kind);
			return "game/gameSelfPrivateMatchType.pag";

		} else if (cs_kind.equals("팀리그전")) {
			List<ClubMatchVO> list = gService.selfMatchKindList(cs_idx);

			model.addAttribute("list", list);
			model.addAttribute("cs_kind", cs_kind);
			return "game/gameSelfPrivateMatchType.pag";
		}

		List<ClubMatchVO> list = gService.selfMatchKindList(cs_idx);

		model.addAttribute("list", list);

		return "game/gameSelfMatchType.pag";
	}

	// 자체대회(개인,팀) 종목 등록폼
	@RequestMapping("/Game/selfPrivateMatchTypeInsertForm.techni")
	public String selfPrivateMatchTypeForm(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");
		model.addAttribute("cs_idx", cs_idx);

		List<ClubMatchVO> list = gService.selfMatchKindList(cs_idx);

		model.addAttribute("list", list);

		return "game/gameSelfPrivateMatchType.pag";
	}

	// 자체대회 종목 등록
	@RequestMapping("/Game/selfMatchTypeInsert.techni")
	@ResponseBody
	public Map<String, Object> selfMatchType(@RequestBody String json) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String no = (String) json2.get("no");
		String type = (String) json2.get("type");
		String cs_idx = (String) json2.get("cs_idx");

		String[] noArr = no.split(",");
		String[] typeArr = type.split(",");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for (int i = 0; i < noArr.length; i++) {
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("no", noArr[i]);
			map1.put("type", typeArr[i]);
			list.add(map1);
		}

		map2.put("list", list);
		map2.put("cs_idx", cs_idx);

		gService.selfMatchKindDelete(cs_idx);

		int cnt = gService.selfMatchTypeInsert(map2);

		map.put("cnt", cnt);

		return map;
	}

	// 자체대회 청백 등록폼
	@RequestMapping("/Game/selfMatchWBInsertForm.techni")
	public String selfMatchWBInsertForm(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");

		List<ClubMatchVO> list = gService.selfMatchGD(cs_idx);
		List<ClubMatchVO> list2 = new ArrayList<ClubMatchVO>();
		List<ClubMatchVO> list3 = new ArrayList<ClubMatchVO>();
		for (int i = 0; i < list.size(); i++) {
			if (i == 0 || i % 2 == 0) {
				list2.add(list.get(i));
			} else {
				list3.add(list.get(i));
			}
		}
		List<ClubMatchVO> blueList = gService.selectBlueTeam(cs_idx);
		List<ClubMatchVO> whiteList = gService.selectWhiteTeam(cs_idx);
		System.out.println(list2);
		System.out.println(list3);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("cs_idx", cs_idx);
		model.addAttribute("blueList", blueList);
		model.addAttribute("whiteList", whiteList);

		return "game/gameSelfMatchWBInsert.pag";
	}

	// 자체대회 청백 등록
	@RequestMapping("/Game/selfMatchWBInsert.techni")
	@ResponseBody
	public Map<String, Object> selfMatchWBInsert(@RequestBody String json) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String blue = (String) json2.get("blueTeam");
		String white = (String) json2.get("whiteTeam");
		String cs_idx = (String) json2.get("cs_idx");

		Map<String, String> map2 = new HashMap<String, String>();
		Map<String, String> map3 = new HashMap<String, String>();

		map2.put("u_id", blue);
		map2.put("bw", "b");
		map2.put("cs_idx", cs_idx);
		map3.put("u_id", white);
		map3.put("bw", "w");
		map3.put("cs_idx", cs_idx);

		int res = gService.BWUpdate(map2);
		int res2 = gService.BWUpdate(map3);

		if (res > 0 && res2 > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	// 자체대회 팀등록 화면
	@RequestMapping("/Game/selfMatchTeamInsertForm.techni")
	public String selfMatchTeamInsertForm(String cs_kind, Model model, HttpSession session,
			@RequestParam(required = false) String cs_k_idx) {
		Map<String, String> map = new HashMap<String, String>();
		String cs_idx = (String) session.getAttribute("cs_idx");
		List<ClubMatchVO> list0 = gService.selfMatchKindList(cs_idx);

		if (cs_k_idx == null) {
			cs_k_idx = list0.get(0).getCs_k_idx();
		}

		map.put("cs_idx", cs_idx);
		map.put("cs_k_idx", cs_k_idx);

		List<ClubMatchVO> list = gService.selfMatchTeamList(map);

		List<ClubMatchVO> list2 = gService.selfMatchNotKindJoinList(map);
		ClubMatchVO list3 = gService.selfMatchGameCount(cs_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list0", list0);
		model.addAttribute("cs_k_idx", cs_k_idx);
		model.addAttribute("cs_idx", cs_idx);
		model.addAttribute("cs_kind", cs_kind);

		return "game/gameSelfMatchRegistT.pag";
	}

	// 자체대회 청팀등록 화면
	@RequestMapping("/Game/selfMatchBlueTeamInsertForm.techni")
	public String selfMatchBlueTeamInsertForm(Model model, HttpSession session,
			@RequestParam(required = false) String cs_k_idx) {
		Map<String, String> map = new HashMap<String, String>();
		String cs_idx = (String) session.getAttribute("cs_idx");
		List<ClubMatchVO> list0 = gService.selfMatchKindList(cs_idx);

		if (cs_k_idx == null) {
			cs_k_idx = list0.get(0).getCs_k_idx();
		}

		map.put("cs_idx", cs_idx);
		map.put("cs_k_idx", cs_k_idx);

		List<ClubMatchVO> blist = gService.selfMatchTeamList(map);
		List<ClubMatchVO> list = new ArrayList<ClubMatchVO>();
		List<ClubMatchVO> list2 = new ArrayList<ClubMatchVO>();

		for (ClubMatchVO cmvo : blist) {
			String bw = cmvo.getCs_t_bw();
			if (bw != null) {
				if (bw.equals("b")) {
					list.add(cmvo);
				}
			}
		}

		List<ClubMatchVO> blist2 = gService.selfMatchNotKindJoinList(map);
		for (ClubMatchVO cmvo : blist2) {
			String bw = cmvo.getCs_t_bw();
			if (bw != null) {
				if (bw.equals("b")) {
					list2.add(cmvo);
				}
			}
		}
		ClubMatchVO list3 = gService.selfMatchGameCount(cs_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list0", list0);
		model.addAttribute("cs_k_idx", cs_k_idx);
		model.addAttribute("cs_idx", cs_idx);

		return "game/gameSelfMatchRegistBlueT.pag";
	}

	// 자체대회 백팀등록 화면
	@RequestMapping("/Game/selfMatchWhiteTeamInsertForm.techni")
	public String selfMatchWhiteTeamInsertForm(Model model, HttpSession session,
			@RequestParam(required = false) String cs_k_idx) {
		Map<String, String> map = new HashMap<String, String>();
		String cs_idx = (String) session.getAttribute("cs_idx");
		List<ClubMatchVO> list0 = gService.selfMatchKindList(cs_idx);

		if (cs_k_idx == null) {
			cs_k_idx = list0.get(0).getCs_k_idx();
		}

		map.put("cs_idx", cs_idx);
		map.put("cs_k_idx", cs_k_idx);

		List<ClubMatchVO> wlist = gService.selfMatchTeamList(map);
		List<ClubMatchVO> list = new ArrayList<ClubMatchVO>();
		List<ClubMatchVO> list2 = new ArrayList<ClubMatchVO>();

		for (ClubMatchVO cmvo : wlist) {
			String bw = cmvo.getCs_t_bw();
			if (bw != null) {
				if (bw.equals("w")) {
					list.add(cmvo);
				}
			}
		}

		List<ClubMatchVO> wlist2 = gService.selfMatchNotKindJoinList(map);
		for (ClubMatchVO cmvo : wlist2) {
			String bw = cmvo.getCs_t_bw();
			if (bw != null) {
				if (bw.equals("w")) {
					list2.add(cmvo);
				}
			}
		}
		ClubMatchVO list3 = gService.selfMatchGameCount(cs_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list0", list0);
		model.addAttribute("cs_k_idx", cs_k_idx);
		model.addAttribute("cs_idx", cs_idx);

		return "game/gameSelfMatchRegistWhiteT.pag";
	}

	// 자체대회 개인등록 화면
	@RequestMapping("/Game/selfMatchPrivateInsertForm.techni")
	public String selfMatchPrivateInsertForm(String cs_kind, Model model, HttpSession session,
			@RequestParam(required = false) String cs_k_idx) {
		String cs_idx = (String) session.getAttribute("cs_idx");

		Map<String, String> map = new HashMap<String, String>();

		List<ClubMatchVO> list0 = gService.selfMatchKindList(cs_idx);

		if (cs_k_idx == null) {
			cs_k_idx = list0.get(0).getCs_k_idx();
		}

		map.put("cs_idx", cs_idx);
		map.put("cs_k_idx", cs_k_idx);

		int cs_k_count = 0;

		List<ClubMatchVO> list = gService.selfMatchPrivateList(map);

		List<ClubMatchVO> list2 = gService.selfMatchPrivateNotKindJoinList(map);

		if (!list.isEmpty()) {
			cs_k_count = list.get(0).getCs_k_count();
		}

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list0", list0);
		model.addAttribute("cs_k_idx", cs_k_idx);
		model.addAttribute("cs_idx", cs_idx);
		model.addAttribute("cs_kind", cs_kind);
		model.addAttribute("cs_k_count", cs_k_count);

		return "game/gameSelfMatchPrivateInsert.pag";
	}

	// 자체대회 개인등록
	@RequestMapping("/Game/selfMatchPrivateInsert.techni")
	@ResponseBody
	public Map<String, Object> selfMatchPrivateInser(@RequestBody String json) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		String user_id = (String) json2.get("user_id");
		String cs_k_idx = (String) json2.get("cs_k_idx");
		String cs_idx = (String) json2.get("cs_idx");
		String count = (String) json2.get("count");
		System.out.println(user_id);
		String[] arr = user_id.split(",");
		List<Object> teamList = new ArrayList<Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();

		for (int i = 0; i < arr.length; i++) {
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("u_id", arr[i]);
			teamList.add(map1);
		}
		Map<String, String> map3 = new HashMap<String, String>();

		map3.put("cs_k_idx", cs_k_idx);
		map3.put("count", count);
		map3.put("cs_idx", cs_idx);

		List<ClubMatchVO> list = gService.selfMatchPrivateList(map3);

		map2.put("cs_k_idx", cs_k_idx);
		map2.put("cs_idx", cs_idx);
		map2.put("list", teamList);
		int res2 = 0;

		int res = gService.selfMatchPrivateDelete(map2);

		if (list.isEmpty()) {
			res = 1;
		}

		if (res > 0) {
			int res3 = gService.selfMatchCount(map3);
			if (res3 > 0) {
				res2 = gService.selfMatchPrivateInsert(map2);
			}
		}

		map.put("cnt", res2);

		return map;
	}

	// 자체대회 팀등록
	@RequestMapping("/Game/selfMatchTeamInsert.techni")
	@ResponseBody
	public Map<String, Object> selfMatchTeamInsert(@RequestBody String json) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String cs_k_idx = (String) json2.get("cs_k_idx");
		String cs_idx = (String) json2.get("cs_idx");
		String u_id_a = (String) json2.get("u_id_a");
		String u_id_b = (String) json2.get("u_id_b");
		String wb = (String) json2.get("bw");

		Map<String, String> map2 = new HashMap<String, String>();

		map2.put("cs_k_idx", cs_k_idx);
		map2.put("cs_idx", cs_idx);
		map2.put("u_id_a", u_id_a);
		map2.put("u_id_b", u_id_b);
		map2.put("bw", wb);

		int res = gService.selfMatchTeamInsert(map2);

		map.put("cnt", res);

		return map;
	}

	// 자체대회 팀들삭제
	@RequestMapping("/Game/selfMatchTeamDelete.techni")
	@ResponseBody
	public Map<String, Object> selfMatchTeamDelete(@RequestBody String cs_t_idx) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println(cs_t_idx);

		int res = gService.selfMatchTeamDelete(cs_t_idx);

		map.put("cnt", res);

		return map;
	}

	// 자체대회 대진표
	@RequestMapping("/Game/selfMatchGameInsert.techni")
	public String selfMatchGameInsert(Model model, HttpSession session, @RequestParam(required = false) String kind)
			throws java.text.ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String cs_idx = (String) session.getAttribute("cs_idx");

		if (kind == null) {
			kind = gService.selfMatchDetail(cs_idx).getCs_kind();
		}

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		Map<String, Object> insertMap = new HashMap<String, Object>();
		Map<String, Object> updateMap = new HashMap<String, Object>();

		Map<String, String> map1 = new HashMap<String, String>();

		int var = 0;

		insertMap.put("list", list);
		insertMap.put("cs_idx", cs_idx);
		updateMap.put("list", list2);
		System.out.println(list2);

		String hae = "";
		List<Object> gameList = new ArrayList<Object>();
		List<ClubMatchVO> k_idx_list = gService.selfMatchKindList(cs_idx);
		if (kind.equals("청백전")) {
			for (ClubMatchVO cvo : k_idx_list) { // 종목수 만큼 반복문 돌리면된다
				Map<String, String> pMap = new HashMap<String, String>();

				pMap.put("cs_idx", cs_idx);
				pMap.put("cs_k_idx", cvo.getCs_k_idx()); // 종목인덱스를 넣자
				List<ClubMatchVO> group = gService.selfMatchTeamList(pMap);// 해당 종목에 참여한 팀리스트를 가져온다
				List<ClubMatchVO> groupB = new ArrayList<ClubMatchVO>();
				List<ClubMatchVO> groupW = new ArrayList<ClubMatchVO>();

				for (int i = 0; i < group.size(); i++) {
					String bw = group.get(i).getCs_t_bw();
					if (bw != null) {
						if (bw.equals("b")) {
							groupB.add(group.get(i));
						} else if (bw.equals("w")) {
							groupW.add(group.get(i));
						}
					}
				}

				if (groupB.size() != groupW.size()) {

					map.put("msg", "백팀과 청팀의 숫자가 맞지않습니다.");

					return "";
				}

				int g = 0;
				/* hae += cvo.getCf_t_idx()+","; */
				for (int i = 0; i < groupB.size(); i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cs_k_idx", cvo.getCs_k_idx());
					uMap.put("cs_gidx", cvo.getCs_k_idx() + "_" + g);
					uMap.put("team_a_idx", groupB.get(i).getCs_t_idx());
					uMap.put("team_a_user_a", groupB.get(i).getCs_a_id());
					uMap.put("team_a_user_b", groupB.get(i).getCs_b_id());
					uMap.put("team_b_idx", groupW.get(i).getCs_t_idx());
					uMap.put("team_b_user_a", groupW.get(i).getCs_a_id());
					uMap.put("team_b_user_b", groupW.get(i).getCs_b_id());
					gameList.add(uMap);
					g++;
				}
			}
		}
		for (ClubMatchVO cvo : k_idx_list) { // 종목수 만큼 반복문 돌리면된다
			Map<String, String> pMap = new HashMap<String, String>();

			pMap.put("cs_idx", cs_idx);
			pMap.put("cs_k_idx", cvo.getCs_k_idx()); // 종목인덱스를 넣자
			List<ClubMatchVO> group = gService.selfMatchTeamList(pMap);// 해당 종목에 참여한 팀리스트를 가져온다
			int g = 0;
			/* hae += cvo.getCf_t_idx()+","; */
			if (group.size() == 5) { // 팀수
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 10; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cs_k_idx", cvo.getCs_k_idx());
					uMap.put("cs_gidx", cvo.getCs_k_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCs_t_idx());
					uMap.put("team_a_user_a", group.get(a).getCs_a_id());
					uMap.put("team_a_user_b", group.get(a).getCs_b_id());
					uMap.put("team_b_idx", group.get(b).getCs_t_idx());
					uMap.put("team_b_user_a", group.get(b).getCs_a_id());
					uMap.put("team_b_user_b", group.get(b).getCs_b_id());
					gameList.add(uMap);
					b++;
					g++;
					if (i == group.size() - 1) {
						a = 1;
						b = 2;
					}
					if (i == group.size() - 1 + group.size() - 2) {
						a = 2;
						b = 3;
					}
					if (i == group.size() - 1 + group.size() - 2 + group.size() - 3) {
						a = 3;
						b = 4;
					}
					if (i == group.size() - 1 + group.size() - 2 + group.size() - 3 + group.size() - 4) {
						a = 4;
						b = 5;
					}
				}
			} else if (group.size() == 4) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 6; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cs_k_idx", cvo.getCs_k_idx());
					uMap.put("cs_gidx", cvo.getCs_k_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCs_t_idx());
					uMap.put("team_a_user_a", group.get(a).getCs_a_id());
					uMap.put("team_a_user_b", group.get(a).getCs_b_id());
					uMap.put("team_b_idx", group.get(b).getCs_t_idx());
					uMap.put("team_b_user_a", group.get(b).getCs_a_id());
					uMap.put("team_b_user_b", group.get(b).getCs_b_id());
					gameList.add(uMap);
					b++;
					g++;
					if (i == group.size() - 1) {
						a = 1;
						b = 2;
					}
					if (i == group.size() - 1 + group.size() - 2) {
						a = 2;
						b = 3;
					}
				}
			} else if (group.size() == 3) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 3; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cs_k_idx", cvo.getCs_k_idx());
					uMap.put("cs_gidx", cvo.getCs_k_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCs_t_idx());
					uMap.put("team_a_user_a", group.get(a).getCs_a_id());
					uMap.put("team_a_user_b", group.get(a).getCs_b_id());
					uMap.put("team_b_idx", group.get(b).getCs_t_idx());
					uMap.put("team_b_user_a", group.get(b).getCs_a_id());
					uMap.put("team_b_user_b", group.get(b).getCs_b_id());
					gameList.add(uMap);
					b++;
					g++;
					if (i == group.size() - 1) {
						a = 1;
						b = 2;
					}
				}
			} else if (group.size() == 2) {
				int a = 0;
				int b = 1;
				Map<String, String> uMap = new HashMap<String, String>();
				uMap.put("cs_k_idx", cvo.getCs_k_idx());
				uMap.put("cs_gidx", cvo.getCs_k_idx() + "_" + g);
				uMap.put("team_a_idx", group.get(a).getCs_t_idx());
				uMap.put("team_a_user_a", group.get(a).getCs_a_id());
				uMap.put("team_a_user_b", group.get(a).getCs_b_id());
				uMap.put("team_b_idx", group.get(b).getCs_t_idx());
				uMap.put("team_b_user_a", group.get(b).getCs_a_id());
				uMap.put("team_b_user_b", group.get(b).getCs_b_id());
				gameList.add(uMap);
			}
		}
		ClubMatchVO cfvo = gService.selfMatchDetail(cs_idx);
		String[] ar = new String[Integer.parseInt(cfvo.getCs_court()) * 4];
		// 배열 사이즈는 사용가능 코트수 *8
		int va = 0;
		int bl = 0;
		System.out.println("게임리스트 ㅁㄴㅇㄹ" + gameList);

		List<Object> endGameList = new ArrayList<Object>();

		for (int i = 0; i < gameList.size(); i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) gameList.get(i);
			int vv = 1;
			Map<String, String> M = new HashMap<String, String>();
			Map<String, String> M2 = new HashMap<String, String>();
			Map<String, String> M3 = new HashMap<String, String>();
			Map<String, String> M4 = new HashMap<String, String>();
			M.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M.put("cs_gidx", (String) newM.get("cs_gidx"));
			M.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M.put("cs_team_idx", (String) newM.get("team_a_idx"));
			M.put("u_id", (String) newM.get("team_a_user_a"));
			M.put("c_idx", (String) newM.get("team_a_club"));
			vv++;
			M2.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M2.put("cs_gidx", (String) newM.get("cs_gidx"));
			M2.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M2.put("cs_team_idx", (String) newM.get("team_a_idx"));
			M2.put("u_id", (String) newM.get("team_a_user_b"));
			M2.put("c_idx", (String) newM.get("team_a_club"));
			vv++;
			M3.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M3.put("cs_gidx", (String) newM.get("cs_gidx"));
			M3.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M3.put("cs_team_idx", (String) newM.get("team_b_idx"));
			M3.put("u_id", (String) newM.get("team_b_user_a"));
			M3.put("c_idx", (String) newM.get("team_b_club"));
			vv++;
			M4.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M4.put("cs_gidx", (String) newM.get("cs_gidx"));
			M4.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M4.put("cs_team_idx", (String) newM.get("team_b_idx"));
			M4.put("u_id", (String) newM.get("team_b_user_b"));
			M4.put("c_idx", (String) newM.get("team_b_club"));
			endGameList.add(M);
			endGameList.add(M2);
			endGameList.add(M3);
			endGameList.add(M4);

		}

		System.out.println("end게임" + endGameList);

		List<Object> rGameList = new ArrayList<Object>();
		for (int i = 0; i < gameList.size() + 1; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			System.out.println(i);
			newM = (Map<String, Object>) gameList.get(i);
			int jjj = 0;
			for (int jk = 0; jk < rGameList.size(); jk++) {
				Map<String, Object> nM = new HashMap<String, Object>();
				nM = (Map<String, Object>) rGameList.get(jk);
				if (nM.containsValue(newM.get("cs_gidx"))) { // rgamelist에
																// csgidx가없다면
																// jjj는1
					System.out.println("여긴어캐와");
					jjj = 1;
					break;
				}
			}
			System.out.println(Arrays.asList(ar).toString());
			System.out.println(i);
			System.out.println(gameList.size());

			if (jjj != 1 && !Arrays.asList(ar).contains((String) newM.get("team_a_user_a"))
					&& !Arrays.asList(ar).contains((String) newM.get("team_a_user_b"))
					&& !Arrays.asList(ar).contains((String) newM.get("team_b_user_a"))
					&& !Arrays.asList(ar).contains((String) newM.get("team_b_user_b"))) {
				ar[va] = (String) newM.get("team_a_user_a");
				System.out.println((String) newM.get("team_a_user_a"));
				ar[va + 1] = (String) newM.get("team_a_user_b");
				ar[va + 2] = (String) newM.get("team_b_user_a");
				ar[va + 3] = (String) newM.get("team_b_user_b");
				va = va + 4;
				System.out.println(Arrays.asList(ar).toString());
				i = -1;

				rGameList.add(newM);
				gameList.remove(newM);
				if (gameList.isEmpty()) {
					break;
				}
			} else if (i + 1 == gameList.size()) {
				System.out.println(i);
				System.out.println(gameList.size());
				ar[va] = ""; // 0 +4 = 4 4+4 = 8 8+4=12
				ar[va + 1] = "";
				ar[va + 2] = "";
				ar[va + 3] = "";
				va = va + 4;
				i = -1;
				Map<String, Object> nM = new HashMap<String, Object>();
				nM.put("cs_gidx", cs_idx + "_blank" + bl);
				nM.put("team_b_idx", null);
				nM.put("team_a_idx", null);
				nM.put("team_a_user_a", null);
				nM.put("team_a_user_b", null);
				nM.put("team_b_user_a", null);
				nM.put("team_b_user_b", null);
				nM.put("cs_g_idx", null);
				rGameList.add(nM);
				bl++;
				if (gameList.isEmpty()) {
					break;
				}
			}
			if (va == (Integer.parseInt(cfvo.getCs_court()) * 4)) {
				// 여기서 23은 ar의 배열사이즈-1(배열은0부터시작이기때문)
				// va+3==(Integer.parseInt(cfvo.getCf_court())*4)-1
				for (int j = 0; j < Integer.parseInt(cfvo.getCs_court()) * 4; j++) {
					// 여기서 반복 횟수는 사용 가능 코트수*4
					ar[j] = "";
				}
				va = 0;
			}
		}
		/*
		 * for(int ac = 0 ; ac<second.length;ac++){ for(int ad = 0 ;
		 * ad<second[ac].length;ad++){ System.out.println("2차원"+second[ac][ad]); } }
		 */
		for (int i = 0; i < rGameList.size(); i++) {
			Map<String, Object> nM = new HashMap<String, Object>();
			nM = (Map<String, Object>) rGameList.get(i);
			System.out.print(nM.get("team_a_user_a") + ",");
			System.out.print(nM.get("team_a_user_b") + ",");
			System.out.print(nM.get("team_b_user_a") + ",");
			System.out.print(nM.get("team_b_user_b") + ",");
			if (i + 1 % 4 == 0) {
				System.out.println("");
			}
		}
		System.out.println(gameList);
		System.out.println(gameList.size());
		System.out.println(rGameList);
		System.out.println(rGameList.size());

		List<Object> rGameList2 = new ArrayList<Object>();
		int ii = 0;
		int jj = 0;
		int s = (rGameList.size() / (Integer.parseInt(cfvo.getCs_court()) * 10))
				* 5;/*
					 * if((rGameList.size() / Integer.parseInt(cfvo.getCf_court())) % 2 != 0){ s=
					 * s+1; }
					 */
		for (int i = 0; i < s; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			for (int j = 0; j < Integer.parseInt(cfvo.getCs_court()); j++) {
				newM = (Map<String, Object>) rGameList.get(ii);
				rGameList2.add(newM);
				ii++;
			}
			for (int j = 0; j < Integer.parseInt(cfvo.getCs_court()); j++) {
				newM = (Map<String, Object>) rGameList.get(jj + (Integer.parseInt(cfvo.getCs_court()) * 5));
				rGameList2.add(newM);
				jj++;
				if ((jj + (Integer.parseInt(cfvo.getCs_court()) * 5))
						% (Integer.parseInt(cfvo.getCs_court()) * 10) == 0) {
					jj = jj + (Integer.parseInt(cfvo.getCs_court()) * 5);
					ii = ii + (Integer.parseInt(cfvo.getCs_court()) * 5);
					System.out.println();
				}
			}

		}
		System.out.println(rGameList2);
		System.out.println("ii=" + ii);
		System.out.println(rGameList.size() % 4);
		System.out.println(rGameList.size() - ii);
		for (int i = rGameList.size() - rGameList.size() % (Integer.parseInt(cfvo.getCs_court()) * 10); i < rGameList
				.size(); i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) rGameList.get(i);
			rGameList2.add(newM);
		}
		System.out.println("바뀐거 : " + rGameList2);

		int co = 1;
		int order = 1;
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date date = dateFormat.parse(cfvo.getCs_sTime());
		cal.setTime(date);
		for (int i = 0; i < rGameList2.size(); i++) {
			if ((co - 1) == Integer.parseInt(cfvo.getCs_court())) {
				co = 1;
				order++;
				cal.add(Calendar.MINUTE, Integer.parseInt(cfvo.getCs_time()));
			}
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) rGameList2.get(i);
			newM.put("cs_u_court", co);
			newM.put("cs_order", order);
			newM.put("cs_w_date", dateFormat.format(cal.getTime()));
			newM.put("cs_no", i + 1);
			co++;
		}
		System.out.println(rGameList2);
		System.out.println(rGameList.size());
		Map<String, Object> cf_match = new HashMap<String, Object>();

		cf_match.put("list", rGameList2);
		cf_match.put("cs_idx", cs_idx);
		cf_match.put("cs_status", "대기");

		Map<String, Object> cf_match_end = new HashMap<String, Object>();

		cf_match_end.put("list", endGameList);
		cf_match_end.put("cs_idx", cs_idx);

		int cs = gService.gameInsert(cf_match, cf_match_end);

		System.out.println(rGameList2);
		System.out.println(rGameList.size() % 4);
		System.out.println(rGameList.size());
		System.out.println(rGameList2.size());
		System.out.println(rGameList);
		System.out.println(hae);

		if (cs > 0) {
			return "redirect:/Game/selfMatchDetail.techni";
		} else {
			return "redirect:/Game/selfMatchDetail.techni";
		}

	}

	// 개인리그등록
	@RequestMapping("/Game/selfPrivateLeagueInsert.techni")
	public Map<Object, Object> selfPrivateLeageInsert(HttpSession session)
			throws ParseException, java.text.ParseException {
		String cs_idx = (String) session.getAttribute("cs_idx");

		Map<Object, Object> mapr = new HashMap<Object, Object>();

		Map<Object, Object> map2 = new HashMap<Object, Object>();

		List<ClubMatchVO> list = gService.selfMatchKindList(cs_idx);
		List<Object> allList = new ArrayList<Object>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			List<Map<String, Object>> tList = new ArrayList<Map<String, Object>>();
			int g = 0;
			map.put("cs_idx", cs_idx);
			map.put("cs_k_idx", list.get(i).getCs_k_idx());
			List<Map<String, Object>> teamList = new ArrayList<Map<String, Object>>();
			List<ClubMatchVO> list2 = gService.selfMatchPrivateList(map);
			for (int j = 0; j < list2.size(); j++) {
				for (int k = j + 1; k < list2.size(); k++) {
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("team1", list2.get(j).getU_id());
					map3.put("team2", list2.get(k).getU_id());
					map3.put("cs_k_idx", list.get(i).getCs_k_idx());
					map3.put("cs_idx", cs_idx);
					map3.put("cs_gidx", list.get(i).getCs_k_idx() + "_" + g);
					teamList.add(map3);
					g++;
				}
			}
			System.out.println(teamList);
			if (teamList.isEmpty()) {
				continue;
			}
			int e = 0;
			System.out.println("돌아라1");
			for (;;) {
				String[] ar = new String[list2.size() * list.get(i).getCs_k_count()];
				int v = 0;
				int p = 0;
				int q = 0;
				if (e == 1) {
					break;
				} else {

					tList.clear();

					Collections.shuffle(teamList);

					for (int ii = 0; ii < teamList.size(); ii++) {
						int count = 0;
						int count_1 = 0;
						int count_2 = 0;
						int count_3 = 0;

						Map<String, Object> newM = new HashMap<String, Object>();
						newM = (Map<String, Object>) teamList.get(ii - q);

						Map<String, Object> newM2 = new HashMap<String, Object>();
						newM2 = (Map<String, Object>) teamList.get(teamList.size() - ii - 1 + p);

						String team1 = (String) newM.get("team1");
						String team2 = (String) newM.get("team2");

						String team1_1 = (String) newM2.get("team1");
						String team2_1 = (String) newM2.get("team2");

						int a = 0;
						int b = 0;

						for (int j = 0; j < ar.length; j++) {
							if (ar[j] != null) {
								if (ar[j].equals(team1)) {
									count++;
								}
								if (ar[j].equals(team2)) {
									count_1++;
								}
							}
						}

						if (team2 != team1_1 && team2 != team2_1 && team1 != team1_1 && team1 != team2_1
								&& count < list.get(i).getCs_k_count() && count_1 < list.get(i).getCs_k_count()) {
							ar[v] = team1;
							ar[v + 1] = team2;
							a = 1;
						}
						for (int j = 0; j < ar.length; j++) {
							if (ar[j] != null) {
								if (ar[j].equals(team1_1)) {
									count_2++;
								}
								if (ar[j].equals(team2_1)) {
									count_3++;
								}
							}
						}
						if (team1_1 != team2 && team1_1 != team2 && team2_1 != team1 && team2_1 != team2
								&& count_2 < list.get(i).getCs_k_count() && count_3 < list.get(i).getCs_k_count()) {
							ar[v + 2] = team1_1;
							ar[v + 3] = team2_1;
							b = 1;
						}

						if (count >= list.get(i).getCs_k_count() || count_1 >= list.get(i).getCs_k_count()) {
							if (count_2 < list.get(i).getCs_k_count() && count_3 < list.get(i).getCs_k_count()) {
								p++;
							}

						}

						if (count_2 >= list.get(i).getCs_k_count() || count_3 >= list.get(i).getCs_k_count()) {
							if (count < list.get(i).getCs_k_count() || count_1 < list.get(i).getCs_k_count()) {
								q++;
							}
						}

						if (a == 1 && b == 1) {
							tList.add(newM);
							tList.add(newM2);
							v = v + 4;
						} else if (a == 1 && b == 0) {
							ar[v] = "";
							ar[v + 1] = "";
						} else if (a == 0 && b == 1) {
							ar[v + 2] = "";
							ar[v + 3] = "";
						}

						if (tList.size() / 2 == list2.size() * list.get(i).getCs_k_count() / 4 && tList.size() > 1) {
							e = 1;
							break;
						}

					}
				}

			}
			List<Map<String, Object>> tList2 = new ArrayList<Map<String, Object>>();

			for (int z = 0; z < tList.size(); z++) {
				Map<String, Object> newM = new HashMap<String, Object>();
				newM = (Map<String, Object>) tList.get(z);
				z++;
				Map<String, Object> newM2 = new HashMap<String, Object>();
				newM2 = (Map<String, Object>) tList.get(z);
				Map<String, Object> M = new HashMap<String, Object>();
				Map<String, Object> M2 = new HashMap<String, Object>();
				M2.put("u_id_a", (String) newM.get("team1"));
				M2.put("u_id_b", (String) newM.get("team2"));
				M.put("team_a_user_a", (String) newM.get("team1"));
				M.put("team_a_user_b", (String) newM.get("team2"));
				M.put("team_b_user_a", (String) newM2.get("team1"));
				M.put("team_b_user_b", (String) newM2.get("team2"));
				M.put("cs_idx", cs_idx);
				M.put("cs_k_idx", (String) newM.get("cs_k_idx"));
				M.put("cs_gidx", (String) newM.get("cs_gidx"));
				M.put("team_a_idx",
						(String) newM.get("cs_k_idx") + (String) newM.get("team1") + (String) newM.get("team2"));
				M.put("team_b_idx",
						(String) newM.get("cs_k_idx") + (String) newM2.get("team1") + (String) newM2.get("team2"));
				allList.add(M);
				tList2.add(M2);
			}
			System.out.println("돌아라1");
			System.out.println("총인원수*게임수 : " + list2.size() * list.get(i).getCs_k_count());

			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("list", tList2);
			tMap.put("cs_idx", cs_idx);
			tMap.put("cs_k_idx", list.get(i).getCs_k_idx());

			int res = gService.selfMatchTeamDelete2(list.get(i).getCs_k_idx());

			int res2 = gService.selfMatchTeamInsert2(tMap);
			if (res2 <= 0) {
				System.out.println("팀생성 실패");
			}

			/*
			 * List<Object> aList = new ArrayList<Object>(); List<Object> bList = new
			 * ArrayList<Object>();
			 * 
			 * for(int i = 0 ; i<allList.size();i++) {
			 * 
			 * Map<String,Object> m = new HashMap<String,Object>(); Map<String,Object> n =
			 * new HashMap<String,Object>(); Map<String, Object> newM2 = new HashMap<String,
			 * Object>(); newM2 = (Map<String, Object>) allList.get(i); m.put("u_id_a",
			 * (String)newM2.get("cm_a1_id")); m.put("u_id_b",
			 * (String)newM2.get("cm_a2_id")); n.put("u_id_a",
			 * (String)newM2.get("cm_b1_id")); n.put("u_id_b",
			 * (String)newM2.get("cm_b2_id")); aList.add(m); bList.add(n); }
			 * Map<String,Object> tMap = new HashMap<String,Object>(); Map<String,Object>
			 * pMap = new HashMap<String,Object>(); tMap.put("list", aList);
			 * tMap.put("cs_k_idx", list.get(i)getCs_k_idx()); tMap.put("cs_idx", cs_idx);
			 * pMap.put("list", bList); pMap.put("cs_k_idx", list.get(i)getCs_k_idx());
			 * pMap.put("cs_idx", cs_idx);
			 * 
			 * int res = gService.selfMatchTeamInsert2(tMap); int res2 =
			 * gService.selfMatchTeamInsert2(pMap);
			 */

		}

		System.out.println("총 게임 :" + allList);
		System.out.println("총게임수 : " + allList.size());

		ClubMatchVO cfvo = gService.selfMatchDetail(cs_idx);
		String[] ar = new String[Integer.parseInt(cfvo.getCs_court()) * 4];
		// 배열 사이즈는 사용가능 코트수 *8
		int va = 0;
		int bl = 0;
		System.out.println("게임리스트 ㅁㄴㅇㄹ" + allList);

		List<Object> endGameList = new ArrayList<Object>();

		for (int i = 0; i < allList.size(); i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) allList.get(i);
			int vv = 1;
			Map<String, String> M = new HashMap<String, String>();
			Map<String, String> M2 = new HashMap<String, String>();
			Map<String, String> M3 = new HashMap<String, String>();
			Map<String, String> M4 = new HashMap<String, String>();
			M.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M.put("cs_gidx", (String) newM.get("cs_gidx"));
			M.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M.put("cs_team_idx", (String) newM.get("team_a_idx"));
			M.put("u_id", (String) newM.get("team_a_user_a"));
			vv++;
			M2.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M2.put("cs_gidx", (String) newM.get("cs_gidx"));
			M2.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M2.put("cs_team_idx", (String) newM.get("team_a_idx"));
			M2.put("u_id", (String) newM.get("team_a_user_b"));
			vv++;
			M3.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M3.put("cs_gidx", (String) newM.get("cs_gidx"));
			M3.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M3.put("cs_team_idx", (String) newM.get("team_b_idx"));
			M3.put("u_id", (String) newM.get("team_b_user_a"));
			vv++;
			M4.put("cs_e_gidx", (String) newM.get("cs_gidx") + "_" + vv);
			M4.put("cs_gidx", (String) newM.get("cs_gidx"));
			M4.put("cs_k_idx", newM.get("cs_k_idx").toString());
			M4.put("cs_team_idx", (String) newM.get("team_b_idx"));
			M4.put("u_id", (String) newM.get("team_b_user_b"));
			endGameList.add(M);
			endGameList.add(M2);
			endGameList.add(M3);
			endGameList.add(M4);

		}

		System.out.println("end게임" + endGameList);

		List<Object> rGameList = new ArrayList<Object>();
		for (int i = 0; i < allList.size() + 1; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			System.out.println(i);
			newM = (Map<String, Object>) allList.get(i);
			int jjj = 0;

			System.out.println(Arrays.asList(ar).toString());
			System.out.println(i);

			if (jjj != 1 && !Arrays.asList(ar).contains((String) newM.get("team_a_user_a"))
					&& !Arrays.asList(ar).contains((String) newM.get("team_a_user_b"))
					&& !Arrays.asList(ar).contains((String) newM.get("team_b_user_a"))
					&& !Arrays.asList(ar).contains((String) newM.get("team_b_user_b"))) {
				ar[va] = (String) newM.get("team_a_user_a");
				System.out.println((String) newM.get("team_a_user_a"));
				ar[va + 1] = (String) newM.get("team_a_user_b");
				ar[va + 2] = (String) newM.get("team_b_user_a");
				ar[va + 3] = (String) newM.get("team_b_user_b");
				va = va + 4;
				System.out.println(Arrays.asList(ar).toString());
				i = -1;

				rGameList.add(newM);
				allList.remove(newM);
				if (allList.isEmpty()) {
					break;
				}
			} else if (i + 1 == allList.size()) {
				System.out.println(i);
				System.out.println(allList.size());
				ar[va] = ""; // 0 +4 = 4 4+4 = 8 8+4=12
				ar[va + 1] = "";
				ar[va + 2] = "";
				ar[va + 3] = "";
				va = va + 4;
				i = -1;
				Map<String, Object> nM = new HashMap<String, Object>();
				nM.put("cs_gidx", cs_idx + "_blank" + bl);
				nM.put("team_b_idx", null);
				nM.put("team_a_idx", null);
				nM.put("team_a_user_a", null);
				nM.put("team_a_user_b", null);
				nM.put("team_b_user_a", null);
				nM.put("team_b_user_b", null);
				nM.put("cs_g_idx", null);
				rGameList.add(nM);
				bl++;
				if (allList.isEmpty()) {
					break;
				}
			}
			if (va == (Integer.parseInt(cfvo.getCs_court()) * 4)) {
				// 여기서 23은 ar의 배열사이즈-1(배열은0부터시작이기때문)
				// va+3==(Integer.parseInt(cfvo.getCf_court())*4)-1
				for (int j = 0; j < Integer.parseInt(cfvo.getCs_court()) * 4; j++) {
					// 여기서 반복 횟수는 사용 가능 코트수*4
					ar[j] = "";
				}
				va = 0;
			}
		}

		/*
		 * for(int ac = 0 ; ac<second.length;ac++){ for(int ad = 0 ;
		 * ad<second[ac].length;ad++){ System.out.println("2차원"+second[ac][ad]); } }
		 */

		for (int i = 0; i < rGameList.size(); i++) {
			Map<String, Object> nM = new HashMap<String, Object>();
			nM = (Map<String, Object>) rGameList.get(i);
			System.out.print(nM.get("team_a_user_a") + ",");
			System.out.print(nM.get("team_a_user_b") + ",");
			System.out.print(nM.get("team_b_user_a") + ",");
			System.out.print(nM.get("team_b_user_b") + ",");
			if (i + 1 % 4 == 0) {
				System.out.println("");
			}
		}
		System.out.println(allList);
		System.out.println(allList.size());
		System.out.println(rGameList);
		System.out.println(rGameList.size());

		List<Map<String, Object>> rGameList2 = new ArrayList<Map<String, Object>>();
		int ii = 0;
		int jj = 0;
		int s = (rGameList.size() / (Integer.parseInt(cfvo.getCs_court()) * 10)) * 5;
		/*
		 * if((rGameList.size() / Integer.parseInt(cfvo.getCs_court())) % 2 != 0){ s=
		 * s+1; }
		 */
		for (int i = 0; i < s; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			for (int j = 0; j < Integer.parseInt(cfvo.getCs_court()); j++) {
				newM = (Map<String, Object>) rGameList.get(ii);
				rGameList2.add(newM);
				ii++;
			}
			for (int j = 0; j < Integer.parseInt(cfvo.getCs_court()); j++) {
				newM = (Map<String, Object>) rGameList.get(jj + (Integer.parseInt(cfvo.getCs_court()) * 5));
				rGameList2.add(newM);
				jj++;
				if ((jj + (Integer.parseInt(cfvo.getCs_court()) * 5))
						% (Integer.parseInt(cfvo.getCs_court()) * 10) == 0) {
					jj = jj + (Integer.parseInt(cfvo.getCs_court()) * 5);
					ii = ii + (Integer.parseInt(cfvo.getCs_court()) * 5);
					System.out.println();
				}
			}

		}
		System.out.println(rGameList2);
		System.out.println("ii=" + ii);
		System.out.println(rGameList.size() % 4);
		System.out.println(rGameList.size() - ii);
		for (int i = rGameList.size() - rGameList.size() % (Integer.parseInt(cfvo.getCs_court()) * 10); i < rGameList
				.size(); i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) rGameList.get(i);
			rGameList2.add(newM);
		}
		System.out.println("바뀐거 : " + rGameList2);

		int co = 1;
		int order = 1;
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date date = dateFormat.parse(cfvo.getCs_sTime());
		cal.setTime(date);
		for (int i = 0; i < rGameList2.size(); i++) {
			if ((co - 1) == Integer.parseInt(cfvo.getCs_court())) {
				co = 1;
				order++;
				cal.add(Calendar.MINUTE, Integer.parseInt(cfvo.getCs_time()));
			}
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) rGameList2.get(i);
			newM.put("cs_u_court", co);
			newM.put("cs_order", order);
			newM.put("cs_w_date", dateFormat.format(cal.getTime()));
			newM.put("cs_no", i + 1);
			co++;
		}
		System.out.println(rGameList2);
		System.out.println(rGameList.size());
		Map<String, Object> cf_match = new HashMap<String, Object>();

		cf_match.put("list", rGameList2);
		cf_match.put("cs_idx", cs_idx);
		cf_match.put("cs_status", "대기");

		Map<String, Object> cf_match_end = new HashMap<String, Object>();

		cf_match_end.put("list", endGameList);
		cf_match_end.put("cs_idx", cs_idx);

		int cs = gService.gameInsert(cf_match, cf_match_end);

		System.out.println(rGameList2);
		System.out.println(rGameList.size() % 4);
		System.out.println(rGameList.size());
		System.out.println(rGameList2.size());
		System.out.println(rGameList);

		if (cs > 0) {
			mapr.put("cnt", 1);
		} else {
			mapr.put("cnt", 0);
		}

		return mapr;
	}

	// 종목리스트
	@RequestMapping("/Game/selfMatchTypeList.techni")
	public String selfMatchKindList(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");
		Map<String, String> map = new HashMap<String, String>();

		map.put("cs_idx", cs_idx);

		List<ClubMatchVO> list = gService.kindMatchList(cs_idx);

		model.addAttribute("list", list);

		return "game/gameSelfMatchKindList.pag";
	}

	@RequestMapping("/Game/selfMatchTimeList.techni")
	public String timeMatchList(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("cs_idx", cs_idx);
		map.put("kind", "MGL_CSELF_W_DAT");

		List<ClubMatchVO> list = gService.timeMatchList(cs_idx);
		List<ClubMatchVO> list2 = gService.matchList(map);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("c_nm", ucService.club_nm((String) session.getAttribute("c_idx")));

		return "game/gameSelfMatchTimeList.pag";
	}

	@RequestMapping("/Game/selfMatchCourtList.techni")
	public String courtMatchList(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("cs_idx", cs_idx);
		map.put("kind", "MGL_CSELF_COURT");

		List<ClubMatchVO> list = gService.courtMatchList(cs_idx);
		List<ClubMatchVO> list2 = gService.matchList(map);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("c_nm", ucService.club_nm((String) session.getAttribute("c_idx")));

		return "game/gameSelfMatchCourtList.pag";
	}

	@RequestMapping("/Game/selfMatchMatchDetail.techni")
	public String MatchDetail(HttpSession session, Model model, String cs_k_idx) {

		String cs_idx = (String) session.getAttribute("cs_idx");

		Map<String, String> map = new HashMap<String, String>();

		map.put("cs_idx", cs_idx);
		map.put("cs_k_idx", (String) cs_k_idx);
		List<ClubMatchVO> list = gService.kindMatchDetail(map);
		List<ClubMatchVO> list2 = gService.kindDetailList(map);

		List<ClubMatchVO> list3 = gService.kindDetailRank(map);
		session.setAttribute("cs_k_nm", list2.get(0).getCs_k_nm());
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("c_nm", ucService.club_nm((String)session.getAttribute("c_idx")));

		return "game/gameSelfMatchKindDetail.pag";
	}

	/////////////////////////////////////

	@RequestMapping("/Game/selfMatchEntryType.techni")
	public String entryType(HttpSession session, Model model) {

		String cs_idx = (String) session.getAttribute("cs_idx");

		List<ClubMatchVO> list = gService.entryKindList(cs_idx);
		List<ClubMatchVO> list2 = gService.entryKindDetail(cs_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("c_nm", ucService.club_nm((String) session.getAttribute("c_idx")));

		return "game/gameSelfMatchEntryType.pag";
	}

	@RequestMapping("/Game/selfMatchMyRank.techni")
	public String myRank(HttpSession session, Model model) {

		String cs_idx = (String) session.getAttribute("cs_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();

		map.put("cs_idx", cs_idx);
		map.put("u_id", mvo.getM_id());

		List<ClubMatchVO> list = gService.myRank(map);
		List<ClubMatchVO> list2 = gService.myKindList(map);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("u_id", mvo.getM_id());
		model.addAttribute("c_nm", ucService.club_nm((String)session.getAttribute("c_idx")));

		return "game/gameSelfMatchMyRank.pag";
	}

	@RequestMapping("/Game/selfMatchTypeRank.techni")
	public String typeRank(HttpSession session, Model model) {

		String cs_idx = (String) session.getAttribute("cs_idx");

		List<ClubMatchVO> list = gService.csKindList(cs_idx);
		List<ClubMatchVO> list2 = gService.csKindRank(cs_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("c_nm", ucService.club_nm((String)session.getAttribute("c_idx")));
		return "game/gameSelfMatchTypeRank.pag";
	}

	@RequestMapping("/Game/selfMatchReferee.techni")
	public String referee(HttpSession session, Model model, @RequestParam(required = false) String cs_court) {

		String cs_idx = (String) session.getAttribute("cs_idx");
		if (cs_court == null) {
			cs_court = "1";
		}
		Map<String, String> map = new HashMap<String, String>();

		map.put("cs_idx", cs_idx);
		map.put("cs_court", cs_court + "");

		List<ClubMatchVO> list = gService.referee(map);

		int court = gService.courtCount(cs_idx);
		model.addAttribute("cf_court", cs_court);
		model.addAttribute("court", court);
		model.addAttribute("list", list);

		return "game/gameSelfMatchReferee.pag";
	}

	@RequestMapping("/Game/selfMatchAllMatch.techni")
	public String allMatch(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");

		List<ClubMatchVO> list = gService.all_court(cs_idx);
		List<ClubMatchVO> list2 = gService.all_dat(cs_idx);
		List<ClubMatchVO> list3 = gService.all_match(cs_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);

		return "game/gameSelfMatchAllMatch.pag";
	}

	@RequestMapping("/Game/selfMatchSummary.techni")
	public String Summary(HttpSession session, Model model) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String cs_idx = (String) session.getAttribute("cs_idx");

		ClubMatchVO cmvo = gService.selfMatchDetail(cs_idx);

		Map<String, String> map = new HashMap<String, String>();

		map.put("cs_idx", cs_idx);
		map.put("u_id", u_id);

		int res = gService.selfMatchJoinYN(map);

		session.setAttribute("cs_nm", cmvo.getCs_nm());
		session.setAttribute("cs_idx", cs_idx);

		model.addAttribute("list", cmvo);
		model.addAttribute("res", res);
		model.addAttribute("listYN", "N");

		return "game/gameSelfMatchSummary.pag";
	}

	@RequestMapping("Game/selfScoreInsert.techni")
	@ResponseBody
	public Map<String, Object> cFightScoreInsert(@RequestBody String json, HttpSession session) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> map2 = new HashMap<String, String>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String cm_a1_id = (String) json2.get("a1_id");
		String cm_a2_id = (String) json2.get("a2_id");
		String cm_b1_id = (String) json2.get("b1_id");
		String cm_b2_id = (String) json2.get("b2_id");
		String aScore = (String) json2.get("aScore");
		String bScore = (String) json2.get("bScore");
		String cs_gidx = (String) json2.get("cs_gidx");
		String cs_idx = (String) session.getAttribute("cs_idx");
		System.out.println(cm_a1_id);

		int aS = Integer.parseInt(aScore);
		int bS = Integer.parseInt(bScore);

		map2.put("a1_id", cm_a1_id);
		map2.put("a2_id", cm_a2_id);
		map2.put("b1_id", cm_b1_id);
		map2.put("b2_id", cm_b2_id);
		map2.put("cs_idx", cs_idx);

		List<ClubMatchVO> list = gService.pointUser2(map2);

		int hon = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getU_sex().equals("M")) {
				hon++;
			}
		}
		System.out.println("hon" + hon);

		double Tgr = 0.0;
		for (int i = 0; i < list.size(); i++) {
			double gr = 0;
			if (hon != 0 || hon != 4) {
				switch (list.get(i).getU_sex()) {
				case "F":
					gr = gr + 0.5;
					break;
				default:
					break;
				}
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getU_sex() + "   공력  : " + gr);
			if (list.get(i).getU_club_gd() == null) {
				list.get(i).setU_club_gd("왕초");
			}
			switch (list.get(i).getU_club_gd()) {
			case "S":
				gr = gr + 0;
				break;
			case "자강":
				gr = gr + 0;
				break;
			case "A":
				gr = gr + 1;
				break;
			case "B":
				gr = gr + 3;
				break;
			case "C":
				gr = gr + 5;
				break;
			case "D":
				gr = gr + 7;
				break;
			case "초심":
				gr = gr + 9;
				break;
			case "왕초":
				gr = gr + 10;
				break;
			case "무급":
				gr = gr + 10;
				break;
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getU_sex() + "급수 :  " + list.get(i).getU_club_gd()
					+ "   공력  : " + gr);

			switch (list.get(i).getU_ageG()) {
			case "0대":
				gr = gr + 1;
				break;
			case "5대":
				gr = gr + 1;
				break;
			case "10대":
				gr = gr + 1;
				break;
			case "15대":
				gr = gr + 1;
				break;
			case "20대":
				gr = gr + 1;
				break;
			case "25대":
				gr = gr + 2;
				break;
			case "30대":
				gr = gr + 3;
				break;
			case "35대":
				gr = gr + 4;
				break;
			case "40대":
				gr = gr + 5;
				break;
			case "45대":
				gr = gr + 6;
				break;
			case "50대":
				gr = gr + 7;
				break;
			case "55대":
				gr = gr + 8;
				break;
			case "60대":
				gr = gr + 9;
				break;
			case "65대":
				gr = gr + 9;
				break;
			case "70대":
				gr = gr + 10;
				break;
			case "75대":
				gr = gr + 10;
				break;
			case "80대":
				gr = gr + 10;
				break;
			default:
				gr = gr + 0;
				break;
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getU_age() + "급수 :  " + list.get(i).getU_club_gd()
					+ "  나이대  :" + list.get(i).getU_age() + "대" + "공력  : " + gr);

			if (hon != 0 && hon != 4) {
				gr = gr / (double) 3;
			} else {
				gr = gr / (double) 2;
			}
			list.get(i).setUeffort(Math.round(gr * 100d) / 100d);

			Tgr = Tgr + gr;

		}
		System.out.println("총공력 : " + Tgr);
		System.out.println(list.get(0).getU_id() + " 의 손실공력은 " + list.get(0).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(0).getUeffort() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(1).getU_id() + " 의 손실공력은 " + list.get(1).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(1).getUeffort() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(2).getU_id() + " 의 손실공력은 " + list.get(2).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(2).getUeffort() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(3).getU_id() + " 의 손실공력은 " + list.get(3).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(3).getUeffort() / Tgr) * 10) * 100d) / 100d);

		int totalP;
		String aWin = "";
		String bWin = "";
		if (aS > bS) {
			list.get(0).setVptn(1.0);
			list.get(1).setVptn(1.0);
			list.get(2).setVptn(0.0);
			list.get(3).setVptn(0.0);
			totalP = aS * 2;
			aWin = "승";
			bWin = "패";
		} else {
			list.get(0).setVptn(0.0);
			list.get(1).setVptn(0.0);
			list.get(2).setVptn(1.0);
			list.get(3).setVptn(1.0);
			totalP = bS * 2;
			aWin = "패";
			bWin = "승";
		}

		double a_pp = Math.round((aS / (double) (totalP)) * 100d) / 100d;
		System.out.println(a_pp);
		double b_pp = Math.round((bS / (double) (totalP)) * 100d) / 100d;
		System.out.println(b_pp);
		for (int i = 0; i < 2; i++) {
			list.get(i).setPptn(a_pp);
			list.get(i).setGptn(Math.round(((list.get(i).getUeffort() / Tgr) * 10) * 100d) / 100d);
			list.get(i).setAptn(
					Math.round(((list.get(i).getUeffort() / Tgr) * 10) * 100d) / 100d + a_pp + list.get(i).getVptn());
			list.get(i).setTotal(aS);
			list.get(i).setCnt_gap(aS - bS);
			list.get(i).setWin(aWin);
		}
		for (int i = 2; i < 4; i++) {
			list.get(i).setPptn(b_pp);
			list.get(i).setGptn(Math.round(((list.get(i).getUeffort() / Tgr) * 10) * 100d) / 100d);
			list.get(i).setAptn(
					Math.round(((list.get(i).getUeffort() / Tgr) * 10) * 100d) / 100d + b_pp + list.get(i).getVptn());
			list.get(i).setTotal(bS);
			list.get(i).setCnt_gap(bS - aS);
			list.get(i).setWin(bWin);
		}
		System.out.println(list);

		Map<String, Object> map3 = new HashMap<String, Object>();

		map3.put("cs_gidx", cs_gidx);
		map3.put("list", list);

		int res = gService.pointUpdate(map3, cs_gidx);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}
	
	@RequestMapping("/Game/selfMatchTeamList.techni")
	public String cFightTeamList(HttpSession session, Model model) {
		String cs_idx = (String) session.getAttribute("cs_idx");

		List<ClubMatchVO> list = gService.teamList(cs_idx);

		model.addAttribute("list", list);

		return "game/gameSelfMatchTeamList.pag";
	}
	
	
	
	
	
	// 게임현황판화면 처리
	@RequestMapping("/Game/GameStateInfo.techni")
	public ModelAndView getGameStateInfo(HttpSession session, ModelAndView mv, ServletRequest req) {
		ArrayList<GTempTeamVO> gameMemberDateList = null; // 진행중 리스트
		ArrayList<GTempTeamVO> gameMemberTempList = null; // 대기중 리스트
		ArrayList<CStadiumVO> clubStadiumCoatList = null; // 클럽에서 사용가능한 코트 리스트 mgl_stadium.mgl_stadium_coat_yn = Y
		try {

			clubStadiumCoatList = gService.getClubStadiumCoatList(session);

			String matchDate = req.getParameter("matchDate");

			if ((matchDate == null) || matchDate.equals("")) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd ");
				Calendar cal = Calendar.getInstance();
				matchDate = dateFormat.format(cal.getTime());
			}
			String tempyn = "N";
			gameMemberDateList = gService.getGameStateTempInfo(session, matchDate, tempyn); // 진행중 멤버
			tempyn = "Y";
			gameMemberTempList = gService.getGameStateTempInfo(session, matchDate, tempyn); // 대기중 멤버

		} catch (Exception e) {
			e.printStackTrace();
		}
		Object DispYn = null;
		if (gameMemberDateList.size() > 0) {

			for (int i = 0; i < clubStadiumCoatList.size(); i++) {
				String a = clubStadiumCoatList.get(i).getCst_coat();

				for (int j = 0; j < gameMemberDateList.size(); j++) {
					String b = gameMemberDateList.get(j).getTemp_coat();
					// 현재 경기장 코트 리스트를 출력하면서 그곳과 매칭된 GTempTeam객체 정보 하나를 넣어준다.
					if (a.equals(b)) {
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

	// 게임현황판 > 종료게임 명령 처리
	@RequestMapping("/Game/GameStateInfoEnd.techni")
	public ModelAndView getGameStateInfoEnd(HttpSession session, ModelAndView mv, ServletRequest req) {
		mv.setViewName("game/gameStateInfoEnd");
		return mv;
	}

	// 게임현황판 > 대기중 순위 올리기 명령 처리
	@RequestMapping("/Game/GameStateInfoRankUp.techni")
	public ModelAndView setGameStateInfoRankUp(HttpSession session, ServletRequest req, ModelAndView mv) {

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
	/*
	 * @RequestMapping("/Game/GameScoreRegist.techni") public ModelAndView
	 * getGemeScoreRegist(HttpSession session, ModelAndView mv, ServletRequest req){
	 * String gtIdx = (String) req.getParameter("gtIdx"); GTempTeamVO gttVO = null;
	 * ClubMatchVO cmVO = null; try{ // 단일 임시저장테이블에서 데이터 추출(향후 삭제권장) gttVO =
	 * gService.getGameScoreRegist(gtIdx, session);
	 * 
	 * // temp_teamgroup 테이블의 각각의 회원정보를 불러와서 화면 하단에 지난기록을 출력(미작업) // ClubMatchVO
	 * cmVO = gService.getGameScoreRegist(gIdx, session);
	 * 
	 * }catch (Exception e) { e.printStackTrace(); } mv.addObject("gttVO", gttVO);
	 * //mgl_temp_teamgroup 사용(비권장) // mv.addObject("cmVO", gttVO); //mgl_club_match
	 * 사용(권장) mv.setViewName("game/gameScoreRegist"); return mv; }
	 */
	/*
	 * 게임등록화면 호출
	 */
	@RequestMapping("/Game/GameRegist.techni")
	public ModelAndView gameRegist(HttpSession session, ModelAndView mv) {
		// 게임대기는 MGL_ATTEND_STATUS 컬럼에서 G GAME-READY / A ATTEND / R REST 로 구분
		// 출석하기 DEFAULT = A
		// 출석된 회원들 불러오기
		ArrayList canDoGameList = null;
		// 출석된 회원중 게임등록불가(게임대기/휴식중) 회원 불러오기
		ArrayList dontGameList = null;

		try {
			canDoGameList = gService.getGameRegist(session, "A");
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			dontGameList = gService.getGameRegist(session, "G");
		} catch (Exception e) {
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
	public ModelAndView gameRegistProc(HttpSession session, ModelAndView mv, ServletRequest req) {
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
		try {
			// set 작업을 두번함, service단(attend 수정, match 등록) 처리
			gService.setMultiGameRegist(session, map);

		} catch (Exception e) {
			e.printStackTrace();
		}
		RedirectView rv = new RedirectView();
		rv.setUrl("/Game/GameStateInfo.techni");
		mv.addObject("matchDate", date.replace(".", "-"));
		mv.setView(rv);
		return mv;
	}

	// 출석화면 처리
	/*
	 * @RequestMapping("/Game/GameAttend.techni") public ModelAndView
	 * gameAttend(HttpSession session, ModelAndView mv){
	 * 
	 * ArrayList attendMemberDataList = null; ArrayList<MemberVO> memberDataList =
	 * null; int mCnt = 0; int aCnt = 0; try{
	 * //--------------------------------------------------------------------------
	 * 화면 상단 출력 attendMemberDataList = gService.getAttendMemberList(session); aCnt =
	 * attendMemberDataList.size(); // 출석한 회원수
	 * //--------------------------------------------------------------------------
	 * 화면 하단 출력 //이것은 단일클럽의 회원들의 정보를 가지고 온다// 그래서 mService로... memberDataList =
	 * mService.getMemberList(session); mCnt = memberDataList.size(); //전체 회원수
	 * }catch(Exception e){ e.printStackTrace(); } mv.addObject("ACNT", aCnt);
	 * mv.addObject("MCNT", mCnt); mv.addObject("MEMBERLIST", memberDataList);
	 * mv.addObject("ATTENDLIST", attendMemberDataList);
	 * mv.setViewName("game/gameAttend"); return mv; }
	 */
	/*
	 * 게임하자 >> 게임준비 버튼 클릭시 로그인한 회원에게 '출석 확인했습니다.’ 메시지와 함께 출석확인 목록에 게임가능 회원으로 등록됨
	 * (출석확인 페이지로 이동)
	 */
	@RequestMapping("/Game/GameMemberAttend.techni")
	public ModelAndView setGameMemberAttend(ModelAndView mv) {

		RedirectView rv = new RedirectView();
		rv.setUrl("/Game/GameAttend.techni");
		mv.setView(rv);
		return mv;
	}

	/*
	 * 출석화인 >> 출석등록 버튼 클릭시
	 */
	@RequestMapping("/Ajax/AJax4GameAttend.techni")
	public void setAjax4GameAttend(HttpSession session, ServletRequest req, ModelAndView mv) {
		try {
			String uId = req.getParameter("uId");
			String today = req.getParameter("today");

			gService.setGameMemberAttend(uId, today, session);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// RedirectView rv = new RedirectView();
		// rv.setUrl("/Game/GameAttend.techni");
		// mv.setView(rv);
		// mv.setViewName("ajax/attendMemberForUClub");
		// return mv;
	}

	/*
	 * 자체게임> 진행중 리스트
	 */
	@RequestMapping("/Game/GameSelfMatchIngList.techni")
	public String getGameSelfMatchIngList() {
		return "game/gameSelfMatchIngList";
	}

	/*
	 * 자체게임> 예정 리스트
	 */
	@RequestMapping("/Game/GameSelfMatchPreList.techni")
	public String getGameSelfMatchPreList() {
		return "game/gameSelfMatchPreList";
	}

	/*
	 * 자체게임> 종료된 리스트
	 */
	@RequestMapping("/Game/GameSelfMatchLastList.techni")
	public String getGameSelfMatchLastList() {
		return "game/gameSelfMatchLastList";
	}

	/*
	 * 자체게임> 과거대회목록 > 청백전
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteDetail.techni")
	public String getGameSelfMatchBlueAndWhiteDetail() {
		return "game/gameSelfMatchBlueAndWhiteDetail";
	}

	/*
	 * 자체게임> 과거대회목록 > 청백전 검색
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteDetailSearch.techni")
	public String getGameSelfMatchBlueAndWhiteDetailSearch() {
		return "game/gameSelfMatchBlueAndWhiteDetailSearch";
	}

	/*
	 * 자체게임> 청백전 > 조별(종목, 환경설정)
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteEnvir.techni")
	public String getGameSelfMatchBlueAndWhiteEnvir() {
		return "game/gameSelfMatchBlueAndWhiteEnvir";
	}

	/*
	 * 자체게임> 청백전 > 선수구분
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhitePlayerDiv.techni")
	public String getGameSelfMatchBlueAndWhitePlayerDiv() {
		return "game/gameSelfMatchBlueAndWhitePlayerDiv";
	}

	/*
	 * 자체게임> 청백전 > 출전신청
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteEntry.techni")
	public String getGameSelfMatchBlueAndWhiteEntry() {
		return "game/gameSelfMatchBlueAndWhiteEntry";
	}

	/*
	 * 자체게임> 청백전 > 대진표(대진환경)
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteMap.techni")
	public String getGameSelfMatchBlueAndWhiteMap() {
		return "game/gameSelfMatchBlueAndWhiteMap";
	}

	/*
	 * 자체게임> 청백전 > 대진표(대진생성)
	 */
	@RequestMapping("/Game/GameSelfMatchBlueAndWhiteMap2.techni")
	public String getGameSelfMatchBlueAndWhiteMap2() {
		return "game/gameSelfMatchBlueAndWhiteMap2";
	}

	/*
	 * 자체게임> 과거대회목록 > 개인리그전
	 */
	@RequestMapping("/Game/GameSelfMatchPersonalDetail.techni")
	public String getGameSelfMatchPersonalDetail() {
		return "game/gameSelfMatchPersonalDetail";
	}

	/*
	 * 자체게임> 과거대회목록 > 개인리그전 검색
	 */
	@RequestMapping("/Game/GameSelfMatchPersonalDetailSearch.techni")
	public String getGameSelfMatchPersonalDetailSearch() {
		return "game/gameSelfMatchPersonalDetailSearch";
	}

	/*
	 * 자체게임> 리그개인전 > 조별 환경설정
	 */
	@RequestMapping("/Game/GameSelfMatchPersonalEnvir.techni")
	public String getGameSelfMatchPersonalEnvir() {
		return "game/gameSelfMatchPersonalEnvir";
	}

	/*
	 * 자체게임> 리그개인전 > 선수구분
	 */
	@RequestMapping("/Game/GameSelfMatchPersonalPlayerDiv.techni")
	public String getGameSelfMatchPersonalPlayerDiv() {
		return "game/gameSelfMatchPersonalPlayerDiv";
	}

	/*
	 * 자체게임> 리그개인전 > 대진표(대진환경)
	 */
	@RequestMapping("/Game/GameSelfMatchPersonalMap.techni")
	public String getGameSelfMatchPersonalMap() {
		return "game/gameSelfMatchPersonalMap";
	}

	/*
	 * 자체게임> 리그개인전 > 대진표(대진생성)
	 */
	@RequestMapping("/Game/GameSelfMatchPersonalMap2.techni")
	public String getGameSelfMatchPersonalMap2() {
		return "game/gameSelfMatchPersonalMap2";
	}

	/*
	 * 자체게임> 등록 화면호출
	 */
	@RequestMapping("/Game/GameSelfMatchWrite.techni")
	public String getGameSelfMatchWrite() {
		return "cFight/cFightInsert";
	}

	/*
	 * 자체게임> 등록 액션처리
	 */
	@RequestMapping("/Game/GameSelfMatchWriteAct.techni")
	public String getGameSelfMatchWriteAct() {
		return "location-href='/game/gameSelfMatchView'";
	}

	/*
	 * 자체게임> 보기
	 */
	@RequestMapping("/Game/GameSelfMatchView.techni")
	public String getGameSelfMatchView() {
		return "game/gameSelfMatchView";
	}

	/*
	 * 자체게임> 출석 화면
	 */
	@RequestMapping("/Game/GameSelfMatchAttend.techni")
	public String getGameSelfMatchAttend() {
		return "game/gameSelfMatchAttend";
	}

}