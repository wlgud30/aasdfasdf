package com.techni.mgl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.MemberDAO;
import com.techni.mgl.dao.UClubDAO;
import com.techni.mgl.domain.BoardVO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.dto.UClubViewDTO;

@Service
public class UClubService {
	
	@Autowired
	public UClubDAO ucDAO;
	@Autowired
	public MemberDAO mDAO;
	@Autowired
	public BoardService brdService;
	@Autowired
	public MemberService mService;
	
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
		
	if(ucDAO.representCheck(uVO.getU_id())>0) {
		return ucDAO.user_insert(uVO);
	}
		return ucDAO.user_insert(uVO);
	}
	
	@Transactional
	public int representCheck(String u_id) {
		return ucDAO.representCheck(u_id);
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
	public int cJoinOK(Map<String,String> map,HttpSession session){
		BoardVO bvo = new BoardVO();
		bvo.setC_idx(map.get("c_idx"));
		bvo.setCb_yn("N");
		bvo.setCb_title(map.get("u_nm")+"님이 가입하셨습니다.");
		bvo.setCb_content(map.get("u_nm")+"님이 가입하셨습니다.");
		bvo.setU_id(map.get("u_id"));
		brdService.bbsInsert(bvo);
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("c_idx", map.get("c_idx"));
		param.put("al_division", "가입승인");
		param.put("al_url", "/Board/BoardList.techni");
		param.put("u_id", map.get("u_id"));
		param.put("cb_idx", bvo.getCb_idx());
		mService.alarmInsert(session, param);
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
	//급수 업데이트
	@Transactional
	public int userGd(Map<String,String> map){
		return ucDAO.userGd(map);
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
	// 게임가능 인원(카운트포함)
	@Transactional
	public List<UClubVO> count(Map<String,String> map){
		return ucDAO.count(map);
	}
	//클럽의 회원등급
	@Transactional
	public UClubVO	userMng(Map<String,String> map) {
		return ucDAO.userMng(map);
	}
	//클럽의 회원수
	@Transactional
	public int clubCount(String c_idx) {
		return ucDAO.clubCount(c_idx);
	}
	//개인화면 월별게임
	@Transactional
	public List<UClubVO> monthGame(String u_id){
		return ucDAO.monthGame(u_id);
	}
	//대항전 개인순위
	@Transactional
	public List<UClubVO> competitionRank(String u_id){
		return ucDAO.competitionRank(u_id);
	}
	//전국 같은급수 개인순위
	@Transactional
	public List<UClubVO> sameAllGdRank(String u_id){
		return ucDAO.sameAllGdRank(u_id);
	}
	//전국 같은급수 연령별 개인순위
	@Transactional
	public List<UClubVO> sameAgeGdRank(String u_id){
		return ucDAO.sameAgeGdRank(u_id);
	}	
	//전국 같은급수 성별 개인순위
	@Transactional
	public List<UClubVO> sameSexGdRank(String u_id){
		return ucDAO.sameSexGdRank(u_id);
	}	
	//클럽 같은급수 개인순위
	@Transactional
	public List<UClubVO> sameClubGdRank(String u_id){
		return ucDAO.sameClubGdRank(u_id);
	}		
	//헤더화면
	@Transactional
	public UClubVO headerSelect(Map<String,String> map){
		return ucDAO.headerSelect(map);
	}	
	
	//클럽이름
	@Transactional
	public String club_nm(String c_idx){
		return ucDAO.club_nm(c_idx);
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
