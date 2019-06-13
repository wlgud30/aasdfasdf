package com.techni.mgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.microsoft.schemas.office.x2006.encryption.STSaltSize;
import com.techni.mgl.domain.CfightVO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.ContestVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.service.ClubService;
import com.techni.mgl.service.ContestService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class ContestController {

	@Resource(name = "uploadPath3")
	String uploadPath;
	@Resource(name="uploadPath4")
	String uploadPath1;
	@Autowired
	public ClubService cService;
	@Autowired
	public UClubService ucService;
	@Autowired
	public MemberService mService;
	@Autowired
	public ContestService ctService;

	@RequestMapping("/Contest/ContestInsert.techni")
	@ResponseBody
	public Map<Object, Object> contestInsert(HttpSession session,MultipartHttpServletRequest req)
			throws ParseException, IOException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		Map<String, String> map4 = new HashMap<String, String>();
		
		String ct_start_date = req.getParameter("ct_start_date");
		String ct_start_time = req.getParameter("ct_start_time");
		String ct_end_date = req.getParameter("ct_end_date");
		String ct_end_time = req.getParameter("ct_end_time");
		String ct_start = ct_start_date+" "+ct_start_time;
		String ct_end = ct_end_date+" "+ct_end_time;
		
		map1.put("ct_nm", req.getParameter("ct_nm"));
		map1.put("ct_homepage", req.getParameter("ct_homepage"));
		map1.put("ct_start", ct_start);
		map1.put("ct_end", ct_end);
		map1.put("ct_startline", req.getParameter("ct_startline"));
		map1.put("ct_deadline", req.getParameter("ct_deadline"));
		map1.put("ct_location", req.getParameter("ct_location"));
		map1.put("ct_host", req.getParameter("ct_host"));
		map1.put("ct_supervision", req.getParameter("ct_supervision"));
		map1.put("ct_support", req.getParameter("ct_support"));
		map1.put("ct_sponsor", req.getParameter("ct_sponsor"));
		map1.put("ct_inquiry", req.getParameter("ct_inquiry"));
		map1.put("ct_point", req.getParameter("ct_point"));
		map1.put("ct_time", req.getParameter("ct_time"));
		map1.put("ct_court", req.getParameter("ct_court"));
		map1.put("ct_match_yn", "N");
		map1.put("ct_entry_fee", req.getParameter("ct_entry_fee"));
		map1.put("ct_account", req.getParameter("ct_account"));
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		map1.put("ct_host_user", mvo.getM_id());
		map1.put("ct_appeal", req.getParameter("ct_appeal"));
		String ct_points = req.getParameter("ct_points");
		String ct_or_img = req.getParameter("ct_or_img");
		MultipartFile file = req.getFile("filename");
		MultipartFile file_img = req.getFile("filename_img");

		if (file.getSize() != 0) {
			String orignalFileName = file.getOriginalFilename();
			String orignalImgFileName = file_img.getOriginalFilename();
			map1.put("ct_points", orignalFileName);
			map1.put("ct_or_img", orignalImgFileName);
			String[] fileNameArr = orignalFileName.split("\\.");
			String[] imgFileNameArr = orignalImgFileName.split("\\.");
			Date date = new Date();
			String fileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];
			String imgFileName = imgFileNameArr[0] + date.getTime() + "." + imgFileNameArr[1];
			File target = new File(uploadPath, fileName);
			File targetImg = new File(uploadPath1, imgFileName);
			FileCopyUtils.copy(file.getBytes(), target);
			FileCopyUtils.copy(file_img.getBytes(), targetImg);

			String filePath = "/resources/uploadContest/" + fileName;
			String imgFilePath = "/resources/uploadCtImg/" + imgFileName;
			map1.put("ct_attach", filePath);
			map1.put("ct_st_img", imgFilePath);
		} else {
			map1.put("ct_attach", ct_points);
			map1.put("ct_st_img", ct_or_img);
		}
		int res = ctService.contestInsert(map1);

		String ct_idx = map1.get("ct_idx");

		if (res > 0) {
			
			String sql = "CREATE TABLE mgl_contest." + ct_idx
					+ "_kind (MGL_CT_TYPE_IDX VARCHAR(15) NOT NULL,MGL_CT_IDX VARCHAR(30) NULL,MGL_CT_TYPE_NM VARCHAR(30) NULL,MGL_CT_TYPE_KIND VARCHAR(2) NULL,MGL_CT_TYPE_NUM INT(3) NULL,MGL_CT_GROUP_SPLIT VARCHAR(1) NULL,PRIMARY KEY (MGL_CT_TYPE_IDX))";
			map4.put("sql", sql);
			ctService.createKindTable(map4);
			
			String sql1 = "CREATE TABLE mgl_contest." + ct_idx
						+ "_group (MGL_CT_GROUP_IDX VARCHAR(30) NOT NULL,MGL_CT_IDX VARCHAR(30) NOT NULL,MGL_CT_TYPE_IDX VARCHAR(30) NULL,MGL_CT_GROUP_NUM INT(3) NULL,MGL_CT_GROUP_COUNT INT(3) NULL,PRIMARY KEY (MGL_CT_GROUP_IDX))";
			map4.put("sql", sql1);
			ctService.createGroupTable(map4);
			
			String sql2 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_team (MGL_CT_TEAM_IDX VARCHAR(50) NOT NULL,MGL_CT_IDX VARCHAR(50) NOT NULL,MGL_CT_TYPE_IDX VARCHAR(50) NULL,MGL_CT_GROUP_IDX VARCHAR(50) NULL,MGL_CT_CLUB_NM VARCHAR(50) NULL,MGL_CT_USER_A VARCHAR(50) NULL,MGL_CT_USER_B VARCHAR(50) NULL,MGL_CT_FEE_YN VARCHAR(1) NOT NULL,PRIMARY KEY (MGL_CT_TEAM_IDX))";
			map4.put("sql", sql2);
			ctService.createTeamTable(map4);
			
			String sql3 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_user (MGL_CT_USER_IDX VARCHAR(50) NOT NULL,MGL_CT_IDX VARCHAR(50) NULL,MGL_CT_TYPE_IDX VARCHAR(50) NULL,MGL_CT_USER_ID VARCHAR(50) NULL,MGL_CT_USER_NM VARCHAR(50) NULL,MGL_CT_USER_PHOTO VARCHAR(200) NULL,MGL_CT_USER_BIRTH VARCHAR(50) NULL,MGL_CT_USER_SEX VARCHAR(50) NULL,MGL_CT_USER_GD VARCHAR(50) NULL,MGL_CT_CLUB_NM VARCHAR(50) NULL, MGL_CT_REP_ID VARCHAR(50) NULL, PRIMARY KEY (MGL_CT_USER_IDX))";
			map4.put("sql", sql3);
			ctService.createUserTable(map4);
			
			String sql4 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_wait (MGL_CT_GIDX VARCHAR(50) NOT NULL,MGL_CT_IDX VARCHAR(50) NULL,MGL_CT_W_DAT TIME NULL,MGL_CT_STATUS VARCHAR(50) NULL,MGL_CT_ORDER INT(11) NULL,MGL_CT_NUM INT(11) NULL,MGL_CT_COURT INT(11) NULL,MGL_CT_AT_ID1 VARCHAR(50) NULL,MGL_CT_AT_ID2 VARCHAR(50) NULL,MGL_CT_BT_ID1 VARCHAR(50) NULL,MGL_CT_BT_ID2 VARCHAR(50) NULL,MGL_CT_A_TEAM_IDX VARCHAR(50) NULL,MGL_CT_B_TEAM_IDX VARCHAR(50) NULL,PRIMARY KEY (MGL_CT_GIDX))";
			map4.put("sql", sql4);
			ctService.createWaitTable(map4);
			
			String sql5 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_match_end (MGL_CT_GIDX_GB VARCHAR(50) NOT NULL,MGL_CT_GIDX VARCHAR(50) NULL,MGL_CT_IDX VARCHAR(50) NULL,MGL_CT_CLUB_NM VARCHAR(50) NULL,MGL_CT_TYPE_IDX VARCHAR(50) NULL,MGL_CT_GROUP_IDX VARCHAR(50) NULL,MGL_CT_TEAM_IDX VARCHAR(50) NULL,MGL_CT_USER_ID VARCHAR(50) NULL,MGL_CT_DATE DATE NULL,MGL_CT_USER_GD VARCHAR(50) NULL,MGL_CT_USER_AGE VARCHAR(50) NULL,MGL_CT_UEFFORT FLOAT NULL,MGL_CT_TOTAL INT(11) NULL,MGL_CT_CNT_GAP INT(1) NULL,MGL_CT_WIN CHAR(1) NULL,MGL_CT_GPTN DECIMAL(5,2) NULL,MGL_CT_VPTN DECIMAL(5,2) NULL,MGL_CT_PPTN DECIMAL(5,2) NULL,MGL_CT_APTN DECIMAL(5,2) NULL,MGL_CT_END DATETIME NULL,MGL_CT_REFEREE VARCHAR(50) NULL,PRIMARY KEY (MGL_CT_GIDX_GB))";
			map4.put("sql", sql5);
			ctService.createMatchEndTable(map4);
			
			String sql6 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_seq (MGL_CT_USER_SEQ INT(5) NOT NULL,MGL_CT_TEAM_SEQ INT(5) NULL,PRIMARY KEY (MGL_CT_USER_SEQ))";
			map4.put("sql", sql6);
			ctService.createSeqTable(map4);
			
			String sql7 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_view (MGL_CT_GIDX VARCHAR(50) ,MGL_CT_IDX VARCHAR(50) NULL,MGL_CT_W_DAT TIME NULL,MGL_CT_STATUS VARCHAR(50) NULL,MGL_CT_ORDER INT(11) NULL,MGL_CT_NUM INT(11) NULL,MGL_CT_COURT INT(11) NULL,MGL_CT_TYPE_NM VARCHAR(50) NULL,MGL_CT_AT_ID1 VARCHAR(50) NULL,MGL_CT_AT_NM1 VARCHAR(50) NULL,MGL_CT_AT_AGE1 VARCHAR(50) NULL,MGL_CT_AT_GD1 VARCHAR(50) NULL,MGL_CT_AT_ID2 VARCHAR(50) NULL,MGL_CT_AT_NM2 VARCHAR(50) NULL,MGL_CT_AT_AGE2 VARCHAR(50) NULL,MGL_CT_AT_GD2 VARCHAR(50) NULL,MGL_CT_BT_ID1 VARCHAR(50) NULL,MGL_CT_BT_NM1 VARCHAR(50) NULL,MGL_CT_BT_AGE1 VARCHAR(50) NULL,MGL_CT_BT_GD1 VARCHAR(50) NULL,MGL_CT_BT_ID2 VARCHAR(50) NULL,MGL_CT_BT_NM2 VARCHAR(50) NULL,MGL_CT_BT_AGE2 VARCHAR(50) NULL,MGL_CT_BT_GD2 VARCHAR(50) NULL,MGL_CT_A_TEAM_IDX VARCHAR(50) NULL,MGL_CT_A_TEAM_NM VARCHAR(50) NULL,MGL_CT_A_TEAM_SCORE INT(11) NULL,MGL_CT_B_TEAM_IDX VARCHAR(50) NULL,MGL_CT_B_TEAM_NM VARCHAR(50) NULL,MGL_CT_B_TEAM_SCORE INT(11) NULL)";
			map4.put("sql", sql7);
			ctService.createViewTable(map4);
			
			String sql8 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_staff (MGL_USER_ID VARCHAR(50),MGL_DUTY VARCHAR(50))";
			map4.put("sql", sql8);
			ctService.createStaffTable(map4);
		}
		String[] age = req.getParameterValues("age");
		String[] ct_k_kind = req.getParameterValues("ctk_kind");
		String[] guide = req.getParameterValues("guide");
		
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for (int i = 0; i < age.length; i++) {
			String ct_k_nm = age[i] + "대 ";
			for (int j = 0; j < ct_k_kind.length; j++) {
				ct_k_nm += ct_k_kind[j];
				for (int k = 0; k < guide.length; k++) {
					Map<String, String> map2 = new HashMap<String, String>();
					ct_k_nm += guide[k] + "조";

					ct_k_nm = age[i] + "대 " + ct_k_kind[j];
					/* System.out.println("종목 이름 : " + ctk_nm + guide[k] + "조"); */

					map2.put("ct_k_nm", ct_k_nm + " " + guide[k] + "조");
					map2.put("ct_k_kind", ct_k_kind[j]);
					list.add(map2);
				}
			}
		}
		map3.put("list", list);
		map3.put("ct_idx", ct_idx);
		
		int res2 = ctService.contestKindInsert(map3);
		int res3 = ctService.insertSeq(map3);
		
		if (res2 > 0 && res3 > 0) {
			map.put("cnt", 1);
			map.put("ct_idx", ct_idx);
		} else {
			map.put("cnt", 0);
		}
		return map;
	}

	@RequestMapping(value = "/Contest/ContestMain.techni")
	  public String contestMain(HttpSession session, Model model) {
	      List<ContestVO> ingList = ctService.selectCtIngList();
	      model.addAttribute("ingList", ingList);
	      List<ContestVO> preList = ctService.selectCtPreList();
	      model.addAttribute("preList", preList);
	      List<ContestVO> adList = ctService.contestAdList();
	      ContestVO ctvo = ctService.selectCt("CT190429008");
	      model.addAttribute("ctvo", ctvo);
	      model.addAttribute("adList", adList);
	      
	      if (session.getAttribute("login") == null) {
	         return "contest/contestMain.pa";
	      } else {
	         return "contest/contestMain.pa";
	      }

	   }

	@RequestMapping(value = "/Contest/ContestCreate.techni")
	public String contestCreate(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestCreate.pa";
		} else {
			return "contest/contestCreate.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestApplication.techni")
	public String contestApplication(HttpSession session) {
		
		if (session.getAttribute("login") == null) {
			return "contest/contestApplication.pa";
		} else {
			return "contest/contestApplication.pa";
		}
	}
	
	@RequestMapping(value = "/Contest/ContestApplicationAct.techni")
	@ResponseBody
	public Map<Object, Object> contestApplicationAct(HttpSession session,@RequestBody String json) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		int result = ctService.contestApplicationAct(session, json);
		if(result == 1) {
			map.put("cnt", 1);
		}else {
			map.put("cnt", 0);
		}
		return map;
	}
	
	@RequestMapping(value = "/Contest/ContestUserInsert.techni")
	@ResponseBody
	public Map<Object, Object> contestUserInsert(HttpSession session,@RequestBody String json) throws ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String,String> map1 = new HashMap<String,String>();
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		MemberVO mvo = new MemberVO();
		mvo.setM_id((String) json2.get("u_tel"));
		mvo.setM_pw((String) json2.get("u_birth"));
		mvo.setM_sex((String) json2.get("u_sex"));
		mvo.setM_nm((String) json2.get("u_nm"));
		mvo.setM_tel((String) json2.get("u_tel"));
		mvo.setM_birth((String) json2.get("u_birth"));
		mvo.setM_tsize("95");
		mvo.setM_photo("");
		mvo.setM_club_gd("무급");
		mvo.setM_city_gd("무급");
		mvo.setM_do_gd("무급");
		mvo.setM_con_gd("무급");
		mvo.setM_club_temp_nm((String) json2.get("u_club_nm"));
		mvo.setM_user_temp_yn("Y");
		if(mvo.getM_photo()==""){
			if(mvo.getM_sex().contains("M")){
				mvo.setM_photo("/resources/img/man_face.svg");
			}else{
				mvo.setM_photo("/resources/img/woman_face.svg");
			}
		}
		map1.put("m_tel", mvo.getM_tel());
        map1.put("m_birth", mvo.getM_birth());
		int res = mService.birthTelCheck(map1);
		if(res > 0) {
			map.put("cnt", 1);
		}else {
			int res2 = mService.memberInsert(mvo);
			int s_res = mService.m_join_seq();
			if(res2 > 0 && s_res > 0){
				map1.put("m_id", mvo.getM_tel());
				map1.put("m_pw", mvo.getM_birth());
				MemberVO login = mService.login(map1);
				session.setAttribute("login", login);
				map.put("cntt", 1);
			}else { 
				map.put("cntt", 0);
			}
		}
		return map;
	}
	
	@RequestMapping(value = "/Contest/ContestClubRanking.techni")
	public String contestClubRanking(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestClubRanking.pa";
		} else {
			return "contest/contestClubRanking.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestDetail.techni")
	public String contestDetail(@RequestParam(required = false) String ct_idx, HttpSession session, Model model) {
		if(ct_idx == null) {
			ct_idx =(String) session.getAttribute("ct_idx");
		}else {
			session.setAttribute("ct_idx", ct_idx);
		}
		ContestVO ctVO = ctService.selectCt(ct_idx);
		Map<String,String> map = new HashMap<String,String>();
		map.put("ct_idx", ct_idx);
		List<ContestVO> ctTeamCount = ctService.selectCtTeamCount(map);//출전팀, 출전클럽수 가져오기
		List<ContestVO> list1 = ctService.selectCtKindName(map);
		String age = "";
		String kind = "";
		String gd = "";
		for(Object ob : list1) {
			ContestVO kindNm = (ContestVO)ob;
			if(list1.size() == 0) {
				age = kindNm.getCt_k_nm().substring(0,2);
				kind = kindNm.getCt_k_nm().substring(4,6);
				gd = kindNm.getCt_k_nm().substring(7).replace("조","");
			}else {
				if(!age.contains(kindNm.getCt_k_nm().substring(0,2))) {
					age += kindNm.getCt_k_nm().substring(0,2)+",";
				}
				if(!kind.contains(kindNm.getCt_k_nm().substring(4,6))) {
					kind += kindNm.getCt_k_nm().substring(4,6)+",";
				}
				if(!gd.contains(kindNm.getCt_k_nm().substring(7).replace("조",""))) {
					gd += kindNm.getCt_k_nm().substring(7).replace("조","")+",";
				}
			}
		}
		model.addAttribute("age", age);
		model.addAttribute("kind", kind);
		model.addAttribute("gd", gd);
		model.addAttribute("list", ctVO);
		model.addAttribute("ctTeamCount", ctTeamCount);
		session.setAttribute("ct_idx", ct_idx);
		session.setAttribute("ct_nm", ctVO.getCt_nm());
		ctService.ct_hit(ct_idx);
		if (session.getAttribute("login") == null) {		
			return "contest/contestDetail.pa";
		} else {
			return "contest/contestDetail.pa";
		}

	}
	
	@RequestMapping(value = "/Contest/ContestFileDown.techni")
	public String ContestFileDown(HttpSession session, Model model,String gubun) {
		String ct_idx = (String)session.getAttribute("ct_idx");
		ContestVO list = ctService.selectCt(ct_idx);
		
		if(gubun.equals("file")) {
			String stFileName = list.getCt_attach();
			String orFileName = list.getCt_points();
			model.addAttribute("stFileName", stFileName);
			model.addAttribute("orFileName", orFileName);
			model.addAttribute("gubun", gubun);
			return "contest/contestFiledown";
		}else {
			String stImgName = list.getCt_st_img();
			String orImgName = list.getCt_or_img();
			model.addAttribute("stImgName", stImgName);
			model.addAttribute("orImgName", orImgName);
			model.addAttribute("gubun", gubun);
			return "contest/contestFiledown";
		}
	}
	
	@RequestMapping(value = "/Contest/ContestEventPlayer.techni")
	public String contestEventPlayer(HttpSession session,Model model) {
		ctService.contestEventPlayer(session, model);
		if (session.getAttribute("login") == null) {
			return "contest/contestEventPlayer.pa";
		} else {
			return "contest/contestEventPlayer.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestEventRanking.techni")
	public String contestEventRanking(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestEventRanking.pa";
		} else {
			return "contest/contestEventRanking.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestGroupPlayer.techni")
	public String contestGroupPlayer(HttpSession session,Model model) {
		ctService.contestGroupPlayer(session, model);
		if (session.getAttribute("login") == null) {
			return "contest/contestGroupPlayer.pa";
		} else {
			return "contest/contestGroupPlayer.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestLastList.techni")
	public String contestLastList(HttpSession session, Model model) {
		List<ContestVO> list = ctService.selectCtLastList();
		model.addAttribute("list", list);
		if (session.getAttribute("login") == null) {
			return "contest/contestLastList.pa";
		} else {
			return "contest/contestLastList.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestLikeList.techni")
	public String contestLikeList(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestLikeList.pa";
		} else {
			return "contest/contestLikeList.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGame.techni")
	public String contestMyGame(Model model,HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("ct_idx",(String) session.getAttribute("ct_idx"));
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		map.put("u_id", "CT19052101119890101130");
		List<ContestVO> list = ctService.myMatchList(map);
		List<ContestVO> listA = new ArrayList<ContestVO>();
		List<ContestVO> listB = new ArrayList<ContestVO>();
		List<String> k_list = new ArrayList<String>();
		
		for(int i = 0 ; i<list.size();i++) {
			if(!k_list.contains(list.get(i).getCt_k_idx())) {
				k_list.add(list.get(i).getCt_k_idx());
			}
		}
		
		if(k_list.size()==1) {
			listA = list;
		}else {
			for(int i = 0 ; i<list.size();i++) {
				if(list.get(i).getCt_k_idx()==k_list.get(0)) {
					listA.add(list.get(i));
				}else {
					listB.add(list.get(i));
				}
			}
		}
		
		model.addAttribute("listA", listA);
		model.addAttribute("listB", listB);
		if (session.getAttribute("login") == null) {
			return "contest/contestMyGame.pa";
		} else {
			return "contest/contestMyGame.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameCoat.techni")
	public String contestMyGameCoat(HttpSession session,Model model) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		map.put("type", "MGL_CT_COURT");

		List<ContestVO> list = ctService.courtMatchList(map);
		List<ContestVO> list2 = ctService.viewSelect(map);
		ContestVO ctvo = ctService.selectCt(ct_idx);
		
		ContestVO count = ctService.gameCount(map);
		
		int all_game = count.getGame_count();
		int end_game = count.getEnd_count();
		
		double rate = (double)((double)end_game/(double)all_game)*100;
		String dispPattern = "0";
		DecimalFormat form = new DecimalFormat(dispPattern);
		System.out.println(form.format(rate));
		model.addAttribute("all_game", all_game);
		model.addAttribute("end_game", end_game);
		model.addAttribute("persent", form.format(rate));
		
		
		int all_court =ctvo.getCt_court();
		model.addAttribute("all_court", all_court);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameCoat.pa";
		} else {
			return "contest/contestMyGameCoat.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameCoat2.techni")
	@ResponseBody
	public Map<Object,Object> contestMyGameCoat2(HttpSession session,Model model,@RequestBody String court) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		map.put("type", "MGL_CT_COURT");
		map.put("value",court);
		
		Map<Object,Object> re_map = new HashMap<Object,Object>();
		ContestVO ctvo = ctService.selectCt(ct_idx);
		int all_court =ctvo.getCt_court();
		
		List<ContestVO> list2 = ctService.viewSelect(map);
		
		String add="";
		
		for(ContestVO cvo : list2) {
			int  i = cvo.getCt_num()/all_court+(1-(cvo.getCt_num()/all_court%1))%1;
			i=i+1;
			String kind = "";
			String status="";
			String ateamNm="";
			String bteamNm="";
			int a_score = 0 ;
			int b_score = 0 ;
			String a1_nm ="";
			String a1_info ="";
			String a2_nm ="";
			String a2_info ="";
			String b1_nm ="";
			String b1_info ="";
			String b2_nm ="";
			String b2_info ="";
			
			
			if(cvo.getTeam_a_score()==null) {
				a_score=0;
			}else {
				a_score = Integer.parseInt(cvo.getTeam_a_score());
			}
			if(cvo.getTeam_b_score()==null) {
				b_score=0;
			}else {
				b_score = Integer.parseInt(cvo.getTeam_b_score());
			}
			if(cvo.getCt_gidx().substring(14, 15).equals("w")) {
				kind="본선";
				ateamNm=Integer.parseInt(cvo.getTeam_a_idx().substring(14, 15))+1+"그룹 1위";
				bteamNm=Integer.parseInt(cvo.getTeam_b_idx().substring(14, 15))+1+"그룹 1위";
			}else {
				a1_nm=cvo.getA1_nm();
				a1_info=cvo.getA1_age().substring(0, 1)+"0-"+cvo.getA1_gd();
				a2_nm=cvo.getA2_nm();
				a2_info=cvo.getA2_age().substring(0, 1)+"0-"+cvo.getA2_gd();
				b1_nm=cvo.getB1_nm();
				b1_info=cvo.getB1_age().substring(0, 1)+"0-"+cvo.getB1_gd();
				b2_nm=cvo.getB2_nm();
				b2_info=cvo.getB2_age().substring(0, 1)+"0-"+cvo.getB2_gd();
				kind="예선";
				ateamNm=cvo.getTeam_a_nm();
				bteamNm=cvo.getTeam_b_nm();
			}
			
			if(cvo.getCt_status().equals("대기")) {
				status="<span class=\"sign-round color2\">대기</span>";
			}else {
				status="<span class=\"sign-round color3\">"+cvo.getCt_status()+"</span>";
			}
			
			add+="<div class=\"head-data\">" + 
					"          <div>" + 
					"            <ul class=\"li_col-nol impot\">" + 
					"              <li>"+cvo.getCt_w_dat().substring(0, 5)+"</li><li>"+i+"경기</li>" + 
					"              <li>"+cvo.getCt_k_nm()+"</li>" + 
					"              <li>"+kind+"</li>" + 
					"            </ul>" + 
					"          </div>" + 
					"          <div>" + status+"</div>" + 
					"        </div>";
			
			add+="<table class=\"line_no td-pt\">" + 
					"							<tbody><tr>" + 
					"								<td class=\"club_td\"><span>"+ateamNm+"</span></td>" + 
					"								<td class=\"name3-2_td\">" + 
					"									<ul class=\"name_row\">" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+a1_nm+"</span> " + 
					"											<span class=\"age_rank side_right\">("+a1_info+") </span>" + 
					"										</li>" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+a2_nm+"</span>" + 
					"											<span class=\"age_rank side_right\">("+a2_info+") </span>" + 
					"										</li>" + 
					"									</ul>" + 
					"								</td>" + 
					"								<td class=\"game_score\">"+a_score+"</td>"+ 
					"							</tr>" + 
					"							<tr>" + 
					"								<td class=\"club_td\">" + 
					"									<span>"+bteamNm+"</span>" + 
					"								</td>" + 
					"								<td class=\"name3-2_td\">" + 
					"									<ul class=\"name_row\">" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+b1_nm+"</span>" + 
					"											<span class=\"age_rank side_right\">("+b1_info+") </span>" + 
					"										</li>" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+b2_nm+"</span>" + 
					"											<span class=\"age_rank side_right\">("+b2_info+") </span>" + 
					"										</li>" + 
					"									</ul>" + 
					"								</td>" + 
					"								<td class=\"game_score\">"+b_score+"</td>" + 
					"							</tr>" + 
					"						</tbody></table>";
		}
		
		
		re_map.put("str", add);
		
		
		return re_map;
	}
	@RequestMapping(value = "/Contest/ContestMyGameEvent.techni")
	public String contestMyGameEvent(HttpSession session,Model model) {
		
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String,String> map = new HashMap<String,String>();
		map.put("ct_idx", ct_idx);
		
		List<ContestVO> list = ctService.selectCtKindList(map);
		ContestVO count = ctService.gameCount(map);
		
		int all_game = count.getGame_count();
		int end_game = count.getEnd_count();
		
		double rate = (double)((double)end_game/(double)all_game)*100;
		String dispPattern = "0";
		DecimalFormat form = new DecimalFormat(dispPattern);
		System.out.println(form.format(rate));
		model.addAttribute("all_game", all_game);
		model.addAttribute("end_game", end_game);
		model.addAttribute("persent", form.format(rate));
		
		model.addAttribute("list", list);
		
		
		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameEvent.pa";
		} else {
			return "contest/contestMyGameEvent.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameEventDetail.techni")
	public String contestMyGameEventDetail(HttpSession session,Model model,@RequestParam String ct_g_idx) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String,String> map = new HashMap<String,String>();
		map.put("ct_idx", ct_idx);
		map.put("ct_g_idx", ct_g_idx);
		map.put("ct_g_idx2", ct_g_idx+"_");
		map.put("ct_k_idx",ct_g_idx.substring(0, 13));
		map.put("i", ct_g_idx.length()+1+"");
		System.out.println(ct_g_idx.length());
		ContestVO ctvo = ctService.selectCt(ct_idx);
		int all_court =ctvo.getCt_court();
		List<ContestVO> list = ctService.detailRank(map);
		List<ContestVO> list2 = ctService.detailCalendar(map);
		List<ContestVO> listG = ctService.groupList(map);
		model.addAttribute("all_court", all_court);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("listG", listG);
		model.addAttribute("g_num", (ct_g_idx.length()==15)?ct_g_idx.substring(14, 15):ct_g_idx.subSequence(14, 16));
		
		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameEventDetail.pa";
		} else {
			return "contest/contestMyGameEventDetail.pa";
		}

	}
	
	@RequestMapping(value = "/Contest/ContestMyGameEventDetail2.techni")
	@ResponseBody
	public Map<Object,Object> contestMyGameEventDetail2(HttpSession session,Model model,@RequestBody String ct_g_idx) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String,String> map = new HashMap<String,String>();
		Map<Object,Object> re_map = new HashMap<Object,Object>();
		map.put("ct_idx", ct_idx);
		map.put("ct_g_idx2", ct_g_idx+"_");
		map.put("ct_g_idx", ct_g_idx);
		map.put("ct_k_idx",ct_g_idx.substring(0, 13));
		map.put("i", ct_g_idx.length()+1+"");
		ContestVO ctvo = ctService.selectCt(ct_idx);
		int all_court =ctvo.getCt_court();
		List<ContestVO> list = ctService.detailRank(map);
		List<ContestVO> list2 = ctService.detailCalendar(map);
		model.addAttribute("all_court", all_court);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		String add="";
		for(ContestVO cvo : list2) {
			int  i = cvo.getCt_num()/all_court+(1-(cvo.getCt_num()/all_court%1))%1;
			i=i+1;
			int a_score = 0 ;
			int b_score = 0 ;
			if(cvo.getTeam_a_score()==null) {
				a_score=0;
			}else {
				a_score = Integer.parseInt(cvo.getTeam_a_score());
			}
			if(cvo.getTeam_b_score()==null) {
				b_score=0;
			}else {
				b_score = Integer.parseInt(cvo.getTeam_b_score());
			}
			add+="<div class='head-data'><div><ul class='li_col-nol impot'><li>"+cvo.getCt_court()+"코트</li><li>"+i+"경기</li><li>"+cvo.getCt_k_nm()+" - "+cvo.getCt_gidx().substring(14, 15)+"그룹</li><li>예선</li></ul></div>";
			if(cvo.getCt_status().equals("대기")) {
				add+="<div><span class='sign-round color2'>대기</span></div></div>";
			}else {
				add+="<div><span class='sign-round color3'>"+cvo.getCt_status()+"</span></div></div>";
			}
			add+="<table class=\"line_no td-pt\">" + 
					"							<tbody><tr>" + 
					"								<td class=\"club_td\"><span>"+cvo.getTeam_a_nm()+"</span></td>" + 
					"								<td class=\"name3-2_td\">" + 
					"									<ul class=\"name_row\">" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+cvo.getA1_nm()+"</span> " + 
					"											<span class=\"age_rank side_right\">("+cvo.getA1_age().substring(0, 1)+"-"+cvo.getA1_gd()+") </span>" + 
					"										</li>" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+cvo.getA2_nm()+"</span>" + 
					"											<span class=\"age_rank side_right\">("+cvo.getA2_age().substring(0, 1)+"-"+cvo.getA2_gd()+") </span>" + 
					"										</li>" + 
					"									</ul>" + 
					"								</td>" + 
					"								<td class=\"game_score\">"+a_score+"</td>"+ 
					"							</tr>" + 
					"							<tr>" + 
					"								<td class=\"club_td\">" + 
					"									<span>"+cvo.getTeam_b_nm()+"</span>" + 
					"								</td>" + 
					"								<td class=\"name3-2_td\">" + 
					"									<ul class=\"name_row\">" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+cvo.getB1_nm()+"</span>" + 
					"											<span class=\"age_rank side_right\">("+cvo.getB1_age().substring(0, 1)+"-"+cvo.getB1_gd()+") </span>" + 
					"										</li>" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+cvo.getB2_nm()+"</span>" + 
					"											<span class=\"age_rank side_right\">("+cvo.getB2_age().substring(0, 1)+"-"+cvo.getB2_gd()+") </span>" + 
					"										</li>" + 
					"									</ul>" + 
					"								</td>" + 
					"								<td class=\"game_score\">"+b_score+"</td>" + 
					"							</tr>" + 
					"						</tbody></table>";
			System.out.println(i);
		}
		re_map.put("str", add);
		String add2="";
		Object a;
		int i =1;
		for(ContestVO cvo : list) {
			if(cvo.getTotal_sum()==0) {
				a="-";
			}else {
				a=i;
				i++;
			}
			add2+="<tr>	<td class=\"no_td\">"+a+"</td>" + 
					"	<td class=\"club_td\"><span class=\"club_name\">"+cvo.getCt_club_nm()+"</span></td>" + 
					"	<td class=\"na_row_td\"><span class=\"name3\">"+cvo.getA1_id()+"</span><span class=\"name3\">"+cvo.getB1_id()+"</span></td>" + 
					"	<td class=\"td_1\">"+cvo.getWin_count()/2+"</td>" + 
					"	<td class=\"td_1\">"+cvo.getLose_count()/2+"</td>" + 
					"	<td class=\"td_2\">"+cvo.getTotal_sum()/2+"</td>" + 
					"	<td class=\"td_2\">"+((cvo.getTotal_sum()/2)-(cvo.getGap_sum()/2))+"</td>" + 
					"	<td class=\"td_2\">"+cvo.getGap_sum()/2+"</td>" + 
					"</tr>";
		}
		re_map.put("str2", add2);
		
		return re_map;

	}

	@RequestMapping(value = "/Contest/ContestMyGameTime.techni")
	public String contestMyGameTime(HttpSession session,Model model) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		map.put("type", "MGL_CT_W_DAT");

		List<ContestVO> list = ctService.timeMatchList(map);
		
		ContestVO ctvo = ctService.selectCt(ct_idx);
		int all_court =ctvo.getCt_court();
		
		ContestVO count = ctService.gameCount(map);
		
		int all_game = count.getGame_count();
		int end_game = count.getEnd_count();
		
		double rate = (double)((double)end_game/(double)all_game)*100;
		String dispPattern = "0";
		DecimalFormat form = new DecimalFormat(dispPattern);
		System.out.println(form.format(rate));
		model.addAttribute("all_game", all_game);
		model.addAttribute("end_game", end_game);
		model.addAttribute("persent", form.format(rate));
		
		model.addAttribute("all_court", all_court);
		model.addAttribute("list", list);
		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameTime.pa";
		} else {
			return "contest/contestMyGameTime.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameTime2.techni")
	@ResponseBody
	public Map<Object,Object> contestMyGameTime2(HttpSession session,Model model,@RequestBody String time) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		map.put("type", "MGL_CT_W_DAT");
		map.put("value",time);
		
		Map<Object,Object> re_map = new HashMap<Object,Object>();
		ContestVO ctvo = ctService.selectCt(ct_idx);
		int all_court =ctvo.getCt_court();
		
		List<ContestVO> list2 = ctService.viewSelect(map);
		
		String add="";
		
		for(ContestVO cvo : list2) {
			int  i = cvo.getCt_num()/all_court+(1-(cvo.getCt_num()/all_court%1))%1;
			i=i+1;
			String kind = "";
			String status="";
			String ateamNm="";
			String bteamNm="";
			int a_score = 0 ;
			int b_score = 0 ;
			String a1_nm ="";
			String a1_info ="";
			String a2_nm ="";
			String a2_info ="";
			String b1_nm ="";
			String b1_info ="";
			String b2_nm ="";
			String b2_info ="";
			
			
			if(cvo.getTeam_a_score()==null) {
				a_score=0;
			}else {
				a_score = Integer.parseInt(cvo.getTeam_a_score());
			}
			if(cvo.getTeam_b_score()==null) {
				b_score=0;
			}else {
				b_score = Integer.parseInt(cvo.getTeam_b_score());
			}
			if(cvo.getCt_gidx().substring(14, 15).equals("w")) {
				kind="본선";
				ateamNm=Integer.parseInt(cvo.team_a_idx.substring(14, 15))+1+"그룹 1위";
				bteamNm=Integer.parseInt(cvo.team_b_idx.substring(14, 15))+1+"그룹 1위";
			}else {
				a1_nm=cvo.getA1_nm();
				a1_info=cvo.getA1_age().substring(0, 1)+"0-"+cvo.getA1_gd();
				a2_nm=cvo.getA2_nm();
				a2_info=cvo.getA2_age().substring(0, 1)+"0-"+cvo.getA2_gd();
				b1_nm=cvo.getB1_nm();
				b1_info=cvo.getB1_age().substring(0, 1)+"0-"+cvo.getB1_gd();
				b2_nm=cvo.getB2_nm();
				b2_info=cvo.getB2_age().substring(0, 1)+"0-"+cvo.getB2_gd();
				kind="예선";
				ateamNm=cvo.getTeam_a_nm();
				bteamNm=cvo.getTeam_b_nm();
			}
			
			if(cvo.getCt_status().equals("대기")) {
				status="<span class=\"sign-round color2\">대기</span>";
			}else {
				status="<span class=\"sign-round color3\">"+cvo.getCt_status()+"</span>";
			}
			
			add+="<div class=\"head-data\">" + 
					"          <div>" + 
					"            <ul class=\"li_col-nol impot\">" + 
					"              <li>"+cvo.getCt_court()+"코트</li><li>"+i+"경기</li>" + 
					"              <li>"+cvo.getCt_k_nm()+"</li>" + 
					"              <li>"+kind+"</li>" + 
					"            </ul>" + 
					"          </div>" + 
					"          <div>" + status+"</div>" + 
					"        </div>";
			
			add+="<table class=\"line_no td-pt\">" + 
					"							<tbody><tr>" + 
					"								<td class=\"club_td\"><span>"+ateamNm+"</span></td>" + 
					"								<td class=\"name3-2_td\">" + 
					"									<ul class=\"name_row\">" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+a1_nm+"</span> " + 
					"											<span class=\"age_rank side_right\">("+a1_info+") </span>" + 
					"										</li>" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+a2_nm+"</span>" + 
					"											<span class=\"age_rank side_right\">("+a2_info+") </span>" + 
					"										</li>" + 
					"									</ul>" + 
					"								</td>" + 
					"								<td class=\"game_score\">"+a_score+"</td>"+ 
					"							</tr>" + 
					"							<tr>" + 
					"								<td class=\"club_td\">" + 
					"									<span>"+bteamNm+"</span>" + 
					"								</td>" + 
					"								<td class=\"name3-2_td\">" + 
					"									<ul class=\"name_row\">" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+b1_nm+"</span>" + 
					"											<span class=\"age_rank side_right\">("+b1_info+") </span>" + 
					"										</li>" + 
					"										<li>" + 
					"											<span class=\"name3 name_max\">"+b2_nm+"</span>" + 
					"											<span class=\"age_rank side_right\">("+b2_info+") </span>" + 
					"										</li>" + 
					"									</ul>" + 
					"								</td>" + 
					"								<td class=\"game_score\">"+b_score+"</td>" + 
					"							</tr>" + 
					"						</tbody></table>";
		}
		
		
		re_map.put("str", add);
		
		
		return re_map;

	}
	
	@RequestMapping(value = "/Contest/ContestMyRanking.techni")
	public String contestMyRanking(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestMyRanking.pa";
		} else {
			return "contest/contestMyRanking.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestParticipateList.techni")
	public String contestParticipateList(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestParticipateList.pa";
		} else {
			return "contest/contestParticipateList.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestPlayerSearch.techni")
	public String contestPlayerSearch(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestPlayerSearch.pa";
		} else {
			return "contest/contestPlayerSearch.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestReferee.techni")
	public String contestReferee(HttpSession session,Model model) {
		
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String,String> map = new HashMap<String,String>();
		map.put("ct_idx", ct_idx);
		map.put("ct_court", "1");
		
		List<ContestVO> list = ctService.courtMatchList(map);
		List<ContestVO> listC = ctService.courtMatchList2(map);
		ContestVO ctvo = ctService.selectCt(ct_idx);
		int all_court =ctvo.getCt_court();
		model.addAttribute("list",list);
		model.addAttribute("listC", listC);
		model.addAttribute("all_court", all_court);

		if (session.getAttribute("login") == null) {
			return "contest/contestReferee.pa";
		} else {
			return "contest/contestReferee.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestReferee2.techni")
	@ResponseBody
	public Map<Object,Object> contestReferee2(HttpSession session,@RequestBody String ct_court) {
		
		String ct_idx = (String) session.getAttribute("ct_idx");
		Map<String,String> map = new HashMap<String,String>();
		Map<Object,Object> re_map = new HashMap<Object,Object>();
		
		map.put("ct_idx", ct_idx);
		map.put("ct_court", ct_court);
		ContestVO ctvo = ctService.selectCt(ct_idx);
		List<ContestVO> listC = ctService.courtMatchList2(map);
		int all_court =ctvo.getCt_court();
		String add="";
		int index =0;
		for(ContestVO cvo : listC) {
			int  i = cvo.getCt_num()/all_court+(1-(cvo.getCt_num()/all_court%1))%1;
			i=i+1;

			String kind = "";
			String status="";
			String ateamNm="";
			String bteamNm="";
			String a1_nm ="";
			String a1_info ="";
			String a2_nm ="";
			String a2_info ="";
			String b1_nm ="";
			String b1_info ="";
			String b2_nm ="";
			String b2_info ="";
			if(cvo.getCt_gidx().contains("win")) {
				kind="본선";
				if(cvo.getTeam_a_idx().length()==13) {
					ateamNm=cvo.getTeam_a_nm();
				}else if(cvo.getTeam_a_idx().length()==15&&!cvo.getTeam_a_idx().contains("win")) {
					ateamNm=Integer.parseInt(cvo.getTeam_a_idx().substring(cvo.getTeam_a_idx().length()-1, cvo.getTeam_a_idx().length()))+"그룹 1위";
				}else if(!cvo.getTeam_a_idx().contains("win")) {
					System.out.println(cvo.getTeam_a_idx().length());
					System.out.println(cvo.getTeam_a_idx());
					ateamNm=Integer.parseInt(cvo.getTeam_a_idx().substring(cvo.getTeam_a_idx().length()-2, cvo.getTeam_a_idx().length()))+"그룹 1위";
				}else if(cvo.getTeam_a_idx().length()==15&&cvo.getTeam_a_idx().contains("win")) {
					ateamNm=Integer.parseInt(cvo.getTeam_a_idx().substring(17, 18))+"차전"+(Integer.parseInt(cvo.getTeam_a_idx().substring(cvo.getTeam_a_idx().length()-1, cvo.getTeam_a_idx().length()))+1)+"게임 승자";
				}else if(cvo.getTeam_a_idx().contains("win")) {
					ateamNm=Integer.parseInt(cvo.getTeam_a_idx().substring(17, 18))+"차전"+(Integer.parseInt(cvo.getTeam_a_idx().substring(cvo.getTeam_a_idx().length()-1, cvo.getTeam_a_idx().length()))+1)+"게임 승자";
				}
				if(cvo.getTeam_b_idx().length()==13) {
					bteamNm=cvo.getTeam_b_nm();
				}else if(cvo.getTeam_b_idx().length()==15&&!cvo.getTeam_b_idx().contains("win")) {
					bteamNm=Integer.parseInt(cvo.getTeam_b_idx().substring(cvo.getTeam_b_idx().length()-1, cvo.getTeam_b_idx().length()))+"그룹 1위";
				}else if(!cvo.getTeam_b_idx().contains("win")){
					bteamNm=Integer.parseInt(cvo.getTeam_b_idx().substring(cvo.getTeam_b_idx().length()-2, cvo.getTeam_b_idx().length()))+"그룹 1위";
				}else if(cvo.getTeam_b_idx().length()==15&&cvo.getTeam_a_idx().contains("win")) {
					bteamNm=Integer.parseInt(cvo.getTeam_b_idx().substring(17, 18))+"차전"+(Integer.parseInt(cvo.getTeam_b_idx().substring(cvo.getTeam_b_idx().length()-1, cvo.getTeam_b_idx().length()))+1)+"게임 승자";
				}else if(cvo.getTeam_b_idx().contains("win")) {
					bteamNm=Integer.parseInt(cvo.getTeam_b_idx().substring(17, 18))+"차전"+(Integer.parseInt(cvo.getTeam_b_idx().substring(cvo.getTeam_b_idx().length()-1, cvo.getTeam_b_idx().length()))+1)+"게임 승자";
				}
				
			}else {
				kind="예선";
			}
			if(cvo.getA1_nm()!=null) {
				a1_nm=cvo.getA1_nm();
				a1_info=cvo.getA1_age().substring(0, 1)+"0-"+cvo.getA1_gd();
				a2_nm=cvo.getA2_nm();
				a2_info=cvo.getA2_age().substring(0, 1)+"0-"+cvo.getA2_gd();
				
				ateamNm=cvo.getTeam_a_nm();
				
			}if(cvo.getB1_nm()!=null) {
				b1_nm=cvo.getB1_nm();
				System.out.println(cvo.getTeam_a_idx());
				b1_info=cvo.getB1_age().substring(0, 1)+"0-"+cvo.getB1_gd();
				System.out.println(cvo.getTeam_a_idx());
				b2_nm=cvo.getB2_nm();
				b2_info=cvo.getB2_age().substring(0, 1)+"0-"+cvo.getB2_gd();
				bteamNm=cvo.getTeam_b_nm();
			}
			
			if(index==1) {
				status="<span class=\"sign-round color2\">예정</span>";
			}else {
				status="<span class=\"sign-round color2\">대기</span>";
			}
			if(index!=0) {
				
				
				add +="<ul class=\"li_col-nol impot_bg\">" + 
						"      <li>"+cvo.getCt_w_dat().substring(0,5)+"</li>" + 
						"      <li>"+cvo.getCt_court()+"코트 "+i+"경기</li>" + 
						"      <li>"+cvo.getCt_k_nm()+"</li>" + 
						"      <li>"+kind+"</li>" + 
						"    </ul>";
				add+="<table class=\"line_no td-pt score-result3\">" + 
						"      <tbody><tr>" + 
						"        <td class=\"club_name32\"><span class=\"club_name\">"+ateamNm+"</span>" + 
						"          <ul class=\"name_col\">" + 
						"            <li>" + 
						"              <span class=\"name3\">"+a1_nm+"</span>" + 
						"              <span class=\"age_rank\">("+a1_info+")</span>" + 
						"            </li>" + 
						"            <li>" + 
						"              <span class=\"name3\">"+a2_nm+"</span>" + 
						"              <span class=\"age_rank\">("+a2_info+")</span>" + 
						"            </li>" + 
						"          </ul></td>" + 
						"        <td class=\"score2_td\">"+status+"</td>" + 
						"        <td class=\"club_name32\"><span class=\"club_name\">"+bteamNm+"</span>" + 
						"          <ul class=\"name_col\">" + 
						"            <li>" + 
						"              <span class=\"name3\">"+b1_nm+"</span>" + 
						"              <span class=\"age_rank\">("+b1_info+")</span>" + 
						"            </li>" + 
						"            <li>" + 
						"              <span class=\"name3\">"+b2_nm+"</span>" + 
						"              <span class=\"age_rank\">("+b2_info+")</span>" + 
						"            </li>" + 
						"          </ul></td>" + 
						"      </tr>" + 
						"    </tbody></table>";
			}else if(index==0){
				add+="<input type=\"hidden\" name=\"ct_gidx\" id=\"ct_gidx\" value=\""+cvo.getCt_gidx()+"\"/><input type=\"hidden\" name=\"a1_id\" id=\"a1_id\" value=\""+cvo.getCt_at_id1()+"\"/>" + 
						"			<input type=\"hidden\" name=\"a2_id\" id=\"a2_id\" value=\""+cvo.getCt_at_id2()+"\"/>" + 
						"			<input type=\"hidden\" name=\"b1_id\" id=\"b1_id\" value=\""+cvo.getCt_bt_id1()+"\"/>" + 
						"			<input type=\"hidden\" name=\"b2_id\" id=\"b2_id\" value=\""+cvo.getCt_bt_id2()+"\"/><input type=\"hidden\" value=\""+cvo.getTeam_a_idx()+"\" name=\"aTeam\" id=\"aTeam\"><input type=\"hidden\" value=\""+cvo.getTeam_b_idx()+"\" name=\"bTeam\" id=\"bTeam\"><div class=\"line_dark pd_0\">" + 
						"      <ul class=\"li_col-nol impot_bg\">" + 
						"        <li>"+cvo.getCt_w_dat().substring(0,5)+"</li>" + 
						"        <li>"+cvo.getCt_court()+"코트 "+i+"경기</li>" + 
						"        <li>"+cvo.getCt_k_nm()+"</li>" + 
						"        <li>"+kind+"</li>" + 
						"      </ul>" + 
						"      <table class=\"line_no td-pt score-result3\">" + 
						"        <tbody><tr>" + 
						"          <td class=\"club_name32\"><span class=\"club_name\">"+ateamNm+"</span>" + 
						"            <ul class=\"name_col\">" + 
						"              <li>" + 
						"                <span class=\"name3\">"+a1_nm+"</span>" + 
						"                <span class=\"age_rank\">("+a1_info+")</span>" + 
						"              </li>" + 
						"              <li>" + 
						"                <span class=\"name3\">"+a2_nm+"</span>" + 
						"                <span class=\"age_rank\">("+a2_info+")</span>" + 
						"              </li>" + 
						"            </ul>" + 
						"            <div class=\"score_input_area\">" + 
						"              <input id=\"aScore\" type=\"number\" placeholder=\"00\" class=\"box_input cet_lay\">" + 
						"            </div></td>" + 
						"          <td class=\"score2_td\"><span class=\"sign-round color3\">진행</span></td>" + 
						"          <td class=\"club_name32\"><span class=\"club_name\">"+bteamNm+"</span>" + 
						"            <ul class=\"name_col\">" + 
						"              <li>" + 
						"                <span class=\"name3\">"+b1_nm+"</span>" + 
						"                <span class=\"age_rank\">("+b1_info+")</span>" + 
						"              </li>" + 
						"              <li>" + 
						"                <span class=\"name3\">"+b2_nm+"</span>" + 
						"                <span class=\"age_rank\">("+b2_info+")</span>" + 
						"              </li>" + 
						"            </ul>" + 
						"            <div class=\"score_input_area\">" + 
						"              <input id=\"bScore\" type=\"number\" placeholder=\"00\" class=\"box_input cet_lay\">" + 
						"            </div></td>" + 
						"        </tr>" + 
						"      </tbody></table>" + 
						"      <div class=\"btn_full pd_lrb\">" + 
						"        <span class=\"btn_st\" onclick=\"pSubmit('"+cvo.getA1_id()+"','"+cvo.getA2_id()+"','"+cvo.getB1_id()+"','"+cvo.getB2_id()+"','"+cvo.getCt_gidx()+"')\">점수 등록</span>" + 
						"      </div>" + 
						"    </div>";
			}
			index++;
		}
		re_map.put("str", add);

		return re_map;

	}

	@RequestMapping(value = "/Contest/ContestSearch.techni")
	public String contestSearch(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestSearch.pa";
		} else {
			return "contest/contestSearch.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestStep.techni")
	public String contestStep(HttpSession session,Model model) {
		String ct_idx = (String) session.getAttribute("ct_idx");
		
		Map<String,String> map1 = new HashMap<String,String>();
		Map<String,String> map2 = new HashMap<String,String>();
		
		map1.put("ct_idx", ct_idx);
		map1.put("kind", "MGL_CT_W_DAT");
		
		map2.put("ct_idx", ct_idx);
		map2.put("kind", "MGL_CT_COURT");
		
		List<ContestVO> listT = ctService.courtOrTimeList(map1);
		List<ContestVO> listC = ctService.courtOrTimeList(map2);
		
		List<ContestVO> list = ctService.statusList(map1);
		
		model.addAttribute("listT", listT);
		model.addAttribute("listC", listC);

		model.addAttribute("list", list);
		
		if (session.getAttribute("login") == null) {
			return "contest/contestStep.pa";
		} else {
			return "contest/contestStep.pa";
		}

	}
	
	@RequestMapping(value = "/Contest/ContestHit.techni")
	@ResponseBody
	public String contestHit(@RequestBody String json) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		String ct_idx = (String)json2.get("ct_idx");
		ctService.ct_hit(ct_idx);
		String cnt = "1";
		return cnt;
	}
	
	@RequestMapping(value = "/Contest/ContestClubList.techni")
	@ResponseBody
	public Object contestClubList(HttpSession session) throws ParseException {
		
		Map<String,Object> val = new HashMap<String,Object>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		List<ClubVO> list = ucService.selectAll(mvo.getM_id());
		
		val.put("list", list);
		
		return val;
	}
	
	@RequestMapping(value = "/Contest/ContestClubUserList.techni")
	@ResponseBody
	public Object contestClubUserList(@RequestBody String c_idx) throws ParseException {
		Map<String,Object> val = new HashMap<String,Object>();
		
		List<UClubVO> list = ucService.UClubMList(c_idx);
		
		val.put("list", list);
		
		return val;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/Contest/ContestGroupInsert.techni")
	@ResponseBody
	public Map<Object, Object> contestGroupInsert(Model model, HttpSession session)
			throws ParseException, java.text.ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<String,String> ct_map = new HashMap<String,String>();
		String ct_idx = (String) session.getAttribute("ct_idx");

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		Map<String, Object> insertMap = new HashMap<String, Object>();
		Map<String, Object> updateMap = new HashMap<String, Object>();
		System.out.println(ct_idx);
		ct_map.put("ct_idx", ct_idx);
		List<ContestVO> feeTeamList = ctService.feeTeamList(ct_map);
		for(int i = 0 ; i<feeTeamList.size();i++) {
			int count = feeTeamList.get(i).getCt_k_count();
			if(count < 2) {
				map.put("cnt","0");
				return map;
			}else if(count <= 5) {
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_1");
				map3.put("ct_g_count", count);
				map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
				map3.put("ct_g_no", "1");
				list.add(map3);
			}else if(count%3==0){
				int c = count/3;
				for(int k = 1 ; k<=c;k++) {
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_"+k);
					map3.put("ct_g_count",3);
					map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
					map3.put("ct_g_no", k+"");
					list.add(map3);
				}
			}else if(count%3==1) {
				int c = count/3;
				c=c-1;
				for(int k = 1 ; k<=c;k++) {
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_"+k);
					map3.put("ct_g_count",3);
					map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
					map3.put("ct_g_no", k+"");
					list.add(map3);
				}
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_"+(c+1));
				map3.put("ct_g_count",4);
				map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
				map3.put("ct_g_no", c+1+"");
				list.add(map3);
			}else if(count%3==2) {
				int c = count/3;
				c = c-2;
				for(int k = 1 ; k<=c;k++) {
					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_"+k);
					map3.put("ct_g_count",3);
					map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
					map3.put("ct_g_no", k+"");
					list.add(map3);
				}
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_"+(c+1));
				map3.put("ct_g_count",4);
				map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
				map3.put("ct_g_no", c+1+"");
				list.add(map3);
				Map<String, Object> map4 = new HashMap<String, Object>();
				map4.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_"+(c+2));
				map4.put("ct_g_count",4);
				map4.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx());
				map4.put("ct_g_no", c+2+"");
				list.add(map4);
			}
			int co = count/3;
			int a=(co%2!=0)?co-1:co;
			int b=0;
			int c=0;
			int d=0;
			if(co==2||co==3||co==5||co==9) {
				a=2;
			}else if(co==4||co==6||co==10) {
				a=4;
			}else if(co==7||co==11) {
				a=6;
			}else if(co==8||co==12) {
				a=8;
			}else if(co==13) {
				a=10;
			}else if(co==14) {
				a=12;
			}else if(co==15) {
				a=14;
			}else if(co==16) {
				a=16;
			}
			if(co<=4) {
				b=2;
			}else if(co<=8) {
				b=4;
				c=2;
			}else if(co<=16) {
				b=8;
				c=4;
				d=2;
			}
			
			if(count/3 != 1 && count/3 ==2) {
				  Map<String, Object> map3 = new HashMap<String, Object>(); 
				  map3.put("ct_g_idx",feeTeamList.get(i).getCt_k_idx() + "_win"+1); 
				  map3.put("ct_g_count",2);
				  map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx()); 
				  map3.put("ct_g_no","1"); 
				  list.add(map3); 
			}else if(count/3 != 1&& count/3 <5) {
				Map<String,Object> map3 = new HashMap<String, Object>(); 
				map3.put("ct_g_idx",feeTeamList.get(i).getCt_k_idx() + "_win1"); 
				map3.put("ct_g_count",a);
				map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx()); 
				map3.put("ct_g_no","1"); list.add(map3); 
				Map<String, Object> map4 = new HashMap<String,Object>(); 
				map4.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_win2");
				map4.put("ct_g_count",b); 
				map4.put("ct_k_idx",feeTeamList.get(i).getCt_k_idx()); 
				map4.put("ct_g_no", "2"); list.add(map4);
			}else if(count/3 != 1 && count/3 <=8) { 
				Map<String, Object> map3 = new HashMap<String, Object>(); 
				map3.put("ct_g_idx",feeTeamList.get(i).getCt_k_idx() + "_win1"); 
				map3.put("ct_g_count",a);
				map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx()); 
				map3.put("ct_g_no","1"); 
				list.add(map3); 
				Map<String, Object> map4 = new HashMap<String,Object>(); 
				map4.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_win2");
				map4.put("ct_g_count",b); map4.put("ct_k_idx",feeTeamList.get(i).getCt_k_idx()); 
				map4.put("ct_g_no", "2"); list.add(map4);
				Map<String, Object> map5 = new HashMap<String, Object>();
				map5.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_win3");
				map5.put("ct_g_count",c); map5.put("ct_k_idx",feeTeamList.get(i).getCt_k_idx()); 
				map5.put("ct_g_no", "3"); list.add(map5);
			}else if(count/3 != 1 && count/3 <=16) { 
				Map<String, Object> map3 = new HashMap<String, Object>(); 
				map3.put("ct_g_idx",feeTeamList.get(i).getCt_k_idx() + "_win1"); 
				map3.put("ct_g_count",a);
				map3.put("ct_k_idx", feeTeamList.get(i).getCt_k_idx()); 
				map3.put("ct_g_no","1"); 
				list.add(map3); 
				Map<String, Object> map4 = new HashMap<String,Object>(); 
				map4.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_win2");
				map4.put("ct_g_count",b); map4.put("ct_k_idx",feeTeamList.get(i).getCt_k_idx()); 
				map4.put("ct_g_no", "2"); list.add(map4);
				Map<String, Object> map5 = new HashMap<String, Object>();
				map5.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_win3");
				map5.put("ct_g_count",c); map5.put("ct_k_idx",feeTeamList.get(i).getCt_k_idx()); 
				map5.put("ct_g_no", "3"); list.add(map5);
				Map<String, Object> map6 = new HashMap<String, Object>();
				map6.put("ct_g_idx", feeTeamList.get(i).getCt_k_idx() + "_win4");
				map6.put("ct_g_count",d); map6.put("ct_k_idx",feeTeamList.get(i).getCt_k_idx()); 
				map6.put("ct_g_no", "4"); list.add(map6);
			  }
		}

		
		System.out.println(list);
		

		List<ContestVO> c_nm_list = ctService.feeClubList(ct_map);

		Map<String, Object> map1 = new HashMap<String,Object>();
		map1.put("ct_idx", ct_idx);
		List<String> c_nm_insertList = new ArrayList<String>();
		for (ContestVO ctvo : c_nm_list) {
			c_nm_insertList.add(ctvo.getCt_club_nm());
		}
		map1.put("list", c_nm_insertList);
		
		
		
		System.out.println(list.size());
		System.out.println(list);
		
		List<ContestVO> team_list = ctService.feeClubTeamList(map1);
		System.out.println(list.size());
		System.out.println(team_list.size());
		System.out.println(list);
		System.out.println(team_list);
		int var = 0;
		for (int i = 0; i < list.size(); i++) {
			if(!list.get(i).get("ct_g_idx").toString().contains("win")) {
				int c = (int) list.get(i).get("ct_g_count");
				System.out.println(c);
				for (int j = 0; j < c; j++) {//0 1 2 3
					Map<String, Object> map4 = new HashMap<String, Object>();
					map4.put("ct_team_idx", team_list.get(var).getCt_t_idx());//0번째
					System.out.println("팀인덱스 : " + team_list.get(var).getCt_t_idx());
					map4.put("ct_g_idx", list.get(i).get("ct_g_idx"));//0번째
					System.out.println("그룹인덱스 : " + list.get(i).get("ct_g_idx"));
					var++;
					list2.add(map4);
				}
			}
			
		}
		
		//여기서부터수정
		/*
		 * for (int i = 0; i < list.size(); i++) {
		 * if(!list.get(i).get("ct_g_idx").toString().contains("win")) { int c = (int)
		 * list.get(i).get("ct_g_count");//해당 그룹에 참여하고있는 팀만큼 반복문
		 * map1.put("ct_k_idx",list.get(i).get("ct_k_idx")); List<ContestVO> team_list
		 * =ctService.feeClubTeamList(map1); for (int j = 0; j < c; j++) { Map<String,
		 * Object> map4 = new HashMap<String, Object>(); map4.put("ct_team_idx",
		 * team_list.get(j).getCt_t_idx());//팀인덱스와 그룹인덱스를 맵에넣고 리스트에 추가
		 * System.out.println("팀인덱스 : " + team_list.get(j).getCt_t_idx());
		 * map4.put("ct_g_idx", list.get(i).get("ct_g_idx"));
		 * System.out.println("그룹인덱스 : " + list.get(i).get("ct_g_idx"));
		 * list2.add(map4); team_list.remove(j); } }
		 * 
		 * }
		 */
		insertMap.put("list", list);
		insertMap.put("ct_idx", ct_idx);
		updateMap.put("list", list2);
		updateMap.put("ct_idx",ct_idx);
		System.out.println(list2);
		int res = ctService.teamGroupUpdate(insertMap, updateMap);	//팀테이블에 그룹인덱스를 업데이트 시키고 그룹테이블에 그룹정보 인서트(그룹인덱스,대회인덱스,종목인덱스,그룹순서,그룹에 소속된 팀수)

		if (res > 0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
			
		}
		String hae = "";
		System.out.println(list2.get(0));
		for(Map<String, Object> a : list) {
			System.out.println(a);
		}
		List<Object> gameList = new ArrayList<Object>();
		List<ContestVO> g_idx_list = ctService.groupIdx(ct_map);	//그룹인덱스와 그룹에 참여하고있는 팀수 를 리스트로 출력	CF_G_IDX == 그룹인덱스  CF_GIDX == 게임인덱스
		System.out.println("인덱스 리스트" + g_idx_list);
		for (ContestVO cvo : g_idx_list) {
			Map<String, String> pMap = new HashMap<String, String>();

			pMap.put("ct_idx", ct_idx);
			pMap.put("ct_g_idx", cvo.getCt_g_idx());			//여기서 이프문으로 한번 걸러야함(승리그룹과 그냥그룹)
			pMap.put("ct_k_idx",cvo.getCt_k_idx());
			if(cvo.getCt_g_idx().contains("win")) {
				int g = 0;
				hae += cvo.getCt_t_idx()+",";//해당 종목의 그룹수와 1차전 카운트가 같지 않다면 카운트만큼 팀을 1차전에 랜덤으로넣고 나머지팀들을 2차전 카운트에넣는다 같다면 1차전에 다넣는다
						Map<String, String> uMap = new HashMap<String, String>();
						uMap.put("ct_g_idx", cvo.getCt_g_idx());
						uMap.put("ct_gidx", cvo.getCt_g_idx());
						uMap.put("team_a_idx", cvo.getCt_k_idx());
						uMap.put("team_a_user_a", cvo.getCt_k_idx());
						uMap.put("team_a_user_b", cvo.getCt_k_idx());
						uMap.put("team_a_club", cvo.getCt_k_idx()+"_club_nm");
						uMap.put("team_b_idx", cvo.getCt_k_idx());
						uMap.put("team_b_user_a",cvo.getCt_k_idx());
						uMap.put("team_b_user_b",cvo.getCt_k_idx());
						uMap.put("team_b_club", cvo.getCt_k_idx()+"_club_nm");
						uMap.put("ct_g_count", cvo.getCt_g_count()+"");
						gameList.add(uMap);
				
			}else {
			List<ContestVO> group = ctService.groupAll(pMap);	//그룹인덱스를 조건으로 선수아이디를 가져온다 만약 승리 그룹이면 종목에 참여한 모든 선수 아이디를 가져온다
			
			int g = 0;
			hae += cvo.getCt_t_idx()+",";
			if (cvo.getCt_g_count()==5) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 10; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("ct_g_idx", cvo.getCt_g_idx());
					uMap.put("ct_gidx", cvo.getCt_g_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCt_t_idx());
					uMap.put("team_a_user_a", group.get(a).getCt_t_user_a());
					uMap.put("team_a_user_b", group.get(a).getCt_t_user_b());
					uMap.put("team_a_club", group.get(a).getCt_club_nm());
					uMap.put("team_b_idx", group.get(b).getCt_t_idx());
					uMap.put("team_b_user_a", group.get(b).getCt_t_user_a());
					uMap.put("team_b_user_b", group.get(b).getCt_t_user_b());
					uMap.put("team_b_club", group.get(b).getCt_club_nm());
					gameList.add(uMap);
					b++;
					g++;
					if (i == (cvo.getCt_g_count() - 1)) {
						a = 1;
						b = 2;
					}
					if (i == (cvo.getCt_g_count() - 1)+ (cvo.getCt_g_count() - 2)) {
						a = 2;
						b = 3;
					}
					if (i == (cvo.getCt_g_count() - 1) + (cvo.getCt_g_count() - 2)
							+ (cvo.getCt_g_count()) - 3) {
						a = 3;
						b = 4;
					}
					if (i == (cvo.getCt_g_count() - 1) + (cvo.getCt_g_count() - 2)
							+ (cvo.getCt_g_count() - 3)
							+ (cvo.getCt_g_count() - 4)) {
						a = 4;
						b = 5;
					}
				}
			} else if (cvo.getCt_g_count()==4) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 6; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("ct_g_idx", cvo.getCt_g_idx());
					uMap.put("ct_gidx", cvo.getCt_g_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCt_t_idx());
					uMap.put("team_a_user_a", group.get(a).getCt_t_user_a());
					uMap.put("team_a_user_b", group.get(a).getCt_t_user_b());
					uMap.put("team_a_club", group.get(a).getCt_club_nm());
					uMap.put("team_b_idx", group.get(b).getCt_t_idx());
					uMap.put("team_b_user_a", group.get(b).getCt_t_user_a());
					uMap.put("team_b_user_b", group.get(b).getCt_t_user_b());
					uMap.put("team_b_club", group.get(b).getCt_club_nm());
					gameList.add(uMap);
					b++;
					g++;
					if (i == (cvo.getCt_g_count() - 1)) {
						a = 1;
						b = 2;
					}
					if (i == (cvo.getCt_g_count() - 1)
							+ (cvo.getCt_g_count() - 2)) {
						a = 2;
						b = 3;
					}
				}
			} else if (cvo.getCt_g_count()==3) {
				int a = 0;
				int b = 1;
				for (int i = 1; i <= 3; i++) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("ct_g_idx", cvo.getCt_g_idx());
					uMap.put("ct_gidx", cvo.getCt_g_idx() + "_" + g);
					uMap.put("team_a_idx", group.get(a).getCt_t_idx());
					uMap.put("team_a_user_a", group.get(a).getCt_t_user_a());
					uMap.put("team_a_user_b", group.get(a).getCt_t_user_b());
					uMap.put("team_a_club", group.get(a).getCt_club_nm());
					uMap.put("team_b_idx", group.get(b).getCt_t_idx());
					uMap.put("team_b_user_a", group.get(b).getCt_t_user_a());
					uMap.put("team_b_user_b", group.get(b).getCt_t_user_b());
					uMap.put("team_b_club", group.get(b).getCt_club_nm());
					gameList.add(uMap);
					b++;
					g++;
					if (i == (cvo.getCt_g_count() - 1)) {
						a = 1;
						b = 2;
					}
				}
			} else if (cvo.getCt_g_count()==2) {
				int a = 0;
				int b = 1;
				Map<String, String> uMap = new HashMap<String, String>();
				uMap.put("ct_g_idx", cvo.getCt_g_idx());
				uMap.put("ct_gidx", cvo.getCt_g_idx() + "_" + g);
				uMap.put("team_a_idx", group.get(a).getCt_t_idx());
				uMap.put("team_a_user_a", group.get(a).getCt_t_user_a());
				uMap.put("team_a_user_b", group.get(a).getCt_t_user_b());
				uMap.put("team_a_club", group.get(a).getCt_club_nm());
				uMap.put("team_b_idx", group.get(b).getCt_t_idx());
				uMap.put("team_b_user_a", group.get(b).getCt_t_user_a());
				uMap.put("team_b_user_b", group.get(b).getCt_t_user_b());
				uMap.put("team_b_club", group.get(b).getCt_club_nm());
				gameList.add(uMap);
			}
			}
		}
		ContestVO ctvo = ctService.selectCt(ct_idx);
		/* Object[] ar = new String[(ctvo.getCt_court() * 8)]; */
		List<Object> ar_ = new ArrayList<Object>();
		
		Random random = new Random();
		// 배열 사이즈는 사용가능 코트수 *4
		int va = 0;
		int bl = 0;
		System.out.println(gameList);
		List<Object> gameLista = new ArrayList<Object>();
		System.out.println(gameList.size());
		
		int k =0;
		/*
		 * if(!gameList.isEmpty()) { for(int i = 0 ; i<gameList.size();i++) {
		 * System.out.println(gameList.get(i)); } return map; }
		 */
		int g_size = gameList.size();
		for(int i= 0;;i++) {
			if(gameList.size()==0) {
				break;
			}
			/*
			 * for(int t = 0 ; t<ar.length;t++) { System.out.println(k);
			 * System.out.println(Arrays.asList(ar).toString()); }
			 */
			if(ar_.size()==ctvo.getCt_court()*8) {//널값이 하나도 없다면 (꽉찼다면) 코트수X8 일때 코트수X4만큼 앞에서 비워주고 뒤에있는 것들을 땡긴다
				for(int z = 0 ;z<(ctvo.getCt_court() * 8);z++) {
					if(z<ctvo.getCt_court() * 4) {
						/* ar[z]=ar[(ctvo.getCt_court() * 4)+z]; */
						ar_.set(z, ar_.get((ctvo.getCt_court() * 4)));
						ar_.remove((ctvo.getCt_court()*4));
					}
				}
				i=0;
				k=(ctvo.getCt_court() * 4);
			}
			
			
			
			if(i>=gameList.size()) {
				List<Object> ar2 = new ArrayList<Object>();
				for(int j = ctvo.getCt_court()*4;j<ar_.size();j++) {
					ar2.add(ar_.get(j));
					System.out.println(ar_.size());
				}
				loop1 : for(int q =0;;q++) {

					if(q>=gameList.size()) {
						ar_.add("blank_"+k+"_"+i+"_"+random.nextInt(1000)+1);
						ar_.add("blank_"+k+1+"_"+i+"_"+random.nextInt(1000)+1);
						ar_.add("blank_"+k+2+"_"+i+"_"+random.nextInt(1000)+1);
						ar_.add("blank_"+k+3+"_"+i+"_"+random.nextInt(1000)+1);
						k=k+4;
						Map<String,String> e = new HashMap<String,String>();
						e.put("team_a_user_a","blank_"+k+"_"+i+"_"+random.nextInt(1000)+1);
						e.put("team_a_user_b","blank_"+k+1+"_"+i+"_"+random.nextInt(1000)+1);
						e.put("team_b_user_a","blank_"+k+2+"_"+i+"_"+random.nextInt(1000)+1);
						e.put("team_b_user_b","blank_"+k+3+"_"+i+"_"+random.nextInt(1000)+1);
						e.put("ct_gidx", ct_idx + "_blank" + k+"_"+i+"_"+random.nextInt(1000)+1);
						e.put("team_b_idx", null);
						e.put("team_a_idx", null);
						e.put("ct_g_idx", null);
						gameLista.add(e);
						i=0;
						break loop1;
					}else {
						Map<String,String> all_of_game =(Map<String, String>) gameList.get(q);
						String a1 = all_of_game.get("team_a_user_a");
						String a2 = all_of_game.get("team_a_user_b");
						String b1 = all_of_game.get("team_b_user_a");
						String b2 = all_of_game.get("team_b_user_b");
						String g_idx = all_of_game.get("ct_gidx");
						String k_idx = all_of_game.get("ct_g_idx").substring(0, 13);
						String g_count = all_of_game.get("ct_g_count");
						
						List<String> win = new ArrayList<String>();//해당 종목에 예선전이 남아있나 확인
						List<String> win_ = new ArrayList<String>();//해당 종목에 본선 n차전이 남아있는지 확인
						for(int e = 0 ; e<gameList.size();e++) {
							Map<String,String> all_of_game2 =(Map<String, String>) gameList.get(e);
							if(!all_of_game2.get("ct_g_idx").contains("win")) {	//예선전이라면
								if(!win.contains(all_of_game2.get("ct_g_idx").substring(0,13))) {
									win.add(all_of_game2.get("ct_g_idx").substring(0, 13));
								}
							}else {
								if(!win_.contains(all_of_game2.get("ct_g_idx"))) {
									win_.add(all_of_game2.get("ct_g_idx"));
								}
							}
						}//예선전이 남아있는지 확인
						int a3 = 0;
						int yn=0;
						if(all_of_game.get("ct_g_idx").contains("win")) {
							a3=Integer.parseInt(all_of_game.get("ct_g_idx").substring(all_of_game.get("ct_g_idx").length()-1, all_of_game.get("ct_g_idx").length()));
							if(a3==1) {
								yn=1;
							}else if(a3!=1&&win_.contains(all_of_game.get("ct_g_idx").substring(0, 17)+(a3-1))) {
								yn=0;
							}else{
								yn=1;
							}
						}
						if(all_of_game.get("ct_g_idx").contains("win")&&!win.contains(all_of_game.get("ct_g_idx").substring(0, 13))&&yn==1) {
							Map<String,String> tMap = new HashMap<String,String>();
							tMap.put("ct_idx", ct_idx);
							tMap.put("ct_g_idx", all_of_game.get("ct_g_idx"));
							tMap.put("ct_k_idx", all_of_game.get("ct_g_idx").substring(0,13));
							List<ContestVO> tGroup = ctService.typeAll(tMap);	//그룹인덱스를 조건으로 선수아이디를 가져온다 만약 승리 그룹이면 종목에 참여한 모든 선수 아이디를 가져온다
							
									List<Object> kind_nm = new ArrayList<Object>();
									for(int z=0;z<tGroup.size();z++) {
										kind_nm.add(tGroup.get(z).getCt_t_user_a());
										kind_nm.add(tGroup.get(z).getCt_t_user_b());
										
									}//해당 종목에 속해있는 모든선수
									
									List<String> u_list = new ArrayList<String>();	//ar_에 담겨있는 모든 유저들
									for(int j=0;j<ar2.size();j++) {				//선수코트 전부를돌려 겹치는 이름이있나 확인하는 반복문
										if(ar2.get(j) instanceof String) {
											u_list.add(ar2.get(j).toString());
										}else if(ar2.get(j) instanceof List){
											List<String> kind_nm2 = (List<String>) ar2.get(j);
											for(int x=0;x<kind_nm2.size();x++) {
												u_list.add(kind_nm2.get(x));
											}
										}
									}
									int a=0;
									for(int j =0;j<kind_nm.size();j++) {
										if(!u_list.contains(kind_nm.get(j))) {
											a++;
										}
									}
									if(kind_nm.size()==a) {
										int count = Integer.parseInt(all_of_game.get("ct_g_count"));
										for(int c_ = 0 ; c_<count/2;c_++) {
											if(ar_.size()==ctvo.getCt_court()*8) {//널값이 하나도 없다면 (꽉찼다면) 코트수X8 일때 코트수X4만큼 앞에서 비워주고 뒤에있는 것들을 땡긴다
												for(int z = 0 ;z<(ctvo.getCt_court() * 8);z++) {
													if(z<ctvo.getCt_court() * 4) {
														/* ar[z]=ar[(ctvo.getCt_court() * 4)+z]; */
														ar_.set(z, ar_.get((ctvo.getCt_court() * 4)));
														ar_.remove((ctvo.getCt_court()*4));
													}
												}
												k=(ctvo.getCt_court() * 4);
											}
									/*
									 * Map<String,String> game = (Map<String, String>) gameList.get(q);
									 * game.put("ct_gidx", game.get("ct_gidx")+"_"+c_); game.put("team_a_idx",
									 * all_of_game.get("ct_g_idx")+"_"+(c_*2)); game.put("team_b_idx",
									 * all_of_game.get("ct_g_idx")+"_"+((c_*2)+1));
									 */
											
											Map<String, String> uMap = new HashMap<String, String>();
											uMap.put("ct_g_idx", g_idx);
											uMap.put("ct_gidx", g_idx+"_"+c_);
											uMap.put("team_a_idx", k_idx+"_"+(c_*2));
											uMap.put("team_a_user_a", k_idx);
											uMap.put("team_a_user_b", k_idx);
											uMap.put("team_a_club", k_idx+"_club_nm");
											uMap.put("team_b_idx", k_idx+"_"+((c_*2)+1));
											uMap.put("team_b_user_a",k_idx);
											uMap.put("team_b_user_b",k_idx);
											uMap.put("team_b_club", k_idx+"_club_nm");
											uMap.put("ct_g_count", g_count+"");
											
											ar_.add(kind_nm);
											ar_.add(kind_nm);
											ar_.add(kind_nm);
											ar_.add(kind_nm);
											gameLista.add(uMap);
											
										}
										System.out.println("게임리스트사이즈 for : "+ gameList.size());
										System.out.println("아이2 for : "+i);
										System.out.println("카인드nm for : "+kind_nm);
										System.out.println("u_list  for : "+u_list);
										gameList.remove(q);
										i=0;
										break loop1;
									}
						}else if(!all_of_game.get("ct_g_idx").contains("win")) {											//배열의값이 스트링타입인지 리스트타입인지 확인
							List<String> u_list = new ArrayList<String>();
								for(int w =0;w<ar2.size();w++) {
									if(ar2.get(w) instanceof String) {
										u_list.add(ar2.get(w).toString());
									}else if(ar2.get(w) instanceof List) {
										List<String> u_ = (List<String>) ar2.get(w);
										for(int x=0;x<u_.size();x++) {
											u_list.add(u_.get(x));
										}
									}
								}
							if(!u_list.contains(a1)&&!u_list.contains(a2)&&!u_list.contains(b1)&&!u_list.contains(b2)) {
								ar_.add(a1);
								ar_.add(a2);
								ar_.add(b1);
								ar_.add(b2);
								gameLista.add(all_of_game);
								System.out.println("게임리스트사이즈 : "+ gameList.size());
								System.out.println("아이 : "+i);
								gameList.remove(q);
								i=0;
								break loop1;
								}
							
							}
					}
				}
				
			}else{
				Map<String,String> all_of_game =(Map<String, String>) gameList.get(i);
				String a1 = all_of_game.get("team_a_user_a");
				String a2 = all_of_game.get("team_a_user_b");
				String b1 = all_of_game.get("team_b_user_a");
				String b2 = all_of_game.get("team_b_user_b");
				String g_idx = all_of_game.get("ct_gidx");
				String k_idx = all_of_game.get("ct_g_idx").substring(0, 13);
				String g_count = all_of_game.get("ct_g_count");
				if(ar_.size()==0) {
					System.out.println("첫번째로 들어가라" +gameList.size() +"aa : " +gameLista.size());
					ar_.add(a1);
					ar_.add(a2);
					ar_.add(b1);
					ar_.add(b2);
					gameLista.add(gameList.get(0));
					gameList.remove(0);
					i=0;
					System.out.println("첫번째로 들어가라" +gameList.size() +"aa : " +gameLista.size());
					System.out.println(gameLista);
					continue;
				}
				List<String> win = new ArrayList<String>();//해당 종목에 예선전이 남아있나 확인
				List<String> win_ = new ArrayList<String>();//해당 종목에 본선 n차전이 남아있는지 확인
				for(int e = 0 ; e<gameList.size();e++) {
					Map<String,String> all_of_game2 =(Map<String, String>) gameList.get(e);
					if(!all_of_game2.get("ct_g_idx").contains("win")) {	//예선전이라면
						if(!win.contains(all_of_game2.get("ct_g_idx").substring(0,13))) {
							win.add(all_of_game2.get("ct_g_idx").substring(0, 13));
						}
					}else {
						if(!win_.contains(all_of_game2.get("ct_g_idx"))) {
							win_.add(all_of_game2.get("ct_g_idx"));
						}
					}
				}//예선전이 남아있는지 확인
				int a3 = 0;
				int yn=0;
				if(all_of_game.get("ct_g_idx").contains("win")) {
					System.out.println(all_of_game.get("ct_g_idx"));
					a3=Integer.parseInt(all_of_game.get("ct_g_idx").substring(all_of_game.get("ct_g_idx").length()-1, all_of_game.get("ct_g_idx").length()));
					System.out.println(a3);
					System.out.println(all_of_game.get("ct_g_idx").substring(0, 17)+(a3-1));
					if(a3==1) {
						yn=1;
					}else if(a3!=1&&win_.contains(all_of_game.get("ct_g_idx").substring(0, 17)+(a3-1))) {
						yn=0;
					}else{
						yn=1;
					}
				}
				if(all_of_game.get("ct_g_idx").contains("win")&&!win.contains(all_of_game.get("ct_g_idx").substring(0, 13))&&yn==1) {
					Map<String,String> tMap = new HashMap<String,String>();
					tMap.put("ct_idx", ct_idx);
					tMap.put("ct_g_idx", all_of_game.get("ct_g_idx"));
					tMap.put("ct_k_idx", all_of_game.get("ct_g_idx").substring(0,13));
					List<ContestVO> tGroup = ctService.typeAll(tMap);	//그룹인덱스를 조건으로 선수아이디를 가져온다 만약 승리 그룹이면 종목에 참여한 모든 선수 아이디를 가져온다
					
							List<Object> kind_nm = new ArrayList<Object>();
							for(int z=0;z<tGroup.size();z++) {
								kind_nm.add(tGroup.get(z).getCt_t_user_a());
								kind_nm.add(tGroup.get(z).getCt_t_user_b());
								
							}//해당 종목에 속해있는 모든선수
							
							List<String> u_list = new ArrayList<String>();	//ar_에 담겨있는 모든 유저들
							for(int j=0;j<ar_.size();j++) {				//선수코트 전부를돌려 겹치는 이름이있나 확인하는 반복문
								if(ar_.get(j) instanceof String) {
									u_list.add(ar_.get(j).toString());
								}else if(ar_.get(j) instanceof List){
									List<String> kind_nm2 = (List<String>) ar_.get(j);
									for(int x=0;x<kind_nm2.size();x++) {
										u_list.add(kind_nm2.get(x));
									}
								}
							}
							int a=0;
							for(int j =0;j<kind_nm.size();j++) {
								if(!u_list.contains(kind_nm.get(j))) {
									a++;
								}
							}
							if(kind_nm.size()==a) {
								int count = Integer.parseInt(all_of_game.get("ct_g_count"));
								for(int c_ = 0 ; c_<count/2;c_++) {
									if(ar_.size()==ctvo.getCt_court()*8) {//널값이 하나도 없다면 (꽉찼다면) 코트수X8 일때 코트수X4만큼 앞에서 비워주고 뒤에있는 것들을 땡긴다
										for(int z = 0 ;z<(ctvo.getCt_court() * 8);z++) {
											if(z<ctvo.getCt_court() * 4) {
												ar_.set(z, ar_.get((ctvo.getCt_court() * 4)));
												ar_.remove((ctvo.getCt_court()*4));
											}
										}
										k=(ctvo.getCt_court() * 4);
									}
									Map<String, String> uMap = new HashMap<String, String>();
									uMap.put("ct_g_idx", g_idx);
									uMap.put("ct_gidx", g_idx+"_"+c_);
									uMap.put("team_a_idx", k_idx+"_"+(c_*2));
									uMap.put("team_a_user_a", k_idx);
									uMap.put("team_a_user_b", k_idx);
									uMap.put("team_a_club", k_idx+"_club_nm");
									uMap.put("team_b_idx", k_idx+"_"+((c_*2)+1));
									uMap.put("team_b_user_a",k_idx);
									uMap.put("team_b_user_b",k_idx);
									uMap.put("team_b_club", k_idx+"_club_nm");
									uMap.put("ct_g_count", g_count+"");
									
									ar_.add(kind_nm);
									ar_.add(kind_nm);
									ar_.add(kind_nm);
									ar_.add(kind_nm);
									gameLista.add(uMap);
									
								}
								
								
								System.out.println("게임리스트사이즈2 : "+ gameList.size());
								System.out.println("아이2 : "+i);
								System.out.println("카인드nm : "+kind_nm);
								System.out.println("u_list : "+u_list);
								gameList.remove(i);
								i=0;
							}
							
					
				}else if(!all_of_game.get("ct_g_idx").contains("win")) {											//배열의값이 스트링타입인지 리스트타입인지 확인
					List<String> u_list = new ArrayList<String>();
						for(int w =0;w<ar_.size();w++) {
							if(ar_.get(w) instanceof String) {
								u_list.add(ar_.get(w).toString());
							}else if(ar_.get(w) instanceof List) {
								List<String> u_ = (List<String>) ar_.get(w);
								for(int x=0;x<u_.size();x++) {
									u_list.add(u_.get(x));
								}
							}
						}
					if(!u_list.contains(a1)&&!u_list.contains(a2)&&!u_list.contains(b1)&&!u_list.contains(b2)) {
						ar_.add(a1);
						ar_.add(a2);
						ar_.add(b1);
						ar_.add(b2);
						gameLista.add(all_of_game);
						System.out.println("게임리스트사이즈 : "+ gameList.size());
						System.out.println("아이 : "+i);
						gameList.remove(i);
						i=0;
						}
					
					}
			}
				System.out.println("게임리스트 사이즈 최종 :  " + gameList.size());
			if(gameList.size()==0) {
				break;
			}
		}

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
			M.put("ct_e_gidx", (String) newM.get("ct_gidx") + "_" + vv);
			M.put("ct_gidx", (String) newM.get("ct_gidx"));
			M.put("ct_g_idx", (String) newM.get("ct_g_idx"));
			if(newM.get("ct_g_idx") != null) {
				M.put("ct_t_idx", newM.get("ct_g_idx").toString().substring(0, 13));
			}else {
				M.put("ct_t_idx", null);
			}
			M.put("ct_team_idx", (String) newM.get("team_a_idx"));
			M.put("u_id", (String) newM.get("team_a_user_a"));
			M.put("c_nm", (String) newM.get("team_a_club"));
			vv++;
			M2.put("ct_e_gidx", (String) newM.get("ct_gidx") + "_" + vv);
			M2.put("ct_gidx", (String) newM.get("ct_gidx"));
			M2.put("ct_g_idx", (String) newM.get("ct_g_idx"));
			if(newM.get("ct_g_idx") != null) {
				M2.put("ct_t_idx", newM.get("ct_g_idx").toString().substring(0, 13));
			}else {
				M2.put("ct_t_idx", null);
			}
			M2.put("ct_team_idx", (String) newM.get("team_a_idx"));
			M2.put("u_id", (String) newM.get("team_a_user_b"));
			M2.put("c_nm", (String) newM.get("team_a_club"));
			vv++;
			M3.put("ct_e_gidx", (String) newM.get("ct_gidx") + "_" + vv);
			M3.put("ct_gidx", (String) newM.get("ct_gidx"));
			M3.put("ct_g_idx", (String) newM.get("ct_g_idx"));
			if(newM.get("ct_g_idx") != null) {
				M3.put("ct_t_idx", newM.get("ct_g_idx").toString().substring(0, 13));
			}else {
				M3.put("ct_t_idx", null);
			}
			M3.put("ct_team_idx", (String) newM.get("team_b_idx"));
			M3.put("u_id", (String) newM.get("team_b_user_a"));
			M3.put("c_nm", (String) newM.get("team_b_club"));
			vv++;
			M4.put("ct_e_gidx", (String) newM.get("ct_gidx") + "_" + vv);
			M4.put("ct_gidx", (String) newM.get("ct_gidx"));
			M4.put("ct_g_idx", (String) newM.get("ct_g_idx"));
			if(newM.get("ct_g_idx") != null) {
				M4.put("ct_t_idx", newM.get("ct_g_idx").toString().substring(0, 13));
			}else {
				M4.put("ct_t_idx", null);
			}
			M4.put("ct_team_idx", (String) newM.get("team_b_idx"));
			M4.put("u_id", (String) newM.get("team_b_user_b"));
			M4.put("c_nm", (String) newM.get("team_b_club"));
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
				if (nM.containsValue(newM.get("ct_gidx"))) { // rgamelist에
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
		/*
		 * for (int i = 0; i < rGameList.size(); i++) { Map<String, Object> nM = new
		 * HashMap<String, Object>(); nM = (Map<String, Object>) rGameList.get(i);
		 * System.out.print(nM.get("team_a_user_a") + ",");
		 * System.out.print(nM.get("team_a_user_b") + ",");
		 * System.out.print(nM.get("team_b_user_a") + ",");
		 * System.out.print(nM.get("team_b_user_b") + ","); if (i + 1 % 4 == 0) {
		 * System.out.println(""); } }
		 */
		System.out.println(gameList);
		System.out.println(gameList.size());
		System.out.println(rGameList);
		System.out.println(rGameList.size());

		List<Object> rGameList2 = new ArrayList<Object>();
		int ii = 0;
		int jj = 0;
		int s = (rGameList.size() / (ctvo.getCt_court())*10) * 5;/*
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
		Date date = dateFormat.parse(ctvo.getCt_start().substring(11, ctvo.getCt_start().length()));
		cal.setTime(date);
		for (int i = 0; i < gameLista.size(); i++) {
			if ((co - 1) == ctvo.getCt_court()) {
				co = 1;
				order++;
				cal.add(Calendar.MINUTE, ctvo.getCt_time());
			}
			Map<String, Object> newM = new HashMap<String, Object>();
			newM = (Map<String, Object>) gameLista.get(i);
			newM.put("ct_u_court", co);
			newM.put("ct_order", order);
			newM.put("ct_w_date", dateFormat.format(cal.getTime()));
			newM.put("ct_no", i + 1);
			co++;
		}
		Map<String, Object> ct_match = new HashMap<String, Object>();

		ct_match.put("list", gameLista);
		ct_match.put("ct_idx", ct_idx);
		ct_match.put("ct_status", "대기");

		Map<String, Object> ct_match_end = new HashMap<String, Object>();

		ct_match_end.put("list", endGameList);
		ct_match_end.put("ct_idx", ct_idx);
		System.out.println(gameLista);
		 int ct = ctService.gameInsert(ct_match, ct_match_end); 

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
			System.out.println(map4.get("ct_w_date"));
		}
		System.out.println(gameLista);
	
		List<ContestVO> cvo = ctService.getCount(ct_map);
		List<Object> n_list = new ArrayList<Object>();
		for(int i = 0 ; i<cvo.size();i++) {
			int t_count = cvo.get(i).getCt_k_count();	//각종목에 참여한 팀 카운트
			int g_count = cvo.get(i).getCt_g_count();	//각 그룹에 몇팀이 참여하는지카운트
			ct_map.put("ct_k_idx",cvo.get(i).getCt_k_idx());
			List<ContestVO> rGroupList = ctService.randomGroupList(ct_map);
			List<ContestVO> winGameList = ctService.winGame(ct_map);
			
				int c = rGroupList.size();
				int d = 0;
				int e = 0;
				int f = 0;
				int win = 0;
				for(int j = 0 ; j<g_count/2;j++) {
					Map<String,String> n_map = new HashMap<String,String>();
					n_map.put("ct_gidx", winGameList.get(j).getCt_gidx());
					n_map.put("team_a_idx", rGroupList.get(0).getCt_g_idx());
					c--;
					rGroupList.remove(0);
					n_map.put("team_b_idx", rGroupList.get(0).getCt_g_idx());
					rGroupList.remove(0);
					n_list.add(n_map);
					c--;
					win++;
				}
				for(int j = 0; j<winGameList.size();j++) {
					if(winGameList.get(j).getCt_gidx().contains("win2")) {
						Map<String,String> n_map = new HashMap<String,String>();
						n_map.put("ct_gidx", winGameList.get(j).getCt_gidx());
						if(win!=0) {
							n_map.put("team_a_idx",cvo.get(i).getCt_k_idx()+"_win1_"+d);
							d++;
							win--;
						}else {
							n_map.put("team_a_idx", rGroupList.get(0).getCt_g_idx());
							rGroupList.remove(0);
							c--;
						}
						if(win!=0) {
							n_map.put("team_b_idx",cvo.get(i).getCt_k_idx()+"_win1_"+d);
							d++;
							win--;
						}else {
							n_map.put("team_b_idx", rGroupList.get(0).getCt_g_idx());
							rGroupList.remove(0);
							c--;
						}
						n_list.add(n_map);
					}else if(winGameList.get(j).getCt_gidx().contains("win3")) {
						Map<String,String> n_map = new HashMap<String,String>();
						n_map.put("ct_gidx", winGameList.get(j).getCt_gidx());
						n_map.put("team_a_idx",cvo.get(i).getCt_k_idx()+"_win2_"+e);
						e++;
						n_map.put("team_b_idx",cvo.get(i).getCt_k_idx()+"_win2_"+e);
						e++;
						n_list.add(n_map);
					}else if(winGameList.get(j).getCt_gidx().contains("win4")) {
						Map<String,String> n_map = new HashMap<String,String>();
						n_map.put("ct_gidx", winGameList.get(j).getCt_gidx());
						n_map.put("team_a_idx",cvo.get(i).getCt_k_idx()+"_win3_"+f);
						f++;
						n_map.put("team_b_idx",cvo.get(i).getCt_k_idx()+"_win3_"+f);
						f++;
						n_list.add(n_map);
					}
					
					
				}
				System.out.println(n_list);
			}
		
		System.out.println(n_list);
		List<Object> e_list = new ArrayList<Object>();
		for(int i = 0 ; i<n_list.size()/2;i++) {
			Map<String,String> n_map = (Map<String, String>) n_list.get(i);
			Map<String,String> nmap1 = new HashMap<String,String>();
			Map<String,String> nmap2 = new HashMap<String,String>();
			Map<String,String> nmap3 = new HashMap<String,String>();
			Map<String,String> nmap4 = new HashMap<String,String>();
			nmap1.put("ct_t_idx", n_map.get("team_a_idx"));
			nmap1.put("ct_gidx_gb", n_map.get("ct_gidx")+"_1");
			e_list.add(nmap1);
			nmap2.put("ct_t_idx", n_map.get("team_a_idx"));
			nmap2.put("ct_gidx_gb", n_map.get("ct_gidx")+"_2");
			e_list.add(nmap2);
			nmap3.put("ct_t_idx", n_map.get("team_b_idx"));
			nmap3.put("ct_gidx_gb", n_map.get("ct_gidx")+"_3");
			e_list.add(nmap3);
			nmap4.put("ct_t_idx", n_map.get("team_b_idx"));
			nmap4.put("ct_gidx_gb", n_map.get("ct_gidx")+"_4");
			e_list.add(nmap4);
			
		}
		System.out.println(e_list);
		
		Map<String,Object> rMap = new HashMap<String,Object>();
		rMap.put("list",n_list);
		rMap.put("ct_idx",ct_idx);
		Map<String,Object> rMap2 = new HashMap<String,Object>();
		rMap2.put("list",e_list);
		rMap2.put("ct_idx",ct_idx);
		
		int ct2 = ctService.fUpdate(rMap2, rMap);
		
		if (ct > 0&&ct2>0) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}
		
		return map;
	}
	
	@RequestMapping("/Contest/Join.techni")
	public String excelJoin(Model model) {
		
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		String filePath="C:\\Users\\wlgud\\git\\aasdfasdf\\mgl\\src\\main\\webapp\\resources\\excel\\민턴인 단체 대회 출전 양식.xlsx";
		 int result = 0;
         int all = 0;
		String ct_idx = "CT190611014";
		 try {
	            
	            fis= new FileInputStream(filePath);
	            // HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
	            workbook = new XSSFWorkbook(fis);
	            
	            // 탐색에 사용할 Sheet, Row, Cell 객체
	            XSSFSheet curSheet;
	            XSSFRow   curRow;
	            XSSFCell  curCell;
	            MemberVO mvo;
	            UClubVO uvo;
	            // Sheet 탐색 for문
	           
	            for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
	            	
	                // 현재 Sheet 반환
	                curSheet = workbook.getSheetAt(sheetIndex);
	                // row 탐색 for문
	                for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
	                	Map<String,String> map = new HashMap<String,String>();
                        map.put("ct_idx", ct_idx);
                        map.put("req_id","admin1234");
                        String kind_nm = "";
                        String kind_type="";
                        String kind_age="";
                        String kind_gd="";
	                    // row 0은 헤더정보이기 때문에 무시
	                    if(rowIndex != 0) {
	                        // 현재 row 반환
	                        curRow = curSheet.getRow(rowIndex);
	                       mvo = new MemberVO();
	                       uvo = new UClubVO();
	                        String value;
	                        
	                        // row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
	                        if(!"".equals(curRow.getCell(0).getStringCellValue())) {
	                            
	                            // cell 탐색 for 문
	                            for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
	                                curCell = curRow.getCell(cellIndex);
	                                
	                                if(true) {
	                                    value = "";
	                                    // cell 스타일이 다르더라도 String으로 반환 받음
	                                    switch (curCell.getCellType()){
	                                    case HSSFCell.CELL_TYPE_FORMULA:
	                                        value = curCell.getCellFormula();
	                                        break;
	                                    case HSSFCell.CELL_TYPE_NUMERIC:
	                                        value = curCell.getNumericCellValue()+"";
	                                        break;
	                                    case HSSFCell.CELL_TYPE_STRING:
	                                        value = curCell.getStringCellValue()+"";
	                                        break;
	                                    case HSSFCell.CELL_TYPE_BLANK:
	                                        value = curCell.getBooleanCellValue()+"";
	                                        break;
	                                    case HSSFCell.CELL_TYPE_ERROR:
	                                        value = curCell.getErrorCellValue()+"";
	                                        break;
	                                    default:
	                                        value = new String();
	                                        break;
	                                    }
	                                    
	                                    // 현재 column index에 따라서 vo에 입력
	                                    
	                                    switch (cellIndex) {
	                                    case 1: // 이름
	                                        kind_type=value.replaceAll(" ", "");
	                                        
	                                        break;
	                                        
	                                    case 2: // 성별,사진
	                                    	int year = Calendar.getInstance().get(Calendar.YEAR);
	                                    	year = year-Integer.parseInt(value.replaceAll(" ", ""));
	                                    	kind_age=value.replaceAll(" ", "")+"대";
	                                    	
	                                        break;
	                                        
	                                    case 3: // 생년월일,비밀번호
	                                    	if(value.equals("왕초심")) {
	                                    		value="왕초";
	                                    	}else if(value.equals("E")) {
	                                    		value="초심";
	                                    	}
	                                    	map.put("kind_gd", value.replaceAll(" ", ""));
	                                    	kind_gd=value+"조";
	                                    	
	                                        break;
	                                        
	                                    case 4: // 전화번호 아이디
	                                    	map.put("m_club_nm", value.replaceAll(" ", ""));
	                                        break;
	                                        
	                                    case 5: // 급수
	                                        map.put("m_nm_A", value.replaceAll(" ", ""));
	                                        break;
	                                        
	                                    case 6: // 직책 "회장","부회장","고문","감사","총무","재무","경기이사","관리이사","홍보이사","회원"
	                                    	if(value.equals("1")) {
	                                    		map.put("m_sex_A", "M");
	                                    	}else if(value.equals("2")) {
	                                    		map.put("m_sex_A", "F");
	                                    	}
	                                        break;
	                                    case 7:
	                                    	map.put("m_nm_B", value.replaceAll(" ", ""));
	                                    	break;
	                                    
	                                    case 8:
	                                    	if(value.replaceAll(" ", "").equals("1")) {
	                                    		map.put("m_sex_B", "M");
	                                    	}else if(value.replaceAll(" ", "").equals("2")) {
	                                    		map.put("m_sex_B", "F");
	                                    	}
	                                    case 9:
	                                    	
	                                    case 10:
	                                    	if(value.replaceAll(" ", "").length()==6&&value.replaceAll(" ", "").substring(0, 2).equals("00")) {
	                                    		map.put("m_birth_A", "20"+value.replaceAll(" ", ""));
	                                    	}else if(value.replaceAll(" ", "").length()==6) {
	                                    		map.put("m_birth_A", "19"+value.replaceAll(" ", ""));
	                                    	}
	                                    case 11:
	                                    	
	                                    case 12:
	                                    	if(value.replaceAll(" ", "").length()==6&&value.replaceAll(" ", "").substring(0, 2).equals("00")) {
	                                    		map.put("m_birth_B", "20"+value.replaceAll(" ", ""));
	                                    	}else if(value.length()==6) {
	                                    		map.put("m_birth_B", "19"+value.replaceAll(" ", ""));
	                                    	}
	                                    default:
	                                        break;
	                                    }
	                                }
	                            }
	                            // cell 탐색 이후 vo 추가
	                            all++;
	                            kind_nm=kind_age+" "+kind_type+" "+kind_gd;
	                            map.put("kind_nm", kind_nm);
	                            int res = ctService.excelUserInsert(map);
	                            result=result+res;
	                        }
	                    }
	                }
	            }
	        } catch (FileNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            
	        } finally {
	            try {
	                // 사용한 자원은 finally에서 해제
	                if( workbook!= null) workbook.close();
	                if( fis!= null) fis.close();
	                
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		 
		 model.addAttribute("result","전체" + all+"성공" +result);
		return "ajax/excelResult";
	}
	
	
	@RequestMapping("/Contest/ContestPointInsert.techni")
	@ResponseBody
	public Map<Object,Object> pointInsert(HttpSession session,@RequestBody String json) throws ParseException{
		Map<Object,Object> map = new HashMap<Object,Object>();
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		
		List<String> id = new ArrayList<String>();
		id.add((String) json2.get("a1_id"));
		id.add((String) json2.get("a2_id"));
		id.add((String) json2.get("b1_id"));
		id.add((String) json2.get("b2_id"));
		System.out.println(id);
		int aScore = Integer.parseInt(((String) json2.get("aScore")));
		int bScore = Integer.parseInt(((String) json2.get("bScore")));
		String ct_gidx = (String) json2.get("ct_gidx");
		String ct_idx = (String) session.getAttribute("ct_idx");
		String win_team ="";
		double a_aptn = 0.25;
		double b_aptn = 0.25;
		double a_vptn=0;
		double b_vptn=0;
		double a_pptn=0;
		double b_pptn=0;
		String a_win = "";
		String b_win = "";
		int a_gap = aScore - bScore;
		int b_gap = bScore - aScore;
		if(aScore>bScore) {
			a_vptn=1;
			a_aptn=a_aptn+1;
			a_aptn+=0.5;
			b_aptn+=(bScore*2)*0.01;
			a_pptn=0.5;
			b_pptn=(bScore*2)*0.01;
			a_win = "승";
			b_win = "패";
			win_team = (String) json2.get("aTeam");
		}else if(bScore>aScore) {
			b_vptn=1;
			b_aptn=b_aptn+1;
			b_aptn+=0.5;
			a_aptn+=(aScore*2)*0.01;
			b_pptn=0.5;
			a_pptn=(aScore*2)*0.01;
			a_win = "패";
			b_win = "승";
			win_team = (String) json2.get("bTeam");
		}
		a_aptn = a_aptn*2;
		b_aptn = b_aptn*2;
		List<Object> list = new ArrayList<Object>();
		Map<String,Object> pointUpdate = new HashMap<String,Object>();
		for(int i = 0 ; i<id.size()/2;i++) {
			Map<String,String> map1 = new HashMap<String,String>();
			map1.put("total", aScore+"");
			map1.put("cnt_gap", a_gap+"");
			map1.put("win", a_win);
			map1.put("vptn", a_vptn+"");
			map1.put("pptn", a_pptn+"");
			map1.put("aptn", a_aptn+"");
			map1.put("ct_u_id", id.get(i));
			Map<String,String> map2 = new HashMap<String,String>();
			map2.put("total", bScore+"");
			map2.put("cnt_gap", b_gap+"");
			map2.put("win", b_win);
			map2.put("vptn", b_vptn+"");
			map2.put("pptn", b_pptn+"");
			map2.put("aptn", b_aptn+"");
			map2.put("ct_u_id", id.get(i+2));
		
			list.add(map1);
			list.add(map2);
		}
		pointUpdate.put("list", list);
		pointUpdate.put("ct_gidx", ct_gidx);
		pointUpdate.put("ct_idx", ct_idx);
		pointUpdate.put("a_score", aScore);
		pointUpdate.put("b_score", bScore);
		int res = ctService.pointUpdate(pointUpdate);
		//점수업데이트와 동시에 스테이터스 업데이트도 해야한다
		System.out.println(ct_gidx);
		System.out.println("팀은  : " + win_team);
		if(!ct_gidx.contains("win")) {
			Map<String,String> yn = new HashMap<String,String>();
			Map<String,String> yn2 = new HashMap<String,String>();
			if(ct_gidx.length()==18) {
				yn.put("i", "16");
				yn2.put("i", "16");
			}else if(ct_gidx.length()==17) {
				yn.put("i", "15");
				yn2.put("i", "15");
			}
			yn.put("ct_g_idx",win_team);
			yn.put("ct_idx", ct_idx);
			yn2.put("ct_g_idx",ct_gidx.substring(0, ct_gidx.length()-2));
			yn2.put("ct_idx", ct_idx);
			int end_yn=ctService.endYn(yn2);
			if(end_yn==0) {
				Map<String,Object> uMap = new HashMap<String,Object>();
				Map<String,Object> eMap1 = new HashMap<String,Object>();
				Map<String,Object> eMap2 = new HashMap<String,Object>();
				eMap1.put("ab_user", "MGL_CT_USER_A");
				eMap2.put("ab_user", "MGL_CT_USER_B");
				uMap.put("ct_idx", ct_idx);
				ContestVO cvo = ctService.selectAteam(yn2);
				
				List<Object> endJoin = new ArrayList<Object>();
				if(cvo.getCount()==1) {
					ContestVO cvo_1st = ctService.selectGroup_1st(yn2);
					uMap.put("ct_gidx", cvo.getCt_gidx());
					uMap.put("ct_t_idx", cvo_1st.getCt_t_idx());
					uMap.put("ab_team", "MGL_CT_A_TEAM_IDX");
					uMap.put("ab_team_nm", "MGL_CT_A_TEAM_NM");
					uMap.put("ab_id1", "MGL_CT_AT_ID1");
					uMap.put("ab_nm1", "MGL_CT_AT_NM1");
					uMap.put("ab_age1", "MGL_CT_AT_AGE1");
					uMap.put("ab_gd1", "MGL_CT_AT_GD1");
					uMap.put("ab_id2", "MGL_CT_AT_ID2");
					uMap.put("ab_nm2", "MGL_CT_AT_NM2");
					uMap.put("ab_age2", "MGL_CT_AT_AGE2");
					uMap.put("ab_gd2", "MGL_CT_AT_GD2");
					eMap1.put("ct_gidx_gb", cvo.getCt_gidx()+"_1");
					endJoin.add(eMap1);
					eMap2.put("ct_gidx_gb", cvo.getCt_gidx()+"_2");
					endJoin.add(eMap2);
				}else {
					cvo = ctService.selectBteam(yn2);
					ContestVO cvo_1st = ctService.selectGroup_1st(yn2);
					uMap.put("ct_gidx", cvo.getCt_gidx());
					uMap.put("ct_t_idx", cvo_1st.getCt_t_idx());
					uMap.put("ab_team", "MGL_CT_B_TEAM_IDX");
					uMap.put("ab_team_nm", "MGL_CT_B_TEAM_NM");
					uMap.put("ab_id1", "MGL_CT_BT_ID1");
					uMap.put("ab_nm1", "MGL_CT_BT_NM1");
					uMap.put("ab_age1", "MGL_CT_BT_AGE1");
					uMap.put("ab_gd1", "MGL_CT_BT_GD1");
					uMap.put("ab_id2", "MGL_CT_BT_ID2");
					uMap.put("ab_nm2", "MGL_CT_BT_NM2");
					uMap.put("ab_age2", "MGL_CT_BT_AGE2");
					uMap.put("ab_gd2", "MGL_CT_BT_GD2");
					eMap1.put("ct_gidx_gb", cvo.getCt_gidx()+"_3");
					endJoin.add(eMap1);
					eMap2.put("ct_gidx_gb", cvo.getCt_gidx()+"_4");
					endJoin.add(eMap2);
				}
				uMap.put("list",endJoin);
				System.out.println(endJoin);
				System.out.println(uMap);
				System.out.println(uMap.values());
				if(cvo.getCount()==1) {
					res = ctService.tournamentUpdate(uMap);
				}
			}else {
				map.put("cnt", res);
				System.out.println("ㅁㄴㅁㄻㄴㅇㄻ마지막");
				return map;
			}
		}else {
			Map<String,String> yn = new HashMap<String,String>();
			yn.put("ct_gidx", ct_gidx);
			yn.put("ct_g_idx", ct_gidx);
			yn.put("ct_idx", ct_idx);
			Map<String,Object> uMap = new HashMap<String,Object>();
			Map<String,Object> eMap1 = new HashMap<String,Object>();
			Map<String,Object> eMap2 = new HashMap<String,Object>();
			eMap1.put("ab_user", "MGL_CT_USER_A");
			eMap2.put("ab_user", "MGL_CT_USER_B");
			uMap.put("ct_idx", ct_idx);
			ContestVO cvo = ctService.selectAteam(yn);
			//이번경기에서 이긴팀 인덱스
			List<Object> endJoin = new ArrayList<Object>();
			if(cvo.getCount()==1) {
				uMap.put("ct_gidx", cvo.getCt_gidx());
				uMap.put("ct_t_idx", win_team);
				uMap.put("ab_team", "MGL_CT_A_TEAM_IDX");
				uMap.put("ab_team_nm", "MGL_CT_A_TEAM_NM");
				uMap.put("ab_id1", "MGL_CT_AT_ID1");
				uMap.put("ab_nm1", "MGL_CT_AT_NM1");
				uMap.put("ab_age1", "MGL_CT_AT_AGE1");
				uMap.put("ab_gd1", "MGL_CT_AT_GD1");
				uMap.put("ab_id2", "MGL_CT_AT_ID2");
				uMap.put("ab_nm2", "MGL_CT_AT_NM2");
				uMap.put("ab_age2", "MGL_CT_AT_AGE2");
				uMap.put("ab_gd2", "MGL_CT_AT_GD2");
				eMap1.put("ct_gidx_gb", cvo.getCt_gidx()+"_1");
				endJoin.add(eMap1);
				eMap2.put("ct_gidx_gb", cvo.getCt_gidx()+"_2");
				endJoin.add(eMap2);
			}else {
				cvo = ctService.selectBteam(yn);
				uMap.put("ct_gidx", cvo.getCt_gidx());
				uMap.put("ct_t_idx", win_team);
				uMap.put("ab_team", "MGL_CT_B_TEAM_IDX");
				uMap.put("ab_team_nm", "MGL_CT_B_TEAM_NM");
				uMap.put("ab_id1", "MGL_CT_BT_ID1");
				uMap.put("ab_nm1", "MGL_CT_BT_NM1");
				uMap.put("ab_age1", "MGL_CT_BT_AGE1");
				uMap.put("ab_gd1", "MGL_CT_BT_GD1");
				uMap.put("ab_id2", "MGL_CT_BT_ID2");
				uMap.put("ab_nm2", "MGL_CT_BT_NM2");
				uMap.put("ab_age2", "MGL_CT_BT_AGE2");
				uMap.put("ab_gd2", "MGL_CT_BT_GD2");
				eMap1.put("ct_gidx_gb", cvo.getCt_gidx()+"_3");
				endJoin.add(eMap1);
				eMap2.put("ct_gidx_gb", cvo.getCt_gidx()+"_4");
				endJoin.add(eMap2);
			}
			uMap.put("list",endJoin);
			
			res = ctService.tournamentUpdate(uMap);
		}
		
		
		//해당 그룹의 모든경기가끝났으면 1등을 본선에 올려서 업데이트시킨다
		//gptn(게임포인트)0.25점	vptn(승리포인트) 승리시 1 패배시 0		pptn(점수포인트) 승리시 0.5 패배시 획득포인트x2x0.01		적용포인트 = 포인트총합
		
		map.put("cnt", res);
		System.out.println("ㅁ마지막");
		return map;
	}
	
	@RequestMapping(value = "/Contest/ContestTournament.techni")
	public String contestTournament(HttpSession session, @RequestParam String ct_k_idx,Model model) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("ct_idx", session.getAttribute("ct_idx").toString());
		map.put("ct_k_idx", ct_k_idx);
		map.put("win", "%win%");
		List<ContestVO> listG = ctService.groupList(map);
		List<ContestVO> list = ctService.tournamentSelect(map);
		
		List<Map<String,String>> list1 = new ArrayList<Map<String,String>>();
		List<String> listYN = new ArrayList<String>();
		for(int i = 0; i<list.size();i++) {
			Map<String,String> map1 = new HashMap<String,String>();
			Map<String,String> map2 = new HashMap<String,String>();
			if(!list.get(i).getTeam_a_idx().contains("win")&&list.get(i).getTeam_a_nm()!=null&&!listYN.contains(list.get(i).getTeam_a_nm())) {
				map1.put("team_nm", list.get(i).getTeam_a_nm());
				map1.put("nm_1", list.get(i).getA1_nm());
				map1.put("nm_2", list.get(i).getA2_nm());
				list1.add(map1);
				listYN.add(list.get(i).getTeam_a_nm());
			}else if(!list.get(i).getTeam_a_idx().contains("win")&&list.get(i).getTeam_a_nm()==null) {
				if(list.get(i).getTeam_a_idx().length()==15) {
					map1.put("team_nm", list.get(i).getTeam_a_idx().substring(list.get(i).getTeam_a_idx().length()-1, list.get(i).getTeam_a_idx().length())+"그룹 승자");
				}else {
					map1.put("team_nm", list.get(i).getTeam_a_idx().substring(list.get(i).getTeam_a_idx().length()-2, list.get(i).getTeam_a_idx().length())+"그룹 승자");
				}
				list1.add(map1);
				listYN.add(list.get(i).getTeam_a_nm());
			}
			
			if(!list.get(i).getTeam_b_idx().contains("win")&&list.get(i).getTeam_b_nm()!=null&&!listYN.contains(list.get(i).getTeam_b_nm())) {
				map2.put("team_nm", list.get(i).getTeam_b_nm());
				map2.put("nm_1", list.get(i).getB1_nm());
				map2.put("nm_2", list.get(i).getB2_nm());
				list1.add(map2);
				listYN.add(list.get(i).getTeam_b_nm());
			}else if(!list.get(i).getTeam_b_idx().contains("win")&&list.get(i).getTeam_b_nm()==null) {
				if(list.get(i).getTeam_b_idx().length()==15) {
					map2.put("team_nm", list.get(i).getTeam_b_idx().substring(list.get(i).getTeam_b_idx().length()-1, list.get(i).getTeam_b_idx().length())+"그룹 승자");
				}else {
					map2.put("team_nm", list.get(i).getTeam_b_idx().substring(list.get(i).getTeam_b_idx().length()-2, list.get(i).getTeam_b_idx().length())+"그룹 승자");
				}
				list1.add(map2);
			}
			
			
		}
		
		map.put("win", "%win1%");
		List<ContestVO> listWin1 = ctService.tournamentSelect(map);
		List<Map<String,String>> list2 = new ArrayList<Map<String,String>>();
		map.put("win", "%win2%");
		List<ContestVO> listWin2 = ctService.tournamentSelect(map);
		List<Map<String,String>> list3 = new ArrayList<Map<String,String>>();
		map.put("win", "%win3%");
		List<ContestVO> listWin3 = ctService.tournamentSelect(map);
		List<Map<String,String>> list4 = new ArrayList<Map<String,String>>();
		map.put("win", "%win4%");
		List<ContestVO> listWin4 = ctService.tournamentSelect(map);
		List<Map<String,String>> list5 = new ArrayList<Map<String,String>>();
		
		for(int i = 0 ; i<listWin1.size();i++) {
			Map<String,String> map1 = new HashMap<String,String>();
			if(listWin1.get(i).getTeam_a_score()==null || listWin1.get(i).getTeam_b_score()==null) {
				map1.put("team_nm", "");
				map1.put("nm_1","");
				map1.put("nm_2","");
			}else if(Integer.parseInt(listWin1.get(i).getTeam_a_score())>Integer.parseInt(listWin1.get(i).getTeam_b_score())){
				map1.put("team_nm", listWin1.get(i).getTeam_a_nm());
				map1.put("nm_1", listWin1.get(i).getA1_nm());
				map1.put("nm_2", listWin1.get(i).getA2_nm());
				map1.put("win", "aTeam");
			}else if(Integer.parseInt(listWin1.get(i).getTeam_b_score())>Integer.parseInt(listWin1.get(i).getTeam_a_score())){
				map1.put("team_nm", listWin1.get(i).getTeam_b_nm());
				map1.put("nm_1", listWin1.get(i).getB1_nm());
				map1.put("nm_2", listWin1.get(i).getB2_nm());
				map1.put("win", "bTeam");
			}
			list2.add(map1);
		}
		
		for(int i = 0 ; i<listWin2.size();i++) {
			Map<String,String> map1 = new HashMap<String,String>();
			if(listWin2.get(i).getTeam_a_score()==null || listWin2.get(i).getTeam_b_score()==null) {
				map1.put("team_nm", "");
			}else if(Integer.parseInt(listWin2.get(i).getTeam_a_score())>Integer.parseInt(listWin2.get(i).getTeam_b_score())){
				map1.put("team_nm", listWin2.get(i).getTeam_a_nm());
				map1.put("nm_1", listWin2.get(i).getA1_nm());
				map1.put("nm_2", listWin2.get(i).getA2_nm());
				map1.put("win", "aTeam");
			}else if(Integer.parseInt(listWin2.get(i).getTeam_b_score())>Integer.parseInt(listWin2.get(i).getTeam_a_score())){
				map1.put("team_nm", listWin2.get(i).getTeam_b_nm());
				map1.put("nm_1", listWin2.get(i).getB1_nm());
				map1.put("nm_2", listWin2.get(i).getB2_nm());
				map1.put("win", "bTeam");
			}
			list3.add(map1);
		}
		
		for(int i = 0 ; i<listWin3.size();i++) {
			Map<String,String> map1 = new HashMap<String,String>();
			if(listWin3.get(i).getTeam_a_score()==null || listWin3.get(i).getTeam_b_score()==null) {
				map1.put("team_nm", "");
			}else if(Integer.parseInt(listWin3.get(i).getTeam_a_score())>Integer.parseInt(listWin3.get(i).getTeam_b_score())){
				map1.put("team_nm", listWin3.get(i).getTeam_a_nm());
				map1.put("nm_1", listWin3.get(i).getA1_nm());
				map1.put("nm_2", listWin3.get(i).getA2_nm());
				map1.put("win", "aTeam");
			}else if(Integer.parseInt(listWin3.get(i).getTeam_b_score())>Integer.parseInt(listWin3.get(i).getTeam_a_score())){
				map1.put("team_nm", listWin3.get(i).getTeam_b_nm());
				map1.put("nm_1", listWin3.get(i).getB1_nm());
				map1.put("nm_2", listWin3.get(i).getB2_nm());
				map1.put("win", "bTeam");
			}
			list4.add(map1);
		}
		
		for(int i = 0 ; i<listWin4.size();i++) {
			Map<String,String> map1 = new HashMap<String,String>();
			if(listWin4.get(i).getTeam_a_score()==null || listWin4.get(i).getTeam_b_score()==null) {
				map1.put("team_nm", "");
			}else if(Integer.parseInt(listWin4.get(i).getTeam_a_score())>Integer.parseInt(listWin4.get(i).getTeam_b_score())){
				map1.put("team_nm", listWin4.get(i).getTeam_a_nm());
				map1.put("nm_1", listWin4.get(i).getA1_nm());
				map1.put("nm_2", listWin4.get(i).getA2_nm());
				map1.put("win", "aTeam");
			}else if(Integer.parseInt(listWin4.get(i).getTeam_b_score())>Integer.parseInt(listWin4.get(i).getTeam_a_score())){
				map1.put("team_nm", listWin4.get(i).getTeam_b_nm());
				map1.put("nm_1", listWin4.get(i).getB1_nm());
				map1.put("nm_2", listWin4.get(i).getB2_nm());
				map1.put("win", "bTeam");
			}
			list5.add(map1);
		}
		
		
		
		model.addAttribute("list1", list1);
		
		System.out.println(list1);
		model.addAttribute("list2", list2);
		
		System.out.println(list2);
		model.addAttribute("list3", list3);
		
		System.out.println(list3);
		model.addAttribute("list4", list4);
		
		System.out.println(list4);
		model.addAttribute("list5", list5);
		
		System.out.println(list5);
		
		model.addAttribute("listG",listG);
		model.addAttribute("ct_k_nm", list.get(0).getCt_k_nm());
		model.addAttribute("ct_g_idx", list.get(0).getCt_gidx().substring(0, 14));
		
		if (session.getAttribute("login") == null) {
			return "contest/contestTournament.pa";
		} else {
			return "contest/contestTournament.pa";
		}

	}
	
}
