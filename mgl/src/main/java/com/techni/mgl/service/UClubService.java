package com.techni.mgl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.UClubDAO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.dto.UClubViewDTO;

@Service
public class UClubService {
	
	@Autowired
	public UClubDAO ucDAO;
	
	/*
	 * |||||||||||||||||||||||||||||||| Alpha 세션 관리를 위해 따로 만들것을 추천하지만, 임시로 각 서비스단에서 관리중 ||||||||||||||||||||||||||||||||
	 */	
	//세션을 set한다.
	public void setSession(String idx, HttpSession session){
		session.setAttribute("CIDX", idx);
	}
	//세션을 get한다
	public String getSession(HttpSession session) {
		String cIdx = (String) session.getAttribute("CIDX");
		return cIdx;
	}
	/*
	* |||||||||||||||||||||||||||||||| Omega 세션 관리를 위해 따로 만들것을 추천하지만, 임시로 각 서비스단에서 관리중 ||||||||||||||||||||||||||||||||
	 */	
	
	public ArrayList<ClubVO> getUClubList(HttpSession session){
		String id = (String) session.getAttribute("UID");
		return ucDAO.getUClubList(id);
	}
	
	//로그인한 아이디가 해당되는 클럽 리스트 출력
	@Transactional
	public List<ClubVO> selectAll(String m_id){
		return ucDAO.selectList(m_id);
		
	}
	//로그인한 아이디가 검색한 클럽 리스트 출력
	@Transactional
	public List<ClubVO> searchList(Map<String,String> map){
		return ucDAO.searchList(map);
	}
	@Transactional
	public int insert(UClubVO uVO){
		return ucDAO.insert(uVO);
	}
	@Transactional
	public int user_insert(UClubVO uVO){
		return ucDAO.user_insert(uVO);
	}
	
	//시퀀스 증가
	@Transactional
	public int c_seq(){
		return ucDAO.c_seq();
	}
	@Transactional
	public int uc_seq(){
		return ucDAO.uc_seq();
	}
	@Transactional
	public int selectYN(Map<String,String> map){
		return ucDAO.selectYN(map);
	}
	@Transactional
	public List<UClubVO> selectUClubUser(Map<String,String> map){
		return ucDAO.selectUClubUser(map);
	}
	@Transactional
	public List<UClubVO> selectUClubM(Map<String,String> map){
		return ucDAO.selectUClubM(map);
	}
	@Transactional
	public List<UClubVO> selectUClubF(Map<String,String> map){
		return ucDAO.selectUClubF(map);
	}
	@Transactional
	public List<UClubVO> UClubMList(String c_idx){
		return ucDAO.UClubMList(c_idx);
	}
	@Transactional
	public List<UClubVO> UClubJoinWaitList(String c_idx){
		return ucDAO.UClubJoinWaitList(c_idx);
	}
	@Transactional
	public List<UClubVO> UClubOutWaitList(String c_idx){
		return ucDAO.UClubOutWaitList(c_idx);
	}
	@Transactional
	public UClubVO UClubJoinWaitDetail(Map<String,String> map){
		return ucDAO.UClubJoinWaitDetail(map);
	}
	@Transactional
	public int cJoinOK(Map<String,String> map){
		return ucDAO.cJoinOK(map);
	}
	@Transactional
	public int cJoinNo(Map<String,String> map){
		return ucDAO.cJoinNO(map);
	}
	@Transactional
	public List<UClubVO> attend(String c_idx){
		return ucDAO.attend(c_idx);
	}
	@Transactional
	public List<UClubVO> attendY(String c_idx){
		return ucDAO.attendY(c_idx);
	}
	@Transactional
	public int attendInsert(UClubVO uvo){
		return ucDAO.attendInsert(uvo);
	}
	@Transactional
	public int attendOut(Map<String,String> map){
		return ucDAO.attendOut(map);
	}
	@Transactional
	public int multiAttendI(Map<String,Object> map){
		return ucDAO.multiAttend(map);
	}
	@Transactional
	public List<UClubVO> gameOKList(String c_idx){
		return ucDAO.gameOKList(c_idx);
	}
	@Transactional
	public UClubVO selectOne(Map<String,String>map){
		return ucDAO.selectOne(map);
	}
	@Transactional
	public List<UClubVO> clubUserList(String c_idx){
		return ucDAO.clubUserList(c_idx);
	}
	@Transactional
	public UClubVO meAndYou(Map<String,String>map){
		return ucDAO.meAndYou(map);
	}
	//클럽 업데이트
	@Transactional
	public int clubUpdate(Map<String,String> map){
		return ucDAO.clubUpdate(map);
	}
	//유저업데이트
	@Transactional
	public int userUpdat(Map<String,String> map){
		return ucDAO.userUpdat(map);
	}
	//월별게임수
	@Transactional
	public List<UClubVO> gameCount(Map<String,String> map){
		return ucDAO.gameCount(map);
	}
	//유저정보
	@Transactional
	public UClubVO userOne(Map<String,String> map){
		return ucDAO.userOne(map);
	}
	//직급 급수 업데이트
	@Transactional
	public int userMngGd(Map<String,String> map){
		return ucDAO.userMngGd(map);
	}
	//클럽사용자 탈퇴
	@Transactional
	public int clubOut(Map<String,String>map){
		return ucDAO.clubOut(map);
	}
	//매니저 양도
	@Transactional
	public int manUpdate(Map<String,String> map){
		int res = 0;
		if(ucDAO.manUpdate(map) > 0 && ucDAO.manCUpdate(map) > 0){
			res = 1;
		}
		return res;
	}
	//오늘개인순위
	@Transactional
	public List<UClubVO> todayRank(Map<String,String> map){
		return ucDAO.todayRank(map);
	}
	//푸쉬인서트
	@Transactional
	public int pushInsert(Map<String,String> map) {
		return ucDAO.pushInsert(map);
	}
	
	public UClubViewDTO getUClubDetail(String idx, HttpSession session){
		//세션에 클럽인덱스를 넣어두자!!
		session.setAttribute("CIDX", idx);
		
		HashMap map = new HashMap();
		map.put("idx", idx);
		map.put("uid", session.getAttribute("UID"));
		
		return ucDAO.getUClubDetaill(map);
	}


}