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
import com.techni.mgl.domain.CfightVO;
import com.techni.mgl.domain.ClubMatchVO;
import com.techni.mgl.domain.GTempTeamVO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.UClubVO;

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
			/*res2 = gDAO.gameJoinSChange(map);
			if(res2>0){*/
				res3 = gDAO.c_matchSeq();
			/*}*/
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
			/*int res3 = gDAO.gameJoinSChange(map);
			if(res3>0){*/
				
			
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
		/*}*/
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
		
		return gDAO.deleteW(c_gidx);
	}
	//자체대회 생성
	@Transactional
	public int selfMatchInsert(Map<String,String> map) {
		int res = gDAO.selfMatchInsert(map);
		if(res > 0) {
			return gDAO.selfMatchSeq();
		}else {
			return 0;
		}
	}
	
	//자체대회 리스트
	@Transactional
	public List<ClubMatchVO> selfMatchList(String c_idx){

		return gDAO.selfMatchList(c_idx);
	}
	//자체대회 디테일
	@Transactional
	public ClubMatchVO selfMatchDetail(String cs_idx){
		return gDAO.selfMatchDetail(cs_idx);
	}
	
	//자체대회 참석여부
	@Transactional
	public int selfMatchJoinYN(Map<String,String> map) {
		return gDAO.selfMatchJoinYN(map);
	}
	
	//자체대회 참석
	@Transactional
	public int selfMatchJoin(Map<String,String> map) {
		return gDAO.selfMatchJoin(map);
	}
	
	//자체대회 불참
	@Transactional
	public int selfMatchExit(Map<String,String> map) {
		return gDAO.selfMatchExit(map);
	}
	
	//자체대회 참석인원
	@Transactional
	public List<ClubMatchVO> selfMatchJoinList(String cs_idx){
		return gDAO.selfMatchJoinList(cs_idx);
	}
	
	//자체대회 불참인원
	@Transactional
	public List<ClubMatchVO> selfMatchClubList(Map<String,String> map){
		return gDAO.selfMatchClubList(map);
	}
	
	//자체대회 다중참석
	@Transactional
	public int selfMatchMultiJoin(Map<Object,Object> map) {
		return gDAO.selfMatchMultiJoin(map);
	}
	
	//자체대회 다중참석 취소
	@Transactional
	public int selfMatchMultiUnJoin(Map<Object,Object> map) {
		return gDAO.selfMatchMultiUnJoin(map);
	}
	
	//자체대회 등급정렬
	@Transactional
	public List<ClubMatchVO> selfMatchGD(String cs_idx){
		return gDAO.selfMatchGD(cs_idx);
	}
	//자체대회 청백업데이트
	@Transactional
	public int BWUpdate(Map<String,String> map) {
		return gDAO.BWUpdate(map);
	}
	//자체대회 종목인서트
	@Transactional
	public int selfMatchTypeInsert(Map<String,Object> map) {
		return gDAO.selfMatchTypeInsert(map);
	}
	
	//자체대회 해당 종목에 등록된팀들
	@Transactional
	public List<ClubMatchVO> selfMatchTeamList(Map<String,String> map){
		return gDAO.selfMatchTeamList(map);
	}
	//자체대회 해당 종목에 등록된팀들
	@Transactional
	public List<ClubMatchVO> selfMatchPrivateList(Map<String,String> map){
		return gDAO.selfMatchPrivateList(map);
	}
	//자체대회 해당 종목에 등록되지않은 참가자들
	@Transactional
	public List<ClubMatchVO> selfMatchNotKindJoinList(Map<String,String> map){
		return gDAO.selfMatchNotKindJoinList(map);
	}
	//게임참가인원, 자체대회 참가인원
	@Transactional
	public ClubMatchVO selfMatchGameCount(String cs_idx){
		return gDAO.selfMatchGameCount(cs_idx);
	}
	//자체대회 팀 생성
	@Transactional
	public int selfMatchTeamInsert(Map<String,String> map) {
		return gDAO.selfMatchTeamInsert(map);
	}
	//자체대회 팀 생성(개인리그용)
	@Transactional
	public int selfMatchTeamInsert2(Map<String,Object> map) {
		return gDAO.selfMatchTeamInsert2(map);
	}
	@Transactional
	//자체대회 팀 삭제
	public int selfMatchTeamDelete(String cs_idx) {
		return gDAO.selfMatchTeamDelete(cs_idx);
	}
	@Transactional
	//자체대회 팀 삭제(개인리그용)
	public int selfMatchTeamDelete2(String cs_k_idx) {
		return gDAO.selfMatchTeamDelete2(cs_k_idx);
	}
	//자체대회 개인 생성
	@Transactional
	public int selfMatchPrivateInsert(Map<String,Object> map) {
		int res = gDAO.selfMatchPrivateInsert(map);
		return res;
	}
	@Transactional
	//자체대회 개인 삭제
	public int selfMatchPrivateDelete(Map<String,Object> map) {
		return gDAO.selfMatchPrivateDelete(map);
	}
	@Transactional
	public List<ClubMatchVO> selfMatchKindList(String cs_idx)	{
		return gDAO.selfMatchKindList(cs_idx);
	}
	@Transactional
	public int selfMatchCount(Map<String,String> map) {
		return gDAO.selfMatchCount(map);
	}
	@Transactional
	//자체대회 개인참가자 리스트
	public List<ClubMatchVO> selfMatchPrivateNotKindJoinList(Map<String,String> map){
		return gDAO.selfMatchPrivateNotKindJoinList(map);
	}
	//자체대회 청팀리스트
	@Transactional
	public List<ClubMatchVO> selectBlueTeam(String cs_idx){
		return gDAO.selectBlueTeam(cs_idx	);
	}
	//자체대회 백팀리스트
	@Transactional
	public List<ClubMatchVO> selectWhiteTeam(String cs_idx){
		return gDAO.selectWhiteTeam(cs_idx	);
	}
	//대진표 인서트
	@Transactional
	public int gameInsert(Map<String,Object>map,Map<String,Object> map2){
		
		int res = gDAO.gameInsert(map);
		int res2 = 0;
		int res3 = 0;
		if(res >0){
			res2  = gDAO.matchListYN((String)map.get("cs_idx"));
		}
		if(res2 >0){
			res3=gDAO.endGameInsert(map2);
		}
		return res3;
	}	
	//나의 대진표
	@Transactional
	public List<ClubMatchVO> myMatchList(Map<String,String> map){
		return gDAO.myMatchList(map);
	}
	//시간 리스트
	@Transactional
	public List<ClubMatchVO> timeMatchList(String cs_idx){
		return gDAO.timeMatchList(cs_idx);
	}
	//코트 리스트
	@Transactional
	public List<ClubMatchVO> courtMatchList(String cs_idx){
		return gDAO.courtMatchList(cs_idx);
	}
	//시간,코트별 대진표 리스트
	@Transactional
	public List<ClubMatchVO> matchList(Map<String,String> map){
		return gDAO.matchList(map);
	}
	//종목 리스트
	@Transactional
	public List<ClubMatchVO> kindMatchList(String cs_idx){
		return gDAO.kindMatchList(cs_idx);
	}
	//종목 디테일
	@Transactional
	public List<ClubMatchVO> kindMatchDetail(String cf_g_idx){
		return gDAO.kindMatchDetail(cf_g_idx);
	}
	//참가자보기(종목리스트)
	@Transactional
	public List<ClubMatchVO> entryKindList(String cs_idx){
		return gDAO.entryKindList(cs_idx);
	}
	//참가자보기(종목리스트)
	@Transactional
	public List<ClubMatchVO> entryKindDetail(String cs_idx){
		return gDAO.entryKindDetail(cs_idx);
	}	
	//일정
	@Transactional
	public List<ClubMatchVO> kindDetailList(Map<String,String> map){
		return gDAO.kindDetailList(map);
	}
	//종목 디테일(랭킹)
	@Transactional
	public List<ClubMatchVO> kindDetailRank(Map<String,String> map){
		return gDAO.kindDetailRank(map);
	}
	//코트수
	@Transactional
	public int courtCount(String cs_idx){
		return gDAO.courtCount(cs_idx);
	}
	//심판화면
	@Transactional
	public List<ClubMatchVO> referee(Map<String,String> map){
		return gDAO.referee(map);
	}
	//나의순위
	@Transactional
	public List<ClubMatchVO> myRank(Map<String,String> map){
		return gDAO.myRank(map);
	}
	//내종목리스트
	@Transactional
	public List<ClubMatchVO> myKindList(Map<String,String> map){
		return gDAO.myKindList(map);
	}
	//대항전 종목 리스트
	@Transactional
	public List<ClubMatchVO> csKindList(String cs_idx){
		return gDAO.csKindList(cs_idx);
	}
	//대항전 종목 순위
	@Transactional
	public List<ClubMatchVO> csKindRank(String cs_idx){
		return gDAO.csKindRank(cs_idx);
	}
	//점수 입력을위한 유저정보
	@Transactional
	public List<ClubMatchVO> pointUser2(Map<String,String> map){
		return gDAO.pointUser2(map);
	}
	//점수업데이트
	@Transactional
	public int pointUpdate(Map<String,Object>map, String cs_gidx){
		int res = gDAO.pointUpdate(map);
		int res2 = 0;
		if(res>0){
			res2 = gDAO.endUpdate(cs_gidx);
		}
		return res2;
	}	
	//종목삭제
	@Transactional
	public int selfMatchKindDelete(String cs_idx) {
		return gDAO.selfMatchKindDelete(cs_idx);
	}
	//allmatch
	@Transactional
	public List<ClubMatchVO> all_court(String cs_idx){
		return gDAO.all_court(cs_idx);
	}
	@Transactional
	public List<ClubMatchVO> all_dat(String cs_idx){
		return gDAO.all_dat(cs_idx);
	}
	@Transactional
	public List<ClubMatchVO> all_match(String cs_idx){
		return gDAO.all_match(cs_idx);
	}	
	//개인화면 월별게임디테일
	@Transactional
	public List<ClubMatchVO> pointAllDetail(Map<String,String> map){
		return gDAO.pointAllDetail(map);
	}
	
	//전적비교할때 게임인덱스
	@Transactional
	public List<ClubMatchVO> getGidx(Map<String, String> map){
			return gDAO.getGidx(map);
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
