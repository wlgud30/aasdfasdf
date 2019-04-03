package com.techni.mgl.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.service.ClubService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class ClubController {

	@Resource(name = "uploadPath")
	String uploadPath;
	@Autowired
	public ClubService cService;
	@Autowired
	public UClubService ucService;
	@Autowired
	public MemberService mService;
	
	@RequestMapping(value="/Club/ClubInsert.techni", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<Object,Object> clubInsert(@RequestBody ClubVO cVO, HttpSession session,Model model){
		
		Map<Object,Object> map = new HashMap<Object,Object>();
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		cVO.setU_mid(mvo.getM_id());
		int res = cService.clubInsert(cVO);
		System.out.println(cVO.toString());
		String idx = cVO.getC_idx();
		
		UClubVO uVO = new UClubVO(idx,mvo.getM_id(),mvo.getM_club_gd());
		
		int res1 = ucService.insert(uVO);
		int res2 = ucService.c_seq();
		int res3 = ucService.uc_seq();
		
		if(res > 0 &&res1>0&&res2>0&&res3>0)	{
			
			int ch = ucService.representCheck(mvo.getM_id());
			
			if(ch==0) {
				Map<String, String> map2 = new HashMap<String, String>();
				session.setAttribute("represent_idx", cVO.getC_idx());
				map2.put("u_id", mvo.getM_id());
				map2.put("c_idx", cVO.getC_idx());
				System.out.println(cVO.getC_idx());
				System.out.println(cVO);
				
				session.setAttribute("c_idx",mvo.getM_represent());
				session.setAttribute("represent_idx", mvo.getM_represent());
				
				UClubVO uvo = ucService.userMng(map2);
				UClubVO uvo2 = ucService.headerSelect(map2);
				
				Map<String,Object> mvo2 = new HashMap<String,Object>();
				
				mvo2.put("aptn", uvo2.getCm_p_total());
				mvo2.put("c_nm", uvo2.getC_nm());
				mvo2.put("u_nm", mvo.getM_nm());
				mvo2.put("c_gd", uvo2.getU_club_gd());
				mvo2.put("u_photo", mvo.getM_photo());
				mvo2.put("c_idx",mvo.getM_represent());
				
				session.setAttribute("mvo", mvo2);
				System.out.println(mvo2);
				session.setAttribute("mng", uvo.getUc_mng());
				
				mService.clubUpdate2(map2);
			}
			
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		return map;
	}
	@RequestMapping(value="/Club/ClubDetailMy.techni")
	public String detailMy(HttpSession session, Model model){
		Map<String,String> map = new HashMap<String,String>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String c_idx = (String) session.getAttribute("c_idx");
		map.put("c_idx", c_idx);
		map.put("u_id", mvo.getM_id());
		
		List<ClubVO> cvo = cService.selectOne(map);
		
		List<UClubVO> list = ucService.clubUserList(c_idx);
			int i = 0;
			for(UClubVO uvo : list){
				if(uvo.getU_id().equals(mvo.getM_id())){
					i = 1;
				}
			}
		model.addAttribute("yn", i);
		model.addAttribute("club", cvo);
		SimpleDateFormat formatter = new SimpleDateFormat("yyMM");
		Date currentTime = new Date();
		String dTime = formatter.format(currentTime);

		String	ym = dTime;
		
		map.put("ym", ym);
		
		List<UClubVO> list2 = ucService.selectUClubUser(map);
		
		int ss = 0;
		int a = 0;
		int b = 0;
		int c = 0;
		int d = 0;
		int e = 0;
		int f = 0;
		
		for(UClubVO uvo : list2){
			if(uvo.getU_club_gd().equals("자강")) {
				ss++;
			}else if(uvo.getU_club_gd().equals("A")||uvo.getU_club_gd().equals("a")) {
				a++;
			}else if(uvo.getU_club_gd().equals("B")||uvo.getU_club_gd().equals("b")) {
				b++;
			}else if(uvo.getU_club_gd().equals("C")||uvo.getU_club_gd().equals("c")) {
				c++;
			}else if(uvo.getU_club_gd().equals("D")||uvo.getU_club_gd().equals("d")) {
				d++;
			}else if(uvo.getU_club_gd().equals("초심")||uvo.getU_club_gd().equals("초심")) {
				e++;
			}else if(uvo.getU_club_gd().equals("왕초")||uvo.getU_club_gd().equals("왕초")) {
				f++;
			}
		}
		model.addAttribute("ss", ss);
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("c", c);
		model.addAttribute("d", d);
		model.addAttribute("e", e);
		model.addAttribute("f", f);
		
		return "uclub/uClubDetail.pag";
	}
	
	@RequestMapping(value="/Club/ClubYN.techni")
	@ResponseBody
	public Map<Object,Object> clubYN(@RequestBody String c_idx,HttpSession session){
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String> map2 = new HashMap<String,String>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		map2.put("c_idx", c_idx);
		map2.put("u_id", mvo.getM_id());
		
		int cnt = ucService.selectYN(map2);
		
		map.put("cnt", cnt);
		
		return map;
	}
	
	@RequestMapping(value="/Club/ClubDetail.techni" , method={RequestMethod.POST , RequestMethod.GET })
	public String selectOne(RedirectAttributes redirect,HttpServletRequest request,HttpSession session, Model model,@RequestParam(required=false) String c_idx){
		session.removeAttribute("c_idx");
		session.setAttribute("c_idx", c_idx	);
		String msg ="";
		if(c_idx == null){
			Map<String, ?> map2 = RequestContextUtils.getInputFlashMap(request);
			Map<String,String> map3 = new HashMap<String,String>();
			if(null != map2){
				map3 = (Map<String, String>) map2.get("map2");
				
				
				c_idx = map3.get("c_idx");
				msg = map3.get("msg");
			}
		}
		if(c_idx==null){
			c_idx = (String) session.getAttribute("c_idx");
		}
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		Map<String,String> map = new HashMap<String,String>();
		map.put("c_idx", c_idx);
		map.put("u_id", mvo.getM_id());
		int res = cService.detailChoice(map);
		if(res > 0) {
			/*redirect.addAttribute("c_idx", c_idx);
			System.out.println(c_idx);*/
		return "redirect:/Board/BoardList.techni";
		}else{
			System.out.println(c_idx);
			List<ClubVO> club = cService.selectOne(map);
			model.addAttribute("club",club);
			model.addAttribute("msg", msg);
			session.removeAttribute("c_idx");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyMM");
			Date currentTime = new Date();
			String dTime = formatter.format(currentTime);

			String	ym = dTime;
			
			map.put("ym", ym);
			
			List<UClubVO> list = ucService.selectUClubUser(map);
			
			int ss = 0;
			int a = 0;
			int b = 0;
			int c = 0;
			int d = 0;
			int e = 0;
			int f = 0;
			
			for(UClubVO uvo : list){
				if(uvo.getU_club_gd().equals("자강")) {
					ss++;
				}else if(uvo.getU_club_gd().equals("A")||uvo.getU_club_gd().equals("a")) {
					a++;
				}else if(uvo.getU_club_gd().equals("B")||uvo.getU_club_gd().equals("b")) {
					b++;
				}else if(uvo.getU_club_gd().equals("C")||uvo.getU_club_gd().equals("c")) {
					c++;
				}else if(uvo.getU_club_gd().equals("D")||uvo.getU_club_gd().equals("d")) {
					d++;
				}else if(uvo.getU_club_gd().equals("초심")||uvo.getU_club_gd().equals("초심")) {
					e++;
				}else if(uvo.getU_club_gd().equals("왕초")||uvo.getU_club_gd().equals("왕초")) {
					f++;
				}
			}
			model.addAttribute("ss", ss);
			model.addAttribute("a", a);
			model.addAttribute("b", b);
			model.addAttribute("c", c);
			model.addAttribute("d", d);
			model.addAttribute("e", e);
			model.addAttribute("f", f);
			
			return "uclub/uClubDetail.page";
		}
	}
	
	@RequestMapping("/Club/ClubUpdateForm.techni")
	public String setUClubUpdate(HttpSession session,Model model){
		String c_idx = (String) session.getAttribute("c_idx");

		ClubVO cvo = cService.selectOneClub(c_idx);
		
		model.addAttribute("cvo", cvo);
		
		return "uclub/uClubUpdate.pag";
	}
	//클럽삭제
	@RequestMapping("/Club/ClubDel.techni")
	@ResponseBody
	public Map<Object,Object> clubDel(HttpSession session){
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		String c_idx = (String) session.getAttribute("c_idx");
		
		int res = cService.clubDel(c_idx);
		
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}
	@RequestMapping("/Club/ClubUpdate.techni")
	@ResponseBody
	public Map<Object, Object> setUClubUpdate(HttpSession session,Model model,MultipartHttpServletRequest req) throws ParseException, IOException {
		
		String c_nm = req.getParameter("c_nm");
		String c_info = req.getParameter("c_info");
		String cst_nm = req.getParameter("cst_nm");
		String c_location = req.getParameter("c_location");
		String c_court_sa = req.getParameter("c_court_sa");
		String c_court_su = req.getParameter("c_court_su");
		String c_idx = (String) session.getAttribute("c_idx");
		String c_photo = req.getParameter("c_photo");
		System.out.println(c_court_sa);
		System.out.println(c_court_su);
		MultipartFile file = req.getFile("file");
		
		System.out.println("스타디움이름 : " + cst_nm);
		Map<Object, Object> map1 = new HashMap<Object, Object>();

		Map<String, String> map = new HashMap<String, String>();
		
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
			map.put("c_photo", filePath);
			System.out.println(filePath);
			System.out.println(fileName);
		}else{
			map.put("c_photo",c_photo);
		}
		
		
		
		map.put("c_nm", c_nm);
		map.put("c_info",  c_info);
		map.put("cst_nm", cst_nm);
		map.put("c_location", c_location);
		map.put("c_court_sa", c_court_sa);
		map.put("c_court_su", c_court_su);
		map.put("c_idx", c_idx);
		
		int res = ucService.clubUpdate(map);
		
		if (res>0){
			map1.put("cnt", 1);
			return map1;
		}else{
			map1.put("cnt", 0);
			return map1;
		}
	}
}
