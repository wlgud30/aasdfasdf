package com.techni.mgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.CStadiumVO;
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
		return sqlSession.update(nameSpace+"clubMatchPointInsert", cmvo);
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
