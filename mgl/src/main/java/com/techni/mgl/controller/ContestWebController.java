package com.techni.mgl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.techni.mgl.domain.ContestVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.service.ClubService;
import com.techni.mgl.service.ContestService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class ContestWebController {
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

	@RequestMapping(value="/ContestWeb/LoginWebForm.techni")
	public String loginWebForm() {

		return "contestWeb/loginWebForm";
	}


	@RequestMapping(value="/ContestWeb/LoginWeb.techni")
	@ResponseBody
	public String loginWeb(	HttpSession session,
			@RequestParam(value= "m_id", required = true) String m_id, 
			@RequestParam(value="m_pw", required = true) String m_pw) {

		System.out.println("m_id : "+ m_id);
		System.out.println("m_id : "+ m_pw);

		Map<String,String> map = new HashMap<String,String>();

		map.put("m_id", m_id);
		map.put("m_pw", m_pw);

		MemberVO mvo = mService.login(map);

		if(mvo !=null) { //회원데이터 존재 
			System.out.println("회원데이터 존재");
			session.setAttribute("login", mvo);

			if(mService.todayLogin(m_id) == 0) {
				int res = mService.todayLoginInsert(m_id);
				System.out.println("mService.todayLogin(m_id) == 0");

				if(res <= 0) {
					System.out.println("res <= 0");
				}
			}
			return "/";
		}else {//회원데이터 없음
			System.out.println("회원데이터 없음");
			return "";
		}
	} 


	@RequestMapping(value = "/ContestWeb/ContestWebIng.techni")
	public String contestCreateIng(HttpSession session, Model model) {

		List<ContestVO> ingList = ctService.selectCtIngList();
		model.addAttribute("ingList", ingList );



		if (session.getAttribute("login") == null) {
			return "contestWeb/contestWebIng.CWeb";
		} else {
			return "contestWeb/contestWebIng.CWeb";
		}


	}
	@RequestMapping(value = "/ContestWeb/ContestWebExpected.techni")
	public String contestCreateExpected(HttpSession session, Model model) {


		List<ContestVO> preList = ctService.selectCtPreList();
		model.addAttribute("preList", preList );


		if (session.getAttribute("login") == null) {
			return "contestWeb/contestWebExpected.CWeb";
		} else {
			return "contestWeb/contestWebExpected.CWeb";
		}



	}
	@RequestMapping(value = "/ContestWeb/ContestWebEnd.techni")
	public String contestCreateEnd(HttpSession session, Model model) {

		List<ContestVO> lastList = ctService.selectCtLastList();
		model.addAttribute("lastList", lastList );


		if (session.getAttribute("login") == null) {
			return "contestWeb/contestWebEnd.CWeb";
		} else {
			return "contestWeb/contestWebEnd.CWeb";
		}

	}
	@RequestMapping(value = "/ContestWeb/ContestWebRequest.techni")
	public String contestCreateRequest(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "contestWeb/contestWebRequest.CWeb";
		} else {
			return "contestWeb/contestWebRequest.CWeb";
		}

	}

	//확정 대진표
		@RequestMapping(value = "/ContestWeb/ContestWebDesideMatchList.techni")
		public String contestWebDesideMatchList(HttpSession session,Model model,@RequestParam(required = false) String ct_idx) {
			if(ct_idx == null) {
				ct_idx =(String) session.getAttribute("ct_idx");
			}else {
				session.setAttribute("ct_idx", ct_idx);
				ct_idx = (String) session.getAttribute("ct_idx");
			}
			int t_cnt=0;
			
			//System.out.println("ct_idx :" +ct_idx);
			Map<String,String> map = new HashMap<String,String>();
			map.put("ct_idx", ct_idx);

			// System.out.println("map value :"+ map.get("ct_idx"));

			List<ContestVO> list = ctService.selectDesideMatchList(map);

			//팀 수 가져오기
			List<ContestVO> cntList = ctService.selectCtTeamCount(map);

			for(int i=0 ; i < cntList.size();i++) {

				ContestVO map1 = cntList.get(i);

				t_cnt=map1.getTeam_count();
				System.out.println("팀카운트 : "+map1.getTeam_count());

			}
			//종목 수 가져오기
			List<ContestVO> typeList =ctService.selectCtKindName(map);
			int type_cnt=typeList.size();
			System.out.println("종목수 : "+typeList.size());

			//코트 개수 가져오기
			ContestVO ctvo = ctService.selectCt(ct_idx);
			int courtCnt = ctvo.getCt_court();

			System.out.println("코트갯수 :"+courtCnt);
			model.addAttribute("courtCnt",courtCnt);
			model.addAttribute("matchList",list);
			model.addAttribute("t_cnt", t_cnt);
			model.addAttribute("type_cnt",type_cnt);
			if (session.getAttribute("login") == null) { 
				return "contestWeb/contestWebDesideMatchList.CWeb2";
			} else {
				return "contestWeb/contestWebDesideMatchList.CWeb2";
			}

		}
		//대회 상태별(대기) 대진표
		@RequestMapping(value = "/ContestWeb/ContestWebStayMatchList.techni")
		public String contestWebStayMatchList(HttpSession session,Model model) {
			int t_cnt=0;

			String ct_idx = (String)session.getAttribute("ct_idx");
			//String ct_idx = "CT190611014";

			//System.out.println("ct_idx :" +ct_idx);
			Map<String,String> map = new HashMap<String,String>();
			map.put("ct_idx", ct_idx);
			map.put("ct_status", "대기");
			// System.out.println("map value :"+ map.get("ct_idx"));
			
			List<ContestVO> list = ctService.selectStatusMatchList(map);

			//팀 수 가져오기
			List<ContestVO> cntList = ctService.selectCtTeamCount(map);

			//종료 게임 , 모든 게임 카운트
			ContestVO g_cnt = ctService.gameCount(map);
			
			for(int i=0 ; i < cntList.size();i++) {

				ContestVO map1 = cntList.get(i);

				t_cnt=map1.getTeam_count();
				System.out.println("팀카운트 : "+map1.getTeam_count());

			}
			//종목 수 가져오기
			List<ContestVO> typeList =ctService.selectCtKindName(map);
			int type_cnt=typeList.size();
			System.out.println("종목수 : "+typeList.size());

			//코드 개수 가져오기
			ContestVO ctvo = ctService.selectCt(ct_idx);
			int courtCnt = ctvo.getCt_court();


			System.out.println("코트갯수 :"+courtCnt);
			model.addAttribute("courtCnt",courtCnt);
			model.addAttribute("matchList",list);
			model.addAttribute("t_cnt", t_cnt);
			model.addAttribute("type_cnt",type_cnt);
			model.addAttribute("g_cnt",g_cnt);
			if (session.getAttribute("login") == null) {
				return "contestWeb/contestWebStayMatchList.CWeb2";
			} else {
				return "contestWeb/contestWebStayMatchList.CWeb2";
			}

		}

		//대회 상태별(종료) 대진표
		@RequestMapping(value = "/ContestWeb/ContestWebEndMatchList.techni")
		public String contestWebEndMatchList(HttpSession session,Model model) {
			int t_cnt=0;

			String ct_idx = (String)session.getAttribute("ct_idx");
			//String ct_idx = "CT190524012";

			//System.out.println("ct_idx :" +ct_idx);
			Map<String,String> map = new HashMap<String,String>();
			map.put("ct_idx", ct_idx);
			map.put("ct_status", "종료");
			// System.out.println("map value :"+ map.get("ct_idx"));

			List<ContestVO> list = ctService.selectStatusMatchList(map);

			//팀 수 가져오기
			List<ContestVO> cntList = ctService.selectCtTeamCount(map);

			for(int i=0 ; i < cntList.size();i++) {

				ContestVO map1 = cntList.get(i);

				t_cnt=map1.getTeam_count();
				System.out.println("팀카운트 : "+map1.getTeam_count());

			}
			//종목 수 가져오기
			List<ContestVO> typeList =ctService.selectCtKindName(map);
			int type_cnt=typeList.size();
			System.out.println("종목수 : "+typeList.size());

			//코드 개수 가져오기
			ContestVO ctvo = ctService.selectCt(ct_idx);
			int courtCnt = ctvo.getCt_court();

			//종료 게임 , 모든 게임 카운트
			ContestVO g_cnt = ctService.gameCount(map);

			System.out.println("코트갯수 :"+courtCnt);
			model.addAttribute("courtCnt",courtCnt);
			model.addAttribute("matchList",list);
			model.addAttribute("t_cnt", t_cnt);
			model.addAttribute("type_cnt",type_cnt);
			model.addAttribute("g_cnt",g_cnt);
			
			if (session.getAttribute("login") == null) {
				return "contestWeb/contestWebEndMatchList.CWeb2";
			} else {
				return "contestWeb/contestWebEndMatchList.CWeb2";
			}

		}
		
		//프린트 출력
		@RequestMapping(value = "/ContestWeb/PrintTest.techni")
		public String PrintTest(HttpSession session, Model model,
				@RequestParam(value = "ct_gidx", required = true) String ct_gidx) {
			String ct_idx = (String) session.getAttribute("ct_idx");
			System.out.println("ct_gidx :" + ct_gidx);

			Map<String, String> map = new HashMap<String, String>();
			map.put("ct_idx", ct_idx);
			map.put("ct_gidx", ct_gidx);

			ContestVO gInfo = ctService.selectGameInfo(map);

			model.addAttribute("gInfo", gInfo);

			return "contestWeb/printTest";
 
		}
		
		@RequestMapping(value = "/ContestWeb/ContestWebStayMatchList2.techni")
		public String contestWebStayMatchList2(HttpSession session,Model model) {
			int t_cnt=0;

			String ct_idx = (String)session.getAttribute("ct_idx");
			//String ct_idx = "CT190611014";

			//System.out.println("ct_idx :" +ct_idx);
			Map<String,String> map = new HashMap<String,String>();
			map.put("ct_idx", ct_idx);
			map.put("ct_status", "대기");
			// System.out.println("map value :"+ map.get("ct_idx"));
			
			List<ContestVO> list = ctService.selectStatusMatchList(map);

			//팀 수 가져오기
			List<ContestVO> cntList = ctService.selectCtTeamCount(map);

			//종료 게임 , 모든 게임 카운트
			ContestVO g_cnt = ctService.gameCount(map);
			
			for(int i=0 ; i < cntList.size();i++) {

				ContestVO map1 = cntList.get(i);

				t_cnt=map1.getTeam_count();
				System.out.println("팀카운트 : "+map1.getTeam_count());

			}
			//종목 수 가져오기
			List<ContestVO> typeList =ctService.selectCtKindName(map);
			int type_cnt=typeList.size();
			System.out.println("종목수 : "+typeList.size());

			//코드 개수 가져오기
			ContestVO ctvo = ctService.selectCt(ct_idx);
			int courtCnt = ctvo.getCt_court();


			System.out.println("코트갯수 :"+courtCnt);
			model.addAttribute("courtCnt",courtCnt);
			model.addAttribute("matchList",list);
			model.addAttribute("t_cnt", t_cnt);
			model.addAttribute("type_cnt",type_cnt);
			model.addAttribute("g_cnt",g_cnt);
			if (session.getAttribute("login") == null) {
				return "contestWeb/contestWebWinGame.CWeb2";
			} else {
				return "contestWeb/contestWebWinGame.CWeb2";
			}

		}
	
}