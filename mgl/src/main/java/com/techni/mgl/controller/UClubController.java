package com.techni.mgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techni.mgl.domain.BoardVO;
import com.techni.mgl.domain.ClubMatchVO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.dto.UClubViewDTO;
import com.techni.mgl.service.GameService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class UClubController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(UClubController.class);

	@Resource(name = "uploadPath")
	String uploadPath;

	@Autowired
	public UClubService ucService;
	@Autowired
	public MemberService mService;
	@Autowired
	public GameService gService;

	@RequestMapping(value = "/upload/uploadForm.techni", method = RequestMethod.GET)
	public void uplodaForm() {
		// upload/uploadForm.jsp(업로드 페이지)로 포워딩
	}

	@RequestMapping(value = "/upload/uploadForm.techni", method = RequestMethod.POST)
	public String uploadForm(HttpServletRequest request, @RequestParam MultipartFile file, Model model)
			throws IOException {

		System.out.println("파일이름 :" + file.getOriginalFilename());
		System.out.println("파일크기 :" + file.getSize());
		System.out.println("컨텐트타입 :" + file.getContentType());

		String savedName = file.getOriginalFilename();

		String orignalFileName = file.getOriginalFilename();
		String[] fileNameArr = orignalFileName.split("\\.");
		Date date = new Date();
		String fileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];

		File target = new File(uploadPath, fileName);
		FileCopyUtils.copy(file.getBytes(), target);

		model.addAttribute("fileName", fileName);
		String filePath = uploadPath + "\\" + fileName;
		System.out.println(filePath.substring(37));
		System.out.println(fileName);

		return "uclub/uploadResult";
	}

	@RequestMapping("/UClub/SearchList.techni")
	public String searchList(Model model, HttpSession session, @RequestParam String keyword) {

		if (session.getAttribute("login") != null) {

			MemberVO mvo = (MemberVO) session.getAttribute("login");

			Map<String, String> map = new HashMap<String, String>();

			map.put("m_id", mvo.getM_id());
			map.put("keyword", keyword);

			List<ClubVO> list = ucService.searchList(map);

			model.addAttribute("list", list);
			model.addAttribute("keyword", keyword);
			int msg = 0;
			
			if(list.isEmpty()) {
				msg = 1;	
			}
			
			model.addAttribute("msg", msg);
			return "uclub/uClubSearch.page";

		} else {

			session.invalidate();

			String msg = "다시 로그인 해주세요.";
			model.addAttribute("msg", msg);

			return "redirect:/Member/LoginForm.techni";
		}

	}
	
	//클럽 탈퇴
	@RequestMapping("/UClub/UClubOut.techni")
	@ResponseBody
	public Map<Object,Object> clubOut(Model model, HttpSession session, @RequestBody(required =false) String json, @RequestParam(required = false) String u_id) throws ParseException{
		Map<Object,Object> map = new HashMap<Object,Object>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String c_idx = (String) session.getAttribute("c_idx");
		String u_mng = "";
		System.out.println("u_id :  " + u_id);
		if(u_id == null  || u_id.equals("")){
			u_id = mvo.getM_id();
			u_mng = "탈퇴대기";
		}else{
			u_mng = "탈퇴";
		}
		System.out.println(json);
		if(json != null){
			JSONParser parser = new JSONParser();
			JSONObject json2 = (JSONObject) parser.parse(json);
			
			u_id = (String) json2.get("u_id");
			u_mng = (String) json2.get("u_mng");
		}
		
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("u_id", u_id);
		map1.put("c_idx", c_idx);
		map1.put("u_mng", u_mng);
		
		int res = ucService.clubOut(map1);
		System.out.println(res);
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}

	@RequestMapping("/UClub/UClubAllList.techni")
	public String uClubList(Model model, HttpSession session) {
		if (session.getAttribute("login") != null) {
			MemberVO mvo = (MemberVO) session.getAttribute("login");
			List<ClubVO> list = ucService.selectAll(mvo.getM_id());
			System.out.println("ASDFB");
			String token = mvo.getM_push();
			model.addAttribute("token", token);
			model.addAttribute("list", list);
			model.addAttribute("id",mvo.getM_id());
			model.addAttribute("nm", mvo.getM_nm());
			model.addAttribute("pw",mvo.getM_pw());
			MemberVO mvo2 = mService.represent(mvo.getM_id());
			model.addAttribute("represent", mvo2.getM_represent());

			return "uclub/uClubList.page";

		} else {

			session.invalidate();

			String msg = "종료 후 다시 실행 해주세요.";
			model.addAttribute("msg", msg);

			return "ajax/header";
		}

	}
	
	@RequestMapping("/UClub/UClubSearch.techni")
	public String uClubSearch() {
		return "uclub/uClubSearch.page";
	}
	
	@RequestMapping("/UClub/UClubAllList2.techni")
	public String uClubList2(RedirectAttributes redirect ,Model model, HttpSession session) {

		if (session.getAttribute("login") != null) {
			MemberVO mvo = (MemberVO) session.getAttribute("login");
			System.out.println(mvo.getM_id());
			List<ClubVO> list = ucService.selectAll(mvo.getM_id());
			String token = mvo.getM_push();
			model.addAttribute("token", token);
			System.out.println("토큰"+token);
			System.out.println(mvo.getM_id());
			model.addAttribute("list", list);
			model.addAttribute("id",mvo.getM_id());
			model.addAttribute("nm", mvo.getM_nm());
			model.addAttribute("pw",mvo.getM_pw());

			return "uclub/uClubList2.page";

		} else {

			session.invalidate();

			String msg = "종료 후 다시 실행 해주세요.";
			model.addAttribute("msg", msg);

			return "ajax/header";
		}

	}
	// 다시 ajax처리해야함
	@RequestMapping("/UClub/UClubJoin.techni")
	public String user_insert(RedirectAttributes redirect, HttpSession session, Model model,
			@RequestParam String c_idx , @RequestParam(required = false) String u_push) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");

		UClubVO uVO = new UClubVO(c_idx, mvo.getM_id(), mvo.getM_club_gd());

		Map<String, String> map = new HashMap<String, String>();
		map.put("c_idx", c_idx);
		map.put("u_id", mvo.getM_id());

		int res = ucService.user_insert(uVO);
		int res1 = ucService.uc_seq();
		if (res > 0 && res1 > 0) {
			model.addAttribute("가입신청", "클럽(모임) 가입 신청이 완료되었습니다." );
			List<ClubVO> list = ucService.selectAll(mvo.getM_id());
			model.addAttribute("list", list);
			model.addAttribute("u_push", u_push);
			model.addAttribute("u_nm", mvo.getM_nm());
			model.addAttribute("c_idx", c_idx);
			
			MemberController mc = new MemberController();
			MultiValueMap<String,String> param1 = new LinkedMultiValueMap<>();
			
				param1.clear();
				param1.add("sendtype", "push");
				param1.add("appcode", "techni_mglb");
				param1.add("notitype", "noti");
				param1.add("oscode", "a");
				param1.add("token", u_push);
				param1.add("title", "MGL");
				param1.add("desc", mvo.getM_nm()+"님이 가입을 신청하였습니다.");
				param1.add("dataval", "http://mgl.techni.co.kr:8081/UClub/UclubMUserList.techni?c_idx="+c_idx);
				mc.token(param1);
				Map<String,String> map2 = new HashMap<String,String>();
				map2.put("push_id", u_push);
				map2.put("push_ment", mvo.getM_nm()+"님이 가입을 신청하였습니다.");
				map2.put("push_url", "http://mgl.techni.co.kr:8081/UClub/UclubMUserList.techni?c_idx="+c_idx);
				map2.put("u_nm", mvo.getM_nm());
				ucService.pushInsert(map2);
			
			return "uclub/uClubList";
		} else {
			redirect.addAttribute("가입신청", "죄송합니다. 다시 시도해주세요.");
			redirect.addAttribute("c_idx", c_idx);
			return "redirect:/Club/ClubDetail.techni";
		}

	}
	@RequestMapping("/UClub/UClubOutDetail")
	public String user_out(HttpSession session ,@RequestParam(required = false) String u_id ,  Model model	){
		
		Map<String,String> map = new HashMap<String,String>();
		String c_idx = (String)session.getAttribute("c_idx");
		
		map.put("c_idx", c_idx);
		map.put("u_id", u_id);
		
		UClubVO uvo = ucService.UClubJoinWaitDetail(map);
		
		StringBuilder birth = new StringBuilder(uvo.getU_birth());
		
		birth.insert(4, "-");
		birth.insert(7, "-");
		
		uvo.setU_birth(birth.toString());
		
		model.addAttribute("uvo", uvo);
		
		
		return "uclub/uClubMemberOut";
	}

	@RequestMapping("/UClub/UClubUserList.techni")
	public String UclubUserList(HttpSession session, Model model, @RequestParam(required = false) String ym) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String c_idx = (String) session.getAttribute("c_idx");
		String u_id = mvo.getM_id();
		Map<String, String> map = new HashMap<String, String>();

		SimpleDateFormat formatter = new SimpleDateFormat("yyMM");
		Date currentTime = new Date();
		String dTime = formatter.format(currentTime);

		if (ym == null || ym == "") {
			ym = dTime;
		}
		map.put("c_idx", c_idx);
		map.put("u_id", mvo.getM_id());
		map.put("ym", ym);
		System.out.println(ym);
		List<UClubVO> list = ucService.selectUClubUser(map);
		List<UClubVO> listM = ucService.selectUClubM(map);
		List<UClubVO> listF = ucService.selectUClubF(map);
		
		String yn = "n";
		
		for(UClubVO uvo : list){
			if(mvo.getM_id().equals(uvo.getU_id())){
				System.out.println("있네");
				yn = "y";
			}
		}
		model.addAttribute("ym", ym);
		model.addAttribute("yn", yn);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		model.addAttribute("listM", listM);
		model.addAttribute("listF", listF);
		model.addAttribute("c_idx", c_idx);
		model.addAttribute("y", "20" + ym.substring(0, 2));
		model.addAttribute("m", ym.substring(2, 4));
		model.addAttribute("u_id", u_id);

		return "uclub/uClubMemberInfoList.pag";
	}

	@RequestMapping("/UClub/UclubMUserList.techni")
	public String uClubMemberList(HttpSession session, Model model, @RequestParam(required = false) String c_idx,
			@RequestParam(required = false) String msg) {
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		if(c_idx == null){
			c_idx = (String) session.getAttribute("c_idx");
		}else{
			session.setAttribute("c_idx", c_idx);
		}
		List<UClubVO> list = ucService.UClubMList(c_idx);
		List<UClubVO> list2 = ucService.UClubJoinWaitList(c_idx);
		List<UClubVO> list3 = ucService.UClubOutWaitList(c_idx);
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("c_idx", c_idx);
		map.put("u_id",mvo.getM_id());
		
		UClubVO uvo = ucService.userMng(map);
		
		String mng = uvo.getUc_mng();

		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("msg", msg);
		model.addAttribute("mng",mng);
		model.addAttribute("c_idx", c_idx);
		
		if(mng == "회원"||mng=="가입대기"||mng=="탈퇴대기") {
			return "uclub/uClubMemberList.pag";
		}else {
			return "uclub/uClubMemberList.pag";
		}
		
	}

	// admin 회원정보 > 회원가입승인 화면
	@RequestMapping("/UClub/UClubMemberJoin.techni")
	public String setUClubMemberJoin(HttpSession session, Model model, @RequestParam(required = false) String u_id,
			@RequestParam(required = false) String c_idx) {

		Map<String, String> map = new HashMap<String, String>();

		map.put("u_id", u_id);
		map.put("c_idx", c_idx);

		UClubVO uvo = ucService.UClubJoinWaitDetail(map);

		StringBuilder birth = new StringBuilder(uvo.getU_birth());

		birth.insert(4, "-");
		birth.insert(7, "-");

		uvo.setU_birth(birth.toString());

		model.addAttribute("uvo", uvo);

		return "uclub/uClubMemberJoin";
	}

	// 가입승인
	@RequestMapping("/UClub/UClubJoinOK.techni")
	@ResponseBody
	public Map<Object, Object> joinOK(HttpSession session, Model model, @RequestBody String json)
			throws UnsupportedEncodingException, ParseException {

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);

		String u_id = (String) json2.get("u_id");
		String c_idx = (String) json2.get("c_idx");
		String uc_mng = (String) json2.get("uc_mng");
		String push_id = (String) json2.get("push_id");
		String u_nm = (String) json2.get("u_nm");

		Map<Object, Object> map1 = new HashMap<Object, Object>();

		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("push_id", push_id);
		map2.put("push_ment", u_nm+"님이 가입을 신청하였습니다.");
		map2.put("push_url", "http://mgl.techni.co.kr:8081/UClub/UclubMUserList.techni?c_idx="+c_idx);
		map2.put("u_nm", u_nm);
		ucService.pushInsert(map2);
		map.put("u_id", u_id);
		map.put("c_idx", c_idx);
		map.put("uc_mng", uc_mng);

		int res = ucService.cJoinOK(map);

		if (res > 0) {
			map1.put("cnt", 1);

			return map1;

		} else {
			map1.put("cnt", 0);

			return map1;
		}
	}

	@RequestMapping("/UClub/UClubJoinNO.techni")
	@ResponseBody
	public Map<Object, Object> joinNO(HttpSession session, Model model, @RequestBody String json)
			throws ParseException {

		JSONParser parser = new JSONParser();

		JSONObject json2 = (JSONObject) parser.parse(json);

		String u_id = (String) json2.get("u_id");
		String c_idx = (String) json2.get("c_idx");

		Map<Object, Object> map = new HashMap<Object, Object>();

		Map<String, String> map1 = new HashMap<String, String>();

		map1.put("u_id", u_id);
		map1.put("c_idx", c_idx);

		int res = ucService.cJoinNo(map1);

		if (res > 0) {
			map.put("cnt", 1);

			return map;

		} else {
			map.put("cnt", 0);

			return map;
		}

	}

	@RequestMapping("/UClub/AttendList.techni")
	public String attend(HttpSession session, Model model) {
		String c_idx = (String) session.getAttribute("c_idx");
		System.out.println(c_idx);
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";

		List<UClubVO> uvo = ucService.attend(c_idx);
		List<UClubVO> uvo2 = ucService.attendY(c_idx);

		System.out.println(u_id);
		System.out.println(uvo2.toString());
		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
				System.out.println("ustatus" + u_status);
			}

		}
		model.addAttribute("u_status", u_status);
		model.addAttribute("list", uvo);
		model.addAttribute("listY", uvo2);
		System.out.println("1        : " + uvo);

		System.out.println("2       : " + uvo2);
		return "game/gameAttend";
	}
	@RequestMapping("/UClub/Attend.techni")
	public String attend_(HttpSession session, Model model) {
		String c_idx = (String) session.getAttribute("c_idx");
		System.out.println(c_idx);
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";

		List<UClubVO> uvo = ucService.attend(c_idx);
		List<UClubVO> uvo2 = ucService.attendY(c_idx);

		System.out.println(u_id);
		System.out.println(uvo2.toString());
		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
				System.out.println("ustatus" + u_status);
			}

		}
		model.addAttribute("u_status", u_status);
		model.addAttribute("list", uvo);
		model.addAttribute("listY", uvo2);
		System.out.println("1        : " + uvo);

		System.out.println("2       : " + uvo2);
		return "redirect:/Game/GameState.techni";
	}

	@RequestMapping("/UClub/AttendInsert.techni")
	@ResponseBody
	public Map<Object, Object> attendInsert(HttpSession session, Model model) {
		Map<Object, Object> map = new HashMap<Object, Object>();

		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();

		UClubVO uvo = new UClubVO(c_idx, u_id);

		int res = ucService.attendInsert(uvo);

		if (res > 0) {
			map.put("cnt", res);
		} else {
			map.put("cnt", res);
		}
		return map;

	}

	@RequestMapping("/UClub/attendOut.techni")
	@ResponseBody
	public Map<Object, Object> attendOut(HttpSession session, Model model) {

		Map<Object, Object> map = new HashMap<Object, Object>();

		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();

		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("c_idx", c_idx);
		map1.put("u_id", u_id);

		int res = ucService.attendOut(map1);

		if (res > 0) {
			map.put("cnt", res);
		} else {
			map.put("cnt", res);
		}
		return map;

	}

	@RequestMapping("/UClub/MultiAttend.techni")
	@ResponseBody
	public Map<Object, Object> multiAttend(HttpSession session, Model model, @RequestBody String u_id)
			throws UnsupportedEncodingException, ParseException {
		Map<Object, Object> map = new HashMap<Object, Object>();

		String c_idx = (String) session.getAttribute("c_idx");

		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(u_id);

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

		System.out.println(map2);
		int res = ucService.multiAttendI(map2);

		if (res > 0) {
			map.put("cnt", res);
		} else {
			map.put("cnt", res);
		}
		return map;
	}

	@RequestMapping("/UClub/GameOKList.techni")
	public String gameOKList(HttpSession session, Model model) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";
		String c_idx = (String) session.getAttribute("c_idx");

		List<UClubVO> list = ucService.gameOKList(c_idx);

		List<UClubVO> uvo2 = ucService.attendY(c_idx);

		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());

		Map<String,String> map = new HashMap<String,String>();
		map.put("c_idx",c_idx);
		map.put("ymd",strToday);
		List<UClubVO> list2 = ucService.count(map);
		
		model.addAttribute("u_status", u_status);
		model.addAttribute("list", list);
		System.out.println(list2);
		model.addAttribute("list2", list2);
		
		return "game/gameRegist.pag";
	}

	// 클럽유저리스트
	@RequestMapping("/UClub/ClubUserList.techni")
	public String clubUserList(HttpSession session, Model model) {
		String c_idx = (String) session.getAttribute("c_idx");
		List<UClubVO> list = ucService.clubUserList(c_idx);
		
		model.addAttribute("list", list);

		return "uclub/clubUserList";
	}

	// 비교
	@RequestMapping(value = "/UClub/UClubMemberCompareTo.techni")
	public String getUClubMemberCompareTo(HttpSession session, Model model, @RequestParam String total,
			@RequestParam String my_rank, @RequestParam String you_rank, @RequestParam String you_id, @RequestParam String ym) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");

		String c_idx = (String) session.getAttribute("c_idx");
		String my_id = mvo.getM_id();

		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", c_idx);
		map.put("my_id", my_id);
		map.put("you_id", you_id);
		map.put("ym", ym);
		

		UClubVO uvo = ucService.meAndYou(map);
		
		String  m = ym.substring(2);
		System.out.println(m);
		
		model.addAttribute("m", m);
		model.addAttribute("uvo", uvo);
		model.addAttribute("you_rank", you_rank);
		model.addAttribute("my_rank", my_rank);
		model.addAttribute("total", total);

		return "uclub/uClubMemberCompareTo";
	}
	//유저업데이트
	@RequestMapping("/UClub/UserUpdat.techni")
	@ResponseBody
	public Map<Object,Object> userUpdat(HttpSession session,MultipartHttpServletRequest req) throws ParseException, IOException{
		MultipartFile file = req.getFile("file");
		System.out.println(file.getName());
		
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String> map2 = new HashMap<String,String>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		String c_idx = (String) session.getAttribute("c_idx");
		String u_id = mvo.getM_id();
		String u_tel = req.getParameter("tel");
		String u_email = req.getParameter("u_email");
		String u_tsize = req.getParameter("u_tsize");
		String u_club_gd = req.getParameter("u_club_gd");
		String u_pw = req.getParameter("u_pw");
		
		if(u_pw.equals("") || u_pw == null){
			u_pw = mvo.getM_pw();
		}
		map2.put("u_id", u_id);
		map2.put("u_pw", u_pw);
		map2.put("u_tel", u_tel);
		map2.put("u_email", u_email);
		map2.put("u_club_gd", u_club_gd);
		map2.put("u_tsize", u_tsize);
		map2.put("c_idx", c_idx);
		if(file.getSize()!=0){
			System.out.println("파일이름 :" + file.getOriginalFilename());
			System.out.println("파일크기 :" + file.getSize());
			System.out.println("컨텐트타입 :" + file.getContentType());
	
			String orignalFileName = file.getOriginalFilename();
			System.out.println(orignalFileName);
			String[] fileNameArr = orignalFileName.split("\\.");
			Date date = new Date();
			String fileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];
	
			File target = new File(uploadPath, fileName);
			FileCopyUtils.copy(file.getBytes(), target);
	
			String filePath = "/resources/uploadImg/" + fileName;
			map2.put("u_photo", filePath);
			System.out.println(filePath);
			System.out.println(fileName);
			System.out.println(u_id);
			System.out.println(u_club_gd);
			System.out.println(u_tel);
			System.out.println(u_tsize);
			System.out.println(u_email);
			System.out.println(u_pw);
		}else{
			map2.put("u_photo", mvo.getM_photo());
		}
		int res = ucService.userUpdat(map2);
		if(res>0){
			if(req.getParameter("u_pw").equals("") || req.getParameter("u_pw") == null){
				map.put("cnt", 1);
			}else{
				map.put("cnt", 2);
			}
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}

	@RequestMapping("/UClub/UClubList.techni")
	public ModelAndView getUClubList(HttpSession session, ModelAndView mv) {
		ArrayList<ClubVO> list = null;

		try {
			list = ucService.getUClubList(session);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("LIST", list);
		mv.setViewName("uclub/uClubList");
		return mv;
	}

	@RequestMapping("/UClub/UClubWrite.techni")
	public String getUClubWriteForm(ModelAndView mv) {
		
		return "uclub/uClubWriteForm.page";
	}

	@RequestMapping("/UClub/UClubDetailNBeforeJoin.techni")
	public ModelAndView getUClubDetailNotJoin(HttpServletRequest req, HttpSession session, ModelAndView mv) {

		mv.setViewName("uclub/uClubDetailBeforeJoin");
		return mv;
	}

	@RequestMapping("/UClub/UClubDetail.techni")
	public ModelAndView getUClubDetail(HttpServletRequest req, HttpSession session, ModelAndView mv) {
		// 클럽정보 표현을 위한 dto(vo)
		UClubViewDTO ucView = null;
		String idx = req.getParameter("ucidx");
		try {
			if (idx == null || idx.equals("")) {
				idx = ucService.getSession(session);
			}

			// 클럽정보
			ucView = ucService.getUClubDetail(idx, session);

			// ============= 클럽별 운동장정보 리스트를 얻기 위한 코드
			// int c_idx = ucView.getC_idx();

		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("data", ucView);
		mv.setViewName("uclub/uClubDetail");

		return mv;
	}


	@RequestMapping("/UClub/UClubUpdateProc.techni")
	public String setUClubUpdateProc(HttpSession session) {
		return "uclub/uClubUpdate";
	}

	// 회원정보 > 회원정보 상세보기(사용자)
	@RequestMapping("/UClub/UClubMemberDetail.techni")
	public String getUClubMemberDetail(HttpSession session, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String c_idx = (String) session.getAttribute("c_idx");
		String u_id = mvo.getM_id();
		String u_pw = mvo.getM_pw();

		System.out.println("c" + c_idx + "id" + u_id + "pw" + u_pw);

		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", c_idx);
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		
		UClubVO uvo = ucService.selectOne(map);
		List<UClubVO> list = ucService.gameCount(map);
		List<ClubVO> list2 = ucService.selectAll(mvo.getM_id());
		List<UClubVO> list3 = ucService.monthGame(u_id);
		List<UClubVO> list4 = ucService.competitionRank(u_id);
		List<UClubVO> allList = ucService.sameAllGdRank(u_id);
		List<UClubVO> allAgeList = ucService.sameAgeGdRank(u_id);
		List<UClubVO> allSexList = ucService.sameSexGdRank(u_id);
		List<UClubVO> clubList = ucService.sameClubGdRank(u_id);
		
		List<UClubVO> sList = new ArrayList<UClubVO>();
		
		for (UClubVO i : allList) {
			if (i.getU_id().equals(u_id)) {
				i.setTeam_count(allList.size());
				sList.add(i);
			}
		}
		for (UClubVO i : allAgeList) {
			if (i.getU_id().equals(u_id)) {
				i.setTeam_count(allAgeList.size());
				sList.add(i);
			}
		}
		for (UClubVO i : allSexList) {
			if (i.getU_id().equals(u_id)) {
				i.setTeam_count(allSexList.size());
				sList.add(i);
			}
		}
		for (UClubVO i : clubList) {
			if (i.getU_id().equals(u_id)) {
				i.setTeam_count(clubList.size());
				sList.add(i);
			}
		}
				
		model.addAttribute("uvo", uvo);
		model.addAttribute("list", list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",sList);
		System.out.println(sList);
		
		return "uclub/uClubMemberDetail.pag";
	}
	//클럽 등급 변경
	@RequestMapping("/UClub/gdChange.techni")
	@ResponseBody
	public Map<String,Object> gdCahnge(HttpSession session,@RequestBody String json) throws ParseException{
		Map<String,Object> map = new HashMap<String,Object>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		
		String c_idx = (String) json2.get("c_idx");
		String u_club_gd = (String) json2.get("u_club_gd");
		
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("c_idx", c_idx);
		map2.put("u_id", mvo.getM_id());
		map2.put("u_club_gd",u_club_gd);
		
		int cnt = ucService.userGd(map2);
	
		map.put("cnt", cnt);
		
		return map;
	}
	//월별 게임
	@RequestMapping("/UClub/UClubMemberDetail2.techni")
	@ResponseBody
	public Map<String,Object> UClubMemberDetail2(HttpSession session,@RequestBody String json) throws ParseException{
		Map<String,Object> map = new HashMap<String,Object>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		
		String kind = (String) json2.get("kind");
		if(kind.equals("월별디테일")) {
			String ym = (String) json2.get("ym");
			
			Map<String,String> map2 = new HashMap<String,String>();
			map2.put("u_id", mvo.getM_id());
			map2.put("ym",ym);
				
			List<ClubMatchVO> list = gService.pointAllDetail(map2);
			
			map.put("list",list);
			
			if(list.isEmpty()){
				map.put("cnt",0);
			}else {
				map.put("cnt",1);
			}
		}else if(kind.equals("매치디테일")) {
			String c_gidx = (String) json2.get("c_gidx");
			String c_idx = (String) json2.get("c_idx");
			
			Map<String,String> map2 = new HashMap<String,String>();
			map2.put("u_id", mvo.getM_id());
			map2.put("c_gidx",c_gidx);
			map2.put("c_idx",c_idx);
				
			List<ClubMatchVO> list = gService.gameResult(map2);
			
			map.put("list",list);
			
			if(list.isEmpty()){
				map.put("cnt",0);
			}else {
				map.put("cnt",1);
			}
		}
		return map;
		
	}
	// 회원정보 > 회원정보 수정폼 호출
	@RequestMapping("/UClub/UClubMemberUpdate.techni")
	public String getUClubMemberUpdateForm(HttpSession session, Model model) {

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String c_idx = (String) session.getAttribute("c_idx");
		String u_id = mvo.getM_id();
		String u_pw = mvo.getM_pw();

		System.out.println("c" + c_idx + "id" + u_id + "pw" + u_pw);

		Map<String, String> map = new HashMap<String, String>();

		map.put("c_idx", c_idx);
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		UClubVO uvo = ucService.selectOne(map);

		System.out.println(uvo);

		model.addAttribute("uvo", uvo);

		return "uclub/UClubMemberUpdate.page";
	}
	//개인리그등록 화면
	@RequestMapping("/UClub/GamePrivateStateInfo.techni")
	public String privateStateInfo(HttpSession session, Model model) {
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";
		String c_idx = (String) session.getAttribute("c_idx");

		List<UClubVO> uvo2 = ucService.attendY(c_idx);

		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
			}

		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());

		Map<String,String> map = new HashMap<String,String>();
		map.put("c_idx",c_idx);
		map.put("ymd",strToday);
		List<UClubVO> list2 = ucService.count(map);
		model.addAttribute("u_status", u_status);
		model.addAttribute("list", list2);

		return "game/gamePrivateStateInfo.pag";
	}
	//팀리그등록화면
	@RequestMapping("/UClub/GameTeamStateInfo.techni")
	public String teamStateInfo(HttpSession session, Model model) {
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		String u_status = "";
		String c_idx = (String) session.getAttribute("c_idx");

		List<UClubVO> list = ucService.gameOKList(c_idx);

		List<UClubVO> uvo2 = ucService.attendY(c_idx);

		for (UClubVO i : uvo2) {
			if (i.getU_id().equals(u_id)) {
				u_status = i.getU_status();
			}

		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());

		Map<String,String> map = new HashMap<String,String>();
		map.put("c_idx",c_idx);
		map.put("ymd",strToday);
		List<UClubVO> list2 = ucService.count(map);
		model.addAttribute("u_status", u_status);
		model.addAttribute("list", list2);

		return "game/gameTeamStateInfo.pag";
	}

	// 회원정보 > 회원정보 수정 액션 처리
	@RequestMapping("/UClub/UClubMemberUpdateAct.techni")
	public String setUClubMemberUpdateAct(HttpSession session) {
		return "uclub/uClubMemberUpdateAct";
	}

	// 회원정보 > 회원정보 > 리스트
	@RequestMapping("/UClub/UClubMemberInfoList.techni")
	public String getUClubMemberInfoList(HttpSession session) {
		return "uclub/uClubMemberInfoList";
	}

	// 회원정보 > 회원리스트[관리자만 가능]
	@RequestMapping("/UClub/UClubMemberList.techni")
	public String getUClubMemberList(HttpSession session) {
		return "uclub/uClubMemberList";
	}

	// admin 회원정보 > 회원가입승인 처리
	@RequestMapping("/UClub/UClubMemberJoinAct.techni")
	public String setUClubMemberJoinAct(HttpSession session) {
		return "uclub/uClubMemberList";
	}

	// admin 회원정보 > 회원정보 상세보기
	@RequestMapping("/UClub/UClubMemberView.techni")
	public String getUClubMemberView(HttpSession session,Model model,@RequestParam String u_id) {
		Map<String,String> map = new HashMap<String,String>();
		
		String c_idx = (String) session.getAttribute("c_idx");
		
		map.put("c_idx", c_idx);
		map.put("u_id", u_id);
		
		UClubVO uvo = ucService.userOne(map);
		
		model.addAttribute("uvo", uvo);
		
		return "uclub/uClubMemberView";
	}

	// admin 회원정보 > 회원정보 상세 수정액션
	@RequestMapping("/UClub/UClubMemberViewUpdateProc.techni")
	@ResponseBody
	public Map<Object,Object> getUClubMemberViewUpdateProc(HttpSession session,@RequestBody String json) throws ParseException {
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String> map2 = new HashMap<String,String>();
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		
		String c_idx = (String) session.getAttribute("c_idx");
		String u_id = (String) json2.get("u_id");
		String uc_mng = (String) json2.get("uc_mng");
		String u_club_gd = (String) json2.get("u_club_gd");
		
		map2.put("c_idx", c_idx);
		map2.put("u_id", u_id);
		map2.put("uc_mng", uc_mng);
		map2.put("u_club_gd", u_club_gd);
		map2.put("m_id", mvo.getM_id());
		
		System.out.println(c_idx +""+u_id+"바뀔 직책"+uc_mng+""+u_club_gd);
		System.out.println(uc_mng.equals("총무"));
		
		int res = 0;
		if(uc_mng.equals("매니저")){
			res = ucService.manUpdate(map2);
		}else{
			res = ucService.userMngGd(map2);
		}
		if(res > 0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}
	@RequestMapping("/UClub/repersentChange.techni")
	@ResponseBody
	public Map<String,Object> repersentCahnge(HttpSession session,@RequestBody String c_idx){
		Map<String,Object> map = new HashMap<String,Object>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("c_idx", c_idx);
		map2.put("u_id", mvo.getM_id());
		
		int cnt = mService.clubUpdate2(map2);
	
		
		map.put("cnt", cnt);
		
		return map;
	}
}