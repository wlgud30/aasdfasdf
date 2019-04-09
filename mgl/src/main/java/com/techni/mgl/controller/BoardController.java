package com.techni.mgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.apache.xmlbeans.impl.jam.mutable.MSourcePosition;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.techni.mgl.domain.BoardVO;
import com.techni.mgl.domain.CfightVO;
import com.techni.mgl.domain.ClubMatchVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.service.BoardService;
import com.techni.mgl.service.CfightService;
import com.techni.mgl.service.GameService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService brdService;
	@Autowired
	MemberService mService;
	@Autowired
	CfightService cfService;
	@Autowired
	UClubService ucService;
	@Autowired
	GameService gService;
	
	MemberController mc = new MemberController();
	
	@RequestMapping("/Install/apkDownload.techni")
	public String apkDownload(){
		
		return "/member/installEx";
	}
	
	@RequestMapping("/Install/apkDownload2.techni")
	public String apkDownload2(){
		
		return "/member/installEx_2";
	}
	
	@RequestMapping("/Board/Download.techni")
	public void download(HttpServletRequest req , HttpServletResponse res) throws IOException{
	
		req.setCharacterEncoding("UTF-8");
	
		String savePath = "C:\\MGLPROJECT\\mgl\\mgl\\src\\main\\webapp\\resources\\apkDownload";
		String filename = "app-debug.apk";
		String orgfilename = "mgl.apk";
		
		
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

	}
	@RequestMapping("/Board/BoardList.techni")
	public String boardList(HttpSession session , Model model){
		String c_idx = (String) session.getAttribute("c_idx");
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("c_idx", c_idx);
		map.put("u_id", mvo.getM_id());
		List<BoardVO> list = brdService.bbsList(map);
		List<CfightVO> list2 = cfService.cFightList(c_idx);
		List<ClubMatchVO> list3 = gService.selfMatchList(c_idx);
		
		int count = ucService.clubCount(c_idx);
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		
		map2.put("c_nm",list.get(0).getC_nm());
		map2.put("count", count);
		
		session.setAttribute("cvo", map2);
		System.out.println(list2.toString());
		model.addAttribute("list", list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		int res = 0;
		int res2 = 0;
			for(BoardVO bvo : list){
					if(bvo.getCb_yn() != null){
					if(bvo.getCb_yn().equals("Y")){
						res++;
					}else{
						res2++;
					}
				}
			}
			model.addAttribute("nBbs", res2);
			model.addAttribute("sBbs", res);
		
		return "board/boardList.pag";
	}
	@RequestMapping("/Board/BoardListRepresent.techni")
	public String boardListRepresent(HttpSession session , Model model){
		String c_idx = (String) session.getAttribute("represent_idx");
		if(c_idx==null) {
			c_idx = (String) session.getAttribute("c_idx");
		}
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		session.setAttribute("c_idx", c_idx);
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("c_idx", c_idx);
		map.put("u_id", mvo.getM_id());
		List<BoardVO> list = brdService.bbsList(map);
		List<CfightVO> list2 = cfService.cFightList(c_idx);
		List<ClubMatchVO> list3 = gService.selfMatchList(c_idx);
		
		int count = ucService.clubCount(c_idx);
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		
		map2.put("c_nm",list.get(0).getC_nm());
		map2.put("count", count);
		
		session.setAttribute("cvo", map2);
		System.out.println(list2.toString());
		model.addAttribute("list", list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		int res = 0;
		int res2 = 0;
			for(BoardVO bvo : list){
					if(bvo.getCb_yn() != null){
					if(bvo.getCb_yn().equals("Y")){
						res++;
					}else{
						res2++;
					}
				}
			}
			model.addAttribute("nBbs", res2);
			model.addAttribute("sBbs", res);
		
		return "board/boardList.pag";
	}

	/*@RequestMapping("/Board/BoardList.techni")
	public String boardList(HttpServletRequest req, HttpSession session, ModelAndView mv){
		
		String c_idx = (String) session.getAttribute("c_idx");
		String idx = c_idx;
		
		System.out.println("idx:"+idx);
		List<BoardVO> boardList = null; //일반공지
		List<BoardVO> noticeList = null; //중요공지
		String noticeYn = "";
		try{
			if(idx == null || idx.equals("")){
				idx = (String) session.getAttribute("c_idx");
			}
			
			noticeYn="Y";
			noticeList = brdService.getBoardList(idx,noticeYn);
			
			noticeYn="N";
			boardList = brdService.getBoardList(idx,noticeYn);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		mv.addObject("NOTICE", noticeList);
		System.out.println("n"+noticeList.toString());
		mv.addObject("LIST", boardList);
		System.out.println("l"+boardList.toString());
		mv.addObject("idx", idx);
		mv.setViewName("board/boardList");
		return "redirect:/UClub/UClubUserList.techni";
	}*/
	
	// 일반 공지게시판	
	@RequestMapping("/Board/BoardDetail.techni")
	public String getBoardDetail(HttpSession session, Model model, @RequestParam String cb_idx){
		
		
		List<BoardVO> list = brdService.replyList(cb_idx);
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("u_id", mvo.getM_id());
		map.put("cb_idx", cb_idx);
		
		if(brdService.hitUser(map) == 0){
			brdService.hitInsert(map);
		}
		BoardVO bvo = brdService.bbsDetail(cb_idx);
		
		String bbs_yn = "n";
		
		if(bvo.getU_id().equals(mvo.getM_id())) {
			bbs_yn = "y";
		}
		
		model.addAttribute("id", mvo.getM_id());
		model.addAttribute("bvo", bvo);
		model.addAttribute("list", list);
		model.addAttribute("bbs_yn", bbs_yn);
		
		return "board/boardDetail.pag";
	}
	
	//게시글 수정 폼
	@RequestMapping("/Board/BoardBbsUpdateForm.techni")
	public String bbsUpdateForm(Model model,@RequestParam String cb_idx){
		
		BoardVO bvo = brdService.bbsDetail(cb_idx);
		
		model.addAttribute("bvo", bvo);
		
		return "board/boardUpdateForm.pag";
	}
	
	//게시글 수정
	@RequestMapping("/Board/BoardBbsUpdate.techni")
	@ResponseBody
	public Map<Object,Object> bbsUpdate(@RequestBody BoardVO brdVO,HttpSession session){
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		int res = brdService.bbsUpdate(brdVO);
		
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}
	
	//글삭제
	@RequestMapping("/Board/BoardBbsDel.techni")
	@ResponseBody
	public Map<Object,Object> bbsDel(@RequestBody String cb_idx , HttpSession session){
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		int res = brdService.bbsDel(cb_idx);
		
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}
	
	//댓글삭제
		@RequestMapping("/Board/BoardReplyDel.techni")
		@ResponseBody
		public Map<Object,Object> replyDel(@RequestBody String cr_idx , HttpSession session){
			Map<Object,Object>map = new HashMap<Object,Object>();
			
			int res = brdService.replyDel(cr_idx);
			
			if(res>0){
				map.put("cnt", 1);
			}else{
				map.put("cnt", 0);
			}
			
			return map;
		}
	
	//댓글작성
	@RequestMapping(value="/Board/ReplyInsert.techni" ,method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<Object,Object> replyInsert(HttpSession session , @RequestBody BoardVO bvo){
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String u_id = mvo.getM_id();
		
		bvo.setU_id(u_id);
		
		int res = brdService.replyInsert(bvo);
		
		if(res>0){
			map.put("cnt", 1);
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}
	
	// 대회 공지게시판
	@RequestMapping("/Board/BoardDetailMatch.techni")
	public String boardDetailMatch(HttpSession session, ModelAndView mv){
		
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "board/boardDetailMatch";
	}
	
	@RequestMapping("/Board/BoardWriteForm.techni")
	public ModelAndView boardWriteForm(HttpSession session, ModelAndView mv){
		String cIdx = null;
		String uId = null;
		
		try{
			cIdx = (String) session.getAttribute("c_idx");
			uId = (String) session.getAttribute("UID");
		}catch(Exception e){
			e.printStackTrace();
		}
		List<BoardVO> list = brdService.pushList(cIdx);
		
		mv.addObject("CIDX", cIdx);
		mv.addObject("UID", uId);
		mv.addObject("list", list);
		mv.setViewName("board/boardWriteForm.pag");
		return mv;
	}
	
	@RequestMapping("/Board/BoardPush.techni")
	public String boardPush(HttpSession session){
				
				String c_idx = (String) session.getAttribute("c_idx");
				MemberController mc = new MemberController();
				MultiValueMap<String,String> param1 = new LinkedMultiValueMap<>();
				List<BoardVO> list = brdService.pushList(c_idx);
				
				for(BoardVO bvo : list){
					Map<String,String> map = new HashMap<String,String>();
					String push_id = bvo.getU_push();
					param1.clear();
					param1.add("sendtype", "push");
					param1.add("appcode", "techni_mglb");
					param1.add("notitype", "noti");
					param1.add("oscode", "a");
					param1.add("token", bvo.getU_push());
					param1.add("title", "민턴in");
					param1.add("desc", bvo.getC_nm()+"의 공지가 등록되었습니다.");
					param1.add("dataval", "http://mgl.techni.co.kr:8081/Member/HandlerIndex.techni?c_idx="+c_idx+"&gubun=board");
					mc.token(param1);
					if(bvo.getU_push().equals("")||bvo.getU_push().equals(null)) {
						push_id="";
					}
					map.put("push_id",push_id);
					map.put("push_ment", bvo.getC_nm()+"의 공지가 등록되었습니다.");
					map.put("push_url", "http://mgl.techni.co.kr:8081/Member/HandlerIndex.techni?c_idx="+c_idx+"&gubun=board");
					map.put("u_nm", bvo.getU_nm());
					ucService.pushInsert(map);
				}
		return "redirect:/Board/BoardList.techni";
	}
	
	@RequestMapping(value="/Board/BoardWriteProc.techni", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<Object,Object> boardWriteProc(HttpSession session, @RequestBody BoardVO brdVO){		
		
		Map<Object,Object>map = new HashMap<Object,Object>();
		Map<String,Object> param = new HashMap<String,Object>();
		MemberVO mvo = (MemberVO) session.getAttribute("login");
        
		String c_idx = (String) session.getAttribute("c_idx");
		String u_id = mvo.getM_id();
		System.out.println(c_idx);
		brdVO.setC_idx(c_idx);
		brdVO.setU_id(u_id);
		
		int res = brdService.bbsInsert(brdVO);
		String yn = brdVO.getCb_yn();
		if(res>0){
			param.put("c_idx", c_idx);
			if(yn.equals("Y")) {
				param.put("al_division", "주요공지");
			}else if(yn.equals("N")) {
				param.put("al_division", "공지");
			}
			param.put("al_send",mvo.getM_id());
			param.put("al_url", "/Board/BoardDetail.techni");
			param.put("cb_idx", brdVO.getCb_idx());
			map.put("cnt", 1);
			List<BoardVO> list = brdService.pushList(c_idx);
			System.out.println(list);
			param.put("list", list);
			mService.alarmInsert(session, param);
			/*if(brdVO.getCb_yn().equals("Y")){
				MemberController mc = new MemberController();
				MultiValueMap<String,String> param1 = new LinkedMultiValueMap<>();
				List<BoardVO> list = brdService.pushList(c_idx);
				
				for(BoardVO bvo : list){
					param1.clear();
					param1.add("sendtype", "push");
					param1.add("appcode", "techni_mglb");
					param1.add("notitype", "noti");
					param1.add("oscode", "a");
					param1.add("token", bvo.getU_push());
					param1.add("title", "민턴in");
					param1.add("desc", bvo.getC_nm()+"의 공지가 등록되었습니다.");
					param1.add("dataval", "http://mgl.techni.co.kr:8081");
					mc.token(param1);
				}
			}
			*/
		}else{
			map.put("cnt", 0);
		}
		
		return map;
	}
}
