package com.techni.mgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.CStadiumVO;
import com.techni.mgl.domain.CfightVO;
import com.techni.mgl.domain.ClubMatchVO;
import com.techni.mgl.domain.GTempTeamVO;
import com.techni.mgl.domain.MemberVO;

@Repository
public class GameDAO {
	
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	private String nameSpace="mgl.Game.";
	
	//사용 할 수 있는 코트를 알기위해 가져온다.
	public ClubMatchVO clubUseCouert(String c_idx){
		return sqlSession.selectOne(nameSpace+"clubUseCourt", c_idx);
	}
	
	//게임을 등록한다.
	public int clubGameSet(ClubMatchVO cmVO){
		return sqlSession.insert(nameSpace+"clubGameSet", cmVO);
	}
	
	//게임등록한 사용자들의 상태 변경
	public int gameJoinSChange(Map<String,String> map){
		return sqlSession.update(nameSpace+"gameJoinSChange", map);
	}
	//클럽매치 시퀀스값 증가
	public int c_matchSeq(){
		return sqlSession.update(nameSpace+"c_matchSeq");
	}
	//게임중인 리스트 출력
	public List<ClubMatchVO> gameingList(String c_idx){
		return sqlSession.selectList(nameSpace+"gameingList", c_idx);
	}
	//대기중인 리스트 출력
	public List<ClubMatchVO> waitingList(String c_idx){
		return sqlSession.selectList(nameSpace+"waitingList", c_idx);
	}
	//게임 종료시간과,게임상태를 종료로 업데이트
	public int gameEnd(String c_gidx){
		return sqlSession.update(nameSpace+"gameEnd", c_gidx);
	}
	//대기순번이 가장빠른 gidx의 게임상태를 게임으로 바꾼다
	public int waitUpdate(Map<String,String> map){
		return sqlSession.update(nameSpace+"waitUpdate",map);
	}
	//점수 등록화면
	public ClubMatchVO scoreInsertForm(String c_gidx){
		return sqlSession.selectOne(nameSpace+"scoreInsertForm",c_gidx);
	}
	//포인트 계산을위한 유저정보
	public List<ClubMatchVO> pointUser(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"pointUser", map);
	}
	//클럽매치 테이블에 인서트
	public int clubMatchInsert(ClubMatchVO cmvo){
		return sqlSession.insert(nameSpace+"clubMatchInsert", cmvo);
	}
	//게임종료테이블 시퀀스
	public int gameEndSeq(){
		return sqlSession.update(nameSpace+"cm_end_seq");
	}
	//게임 종료후 결과창
	public List<ClubMatchVO> gameResult(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"gameResult", map);
	}
	//종료게임 gidx추출
	public List<ClubMatchVO> endGameGidx(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"endGameGidx", map);
	}
	//포인트 요약
	public List<ClubMatchVO> pointDetail(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"pointDetail", map);
	}
	//포인트 통합
	public List<ClubMatchVO> pointDetailAll(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"pointDetailAll", map);
	}
	//대기명단 위치변경
	public int changeW(Map<String,String> map){
		return sqlSession.update(nameSpace+"changeW", map);
	}
	//대기명단 삭제
	public int deleteW(String c_gidx){
		return sqlSession.delete(nameSpace+"deleteW", c_gidx);
	}
	public int clubMatchPointInsert(ClubMatchVO cmvo){
		return sqlSession.update(nameSpace + "clubMatchPointInsert", cmvo);
	}
	//자체대회 생성
	public int selfMatchInsert(Map<String,String> map) {
		return sqlSession.insert(nameSpace + "selfMatchInsert",map);
	}
	//자체대회 시퀀스값 증가
	public int selfMatchSeq() {
		return sqlSession.update(nameSpace+"self_seq");
	}
	//자체대회 리스트
	public List<ClubMatchVO> selfMatchList(String c_idx){
		return sqlSession.selectList(nameSpace+"selfMatchList", c_idx);
	}
	//자체대회 디테일
	public ClubMatchVO selfMatchDetail(String cs_idx){
		return sqlSession.selectOne(nameSpace+"selfMatchDetail", cs_idx);
	}
	//자체대회 참석여부
	public int selfMatchJoinYN(Map<String,String> map) {
		return sqlSession.selectOne(nameSpace+"selfMatchJoinYN", map);
	}
	
	//자체대회 참석
	public int selfMatchJoin(Map<String,String> map) {
		return sqlSession.insert(nameSpace+"selfMatchJoin", map);
	}
	
	//자체대회 불참
	public int selfMatchExit(Map<String,String> map) {
		return sqlSession.delete(nameSpace+"selfMatchExit", map);
	}
	
	//자체대회 참석 인원
	public List<ClubMatchVO> selfMatchJoinList(String cs_idx){
		return sqlSession.selectList(nameSpace+"selfMatchJoinList", cs_idx);
	}
	
	//자체대회 미참석 인원
	public List<ClubMatchVO> selfMatchClubList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"selfMatchClubList", map);
	}
	
	//자체대회 다중 참석
	public int selfMatchMultiJoin(Map<Object,Object> map) {
		return sqlSession.insert(nameSpace+"selfMatchMultiJoin", map);
	}
	
	//자체대회 다중 참석 취소
	public int selfMatchMultiUnJoin(Map<Object,Object> map) {
		return sqlSession.delete(nameSpace+"selfMatchMultiUnJoin", map);
	}
	//자체대회 등급 정렬
	public List<ClubMatchVO> selfMatchGD(String cs_idx){
		return sqlSession.selectList(nameSpace+"selfMatchGD", cs_idx);
	}
	//자체대회 청백 업데이트
	public int BWUpdate(Map<String,String> map) {
		return sqlSession.update(nameSpace+"BWUpdate", map);
	}
	//자체대회 종목 인서트
	public int selfMatchTypeInsert(Map<String,Object> map) {
		return sqlSession.insert(nameSpace+"selfMatchTypeInsert", map);
	}
	//자체대회 해당 종목에 등록된팀들
	public List<ClubMatchVO> selfMatchTeamList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"selfMatchTeamList", map);
	}
	//자체대회 해당 종목에 등록된개인
	public List<ClubMatchVO> selfMatchPrivateList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"selfMatchPrivateList", map);
	}
	//자체대회 해당 종목에 등록되지않은 참가자들
	public List<ClubMatchVO> selfMatchNotKindJoinList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"selfMatchNotKindJoinList", map);
	}
	//게임참가인원, 자체대회 참가인원
	public ClubMatchVO selfMatchGameCount(String cs_idx){
		return sqlSession.selectOne(nameSpace+"selfMatchGameCount", cs_idx);
	}
	//자체대회 팀 생성
	public int selfMatchTeamInsert(Map<String,String> map) {
		return sqlSession.insert(nameSpace+"selfMatchTeamInsert", map);
	}
	//자체대회 팀 생성(개인리그용)
	public int selfMatchTeamInsert2(Map<String,Object> map) {
		return sqlSession.insert(nameSpace+"selfMatchTeamInsert2", map);
	}
	//자체대회 팀시퀀스 증가
	public int selfMatchTeamSeq() {
		return sqlSession.update(nameSpace+"cs_teamSeq");
	}
	//자체대회 팀 삭제
	public int selfMatchTeamDelete(String cs_idx) {
		return sqlSession.delete(nameSpace+"selfMatchTeamDelete", cs_idx);
	}
	//자체대회 팀삭제(개인리그용)
	public int selfMatchTeamDelete2(String cs_k_idx) {
		return sqlSession.delete(nameSpace+"selfMatchTeamDelete2", cs_k_idx);
	}
	//자체대회 개인 생성
	public int selfMatchPrivateInsert(Map<String,Object> map) {
		return sqlSession.insert(nameSpace+"selfMatchPrivateInsert", map);
	}
	//자체대회 개인시퀀스 증가
	public int selfMatchPrivateSeq() {
		return sqlSession.update(nameSpace+"cs_PrivateSeq");
	}
	//자체대회 개인 삭제
	public int selfMatchPrivateDelete(Map<String,Object> map) {
		return sqlSession.delete(nameSpace+"selfMatchPrivateDelete", map);
	}
	//자체대회 종목리스트
	public List<ClubMatchVO> selfMatchKindList(String cs_idx){
		return sqlSession.selectList(nameSpace+"selfMatchKindList", cs_idx);
	}
	//자체대회 게임수 업데이트
	public int selfMatchCount(Map<String,String> map) {
		return sqlSession.update(nameSpace+"selfMatchCount", map);
	}
	//자체대회 개인리그 참가하지않은 리스트
	public List<ClubMatchVO> selfMatchPrivateNotKindJoinList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"selfMatchPrivateNotKindJoinList", map);
	}
/*	//자체대회 개인 참가자와 게임수 리스트
	public List<ClubMatchVO> selfMatchPrivateUserList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"selfMatchPrivateUserList", map);
	}*/
	//청팀리스트
	public List<ClubMatchVO> selectBlueTeam(String cs_idx){
		return sqlSession.selectList(nameSpace+"selectBlueTeam", cs_idx);
	}
	//백팀리스트
	public List<ClubMatchVO> selectWhiteTeam(String cs_idx){
		return sqlSession.selectList(nameSpace+"selectWhiteTeam", cs_idx);
	}
	//대진표 인서트
	public int gameInsert(Map<String,Object> map){
		return sqlSession.insert(nameSpace+"gameInsert", map);
	}
	//대진표 생성 업데이트
	public int matchListYN(String cs_idx){
		return sqlSession.update(nameSpace+"matchListYN", cs_idx);
	}
	//엔드게임 인서트
	public int endGameInsert(Map<String,Object> map){
		return sqlSession.insert(nameSpace+"endGameInsert", map);
	}
	//나의 대진표
	public List<ClubMatchVO> myMatchList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"myMatchList", map);
	}
	//시간 리스트
	public List<ClubMatchVO> timeMatchList(String cs_idx){
		return sqlSession.selectList(nameSpace+"timeMatchList", cs_idx);
	}
	//코트 리스트
		public List<ClubMatchVO> courtMatchList(String cs_idx){
			return sqlSession.selectList(nameSpace+"courtMatchList", cs_idx);
		}
		//시간,코트별 리스트
		public List<ClubMatchVO> matchList(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"matchList", map);
		}
		//종목 리스트
		public List<ClubMatchVO> kindMatchList(String cs_idx){
			return sqlSession.selectList(nameSpace+"kindMatchList", cs_idx);
		}
		//종목 디테일
		public List<ClubMatchVO> kindMatchDetail(String cs_g_idx){
			return sqlSession.selectList(nameSpace+"kindMatchDetail", cs_g_idx);
		}
		//참가자 보기(종목리스트)
		public List<ClubMatchVO> entryKindList(String cs_idx){
			return sqlSession.selectList(nameSpace+"entryKindList", cs_idx);
		}
		//참가자 보기 (종목디테일)
		public List<ClubMatchVO> entryKindDetail(String cs_idx){
			return sqlSession.selectList(nameSpace+"entryKindDetail", cs_idx);
		}
		//일정
		public List<ClubMatchVO> kindDetailList(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"kindDetailList", map);
		}
		//종목 디테일 랭킹
		public List<ClubMatchVO> kindDetailRank(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"kindDetailRank", map);
		}
		//코트갯수
		public int courtCount(String cs_idx){
			return sqlSession.selectOne(nameSpace+"courtCount", cs_idx);
		}
		//심판화면
		public List<ClubMatchVO> referee(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"referee", map);
		}
		//나의순위
		public List<ClubMatchVO> myRank(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"myRank", map);
		}
		//내종목리스트
		public List<ClubMatchVO> myKindList(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"myKindList", map);
		}
		//대항전 종목리스트
		public List<ClubMatchVO> csKindList(String cs_idx){
			return sqlSession.selectList(nameSpace+"csKindList", cs_idx);
		}
		//대항전 종목 순위
		public List<ClubMatchVO> csKindRank(String cs_idx){
			return sqlSession.selectList(nameSpace+"csKindRank", cs_idx);
		}
		//점수입력을 위한 유저정보
		public List<ClubMatchVO> pointUser2(Map<String,String> map){
			return sqlSession.selectList(nameSpace+"pointUser2", map);
		}
		//점수 계산후 업데이트
		public int pointUpdate(Map<String,Object> map){
			return sqlSession.update(nameSpace+"pointUpdate", map);
		}
		//게임 종료 업데이트
		public int endUpdate(String cs_gidx){
			return sqlSession.update(nameSpace+"endUpdate", cs_gidx);
		}	
		//종목삭제
		public int selfMatchKindDelete(String cs_idx) {
			return sqlSession.delete(nameSpace+"selfMatchKindDelete",cs_idx);
		}
		//올매치
		public List<ClubMatchVO> all_court(String cs_idx){
			return sqlSession.selectList(nameSpace+"all_court", cs_idx);
		}
		public List<ClubMatchVO> all_dat(String cs_idx){
			return sqlSession.selectList(nameSpace+"all_dat", cs_idx);
		}
		public List<ClubMatchVO> all_match(String cs_idx){
			return sqlSession.selectList(nameSpace+"all_match", cs_idx);
		}
	public ArrayList<CStadiumVO> getClubStadiumCoatList(HashMap map) {
		return (ArrayList) sqlSession.selectList("mgl.Game.getClubStadiumCoatList", map);
	}
	
	public void setGameStateInfoRankUp(GTempTeamVO vo) {
		sqlSession.selectList("mgl.Game.setGameStateInfoRankUp", vo);
	}
	public ArrayList<ClubMatchVO> getGameStateInfo(HashMap map){
		return (ArrayList) sqlSession.selectList("mgl.Game.getGameStateInfo", map);
	}
	
	public ArrayList<GTempTeamVO> getGameStateTempInfo(HashMap map){
		return (ArrayList) sqlSession.selectList("mgl.Game.getGameStateTempInfo", map);
	}

	public ArrayList<MemberVO> getAttendMemberList(HashMap map) {
		return (ArrayList)sqlSession.selectList("mgl.Game.getAttendMemberList", map);
	}

	public void setGameMemberAttend(HashMap map) {
		sqlSession.insert("mgl.Game.setGameMemberAttend", map);
	}
	// 출석 회원들의 상태를 일일이 바꿔준다.
	public void setUpdateGameAttend(HashMap map) {
		String GSTATUS = (String) map.get("GSTATUS");
		if(GSTATUS.equals("P")){
			String useCoat = (String) map.get("COAT");
			sqlSession.update("mgl.Game.setUpdateStadiumCoat", useCoat);
		}
		for(int i=1; i<=4; i++){
			String id = (String) map.get("U_"+i);
			map.put("UID", id);
			sqlSession.update("mgl.Game.setUpdateGameAttend", map);
		}
	}
	
	// 임시대기테이블 저장
	public void setGameTempRegist(HashMap map) {
		sqlSession.insert("mgl.Game.setGameTempRegist", map);
	}
	
	public GTempTeamVO getGameScoreRegist(String gtIdx) {
		return sqlSession.selectOne("mgl.Game.getGameScoreRegist", gtIdx);
	}
}
