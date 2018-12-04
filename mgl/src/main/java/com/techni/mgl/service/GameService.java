package com.techni.mgl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.GameDAO;
import com.techni.mgl.domain.CStadiumVO;
import com.techni.mgl.domain.ClubMatchVO;
import com.techni.mgl.domain.GTempTeamVO;
import com.techni.mgl.domain.MemberVO;

@Service
public class GameService {
	
	@Autowired
	public GameDAO gDAO;
	
	//게임 등록 전 사용 가능한 코트를 알기위해 값을 가져온다.
	@Transactional
	public ClubMatchVO clubUseCourt(String c_idx){
		return gDAO.clubUseCouert(c_idx);
	}
	//게임을 등록한다.
/*	@Transactional
	public int clubGameSet(ClubMatchVO cmVO){
		return gDAO.clubGameSet(cmVO);
	}*/
	//게임등록한 사용자들의 상태를 변경한다.
	@Transactional
	public int gameJoinSChange(Map<String,String> map){
		return gDAO.gameJoinSChange(map);
	}
	//다수의 작업을 묶어 둘중 하나의 작업이라도 실패하면 모두 롤백
	@Transactional
	public int clubGameSet(ClubMatchVO cmVO , Map<String,String> map){
		int res = gDAO.clubGameSet(cmVO);
		int res2 = 0;
		int res3 = 0;
		if(res > 0 ){
			res2 = gDAO.gameJoinSChange(map);
			if(res2>0){
				res3 = gDAO.c_matchSeq();
			}
		}
		return res3;
	}
	//게임중인 리스트 출력
	@Transactional
	public List<ClubMatchVO> gameingList(String c_idx){
		return gDAO.gameingList(c_idx);
	}
	//대기중인 리스트 출력
	@Transactional
	public List<ClubMatchVO> waitingList(String c_gidx){
		return gDAO.waitingList(c_gidx);
	}
	//점수 버튼을 누르면 현재 게임중인 게임과 대기중인 게임이 업데이트된다
	@Transactional
	public int gameEndUpdate(String c_gidx,String c_idx , String [] id, int cm_order,Map<String,String> map){
		int res = gDAO.gameEnd(c_gidx);
		int res2 = 0;
		
		if(res>0){
			int res3 = gDAO.gameJoinSChange(map);
			if(res3>0){
				
			
		int i = 0 ;
		
		List<ClubMatchVO> list = pointUser(map);
		
						for(ClubMatchVO cmvo : list){
					cmvo.setC_gidx(c_gidx);
					cmvo.setC_idx(c_idx);
					cmvo.setU_id(id[i]);
					if(i==0||i==1){
						cmvo.setTeamAB("A");
					}else{
						cmvo.setTeamAB("B");
					}
					cmvo.setCm_order(cm_order);
					res2 = clubMatchInsert(cmvo);
					i++;
				}
		}
		}
		return res2;
	}
	
	@Transactional
	public int gameWaitUpdate(Map<String,String>map){
		return gDAO.waitUpdate(map);
	}
	//점수입력화면 출력
	@Transactional
	public ClubMatchVO scoreInsertForm(String c_gidx){
		return gDAO.scoreInsertForm(c_gidx);
	}
	//포인트계산을위한 유저정보
	@Transactional
	public List<ClubMatchVO> pointUser(Map<String,String> map){
		return gDAO.pointUser(map);
	}
	//클럽매치인서트
	@Transactional
	public int clubMatchInsert(ClubMatchVO cmvo){
		int res = gDAO.clubMatchInsert(cmvo);
		int res1 = 0;
		if(res>0){
			res1 = gDAO.gameEndSeq();
		}
		return res1;
	}
	//포인트 입력
	@Transactional
	public int clubMatchPointInsert(ClubMatchVO cmvo){
		return gDAO.clubMatchPointInsert(cmvo);
	}
	//게임 종료 시퀀스
	@Transactional
	public int gameEndSeq(){
		return gDAO.gameEndSeq();
	}
	//게임 종료 결과창
	@Transactional
	public List<ClubMatchVO> gameResult(Map<String,String> map){
		return gDAO.gameResult(map);
	}
	//종료게임 gidx 추출
	@Transactional
	public List<ClubMatchVO> endGameGidx(Map<String,String> map){
		return gDAO.endGameGidx(map);
	}
	//포인트 요약
	@Transactional
	public List<ClubMatchVO> pointDetail(Map<String,String> map){
		return gDAO.pointDetail(map);
	}
	//포인트 통합
	@Transactional
	public List<ClubMatchVO> pointDetailAll(Map<String,String>map){
		return gDAO.pointDetailAll(map);
	}
	//대기명단 위치변경
	@Transactional
	public int changeW(Map<String,String> map){
		return gDAO.changeW(map);
	}
	//대기명단 삭제
	@Transactional
	public int deleteW(String c_gidx,Map<String,String> map){
		
		if(gDAO.deleteW(c_gidx) >0){
			return gDAO.gameJoinSChange(map);
		}else{
			return 0;
		}
	}
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
	
	/*
	 *  게임현황판 > 사용 가능한 경기장 코트 리스트를 불러온다.
	*/
	public ArrayList getClubStadiumCoatList(HttpSession session) {
		HashMap map = new HashMap();
		String cIdx = (String) session.getAttribute("CIDX");
		map.put("CIDX",cIdx);
		map.put("COATYN", "");		// 아무의미 없음
		return (ArrayList<CStadiumVO>) gDAO.getClubStadiumCoatList(map);
	}
	/*
	 *  게임현황판 > 대기중 순위를 올리기
	 *  이 액션 처리를 위해서 트랜잭션 처리는 필수 (미처리 상태)
	*/
	public void setGameStateInfoRankUp(HttpSession session, String rank, String matchDate) {
		HashMap map = new HashMap();
			String cIdx = (String) session.getAttribute("CIDX");
			map.put("CIDX",cIdx);
			map.put("RANK", rank);
			
			map.put("MATCHDATE", matchDate.replace(".", "-"));
			
		ArrayList<GTempTeamVO> list = gDAO.getGameStateTempInfo(map);
		
		int ranker = Integer.parseInt(rank);
		
		GTempTeamVO vo1 = null;
		GTempTeamVO vo2 = null;
		
		vo1 = list.get(ranker-2);
		int temp = vo1.getTemp_rank();
		vo1.setTemp_rank(ranker);
		gDAO.setGameStateInfoRankUp(vo1);		// 순위를 내리기
		vo2 = list.get(ranker-1);			 				
		vo2.setTemp_rank(temp);	
		gDAO.setGameStateInfoRankUp(vo2);		// 순위를 올리기
	}
	/*
	 * 게임이 등록된 match 테이블의 데이터를 불러온다.
	*/
	public ArrayList getGameStateInfo(HttpSession session, String matchDate) {
		HashMap map = new HashMap();
		
		String cIdx = (String) session.getAttribute("CIDX");		//클럽인덱스
		
		map.put("CIDX", cIdx);
		map.put("MATCHDATE", matchDate);

		return (ArrayList<ClubMatchVO>) gDAO.getGameStateInfo(map);
	}
	/*
	 * 	게임이 등록된 tempgroup 테이블의 데이터를 불러온다.
	*/
	public ArrayList getGameStateTempInfo(HttpSession session, String matchDate, String tempyn) {
		HashMap map = new HashMap();
		
		String cIdx = (String) session.getAttribute("CIDX");		//클럽인덱스
		
		map.put("CIDX", cIdx);
		map.put("MATCHDATE", matchDate.replace(".", "-"));
		map.put("TEMPYN", tempyn);
		
		return (ArrayList<GTempTeamVO>) gDAO.getGameStateTempInfo(map);
	}
	
	//출석자 정보 리스트
	public ArrayList<MemberVO> getAttendMemberList(HttpSession session) {
		HashMap map = new HashMap();
		
		String uId = (String) session.getAttribute("UID");		// user id
		String cIdx = (String) session.getAttribute("CIDX");		// 클럽인덱스
		String gIdx = (String) session.getAttribute("GIDX");		// 게임인덱스
		
		map.put("UID", uId);
		map.put("CIDX", cIdx);
		map.put("GIDX", gIdx);
		
		return (ArrayList<MemberVO>) gDAO.getAttendMemberList(map);
	}
	
	public void setGameMemberAttend(String uId, String today, HttpSession session) {
		HashMap map = new HashMap();
		
		map.put("UID", uId);
		map.put("today", today);
		map.put("CIDX", (String) session.getAttribute("CIDX"));
		gDAO.setGameMemberAttend(map);
	}

	public ArrayList getGameRegist(HttpSession session, String status) {
		HashMap map = new HashMap();
		
		String uId = (String) session.getAttribute("UID");
		String cIdx = (String) session.getAttribute("CIDX");
		
		map.put("UID", uId);
		map.put("CIDX", cIdx);
		map.put("STATUS", status);
		
		return gDAO.getAttendMemberList(map);
	}
	/*
	 * 본 액션 처리를 위해서는 트렌젝션 처리가 필수!! [아직 미 처리함]
	*/
	public void setMultiGameRegist(HttpSession session, HashMap map) {
		String cIdx = (String) session.getAttribute("CIDX");
		map.put("CIDX", cIdx);
		map.put("GSTATUS", "G");

		// 사용가능한 경기장 코트를 구한다.
		map.put("COATYN", 'Y');
		ArrayList<CStadiumVO> coatList = gDAO.getClubStadiumCoatList(map);
		
		// 임시저장(대기중) 데이터를 구한다.		
		ArrayList<GTempTeamVO> gttList = getGameStateTempInfo(session, (String) map.get("DATE"), "Y");
		
		// 사용가능한 경기장이 있고, 대기중인 데이터가 없으면 경기를 바로 진행
		if((coatList.size() > 0) && (gttList.size() == 0)){	
			
			String useCoat = coatList.get(0).getCst_coat();
			System.out.println("사용가능한 코트 코드 :: " + useCoat);
			
			map.put("COAT", useCoat);
			map.put("TEMPYN", "N");		// temp 테이블 정보를 N(대기아님)으로 설정	for setGameTempRegist
			map.put("GSTATUS", "P");		// 게임 진행중으로 설정	for setUpdateGameAttend
		}
		
		// 클럽 출석 테이블에서 status = ?? 수정 --------------------------
		gDAO.setUpdateGameAttend(map);
		// -------------------------------------------------------------------
		
		// 임시저장db, mgl_temp_teamgroup 입력
		gDAO.setGameTempRegist(map);
	}
	/*
	 * 게임등록 임시 테이블에서 MGL_T_TEAMGROUP_IDX 입력받아,
	 * MGL_T_TEAMGROUP_AONE ~ MGL_T_TEAMGROUP_BTWO 유저의 정보를 불러온다.
	*/
	public GTempTeamVO getGameScoreRegist(String gtIdx, HttpSession session) {
		GTempTeamVO gttVO = gDAO.getGameScoreRegist(gtIdx);
		return gttVO;
	}
	
}
