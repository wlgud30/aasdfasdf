package com.techni.mgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techni.mgl.domain.CfightVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.service.CfightService;
import com.techni.mgl.service.UClubService;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

@Controller
/*@SessionAttributes({"cf_idx","cf_nm"}) 바뀌지 않는 값만 넣어줘야 될것같다.*/
public class CfightController {

	@Autowired
	public CfightService cfService;
	@Autowired
	public UClubService ucService;

	@RequestMapping("Cfight/CfightInsertForm.techni")
	public String CfightInsert(HttpSession session, Model model, @RequestParam String c_nm) {

		model.addAttribute("c_nm", c_nm);

		return "cFight/cFightInsert.pag";
	}

	@RequestMapping("Cfight/SelectCidx.techni")
	@ResponseBody
	public Map<Object, Object> selectCidx(HttpSession session, Model model, @RequestBody String c_nm) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		System.out.println(c_nm);
		CfightVO cfvo = cfService.selectCidx(c_nm);

		if (cfvo == null) {
			map.put("cnt", 0);
		} else {
			map.put("cnt", 1);
			map.put("c_idx", cfvo.getC_idx());
			map.put("c_nm", cfvo.getC_nm());
		}

		return map;
	}

	@RequestMapping("Cfight/CfightInsert.techni")
	@ResponseBody
	public Map<Object, Object> cFightInsert(HttpSession session, ServletRequest req) {
		Map<Object, Object> map = new HashMap<Object, Object>();

		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		Map<String, String> map3 = new HashMap<String, String>();

		map1.put("cf_location", req.getParameter("cf_location"));
		map1.put("cf_start", req.getParameter("cf_start"));
		map1.put("cf_end", req.getParameter("cf_end"));
		map1.put("cf_sTime", req.getParameter("cf_sTime1") + req.getParameter("cf_sTime2") + "00");
		map1.put("cf_eTime", req.getParameter("cf_eTime1") + req.getParameter("cf_eTime2") + "00");
		map1.put("cf_point", req.getParameter("cf_point"));
		map1.put("cf_time", req.getParameter("cf_time"));
		map1.put("cf_cnm", req.getParameter("cf_cnm"));
		map1.put("cf_court", req.getParameter("cf_court"));
		map1.put("cf_meth", req.getParameter("cf_meth"));
		map1.put("cf_body", req.getParameter("cf_body"));
		map1.put("c_idx", (String) session.getAttribute("c_idx"));
		map1.put("cf_nm", req.getParameter("cf_nm"));

		String[] type = req.getParameterValues("type");
		String[] no = req.getParameterValues("no");
		String[] kind = req.getParameterValues("kind");
		String[] c_idx = req.getParameterValues("c_idx");

		System.out.println(Arrays.toString(c_idx));
		List<String> list = new ArrayList<String>();
		Collections.addAll(list, c_idx);
		list.remove("");
		list.remove(" ");
		c_idx = new String[list.size()];
		int size = 0;
		for (String temp : list) {
			c_idx[size++] = temp;
		}

		int res = cfService.cFightInsert(map1, map2, c_idx, no, kind, type);
		map3.put("cf_idx", map1.get("cf_idx"));
		map3.put("c_idx", (String) session.getAttribute("c_idx"));
		map3.put("yn", "Y");
		int res2 = cfService.cFightYnInsert(map3);
		if (res > 0 && res2 > 0) {
			map.put("cnt", 1);
			map.put("cf_idx", map1.get("cf_idx"));
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	@RequestMapping("Cfight/CfightDetail.techni")
	public String cfDetail(@RequestParam(required = false) String cf_idx, Model model, HttpSession session) {
		if (cf_idx != null) {
			session.setAttribute("cf_idx", cf_idx);
		} else {
			cf_idx = (String) session.getAttribute("cf_idx");
		}
		String c_idx = (String) session.getAttribute("c_idx");
		String cfm = "";
		String cm = "";
		String join = "";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cf_idx", cf_idx);
		map.put("c_idx", (String) session.getAttribute("c_idx"));

		MemberVO mvo = (MemberVO) session.getAttribute("login");

		List<CfightVO> list = cfService.cFightJoinClub(cf_idx);
		List<CfightVO> list2 = cfService.cFightTypeList(map);
		List<CfightVO> list3 = cfService.cf_nm(cf_idx);
		session.setAttribute("cf_nm", list3.get(0).getCf_nm());

		if (list.get(0).getCf_match_list().equals("Y")) {

			map.put("u_id", mvo.getM_id());

			List<CfightVO> mList = cfService.myMatchList(map);
			CfightVO cfvo = cfService.gameDetail(cf_idx);
			int all_court =Integer.parseInt(cfvo.getCf_court());
			model.addAttribute("all_court", all_court);
			model.addAttribute("list", mList);
			model.addAttribute("list3", list3);

			return "cFight/cFightMyGame.pag";
		} else {

			
			for (CfightVO cvo : list) {
				if (c_idx.equals(cvo.c_idx) && mvo.getM_id().equals(cvo.c_u_mid)) {
					cm = "매니저";
				}
				if (cvo.cf_yn != null) {
					if (c_idx.equals(cvo.c_idx) && cvo.cf_yn.equals("Y")) {
						join = "참석";
					} else if (c_idx.equals(cvo.c_idx) && cvo.cf_yn.equals("N")) {
						join = "불참";
					} else {
						join = "미정";
					}
					if (c_idx.equals(cvo.c_idx)) {
						break;
					}
				}else {
					join="미정";
				}
			}
			if (c_idx.equals(list.get(0).cf_c_idx)) {
				join = "참석";
			}
			for (CfightVO cvo : list2) {
				if (mvo.getM_id().equals(cvo.c_u_mid) && c_idx.equals(cvo.cf_c_idx)) {
					cfm = "매니저";
				}
			}
			System.out.println(join);
			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("mYn", mvo.getM_id());
			model.addAttribute("cm", cm);
			model.addAttribute("cfm", cfm);
			model.addAttribute("join", join);

			return "cFight/cFightDetail.pag";
		}
	}

	// 참석 여부
	@RequestMapping("Cfight/CfightYnChk.techni")
	@ResponseBody
	public Map<Object, Object> ynChk(HttpSession session, @RequestBody String json) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String, String> map1 = new HashMap<String, String>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		map1.put("yn", (String) json2.get("yn"));
		map1.put("cf_idx", (String) json2.get("cf_idx"));
		map1.put("c_idx", (String) session.getAttribute("c_idx"));

		int res = cfService.ynChk(map1);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	// 클럽 선수 등록화면
	@RequestMapping("Cfight/CfightRegister.techni")
	public String cFightRegister(HttpSession session, Model model, @RequestParam String cf_idx) {

		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", (String) session.getAttribute("c_idx"));
		map.put("cf_idx", cf_idx);

		List<CfightVO> list = cfService.cFightUserList(map);
		List<CfightVO> list2 = cfService.cFightJoinUserList(map);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("cf_idx", cf_idx);

		return "cFight/cFightRegister.pag";
	}

	// 클럽 선수 팀 등록화면
	@RequestMapping("Cfight/CfightRegisterT.techni")
	public String cFightRegisterT(HttpSession session, Model model, @RequestParam(required = false) String cf_t_nm,
			@RequestParam String cf_t_idx, @RequestParam String cf_idx, @RequestParam String cf_t_kind) {
		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", (String) session.getAttribute("c_idx"));
		map.put("cf_t_idx", cf_t_idx);
		map.put("cf_idx", cf_idx);
		map.put("cf_t_kind", cf_t_kind);

		List<CfightVO> list = cfService.teamUser(map);
		List<CfightVO> list2 = cfService.typeTeam(map);
		List<CfightVO> list3 = cfService.cFightTypeList(map);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("cf_idx", cf_idx);
		model.addAttribute("cf_t_idx", cf_t_idx);

		return "cFight/cFightRegisterT.pag";
	}

	// 팀 등록
	@RequestMapping("Cfight/CfightTeamInsert.techni")
	@ResponseBody
	public Map<Object, Object> teamInsert(HttpSession session, @RequestBody String json) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String, String> map1 = new HashMap<String, String>();

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String id_a = (String) json2.get("u_id_a");
		String id_b = (String) json2.get("u_id_b");

		map1.put("u_id_a", id_a);
		map1.put("u_id_b", id_b);
		map1.put("c_idx", (String) session.getAttribute("c_idx"));
		map1.put("cf_idx", (String) json2.get("cf_idx"));
		map1.put("cf_t_idx", (String) json2.get("cf_t_idx"));

		int res = cfService.teamInsert(map1);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	// 팀 삭제
	@RequestMapping("Cfight/CfightTeamDelete.techni")
	@ResponseBody
	public Map<Object, Object> teamDelete(HttpSession session, @RequestBody String cf_team_idx) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();

		int res = cfService.teamDelete(cf_team_idx);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	// 해당 클럽의 전체 팀 확인
	@RequestMapping("Cfight/CfightTeamList.techni")
	public String cFightTeamList(HttpSession session, Model model, @RequestParam String cf_idx) {

		String c_idx = (String) session.getAttribute("c_idx");

		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", c_idx);
		map.put("cf_idx", cf_idx);

		List<CfightVO> list = cfService.teamList(map);

		model.addAttribute("list", list);

		return "cFight/cFightTeamList.pag";
	}

	// 클럽대항전 유저 테이블에 인서트
	@RequestMapping("Cfight/CfightUserInsert.techni")
	@ResponseBody
	public Map<Object, Object> cFightUserInsert(HttpSession session, @RequestBody String json) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();

		String c_idx = (String) session.getAttribute("c_idx");

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String arr = json2.get("u_id").toString().replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
		System.out.println(arr);
		String[] ar = arr.split(",");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for (int i = 0; i < ar.length; i++) {
			Map<String, String> map1 = new HashMap<String, String>();
			System.out.println(ar[i]);
			map1.put("u_id", ar[i]);
			list.add(map1);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		System.out.println(list);
		map2.put("list", list);
		map2.put("c_idx", c_idx);
		map2.put("cf_idx", (String) json2.get("cf_idx"));

		int res = cfService.cFightUserInsert(map2);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	// 클럽대항전 유저 테이블 딜리트
	@RequestMapping("Cfight/CfightUserDelete.techni")
	@ResponseBody
	public Map<Object, Object> cFightUserDelete(HttpSession session, Model model, @RequestBody String json)
			throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();

		String c_idx = (String) session.getAttribute("c_idx");

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String arr = json2.get("u_id").toString().replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
		System.out.println(arr);
		String[] ar = arr.split(",");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		List<Map<String, String>> list2 = new ArrayList<Map<String, String>>();

		for (int i = 0; i < ar.length; i++) {
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("cf_idx", (String) json2.get("cf_idx") + ar[i] + c_idx);
			list.add(map1);
			Map<String, String> map3 = new HashMap<String, String>();
			map3.put("u_id", ar[i]);
			list2.add(map3);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		Map<String, Object> map4 = new HashMap<String, Object>();
		System.out.println(list2);
		map4.put("list", list2);
		map4.put("c_idx", c_idx);
		map4.put("cf_idx", (String) json2.get("cf_idx"));
		List<CfightVO> list3 = cfService.teamUserChk(map4);
		if (list3.size() != 0) {
			String list_nm = "";
			for (CfightVO cvo : list3) {
				System.out.println(cvo.getCf_u_nm());
				list_nm += cvo.getCf_u_nm() + "님  ";
			}
			map.put("cnt", 0);
			map.put("list_nm", list_nm);
			System.out.println(list3);
			System.out.println("이름 리스트 스트링" + list_nm);
			return map;
		}

		int res = cfService.cFightUserDelete(map2);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	@RequestMapping("Cfight/CfightGroup.techni")
	public String cFightGroup(@RequestParam String cf_idx, Model model, HttpSession session) {
		List<CfightVO> list = cfService.typeList(cf_idx);

		model.addAttribute("list", list);

		return "cFight/cFightGroup.pag";
	}

	@RequestMapping("Cfight/CfightGroupInsert.techni")
	@ResponseBody
	public Map<Object, Object> cFightGroupInsert(Model model, HttpSession session, @RequestBody String json)
			throws ParseException, java.text.ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();

		JSONParser parser = new JSONParser();
		JSONArray json2 = (JSONArray) parser.parse(json);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		Map<String, Object> insertMap = new HashMap<String, Object>();
		Map<String, Object> updateMap = new HashMap<String, Object>();

		for (int i = 1; i < (json2.size() + 1); i++) {
			JSONObject j = (JSONObject) json2.get((i - 1));
			String u = "a" + i;
			String arr = j.get(u).toString().replace("[", "").replace("]", "").replace("\"", "");
			Object array[] = arr.split(",");
			for (int k = 1; k <= (array.length - 1); k++) {
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("cf_g_idx", array[0] + "_" + k + "");
				map3.put("cf_g_count", array[k].toString());
				map3.put("cf_t_idx", array[0].toString());
				map3.put("cf_g_no", k + "");
				list.add(map3);
			}
		}
		
		System.out.println(list);
		
		String cf_idx = (String) session.getAttribute("cf_idx");

		List<CfightVO> c_idx_list = cfService.clubList(cf_idx);

		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("cf_idx", cf_idx);

		int v = 1;
		for (CfightVO cfvo : c_idx_list) {
			String c_idx_n = "c_idx_" + v;
			map1.put(c_idx_n, cfvo.getC_idx());
			v++;
		}

		List<CfightVO> team_list = cfService.clubTeamList(map1);
		System.out.println(list.size());
		System.out.println(team_list.size());
		System.out.println(list);
		System.out.println(team_list);
		int var = 0;
		for (int i = 0; i < list.size(); i++) {
			int c = Integer.parseInt((String) list.get(i).get("cf_g_count"));
			System.out.println(c);
			for (int j = 0; j < c; j++) {
				Map<String, Object> map4 = new HashMap<String, Object>();
				map4.put("cf_team_idx", team_list.get(var).getCf_team_idx());
				System.out.println("팀인덱스 : " + team_list.get(var).getCf_team_idx());
				map4.put("cf_g_idx", list.get(i).get("cf_g_idx"));
				System.out.println("그룹인덱스 : " + list.get(i).get("cf_g_idx"));
				var++;
				list2.add(map4);
			}
		}
		System.out.println(var);
		insertMap.put("list", list);
		insertMap.put("cf_idx", cf_idx);
		updateMap.put("list", list2);
		System.out.println(list2);
		int res = cfService.teamGroupUpdate(insertMap, updateMap);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
			
		}
		String hae = "";
		List<Object> gameList = new ArrayList<Object>();
		List<CfightVO> g_idx_list = cfService.groupIdx(cf_idx);
		System.out.println("인덱스 리스트" + g_idx_list);
		for (CfightVO cvo : g_idx_list) {
			Map<String, String> pMap = new HashMap<String, String>();

			pMap.put("cf_idx", cf_idx);
			pMap.put("cf_g_idx", cvo.getCf_g_idx());
			List<CfightVO> group = cfService.groupAll(pMap);
			System.out.println("그룹리스트" + group);
			int g = 0;
			hae += cvo.getCf_t_idx()+",";
			if (cvo.getCf_g_count().equals("5")) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 10; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cf_g_idx", cvo.getCf_g_idx());
					uMap.put("cf_gidx", cvo.getCf_g_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCf_team_idx());
					uMap.put("team_a_user_a", group.get(a).getCf_team_a_id());
					uMap.put("team_a_user_b", group.get(a).getCf_team_b_id());
					uMap.put("team_a_club", group.get(a).getC_idx());
					uMap.put("team_b_idx", group.get(b).getCf_team_idx());
					uMap.put("team_b_user_a", group.get(b).getCf_team_a_id());
					uMap.put("team_b_user_b", group.get(b).getCf_team_b_id());
					uMap.put("team_b_club", group.get(b).getC_idx());
					gameList.add(uMap);
					b++;
					g++;
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1)) {
						a = 1;
						b = 2;
					}
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1)
							+ (Integer.parseInt(cvo.getCf_g_count()) - 2)) {
						a = 2;
						b = 3;
					}
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1) + (Integer.parseInt(cvo.getCf_g_count()) - 2)
							+ (Integer.parseInt(cvo.getCf_g_count()) - 3)) {
						a = 3;
						b = 4;
					}
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1) + (Integer.parseInt(cvo.getCf_g_count()) - 2)
							+ (Integer.parseInt(cvo.getCf_g_count()) - 3)
							+ (Integer.parseInt(cvo.getCf_g_count()) - 4)) {
						a = 4;
						b = 5;
					}
				}
			} else if (cvo.getCf_g_count().equals("4")) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 6; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cf_g_idx", cvo.getCf_g_idx());
					uMap.put("cf_gidx", cvo.getCf_g_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCf_team_idx());
					uMap.put("team_a_user_a", group.get(a).getCf_team_a_id());
					uMap.put("team_a_user_b", group.get(a).getCf_team_b_id());
					uMap.put("team_a_club", group.get(a).getC_idx());
					uMap.put("team_b_idx", group.get(b).getCf_team_idx());
					uMap.put("team_b_user_a", group.get(b).getCf_team_a_id());
					uMap.put("team_b_user_b", group.get(b).getCf_team_b_id());
					uMap.put("team_b_club", group.get(b).getC_idx());
					gameList.add(uMap);
					b++;
					g++;
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1)) {
						a = 1;
						b = 2;
					}
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1)
							+ (Integer.parseInt(cvo.getCf_g_count()) - 2)) {
						a = 2;
						b = 3;
					}
				}
			} else if (cvo.getCf_g_count().equals("3")) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 3; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("cf_g_idx", cvo.getCf_g_idx());
					uMap.put("cf_gidx", cvo.getCf_g_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCf_team_idx());
					uMap.put("team_a_user_a", group.get(a).getCf_team_a_id());
					uMap.put("team_a_user_b", group.get(a).getCf_team_b_id());
					uMap.put("team_a_club", group.get(a).getC_idx());
					uMap.put("team_b_idx", group.get(b).getCf_team_idx());
					uMap.put("team_b_user_a", group.get(b).getCf_team_a_id());
					uMap.put("team_b_user_b", group.get(b).getCf_team_b_id());
					uMap.put("team_b_club", group.get(b).getC_idx());
					gameList.add(uMap);
					b++;
					g++;
					if (i == (Integer.parseInt(cvo.getCf_g_count()) - 1)) {
						a = 1;
						b = 2;
					}
				}
			} else if (cvo.getCf_g_count().equals("2")) {
				int a = 0;
				int b = 1;
				Map<String, String> uMap = new HashMap<String, String>();
				uMap.put("cf_g_idx", cvo.getCf_g_idx());
				uMap.put("cf_gidx", cvo.getCf_g_idx() + "_" + g);
				uMap.put("team_a_idx", group.get(a).getCf_team_idx());
				uMap.put("team_a_user_a", group.get(a).getCf_team_a_id());
				uMap.put("team_a_user_b", group.get(a).getCf_team_b_id());
				uMap.put("team_a_club", group.get(a).getC_idx());
				uMap.put("team_b_idx", group.get(b).getCf_team_idx());
				uMap.put("team_b_user_a", group.get(b).getCf_team_a_id());
				uMap.put("team_b_user_b", group.get(b).getCf_team_b_id());
				uMap.put("team_b_club", group.get(b).getC_idx());
				gameList.add(uMap);
			}
		}
		CfightVO cfvo = cfService.gameDetail(cf_idx);
		String[] ar = new String[(Integer.parseInt(cfvo.getCf_court()) * 8)];
		Random random = new Random();
		// 배열 사이즈는 사용가능 코트수 *4
		int va = 0;
		int bl = 0;
		System.out.println(gameList);
		List<Object> gameLista = new ArrayList<Object>();
		System.out.println(gameList.size());
		int k =0;
		for(int i= 0;;i++) {
			for(int t = 0 ; t<ar.length;t++) {
				System.out.println(k);
				System.out.println(Arrays.asList(ar).toString());
			}
			if(!Arrays.asList(ar).contains(null)) {//널값이 하나도 없다면 (꽉찼다면) 코트수X8 일때 코트수X4만큼 앞에서 비워주고 뒤에있는 것들을 땡긴다
				for(int z = 0 ;z<(Integer.parseInt(cfvo.getCf_court()) * 8);z++) {
					if(z<Integer.parseInt(cfvo.getCf_court()) * 4) {
						ar[z]=ar[(Integer.parseInt(cfvo.getCf_court()) * 4)+z];
					}else {
						ar[z]=null;
					}
					
				}
				i=0;
				k=Integer.parseInt(cfvo.getCf_court()) * 4;
			}
			
			if(i>=gameList.size()) {
				ar[k]="blank_"+k+"_"+i+"_"+random.nextInt(100)+1;
				ar[k+1]="blank_"+k+1+"_"+i+"_"+random.nextInt(100)+1;
				ar[k+2]="blank_"+k+2+"_"+i+"_"+random.nextInt(100)+1;
				ar[k+3]="blank_"+k+3+"_"+i+"_"+random.nextInt(100)+1;
				k=k+4;
				Map<String,String> e = new HashMap<String,String>();
				e.put("team_a_user_a","blank_"+k+"_"+i+"_"+random.nextInt(100)+1);
				e.put("team_a_user_b","blank_"+k+1+"_"+i+"_"+random.nextInt(100)+1);
				e.put("team_b_user_a","blank_"+k+2+"_"+i+"_"+random.nextInt(100)+1);
				e.put("team_b_user_b","blank_"+k+3+"_"+i+"_"+random.nextInt(100)+1);
				e.put("cf_gidx", cf_idx + "_blank" + k+"_"+i+"_"+random.nextInt(100)+1);
				e.put("team_b_idx", null);
				e.put("team_a_idx", null);
				e.put("cf_g_idx", null);
				gameLista.add(e);
				i=0;
			}else{
				Map<String,String> all_of_game =(Map<String, String>) gameList.get(i);
				String a1 = all_of_game.get("team_a_user_a");
				String a2 = all_of_game.get("team_a_user_b");
				String b1 = all_of_game.get("team_b_user_a");
				String b2 = all_of_game.get("team_b_user_b");
				if(!Arrays.asList(ar).contains(a1)&&!Arrays.asList(ar).contains(a2)&&!Arrays.asList(ar).contains(b1)&&!Arrays.asList(ar).contains(b2)) {
					ar[k]=a1;
					k++;
					ar[k]=a2;
					k++;
					ar[k]=b1;
					k++;
					ar[k]=b2;
					k++;
					gameLista.add(all_of_game);
					gameList.remove(i);
					i=0;
				}
			}
				
			
			
			if(gameList.size()==0) {
				break;
			}
		}
		/*for(int g= 0; ;g++) {
			if(gameList.size()==1) {
				break;
			}else if(gameList.size()<=g) {
				Map<String,String> e = new HashMap<String,String>();
				e.put("team_a_user_a","blank_"+g);
				e.put("team_a_user_b","blank_"+g);
				e.put("team_b_user_a","blank_"+g);
				e.put("team_b_user_b","blank_"+g);
				e.put("cf_gidx", cf_idx + "_blank" + bl);
				e.put("team_b_idx", null);
				e.put("team_a_idx", null);
				e.put("team_a_user_a", null);
				e.put("team_a_user_b", null);
				e.put("team_b_user_a", null);
				e.put("team_b_user_b", null);
				e.put("cf_g_idx", null);
				gameList.add(e);
			}
			Map<String,String> map4 =(Map<String, String>) gameList.get(g);
			//게임리스트에 첫번째 유저들을저장
			String a1 = map4.get("team_a_user_a");
			String a2 = map4.get("team_a_user_b");
			String b1 = map4.get("team_b_user_a");
			String b2 = map4.get("team_b_user_b");
			
				Map<String,String> map5 = (Map<String, String>) gameLista.get(gameLista.size()-1);
				//게임 유저들의 두번째 유저부터 순서대로 저장
				String i_a1 = map5.get("team_a_user_a");
				String i_a2 = map5.get("team_a_user_b");
				String i_b1 = map5.get("team_b_user_a");
				String i_b2 = map5.get("team_b_user_b");
				//만약 첫번째 유저중 두번째 유저와 겹치는사람이 있다면 반복문 실행해서 다시 리스트의 첫번째부터 반복문실행후 겹치는게 하나도없을때
				if(!a1.equals(i_a1)&&!a1.equals(i_a2)&&!a1.equals(i_b1)&&!a1.equals(i_b2)&&!a2.equals(i_a1)&&!a2.equals(i_a2)&&!a2.equals(i_b1)&&!a2.equals(i_b2)&&!b1.equals(i_a1)&&!b1.equals(i_a2)&&!b1.equals(i_b1)&&!b1.equals(i_b2)&&!b2.equals(i_a1)&&!b2.equals(i_a2)&&!b2.equals(i_b1)&&!b2.equals(i_b2)) {
					gameLista.add(map4);
					gameList.remove(g);
					g=0;
				}
			
			if(gameList.size()==0) {
				break;
			}
		}*/
		for(int i = 0; i<gameLista.size(); i++ ) {
			Map<String,String> map4 = (Map<String, String>) gameLista.get(i);
			String aTeam = "A팀 : 1번  : "+map4.get("team_a_user_a") +" 2번 : "+map4.get("team_a_user_b");
			String bTeam = "B팀 : 1번  : "+map4.get("team_b_user_a") +" 2번 : "+map4.get("team_b_user_b");
			System.out.println(aTeam + bTeam);
		}
		
		System.out.println("리스트사이즈"+gameLista.size());
		List<Object> endGameList = new ArrayList<Object>();

		for (int i = 0; i < gameLista.size(); i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) gameLista.get(i);
			int vv = 1;
			Map<String, String> M = new HashMap<String, String>();
			Map<String, String> M2 = new HashMap<String, String>();
			Map<String, String> M3 = new HashMap<String, String>();
			Map<String, String> M4 = new HashMap<String, String>();
			M.put("cf_e_gidx", (String) newM.get("cf_gidx") + "_" + vv);
			M.put("cf_gidx", (String) newM.get("cf_gidx"));
			M.put("cf_g_idx", (String) newM.get("cf_g_idx"));
			if(newM.get("cf_g_idx") != null) {
				M.put("cf_t_idx", newM.get("cf_g_idx").toString().substring(0, 14));
			}else {
				M.put("cf_t_idx", null);
			}
			M.put("cf_team_idx", (String) newM.get("team_a_idx"));
			M.put("u_id", (String) newM.get("team_a_user_a"));
			M.put("c_idx", (String) newM.get("team_a_club"));
			vv++;
			M2.put("cf_e_gidx", (String) newM.get("cf_gidx") + "_" + vv);
			M2.put("cf_gidx", (String) newM.get("cf_gidx"));
			M2.put("cf_g_idx", (String) newM.get("cf_g_idx"));
			if(newM.get("cf_g_idx") != null) {
				M2.put("cf_t_idx", newM.get("cf_g_idx").toString().substring(0, 14));
			}else {
				M2.put("cf_t_idx", null);
			}
			M2.put("cf_team_idx", (String) newM.get("team_a_idx"));
			M2.put("u_id", (String) newM.get("team_a_user_b"));
			M2.put("c_idx", (String) newM.get("team_a_club"));
			vv++;
			M3.put("cf_e_gidx", (String) newM.get("cf_gidx") + "_" + vv);
			M3.put("cf_gidx", (String) newM.get("cf_gidx"));
			M3.put("cf_g_idx", (String) newM.get("cf_g_idx"));
			if(newM.get("cf_g_idx") != null) {
				M3.put("cf_t_idx", newM.get("cf_g_idx").toString().substring(0, 14));
			}else {
				M3.put("cf_t_idx", null);
			}
			M3.put("cf_team_idx", (String) newM.get("team_b_idx"));
			M3.put("u_id", (String) newM.get("team_b_user_a"));
			M3.put("c_idx", (String) newM.get("team_b_club"));
			vv++;
			M4.put("cf_e_gidx", (String) newM.get("cf_gidx") + "_" + vv);
			M4.put("cf_gidx", (String) newM.get("cf_gidx"));
			M4.put("cf_g_idx", (String) newM.get("cf_g_idx"));
			if(newM.get("cf_g_idx") != null) {
				M4.put("cf_t_idx", newM.get("cf_g_idx").toString().substring(0, 14));
			}else {
				M4.put("cf_t_idx", null);
			}
			M4.put("cf_team_idx", (String) newM.get("team_b_idx"));
			M4.put("u_id", (String) newM.get("team_b_user_b"));
			M4.put("c_idx", (String) newM.get("team_b_club"));
			endGameList.add(M);
			endGameList.add(M2);
			endGameList.add(M3);
			endGameList.add(M4);

		}

		System.out.println("end게임" + endGameList);

		List<Object> rGameList = new ArrayList<Object>();
		/*for (int i = 0; i < gameLista.size() + 1; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			System.out.println(i);
			newM = (Map<String, Object>) gameLista.get(i);
			int jjj = 0;
			for (int jk = 0; jk < rGameList.size(); jk++) {
				Map<String, Object> nM = new HashMap<String, Object>();
				nM = (Map<String, Object>) rGameList.get(jk);
				if (nM.containsValue(newM.get("cf_gidx"))) { // rgamelist에
																// cfgidx가없다면
																// jjj는1
					jjj = 1;
					break;
				}
			}
			System.out.println(Arrays.asList(ar).toString());
			System.out.println(i);
			System.out.println(gameLista.size());

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
				gameLista.remove(newM);
				if (gameLista.isEmpty()) {
					break;
				}
			} else if (i + 1 == gameLista.size()) {
				System.out.println(i);
				System.out.println(gameLista.size());
				ar[va] = ""; // 0 +4 = 4 4+4 = 8 8+4=12
				ar[va + 1] = "";
				ar[va + 2] = "";
				ar[va + 3] = "";
				va = va + 4;
				i = -1;
				Map<String, Object> nM = new HashMap<String, Object>();
				nM.put("cf_gidx", cf_idx + "_blank" + bl);
				nM.put("team_b_idx", null);
				nM.put("team_a_idx", null);
				nM.put("team_a_user_a", null);
				nM.put("team_a_user_b", null);
				nM.put("team_b_user_a", null);
				nM.put("team_b_user_b", null);
				nM.put("cf_g_idx", null);
				rGameList.add(nM);
				bl++;
				if (gameLista.isEmpty()) {
					break;
				}
			}
			if (va == (Integer.parseInt(cfvo.getCf_court()) * 4)) {
				// 여기서 23은 ar의 배열사이즈-1(배열은0부터시작이기때문)
				// va+3==(Integer.parseInt(cfvo.getCf_court())*4)-1
				for (int j = 0; j < Integer.parseInt(cfvo.getCf_court()) * 4; j++) {
					// 여기서 반복 횟수는 사용 가능 코트수*4
					ar[j] = "";
				}
				va = 0;
			}
		}*/
		/*
		 * for(int ac = 0 ; ac<second.length;ac++){ for(int ad = 0 ;
		 * ad<second[ac].length;ad++){ System.out.println("2차원"+second[ac][ad]);
		 * } }
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
		int s = (rGameList.size() / (Integer.parseInt(cfvo.getCf_court())*10)) * 5;/*
		if((rGameList.size() / Integer.parseInt(cfvo.getCf_court())) % 2 != 0){
			s= s+1;
		}*/
		/*for (int i = 0; i < s; i++) {
			Map<String, Object> newM = new HashMap<String, Object>();
			for(int j = 0 ; j<Integer.parseInt(cfvo.getCf_court());j++){
				newM = (Map<String, Object>) rGameList.get(ii);
				rGameList2.add(newM);
				ii++;
			}
			for(int j = 0 ; j<Integer.parseInt(cfvo.getCf_court());j++){
				newM = (Map<String, Object>) rGameList.get(jj+(Integer.parseInt(cfvo.getCf_court()) * 5));
				rGameList2.add(newM);
				jj++;
				if((jj+(Integer.parseInt(cfvo.getCf_court()) * 5))%(Integer.parseInt(cfvo.getCf_court())*10)==0){
					jj=jj+(Integer.parseInt(cfvo.getCf_court()) * 5);
					ii=ii+(Integer.parseInt(cfvo.getCf_court()) * 5);
					System.out.println();
				}
			}
			
		}
		System.out.println(rGameList2);
		System.out.println("ii="+ii);
		System.out.println(rGameList.size()%4);
		System.out.println(rGameList.size()-ii);
		for(int i = rGameList.size()-rGameList.size()%(Integer.parseInt(cfvo.getCf_court())*10) ; i<rGameList.size();i++){
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) rGameList.get(i);
			rGameList2.add(newM);
		}
		System.out.println("바뀐거 : "+rGameList2);
		*/
		int co = 1;
		int order = 1;
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date date = dateFormat.parse(cfvo.getCf_sTime());
		cal.setTime(date);
		for (int i = 0; i < gameLista.size(); i++) {
			if ((co - 1) == Integer.parseInt(cfvo.getCf_court())) {
				co = 1;
				order++;
				cal.add(Calendar.MINUTE, Integer.parseInt(cfvo.getCf_time()));
			}
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) gameLista.get(i);
			newM.put("cf_u_court", co);
			newM.put("cf_order", order);
			newM.put("cf_w_date", dateFormat.format(cal.getTime()));
			newM.put("cf_no", i + 1);
			co++;
		}
		Map<String, Object> cf_match = new HashMap<String, Object>();

		cf_match.put("list", gameLista);
		cf_match.put("cf_idx", cf_idx);
		cf_match.put("cf_status", "대기");

		Map<String, Object> cf_match_end = new HashMap<String, Object>();

		cf_match_end.put("list", endGameList);
		cf_match_end.put("cf_idx", cf_idx);

		int cf = cfService.gameInsert(cf_match, cf_match_end);

		System.out.println(rGameList2);
		System.out.println(rGameList.size()%4);
		System.out.println(rGameList.size());
		System.out.println(rGameList2.size());
		System.out.println(rGameList);
		System.out.println(hae);
		for(int i = 0; i<gameLista.size(); i++ ) {
			Map<String,String> map4 = (Map<String, String>) gameLista.get(i);
			String aTeam = "A팀 : 1번  : "+map4.get("team_a_user_a") +" 2번 : "+map4.get("team_a_user_b");
			String bTeam = "B팀 : 1번  : "+map4.get("team_b_user_a") +" 2번 : "+map4.get("team_b_user_b");
			System.out.println(aTeam + bTeam);
			System.out.println(map4.get("cf_w_date"));
		}
		if (cf > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	@RequestMapping("Cfight/CfightTimeList.techni")
	public String timeMatchList(HttpSession session, Model model) {
		String cf_idx = (String) session.getAttribute("cf_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("cf_idx", cf_idx);
		map.put("type", "MGL_CFIGHT_W_DAT");

		List<CfightVO> list = cfService.timeMatchList(cf_idx);
		/*List<CfightVO> list2 = cfService.matchList(map);*/
		
		String c_idx = (String) session.getAttribute("c_idx");
		String cfm = "";
		
		map.put("c_idx", (String) session.getAttribute("c_idx"));

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		List<CfightVO> list3 = cfService.cFightTypeList(map);
		
		for (CfightVO cvo : list3) {
			if (mvo.getM_id().equals(cvo.c_u_mid) && c_idx.equals(cvo.cf_c_idx)) {
				cfm = "매니저";
			}
		}
		CfightVO cfvo = cfService.gameDetail(cf_idx);
		int all_court =Integer.parseInt(cfvo.getCf_court());
		model.addAttribute("all_court", all_court);
		model.addAttribute("list", list);/*
		model.addAttribute("list2", list2);*/
		model.addAttribute("cfm", cfm);

		return "cFight/cFightTimeList.pag";
	}

	@RequestMapping("Cfight/CfightCourtList.techni")
	public String courtMatchList(HttpSession session, Model model) {
		String cf_idx = (String) session.getAttribute("cf_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("cf_idx", cf_idx);
		map.put("type", "MGL_CFIGHT_COURT");

		List<CfightVO> list = cfService.courtMatchList(cf_idx);
		List<CfightVO> list2 = cfService.matchList(map);
		CfightVO cfvo = cfService.gameDetail(cf_idx);
		int all_court =Integer.parseInt(cfvo.getCf_court());
		model.addAttribute("all_court", all_court);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

		return "cFight/cFightCourtList.pag";
	}

	@RequestMapping("Cfight/CfightTypeList.techni")
	public String typeMatchList(HttpSession session, Model model) {
		String cf_idx = (String) session.getAttribute("cf_idx");
		Map<String, String> map = new HashMap<String, String>();

		map.put("cf_idx", cf_idx);

		List<CfightVO> list = cfService.typeMatchList(cf_idx);

		model.addAttribute("list", list);

		return "cFight/cFightTypeList.pag";
	}

	@RequestMapping("Cfight/CfightMatchDetail.techni")
	public String MatchDetail(HttpSession session, Model model, @RequestParam String cf_g_idx) {

		List<CfightVO> list = cfService.typeMatchDetail(cf_g_idx);

		String cf_idx = (String) session.getAttribute("cf_idx");

		Map<String, String> map = new HashMap<String, String>();

		map.put("cf_idx", cf_idx);
		map.put("cf_g_idx", cf_g_idx);
		
		String c_idx = (String) session.getAttribute("c_idx");
		String cfm = "";

		map.put("c_idx", (String) session.getAttribute("c_idx"));

		MemberVO mvo = (MemberVO) session.getAttribute("login");

		List<CfightVO> list4= cfService.cFightTypeList(map);
		
		for (CfightVO cvo : list4) {
			if (mvo.getM_id().equals(cvo.c_u_mid) && c_idx.equals(cvo.cf_c_idx)) {
				cfm = "매니저";
			}
		}

		List<CfightVO> list2 = cfService.typeDetailList(map);

		List<CfightVO> list3 = cfService.typeDetailRank(map);
		CfightVO cfvo = cfService.gameDetail(cf_idx);
		int all_court =Integer.parseInt(cfvo.getCf_court());
		model.addAttribute("all_court", all_court);
		session.setAttribute("cf_t_nm", list2.get(0).getCf_t_nm());
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("cfm", cfm);
		model.addAttribute("cf_g_idx", cf_g_idx.substring(0, 15));

		return "cFight/cFightMatchDetail.pag";
	}

	@RequestMapping("Cfight/CfightEntryType.techni")
	public String entryType(HttpSession session, Model model) {

		String cf_idx = (String) session.getAttribute("cf_idx");

		List<CfightVO> list = cfService.entryTypeList(cf_idx);
		List<CfightVO> list2 = cfService.entryTypeDetail(cf_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

		return "cFight/cFightEntryType.pag";
	}

	@RequestMapping("Cfight/CfightEntryClub.techni")
	public String entryClub(HttpSession session, Model model) {

		String cf_idx = (String) session.getAttribute("cf_idx");

		List<CfightVO> list = cfService.entryClubList(cf_idx);
		List<CfightVO> list2 = cfService.entryClubDetail(cf_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

		return "cFight/cFightEntryClub.pag";
	}

	@RequestMapping("Cfight/CfightReferee.techni")
	public String referee(HttpSession session, Model model, @RequestParam(required = false) String cf_court) {

		String cf_idx = (String) session.getAttribute("cf_idx");
		if (cf_court == null) {
			cf_court = "1";
		}
		Map<String, String> map = new HashMap<String, String>();

		map.put("cf_idx", cf_idx);
		map.put("cf_court", cf_court + "");

		List<CfightVO> list = cfService.referee(map);
		List<CfightVO> list2 = cfService.cf_nm(cf_idx);
		
		int court = cfService.courtCount(cf_idx);
		CfightVO cfvo = cfService.gameDetail(cf_idx);
		int all_court =Integer.parseInt(cfvo.getCf_court());
		model.addAttribute("cf_court", cf_court);
		model.addAttribute("court", court);
		model.addAttribute("list", list);
		model.addAttribute("list2",list2);
		model.addAttribute("all_court", all_court);
		
		return "cFight/cFightReferee.pag";
	}

	@RequestMapping("Cfight/CfightMyRank.techni")
	public String myRank(HttpSession session, Model model,@RequestParam(required = false)String cf_idx) {
		if(cf_idx==null) {
			cf_idx = (String) session.getAttribute("cf_idx");
		}else if(cf_idx=="") {
			cf_idx = (String) session.getAttribute("cf_idx");
		}
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();

		map.put("cf_idx", cf_idx);
		map.put("u_id", mvo.getM_id());

		List<CfightVO> list = cfService.myRank(map);
		List<CfightVO> list2 = cfService.myTypeList(map);
		List<CfightVO> list3 = cfService.cf_nm(cf_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("u_id", mvo.getM_id());

		return "cFight/cFightMyRank.pag";
	}

	@RequestMapping("Cfight/CfightTypeRank.techni")
	public String typeRank(HttpSession session, Model model) {

		String cf_idx = (String) session.getAttribute("cf_idx");

		List<CfightVO> list = cfService.cfTypeList(cf_idx);
		List<CfightVO> list2 = cfService.cfTypeRank(cf_idx);

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

		return "cFight/cFightTypeRank.pag";
	}

	@RequestMapping("Cfight/CfightSummary.techni")
	public String Summary(HttpSession session, Model model) {

		String cf_idx = (String) session.getAttribute("cf_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cf_idx", cf_idx);
		map.put("c_idx", (String) session.getAttribute("c_idx"));

		List<CfightVO> list = cfService.cFightJoinClub(cf_idx);
		List<CfightVO> list2 = cfService.cFightTypeList(map);

		String cfm = "";
		String yn = list.get(0).getCf_yn();
		String c_idx=(String) session.getAttribute("c_idx");
		for (CfightVO cvo : list2) {
			if (mvo.getM_id().equals(cvo.c_u_mid) && c_idx.equals(cvo.cf_c_idx)) {
				cfm = "매니저";
			}
		}
		model.addAttribute("cfm", cfm);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("yn", yn);
		
		return "cFight/cFightSummary.pag";
	}

	@RequestMapping("Cfight/CfightScoreInsert.techni")
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
		String cf_gidx = (String) json2.get("cf_gidx");
		String cf_idx = (String) session.getAttribute("cf_idx");
		System.out.println(cm_a1_id);

		int aS = Integer.parseInt(aScore);
		int bS = Integer.parseInt(bScore);

		map2.put("a1_id", cm_a1_id);
		map2.put("a2_id", cm_a2_id);
		map2.put("b1_id", cm_b1_id);
		map2.put("b2_id", cm_b2_id);
		map2.put("cf_idx", cf_idx);

		List<CfightVO> list = cfService.pointUser(map2);

		int hon = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCf_u_sex().equals("M")) {
				hon++;
			}
		}
		System.out.println("hon" + hon);

		double Tgr = 0.0;
		for (int i = 0; i < list.size(); i++) {
			double gr = 0;
			if (hon != 0 || hon != 4) {
				switch (list.get(i).getCf_u_sex()) {
				case "F":
					gr = gr + 0.5;
					break;
				default:
					break;
				}
			}
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getCf_u_sex() + "   공력  : " + gr);
			if (list.get(i).getCf_u_gd() == null) {
				list.get(i).setCf_u_gd("왕초");
			}
			switch (list.get(i).getCf_u_gd()) {
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
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getCf_u_sex() + "급수 :  " + list.get(i).getU_club_gd()
					+ "   공력  : " + gr);

			switch (list.get(i).getCf_u_age()) {
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
			System.out.println(i + "  :  " + "성별 : " + list.get(i).getCf_u_age() + "급수 :  " + list.get(i).getCf_u_gd()
					+ "  나이대  :" + list.get(i).getCf_u_age() + "대" + "공력  : " + gr);

			if (hon != 0 && hon != 4) {
				gr = gr / (double) 3;
			} else {
				gr = gr / (double) 2;
			}
			list.get(i).setUeffort(Math.round(gr * 100d) / 100d);

			Tgr = Tgr + gr;

		}
		System.out.println("총공력 : " + Tgr);
		System.out.println(list.get(0).getCf_u_id() + " 의 손실공력은 " + list.get(0).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(0).getUeffort() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(1).getCf_u_id() + " 의 손실공력은 " + list.get(1).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(1).getUeffort() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(2).getCf_u_id() + " 의 손실공력은 " + list.get(2).getUeffort() + " 이고 게임 포인트는 "
				+ Math.round(((list.get(2).getUeffort() / Tgr) * 10) * 100d) / 100d);
		System.out.println(list.get(3).getCf_u_id() + " 의 손실공력은 " + list.get(3).getUeffort() + " 이고 게임 포인트는 "
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

		map3.put("cf_gidx", cf_gidx);
		map3.put("list", list);

		int res = cfService.pointUpdate(map3, cf_gidx);

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}

		return map;
	}

	@RequestMapping("Cfight/CfightClubRank.techni")
	public String clubRank(HttpSession session, Model model) {
		String cf_idx = (String) session.getAttribute("cf_idx");

		List<CfightVO> list = cfService.clubRank(cf_idx);

		model.addAttribute("list", list);

		return "cFight/cFightClubRank.pag";
	}
	@RequestMapping("Cfight/ExcelTimeDownload.techni")
	public void Exceldownload(HttpServletRequest req , HttpServletResponse res,HttpSession session) throws IOException, RowsExceededException, WriteException{
	
		String cf_idx = (String) session.getAttribute("cf_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("cf_idx", cf_idx);
		map.put("type", "MGL_CFIGHT_W_DAT");

		List<CfightVO> list = cfService.matchList(map);
		
		File file2 = new File("C:\\MGLPROJECT\\mgl\\mgl\\src\\main\\webapp\\resources\\apkDownload\\Mgl.xls");
		if(!file2.exists()){
			file2.createNewFile();
		}
		
		WritableWorkbook workbook = Workbook.createWorkbook(file2);
		
		WritableSheet sheet = workbook.createSheet("민턴in", 0);
		
		Label label;
		int j = 0;
		for(int i = 0; i<list.size();i++){
			label = null;
			label = new Label(0,j,list.get(i).getCf_w_date().substring(0, 5));
			sheet.addCell(label);
			label = new Label(1,j,list.get(i).getCf_court()+"코트");
			sheet.addCell(label);
			label = new Label(2,j,list.get(i).getCf_no()+"게임");
			sheet.addCell(label);
			label = new Label(3,j,"");
			sheet.addCell(label);
			j++;
			label = new Label(0,j,list.get(i).getTeam_a_nm());
			sheet.addCell(label);
			label = new Label(1,j,list.get(i).getA1_id()+"("+list.get(i).getA1_age()+"-"+list.get(i).getA1_gd()+")");
			sheet.addCell(label);
			label = new Label(2,j,list.get(i).getA2_id()+"("+list.get(i).getA2_age()+"-"+list.get(i).getA2_gd()+")");
			sheet.addCell(label);
			label = new Label(3,j,"");
			sheet.addCell(label);
			j++;
			label = new Label(0,j,list.get(i).getTeam_b_nm());
			sheet.addCell(label);
			label = new Label(1,j,list.get(i).getB1_id()+"("+list.get(i).getB1_age()+"-"+list.get(i).getB1_gd()+")");
			sheet.addCell(label);
			label = new Label(2,j,list.get(i).getB2_id()+"("+list.get(i).getB2_age()+"-"+list.get(i).getB2_gd()+")");
			sheet.addCell(label);
			label = new Label(3,j,"");
			sheet.addCell(label);
			j++;
		}
		workbook.write();
		workbook.close();
		
		
		req.setCharacterEncoding("UTF-8");
	
		String savePath = "C:\\MGLPROJECT\\mgl\\mgl\\src\\main\\webapp\\resources\\apkDownload";
		String filename = "Mgl.xls";
		String orgfilename = "mgl.xls";
		
		
		InputStream in =null;
		OutputStream os =null;
		File file = null;
		boolean skip = false;
		String client = "";
		try{
			
			try{
				file = new File(savePath,filename);
				in = new FileInputStream(file);
			}catch(FileNotFoundException fe){
				skip = true;
			}
			
			client = req.getHeader("User-Agent");
			
			res.reset();
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Description", "JSP Generated Data");
			
			if(!skip){
				 if(client.indexOf("MSIE") != -1){
		                res.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
		 
		            }else{
		                // 한글 파일명 처리
		                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
		 
		                res.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
		                res.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
		            } 
		             
		            res.setHeader ("Content-Length", ""+file.length() );
		 
		            os = res.getOutputStream();
		            byte b[] = new byte[(int)file.length()];
		            int leng = 0;
		             
		           while( (leng = in.read(b)) > 0 ){
		                os.write(b,0,leng);
		            }
		 
		        }else{
		            res.setContentType("text/html;charset=UTF-8");
		        }
			
			}catch(Exception e){
				System.out.println("파일 다운로드 에러 = " + e);
		}finally{
			in.close();
			os.close();
		}
		if( file2.exists() ){
            if(file2.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }

	}
	@RequestMapping("/Cfight/CfightPush.techni")
	public String boardPush(Model model,HttpSession session, @RequestParam String a1_id,@RequestParam String a2_id,@RequestParam String b1_id,@RequestParam String b2_id,@RequestParam String court){
				
				Map<String,String> map = new HashMap<String,String>();
				
				map.put("a1_id", a1_id);
				map.put("a2_id", a2_id);
				map.put("b1_id", b1_id);
				map.put("b2_id", b2_id);
				
				MemberController mc = new MemberController();
				MultiValueMap<String,String> param1 = new LinkedMultiValueMap<>();
				List<CfightVO> list5 = cfService.push(map);
				for(CfightVO cvo : list5){
					String token = "";
					if(cvo != null){
						if(cvo.getToken() == null){
						}else{
							token = cvo.getToken();
						}
					}
					param1.clear();
					param1.add("sendtype", "push");
					param1.add("appcode", "techni_mglb");
					param1.add("notitype", "noti");
					param1.add("oscode", "a");
					param1.add("token", token);
					param1.add("title", "민턴in");
					param1.add("desc", court+"번 코트에 대기해 주세요.");
					param1.add("dataval", "http://mgl.techni.co.kr:8081/Cfight/CfightDetail.techni");
					mc.token(param1);
					Map<String,String> map2 = new HashMap<String,String>();
					map2.put("push_id", token);
					map2.put("push_ment", court+"번 코트에 대기해 주세요.");
					map2.put("push_url", "http://mgl.techni.co.kr:8081/Cfight/CfightDetail.techni");
					map2.put("u_nm", "mgl시스템");
					ucService.pushInsert(map2);
				}
				
				String cf_idx = (String) session.getAttribute("cf_idx");
				Map<String, String> map2 = new HashMap<String, String>();

				map.put("cf_idx", cf_idx);
				map.put("cf_court", court + "");

				List<CfightVO> list = cfService.referee(map);
				List<CfightVO> list2 = cfService.cf_nm(cf_idx);
				
				int court2 = cfService.courtCount(cf_idx);
				model.addAttribute("cf_court", court);
				model.addAttribute("court", court2);
				model.addAttribute("list", list);
				model.addAttribute("list2",list2);
				
				return "cFight/cFightReferee.pag";
	}
	@RequestMapping("Cfight/CfightAllMatch.techni")
	public String allMatch(HttpSession session, Model model){
		String cf_idx = (String) session.getAttribute("cf_idx");
		
		List<CfightVO> list = cfService.all_court(cf_idx);
		List<CfightVO> list2 = cfService.all_dat(cf_idx);
		List<CfightVO> list3 = cfService.all_match(cf_idx);
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		
		return "cFight/cFightAllMatch.pag";
	}
	@RequestMapping("/Cfight/CfightDelete.techni")
	@ResponseBody
	public Map<Object,Object> cfightDelete(@RequestBody String json) throws ParseException{
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		
		Map<Object,Object> map = new HashMap<Object,Object>();
		
		int cnt = cfService.cFightDelete((String) json2.get("cf_idx"));
		
		map.put("cnt", cnt);
		
		return map;
	}
}
