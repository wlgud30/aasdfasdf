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
public class ContestController {
	
	@Autowired
	public ClubService cService;
	@Autowired
	public UClubService ucService;
	@Autowired
	public MemberService mService;
	
	@RequestMapping(value="/Contest/ContestMain.techni")
	public String contestMain(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMain.pa";
		}else {
			return "contest/contestMain.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestCreate.techni")
	public String contestCreate(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestCreate.pa";
		}else {
			return "contest/contestCreate.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestCreateAct.techni")
	public Map<Object,Object> contestCreateAct(HttpSession session){
		Map<Object,Object> map = new HashMap<Object,Object>();
		
		
		return map;
		
	}
	
	@RequestMapping(value="/Contest/ContestApplication.techni")
	public String contestApplication(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestApplication.pa";
		}else {
			return "contest/contestApplication.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestClubRanking.techni")
	public String contestClubRanking(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestClubRanking.pa";
		}else {
			return "contest/contestClubRanking.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestDetail.techni")
	public String contestDetail(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestDetail.pa";
		}else {
			return "contest/contestDetail.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestEventPlayer.techni")
	public String contestEventPlayer(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestEventPlayer.pa";
		}else {
			return "contest/contestEventPlayer.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestEventRanking.techni")
	public String contestEventRanking(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestEventRanking.pa";
		}else {
			return "contest/contestEventRanking.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestGroupPlayer.techni")
	public String contestGroupPlayer(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestGroupPlayer.pa";
		}else {
			return "contest/contestGroupPlayer.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestIngList.techni")
	public String contestIngList(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestIngList.pa";
		}else {
			return "contest/contestIngList.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestLastList.techni")
	public String contestLastList(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestLastList.pa";
		}else {
			return "contest/contestLastList.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestLikeList.techni")
	public String contestLikeList(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestLikeList.pa";
		}else {
			return "contest/contestLikeList.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestList.techni")
	public String contestList(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestList.pa";
		}else {
			return "contest/contestList.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestMyGame.techni")
	public String contestMyGame(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMyGame.pa";
		}else {
			return "contest/contestMyGame.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestMyGameCoat.techni")
	public String contestMyGameCoat(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMyGameCoat.pa";
		}else {
			return "contest/contestMyGameCoat.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestMyGameEvent.techni")
	public String contestMyGameEvent(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMyGameEvent.pa";
		}else {
			return "contest/contestMyGameEvent.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestMyGameEventDetail.techni")
	public String contestMyGameEventDetail(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMyGameEventDetail.pa";
		}else {
			return "contest/contestMyGameEventDetail.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestMyGameTime.techni")
	public String contestMyGameTime(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMyGameTime.pa";
		}else {
			return "contest/contestMyGameTime.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestMyRanking.techni")
	public String contestMyRanking(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestMyRanking.pa";
		}else {
			return "contest/contestMyRanking.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestParticipateList.techni")
	public String contestParticipateList(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestParticipateList.pa";
		}else {
			return "contest/contestParticipateList.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestPlayerSearch.techni")
	public String contestPlayerSearch(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestPlayerSearch.pa";
		}else {
			return "contest/contestPlayerSearch.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestPreList.techni")
	public String contestPreList(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestPreList.pa";
		}else {
			return "contest/contestPreList.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestReferee.techni")
	public String contestReferee(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestReferee.pa";
		}else {
			return "contest/contestReferee.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestSearch.techni")
	public String contestSearch(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestSearch.pa";
		}else {
			return "contest/contestSearch.pa";
		}
		
	}
	
	@RequestMapping(value="/Contest/ContestStep.techni")
	public String contestStep(HttpSession session){
		
		if(session.getAttribute("login") == null) {
			return "contest/contestStep.pa";
		}else {
			return "contest/contestStep.pa";
		}
		
	}

}
