package com.techni.mgl.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudrail.si.CloudRail;
import com.cloudrail.si.services.GooglePlus;
import com.fasterxml.jackson.databind.JsonNode;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class MemberController {
	
	Logger logger = org.slf4j.LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public MemberService mService;
	@Autowired
	public UClubService ucService;
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters_2;
 
    private OAuth2Operations oauthOperations;
	
	//중복체크
	@RequestMapping("/Member/IdCheck.techni")
	@ResponseBody
	public Map<Object, Object> IdCheck(@RequestBody String m_id){
		
		int cnt = 0;
		Map<Object, Object> map = new HashMap<Object,Object>();
		
		if(m_id.length()<=5){
			
			map.put("cnt", 1);
			
			return map;
			
		}else{
		
		
		cnt = mService.idCheck(m_id);
		
		map.put("cnt", cnt);
		
		}
		
		return map;
		
	}
	@RequestMapping("/Member/MemberInsert.techni")
	public String memberInsert(RedirectAttributes redirectAttributes,HttpServletResponse response, HttpSession session,@ModelAttribute MemberVO mVO , HttpServletRequest request , Model model) throws IOException{
		
		response.setContentType("text/html; charset=UTF-8");
		
		String tel = mVO.getM_tel().replaceAll(",", "");
		
		String date = mVO.getM_birth().replaceAll(",", "");
		System.out.println(mVO.getM_email());
		
		mVO.setM_tel(tel);
		mVO.setM_birth(date);
		System.out.println(mVO.toString());
		if(mVO.getM_club_gd().equals("클럽")){
			mVO.setM_club_gd("왕초");
		}if(mVO.getM_city_gd().equals("시.군.구")){
			mVO.setM_city_gd("왕초");
		}if(mVO.getM_do_gd().equals("시.도")){
			mVO.setM_do_gd("왕초");
		}if(mVO.getM_con_gd().equals("전국")){
			mVO.setM_con_gd("왕초");
		}if(mVO.getM_tsize().equals("T사이즈")){
			mVO.setM_tsize("90");
		}
		
		if(mVO.getM_photo()==""){
			if(mVO.getM_sex().contains("M")){
				mVO.setM_photo("/resources/img/man_face.svg");
			}else{
				mVO.setM_photo("/resources/img/woman_face.svg");
			}
		}
		
		int res = mService.memberInsert(mVO);
		int s_res = mService.m_join_seq();
		if(res > 0 && s_res > 0){
			String msg="회원가입을 축하드립니다. 로그인 해주세요.";
			redirectAttributes.addFlashAttribute("msg", msg);
			model.addAttribute("msg", msg);
			return "redirect:/Member/LoginForm.techni";
		}else{
			String msg = "회원가입에 실패 했습니다. 다시 시도해주세요.";
			redirectAttributes.addFlashAttribute("msg", msg);
			return "redirect:/Member/LoginForm.techni";
		}
	}
	
	@RequestMapping(value ="/Member/LoginForm.techni")
	public String loginForm(Model model,@RequestParam(required = false) String m_id , @RequestParam(required = false) String msg){
		model.addAttribute("m_id", m_id);
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		model.addAttribute("google_url", url);
		
		return "member/loginForm";
	}
	
	@RequestMapping("/Member/Logout.techni")
	public String Logout(HttpSession session,Model model){
		
		session.invalidate();
		
		model.addAttribute("au", "1");
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);
		
		return "member/loginForm";
	}
	@RequestMapping("/Member/birthTelCheck.techni")
	@ResponseBody
	public Map<Object,Object> birthTelCheck(HttpSession session, @RequestBody String json) throws ParseException{
		Map<Object,Object> map = new HashMap<Object,Object>();
		Map<String,String> map2 = new HashMap<String,String>();
		
		
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
        
        String m_tel = (String) json2.get("m_tel");
        String m_birth = (String) json2.get("m_birth");
        
        map2.put("m_tel", m_tel);
        map2.put("m_birth", m_birth);
        
        int cnt = mService.birthTelCheck(map2);
		
        map.put("cnt", cnt);
        
		return map;
	}
	
	@RequestMapping("/Member/IDsearch.techni")
	@ResponseBody
	public Map<Object,Object> searchID(@RequestBody String json) throws ParseException{
		Map<Object,Object>map = new HashMap<Object,Object>();
		Map<String,String>map1 = new HashMap<String,String>();
		
		JSONParser parser = new JSONParser();
        JSONObject json2 = (JSONObject) parser.parse(json);
        
        String m_tel = (String) json2.get("m_tel");
        String m_birth = (String) json2.get("m_birth");
        
        map1.put("m_tel", m_tel);
        map1.put("m_birth", m_birth);
        
        MemberVO mvo = mService.searchID(map1);
        
        String m_id = mvo.getM_id();
        
        map.put("m_id", m_id);
		
		return map;
	}
	@RequestMapping("/Member/HandlerIndex.techni")
	public String handlerIndex(Model model,HttpSession session,@RequestParam String c_idx,@RequestParam(required=false) String gubun){
		model.addAttribute("c_idx", c_idx);
		model.addAttribute("gubun", gubun);
		return "/ajax/handler";
	}
	
	@RequestMapping("/Member/handler.techni")
	public String handler(Model model,@RequestParam String c_idx, HttpSession session,@RequestParam String m_id,@RequestParam String m_pw){
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		
		m_id = m_id.replace(" ", "");
		m_pw = m_pw.replace(" ","");
		
		MemberVO mvo = mService.login(map);
		
		if(mvo!=null){
			System.out.println("로그인");
			System.out.println(map);
			session.setAttribute("login", mvo);
			session.setAttribute("c_idx", c_idx);
			
			return "redirect:/Game/GameState.techni";
			
		}else{
			model.addAttribute("m_id", m_id);
		return "member/loginForm";
		}
	}
	
	@RequestMapping("/Member/handler2.techni")
	public String handler2(Model model,@RequestParam String c_idx, HttpSession session,@RequestParam String m_id,@RequestParam String m_pw){
		Map<String,String> map = new HashMap<String,String>();
		
		m_id = m_id.replace(" ", "");
		m_pw = m_pw.replace(" ","");
		
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		
		MemberVO mvo = mService.login(map);
		
		if(mvo!=null){
			System.out.println("로그인");
			session.setAttribute("login", mvo);
			session.setAttribute("c_idx", c_idx);
			
			return "redirect:/Board/BoardList.techni";
			
		}else{
			String msg="ID, P/W를 다시 입력해 주세요.";
			System.out.println("입력한 ID : "+m_id);
			System.out.println("입력한 PW : "+m_pw);
			model.addAttribute("msg", msg);
			System.out.println(msg);
			model.addAttribute("m_id", m_id);
		return "member/loginForm";
		}
	}
	
	@RequestMapping("/Member/Login.techni")
	public String Login(HttpServletResponse response,HttpSession session,@RequestParam(required = false) String m_push, @RequestParam String m_id,
			@RequestParam String m_pw, HttpServletRequest request, Model model) throws IOException{

		String ua = request.getHeader("user-Agent").toLowerCase(); 
		if(m_push != null){
			m_push = m_push.replaceAll(" ", "");
		}
		
		m_id = m_id.replace(" ", "");
		m_pw = m_pw.replace(" ","");
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		map.put("m_push", m_push);
		
		if(ua.indexOf("MacIntel") == -1 && ua.indexOf("win16") == -1 && ua.indexOf("win32") == -1 && ua.indexOf("win64") == -1 && ua.indexOf("mac") == -1){
			mService.pushUpdate(map);
		}
		
		MemberVO mvo = mService.login(map);
		
		
		if(mvo!=null){
			System.out.println("로그인");
			session.setAttribute("login", mvo);
			return "redirect:/UClub/UClubAllList.techni";
		}else{
			String msg="ID, P/W를  다시 입력해 주세요.";
			System.out.println("입력한 ID : "+m_id);
			System.out.println("입력한 PW : "+m_pw);
			model.addAttribute("msg", msg);
			System.out.println(msg);
			model.addAttribute("m_id", m_id);
		return "member/loginForm";
		}
	}
	@RequestMapping("/Error/Error.techni")
	public String errorPage(HttpServletRequest request,Model model){
		
		logger.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
		logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message : " + request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
		
		String params1 = "";
		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		    params1 += name+"/n";
		}
		System.out.println("----------------------------");
		
		model.addAttribute("status_code", request.getAttribute("javax.servlet.error.status_code"));
		model.addAttribute("exception_type", request.getAttribute("javax.servlet.error.exception_type"));
		model.addAttribute("message", request.getAttribute("javax.servlet.error.message"));
		model.addAttribute("request_uri", request.getAttribute("javax.servlet.error.request_uri"));
		model.addAttribute("exception", request.getAttribute("javax.servlet.error.exception"));
		model.addAttribute("servlet_name", request.getAttribute("javax.servlet.error.servlet_name"));
		model.addAttribute("param", params1);


		
		return "ajax/error";
	}
	
	
/*	@RequestMapping("/Member/LoginProc.techni")
	public ModelAndView loginProc(ModelAndView mv, HttpSession session, LoginDTO dto) {

		try{
			int cnt = mService.getLogin(dto);						
			boolean isLogin = mService.getSessionSetting(cnt, session, dto);
			
			// 마이클럽숫자를 조회후에 uclubDetail.jsp로 갈지
			// uclubList.jsp로 갈지 처리하는 로직이 필요하다
				
			mv.addObject("isLogin", isLogin);

		}catch(Exception e){
			e.printStackTrace();
		}
		mv.setViewName("member/loginProc");
		
		return mv;
	}*/
	
	@RequestMapping("/Member/idSearchForm.techni")
	public ModelAndView idSearchForm(ModelAndView mv){
		
		mv.setViewName("member/idSearchForm");
		return mv;
	}
	
	@RequestMapping("/Member/Terms.techni")
	public String terms(@RequestParam(required = false) String route,Model model) {
		System.out.println(route);
		model.addAttribute("route", route);
		return "member/terms";
	}
	
	@RequestMapping("/Member/JoinForm.techni")
	public ModelAndView joinForm(ModelAndView mv){
		
		mv.setViewName("member/joinForm");
		return mv;
	}
	
	@RequestMapping("/Ajax/SmallSelectClub.techni")
	public ModelAndView getSmallSelectClub(ModelAndView mv, HttpServletRequest req){
		String l_select = req.getParameter("1_select");
		ArrayList<ClubVO> clubList = null;
		try{
			clubList = mService.getClubList(l_select);
		}catch(Exception e){
			e.printStackTrace();
		}				
		mv.setViewName("ajax/selectForClubInfo");
		mv.addObject("cList", clubList);
		return mv;
	}
	
	@RequestMapping("/Member/JoinProc.techni")
	public String joinProc(ModelAndView mv, MemberVO mVO){
		
		try{
			mService.setInsertMember(mVO);
		}catch(Exception e){
			e.printStackTrace();
		}
//		RedirectView rv = new RedirectView();
		return "member/loginForm";
	}
	@RequestMapping("/Member/token.techni")
	@ResponseBody
	public void token(@RequestBody MultiValueMap<String,String> param1){
		
		String url = "http://codesvc.com:8080/sendpush";
		System.out.println("푸시값 :  "+param1);
		System.out.println(param1.get("sendtype"));
		RestTemplate restTemplate = new RestTemplate();
		
		String res = restTemplate.postForObject(url,param1, String.class);
	}
	
	@RequestMapping("/Member/naverInsert.techni")
	public String naverInsert(HttpSession session,HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		
		 String clientId = "Fsb84jPDLYb_rUsVeXOo";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "_9s1hlnmlb";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://mgl.techni.co.kr:8081/Member/naverInsert.techni", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        System.out.println(res.toString());
		        JSONParser parser = new JSONParser();
		        Object obj = parser.parse(res.toString());
		        JSONObject jsonObj = (JSONObject) obj;
		        access_token = (String)jsonObj.get("access_token");
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		    	System.out.println(access_token);
		    	
		    	String token = access_token;// 네이버 로그인 접근 토큰;
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가
		        try {
		            String apiURL_ = "https://openapi.naver.com/v1/nid/me";
		            URL url = new URL(apiURL_);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("Authorization", header);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		            }
		            String inputLine;
		            StringBuffer response = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response.append(inputLine);
		            }
		            br.close();
		            System.out.println(response.toString());
		            JSONParser parser = new JSONParser();
			        Object obj = parser.parse(response.toString());
			        JSONObject jsonObj = (JSONObject) obj;
			        Object obj2 = parser.parse(jsonObj.get("response").toString());
			        JSONObject jsonObj_ = (JSONObject) obj2;
			        System.out.println(jsonObj_.get("name"));
			        System.out.println(jsonObj_.get("id"));
			        String naver_id = "N_"+(String)jsonObj_.get("id");
			        System.out.println(naver_id);
			        
			        int cnt = mService.idCheck(naver_id);
			        
			        if(cnt>0) {
			        	model.addAttribute("msg", "이미 가입된 아이디입니다.");
			        	return "member/loginForm";
			        }else {
			        	model.addAttribute("m_id",naver_id);
			        	model.addAttribute("m_pw","");
			        	model.addAttribute("m_nm",(String)jsonObj_.get("name"));
			        	model.addAttribute("m_sex", (String)jsonObj_.get("gender"));
			        	model.addAttribute("m_email",(String)jsonObj_.get("email"));
			        	System.out.println(jsonObj_.get("email").toString());
			        	System.out.println(jsonObj_.get("gender").toString());
			        	return "member/snsJoinForm";
			        }
			        
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		return "redirect:/Member/LoginForm.techni";
	}
	
	@RequestMapping("/Member/naverLogin.techni")
	public String naverLogin(HttpSession session,HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		
		 String clientId = "Fsb84jPDLYb_rUsVeXOo";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "_9s1hlnmlb";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://mgl.techni.co.kr:8081/Member/naverLogin.techni", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        System.out.println(res.toString());
		        JSONParser parser = new JSONParser();
		        Object obj = parser.parse(res.toString());
		        JSONObject jsonObj = (JSONObject) obj;
		        access_token = (String)jsonObj.get("access_token");
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		    	System.out.println(access_token);
		    	
		    	String token = access_token;// 네이버 로그인 접근 토큰;
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가
		        try {
		            String apiURL_ = "https://openapi.naver.com/v1/nid/me";
		            URL url = new URL(apiURL_);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("Authorization", header);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		            }
		            String inputLine;
		            StringBuffer response = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response.append(inputLine);
		            }
		            br.close();
		            System.out.println(response.toString());
		            JSONParser parser = new JSONParser();
			        Object obj = parser.parse(response.toString());
			        JSONObject jsonObj = (JSONObject) obj;
			        Object obj2 = parser.parse(jsonObj.get("response").toString());
			        JSONObject jsonObj_ = (JSONObject) obj2;
			        System.out.println(jsonObj_.get("name"));
			        System.out.println(jsonObj_.get("id"));
			        String naver_id = "N_"+(String)jsonObj_.get("id");
			        System.out.println(naver_id);
			        
			        int cnt = mService.idCheck(naver_id);
			        
			        if(cnt>0) {
			        	model.addAttribute("m_id", naver_id);
			        	return "member/snsLogin";
			        }else {
			        	model.addAttribute("msg", "가입되어있지 않은 아이디입니다.");
			        	return "member/loginForm";
			        }
			        
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		return "redirect:/Member/LoginForm.techni";
	}
	
	@RequestMapping("/Member/kakaoLogin.techni")
	public String kakaoLogin(@RequestParam String code,Model model,HttpServletRequest request) {
		String old_url = request.getHeader("referer");
		JsonNode jsonToken = Kakao.getAccessToken(code);
		System.out.println("JSON 반환 : " + jsonToken.get("access_token"));
		String access_token = jsonToken.get("access_token").toString();
		JsonNode userInfo = Kakao.getKakaoUserInfo(access_token);
		System.out.println(userInfo);
		System.out.println(userInfo.path("id").asText());
		JsonNode properties = userInfo.path("properties");
		String nickname = properties.path("nickname").asText();
		String sex = properties.path("gender").asText();
		int cnt = mService.idCheck("K_"+userInfo.path("id").toString());
		
		if(old_url !=null && old_url.contains("SnsOrMgl")) {
			if(cnt>0) {
	        	model.addAttribute("msg", "이미 가입된 아이디입니다.");
	        	return "member/loginForm";
	        }else {
	        	System.out.println("왜!2"+old_url);
	        	model.addAttribute("m_id","K_"+userInfo.path("id").toString());
	        	model.addAttribute("m_pw","");
	        	model.addAttribute("m_nm",nickname);
	        	model.addAttribute("m_sex", sex);
	        	model.addAttribute("m_email",userInfo.path("kaccount_email").asText());
	        	return "member/snsJoinForm";
	        }
		}else {
		 if(cnt>0) {
			 System.out.println("3왜!"+old_url);
	        	model.addAttribute("m_id", "K_"+userInfo.path("id").toString());
	        	return "member/snsLogin";
	        }else {
	        	System.out.println("4!"+old_url);
	        	model.addAttribute("msg", "가입되어있지 않은 아이디입니다.");
	        	return "member/loginForm";
	        }
		}
	}
	
	@RequestMapping("/Member/SnsOrMgl.techni")
	public String snsOrMgl(Model model) {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters_2);

		model.addAttribute("google_url", url);
		return "member/snsOrMgl";
	}

	@RequestMapping("/Member/MemberSnsInsert.techni")
	public String memberSnsInsert(HttpServletResponse response, HttpSession session,@ModelAttribute MemberVO mVO , HttpServletRequest request , Model model) throws IOException{
		
		response.setContentType("text/html; charset=UTF-8");
		
		String tel = mVO.getM_tel().replaceAll(",", "");
		String naver_id = mVO.getM_id();
		System.out.println(naver_id);
		String date = mVO.getM_birth().replaceAll(",", "");
		System.out.println(mVO.getM_email());
		
		mVO.setM_tel(tel);
		mVO.setM_birth(date);
		System.out.println(mVO.toString());
		if(mVO.getM_club_gd().equals("클럽")){
			mVO.setM_club_gd("왕초");
		}if(mVO.getM_city_gd().equals("시.군.구")){
			mVO.setM_city_gd("왕초");
		}if(mVO.getM_do_gd().equals("시.도")){
			mVO.setM_do_gd("왕초");
		}if(mVO.getM_con_gd().equals("전국")){
			mVO.setM_con_gd("왕초");
		}if(mVO.getM_tsize().equals("T사이즈")){
			mVO.setM_tsize("90");
		}
		
		if(mVO.getM_photo()==""){
			if(mVO.getM_sex().contains("M")){
				mVO.setM_photo("/resources/img/man_face.svg");
			}else{
				mVO.setM_photo("/resources/img/woman_face.svg");
			}
		}
		
		int res = mService.memberInsert(mVO);
		int s_res = mService.m_join_seq();
		if(res > 0 && s_res > 0){
			model.addAttribute("m_id", naver_id);
        	return "member/snsLogin";
		}else{
			String msg = "회원가입에 실패 했습니다. 다시 시도해주세요.";
			model.addAttribute("msg", msg);
			return "member/loginForm";
		}
	}
	
	@RequestMapping("/Member/GoogleLogin.techni")
	public String googleLogin(HttpServletRequest request,Model model) {
		
		 String code = request.getParameter("code");
		 	
	        oauthOperations = googleConnectionFactory.getOAuthOperations();
	        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),null);
	 
	        String accessToken = accessGrant.getAccessToken();
	        Long expireTime = accessGrant.getExpireTime();
	 
	        if (expireTime != null && expireTime < System.currentTimeMillis()) {
	            accessToken = accessGrant.getRefreshToken();
	            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	        }
	 
	        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
	        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
	        PlusOperations plusOperations = google.plusOperations();
	        Person profile = plusOperations.getGoogleProfile();
	       
	        int cnt = mService.idCheck(profile.getId());
	        
	        if(cnt>0) {
	        	model.addAttribute("m_id", profile.getId());
	        	return "member/snsLogin";
	        }else {
	        	model.addAttribute("msg", "가입되어있지 않은 아이디입니다.");
	        	return "member/loginForm";
	        }
	}
	@RequestMapping("/Member/GoogleInsert.techni")
	public String googleInsert(HttpServletRequest request,Model model) {
		
		 String code = request.getParameter("code");
		 
	        oauthOperations = googleConnectionFactory.getOAuthOperations();
	        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters_2.getRedirectUri(),null);
	 
	        String accessToken = accessGrant.getAccessToken();
	        Long expireTime = accessGrant.getExpireTime();
	 
	        if (expireTime != null && expireTime < System.currentTimeMillis()) {
	            accessToken = accessGrant.getRefreshToken();
	            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	 
	        }
	 
	        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
	        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
	        PlusOperations plusOperations = google.plusOperations();
	        Person profile = plusOperations.getGoogleProfile();
	       
	        int cnt = mService.idCheck(profile.getId());
	        
	        if(cnt>0) {
	        	model.addAttribute("msg", "이미 가입된 아이디입니다.");
	        	return "member/loginForm";
	        }else {
	        	
	        	String gender ="";
	        	if(profile.getGender().toString().equals("male")) {
	        		gender ="M";
	        	}else if(profile.getGender().toString().equals("female")) {
	        		gender ="F";
	        	}
	        	
	        	model.addAttribute("m_id",profile.getId());
	        	model.addAttribute("m_pw","");
	        	model.addAttribute("m_nm",profile.getDisplayName());
	        	model.addAttribute("m_sex",gender);
	        	model.addAttribute("m_email",profile.getAccountEmail());
	        	return "member/snsJoinForm";
	        }
	}
	@RequestMapping("/Member/home.techni")
	public String home() {
		
		return "member/home.page";
	}
	@RequestMapping("/Member/accessTerms.techni")
	public String accessTerms() {
		return "member/accessTerms";
	}
	
	@RequestMapping("/Member/personalData.techni")
	public String personalData() {
		return "member/personalData";
	}
}