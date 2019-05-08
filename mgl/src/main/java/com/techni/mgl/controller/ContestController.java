package com.techni.mgl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
					+ "_team (MGL_CT_TEAM_IDX VARCHAR(50) NOT NULL,MGL_CT_IDX VARCHAR(50) NOT NULL,MGL_CT_TYPE_IDX VARCHAR(50) NULL,MGL_CT_GROUP_IDX VARCHAR(50) NULL,MGL_CT_CLUB_NM VARCHAR(50) NULL,MGL_CT_USER_A VARCHAR(50) NULL,MGL_CT_USER_B VARCHAR(50) NULL,PRIMARY KEY (MGL_CT_TEAM_IDX))";
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
					+ "_match_end (MGL_CT_GIDX_GB VARCHAR(50) NOT NULL,MGL_CT_GIDX VARCHAR(50) NULL,MGL_CT_IDX VARCHAR(50) NULL,MGL_CT_TYPE_IDX VARCHAR(50) NULL,MGL_CT_GROUP_IDX VARCHAR(50) NULL,MGL_CT_TEAM_IDX VARCHAR(50) NULL,MGL_CT_USER_ID VARCHAR(50) NULL,MGL_CT_DATE DATE NULL,MGL_CT_USER_GD VARCHAR(50) NULL,MGL_CT_USER_AGE VARCHAR(50) NULL,MGL_CT_UEFFORT FLOAT NULL,MGL_CT_TOTAL INT(11) NULL,MGL_CT_CNT_GAP INT(1) NULL,MGL_CT_WIN CHAR(1) NULL,MGL_CT_GPTN DECIMAL(5,2) NULL,MGL_CT_VPTN DECIMAL(5,2) NULL,MGL_CT_PPTN DECIMAL(5,2) NULL,MGL_CT_APTN DECIMAL(5,2) NULL,MGL_CT_END DATE NULL,PRIMARY KEY (MGL_CT_GIDX_GB))";
			map4.put("sql", sql5);
			ctService.createMatchEndTable(map4);
			
			String sql6 = "CREATE TABLE mgl_contest." + ct_idx
					+ "_seq (MGL_CT_USER_SEQ INT(5) NOT NULL,MGL_CT_TEAM_SEQ INT(5) NULL,PRIMARY KEY (MGL_CT_USER_SEQ))";
			map4.put("sql", sql6);
			ctService.createSeqTable(map4);
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
	public String contestMyGame(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestMyGame.pa";
		} else {
			return "contest/contestMyGame.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameCoat.techni")
	public String contestMyGameCoat(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameCoat.pa";
		} else {
			return "contest/contestMyGameCoat.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameEvent.techni")
	public String contestMyGameEvent(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameEvent.pa";
		} else {
			return "contest/contestMyGameEvent.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameEventDetail.techni")
	public String contestMyGameEventDetail(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameEventDetail.pa";
		} else {
			return "contest/contestMyGameEventDetail.pa";
		}

	}

	@RequestMapping(value = "/Contest/ContestMyGameTime.techni")
	public String contestMyGameTime(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestMyGameTime.pa";
		} else {
			return "contest/contestMyGameTime.pa";
		}

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
	public String contestReferee(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contest/contestReferee.pa";
		} else {
			return "contest/contestReferee.pa";
		}

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
	public String contestStep(HttpSession session) {

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

}
