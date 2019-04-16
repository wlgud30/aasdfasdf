package com.techni.mgl.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.service.ClubService;
import com.techni.mgl.service.MemberService;
import com.techni.mgl.service.UClubService;

@Controller
public class LeagueController {
	
	@Autowired
	public ClubService cService;
	@Autowired
	public UClubService ucService;
	@Autowired
	public MemberService mService;
	
	@RequestMapping(value="/League/LeagueMain.techni")
	public String leagueMain(HttpSession session){
		
		
		return "league/leagueMain.pag";
	}

}
