package com.techni.mgl.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.ContestVO;

@Repository
public class ContestDAO {
	@Autowired
	@Resource(name="sqlSession_ct")
	public SqlSessionTemplate sqlSession_ct;
	@Resource(name="sqlSession")
	public SqlSessionTemplate sqlSession;
	
	private String nameSpace="mgl.Contest.";
	
	public int contestInsert(Map<String,String> map){
		return sqlSession_ct.insert(nameSpace+"contestInsert",map);
	}
	
	public int createKindTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createKindTable", map);
	}
	
	public int createGroupTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createGroupTable", map);
	}
	
	public int createTeamTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createTeamTable", map);
	}
	
	public int createUserTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createUserTable", map);
	}
	
	public int createWaitTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createWaitTable", map);
	}
	
	public int createMatchEndTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createMatchEndTable", map);
	}
	
	public int createSeqTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createMatchEndTable", map);
	}

	public int createViewTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createViewTable", map);
	}
	
	public int createStaffTable(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"createStaffTable", map);
	}
	
	public int contestKindInsert(Map<String, Object> map) {
		return sqlSession_ct.insert(nameSpace+"contestKindInsert", map);
	}
	
	public int ct_seq() {
		return sqlSession.update(nameSpace+"ct_seq");
	}
	
	public int ct_user_seq(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"ct_user_seq", map);
	}
	
	public int ct_team_seq(Map<String,String> map) {
		return sqlSession_ct.update(nameSpace+"ct_team_seq", map);
	}
	
	public int insertSeq(Map<String, Object> map) {
		return sqlSession_ct.insert(nameSpace+"insertSeq", map);
	}
	
	public ContestVO selectCt(String ct_idx){
		return sqlSession_ct.selectOne(nameSpace+"selectCt", ct_idx);
	}
	
	public List<ContestVO> selectCtIngList(){
		return sqlSession_ct.selectList(nameSpace+"selectCtIngList");
	}
	
	public List<ContestVO> selectCtPreList(){
		return sqlSession_ct.selectList(nameSpace+"selectCtPreList");
	}
	
	public List<ContestVO> selectCtLastList(){
		return sqlSession_ct.selectList(nameSpace+"selectCtLastList");
	}
	
	public ContestVO selectCtTypeIdx(Map<String,String> map) {
		return sqlSession_ct.selectOne(nameSpace+"selectCtTypeIdx", map);
	}
	
	public int contestApplicationAct(ContestVO cvo){
		return sqlSession_ct.insert(nameSpace+"contestApplicationAct",cvo);
	}
	
	public int contestApplicationAct2(ContestVO cvo){
		return sqlSession_ct.insert(nameSpace+"contestApplicationAct2",cvo);
	}
	
	public int contestTeamInsert(ContestVO cvo){
		return sqlSession_ct.insert(nameSpace+"contestTeamInsert",cvo);
	}
	public int countSameName(Map<String,String> map) {
		return sqlSession_ct.selectOne(nameSpace+"countSameName", map);
	}
	
	public List<ContestVO> contestAdList(){
		return sqlSession_ct.selectList(nameSpace+"contestAdList");
	}
	
	public List<ContestVO> selectCtKindName(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"selectCtKindName", map);
	}
	
	public List<ContestVO> contestEventPlayer(){
		return sqlSession_ct.selectList(nameSpace+"contestEventPlayer");
	}
	
	
	public List<ContestVO> selectCtKindList(Map<String,String> map) {
		return sqlSession_ct.selectList(nameSpace+"selectCtKindList", map);
	}
	
	public List<ContestVO> selectCtKindList2(Map<String,String> map) {
		return sqlSession_ct.selectList(nameSpace+"selectCtKindList2", map);
	}
	
	public List<ContestVO> selectCtClubList(Map<String,String> map) {
		return sqlSession_ct.selectList(nameSpace+"selectCtClubList", map);
	}
	
	public List<ContestVO> selectCtClubList2(Map<String,String> map) {
		return sqlSession_ct.selectList(nameSpace+"selectCtClubList2", map);
	}
	
	public List<ContestVO> selectCtTeamCount(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"selectCtTeamCount", map); //출전팀, 출전클럽수 가져오기 추가
	}
	
	public int ct_hit(String ct_idx) {
		return sqlSession_ct.update(nameSpace+"ct_hit", ct_idx);
	}
	
	public List<ContestVO> feeTeamList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"feeTeamList",map);
	}
	public List<ContestVO> feeClubList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"feeClubList", map);
	}
	
	public List<ContestVO> feeClubTeamList(Map<String,Object> map){
		return sqlSession_ct.selectList(nameSpace+"feeClubTeamList", map);
	}
	//그룹 인서트
	public int groupInsert(Map<String,Object> map){
		return sqlSession_ct.insert(nameSpace+"groupInsert", map);
	}
	//팀 그룹 업데이트
	public int teamGroupUpdate(Map<String,Object> map){
		return sqlSession_ct.update(nameSpace+"teamGroupUpdate", map);
	}
	//그룹인덱스
	public List<ContestVO> groupIdx(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"groupIdx", map);
	}
	//그룹인덱스로 사용자 리스트출력
	public List<ContestVO> groupAll(Map<String,String> map){
			return sqlSession_ct.selectList(nameSpace+"groupAll", map);
	}
	//종목인덱스로 사용자 리스트 출력
	public List<ContestVO> typeAll(Map<String,String> map){
			return sqlSession_ct.selectList(nameSpace+"typeAll", map);
	}
	//대진표 인서트
	public int gameInsert(Map<String,Object> map){
		return sqlSession_ct.insert(nameSpace+"gameInsert", map);
	}
	//대진표 인서트
	public int viewInsert(Map<String,Object> map){
		return sqlSession_ct.insert(nameSpace+"viewInsert", map);
	}
	//대진표 생성 업데이트
	public int matchListYN(String ct_idx){
		return sqlSession_ct.update(nameSpace+"matchListYN", ct_idx);
	}
	//엔드게임 인서트
	public int endGameInsert(Map<String,Object> map){
		return sqlSession_ct.insert(nameSpace+"endGameInsert", map);
	}
	//나의 대진표
	public List<ContestVO> myMatchList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"myMatchList", map);
	}
	//시간 리스트
	public List<ContestVO> timeMatchList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"timeMatchList", map);
	}
	//코트 리스트
	public List<ContestVO> courtMatchList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"courtMatchList", map);
	}
	//코트 매치리스트
	public List<ContestVO> courtMatchList2(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"courtMatchList2", map);
	}
	//시간,코트별 리스트
	public List<ContestVO> matchList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"matchList", map);
	}
	//종목 리스트
	public List<ContestVO> typeMatchList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"typeMatchList",map);
	}
	//종목 디테일
	public List<ContestVO> typeMatchDetail(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"typeMatchDetail", map);
	}
	//일정
	public List<ContestVO> typeDetailList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"typeDetailList", map);
	}
	//종목 디테일 랭킹
	public List<ContestVO> typeDetailRank(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"typeDetailRank", map);
	}	
	//뷰테이블 셀렉
	public List<ContestVO> viewSelect(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"viewSelect", map);
	}
	//대회 코트나 대회시간 리스트
	public List<ContestVO> courtOrTimeList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"courtOrTimeList", map);
	}
	//대회 상태 리스트
	public List<ContestVO> statusList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"statusList", map);
	}
	//종료게임 전체게임 카운트
	public ContestVO gameCount(Map<String,String> map){
		return sqlSession_ct.selectOne(nameSpace+"gameCount", map);
	}
	//디테일화면 순위
	public List<ContestVO> detailRank(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"detailRank", map);
	}
	//디테일화면 일정 Calendar
	public List<ContestVO> detailCalendar(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"detailCalendar", map);
	}
	//그룹리스ㅡ
	public List<ContestVO> groupList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"groupList", map);
	}
	//그
	public List<ContestVO> getCount(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"getCount", map);
	}
	public List<ContestVO> randomGroupList(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"randomGroupList", map);
	}
	public List<ContestVO> winGame(Map<String,String> map){
		return sqlSession_ct.selectList(nameSpace+"winGame", map);
	}
	public int matchEndUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"matchEndUpdate", map);
	}
	public int waitUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"waitUpdate", map);
	}
	public int viewUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"viewUpdate", map);
	}
	public int pointUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"pointUpdate", map);
	}
	public int statusUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"statusUpdate", map);
	}
	public int viewScoreUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"viewScoreUpdate", map);
	}
	public int tournamentWaitUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"tournamentWaitUpdate", map);
	}
	public int tournamentViewUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"tournamentViewUpdate", map);
	}
	public int tournamentMatchEndUpdate(Map<String,Object> map) {
		return sqlSession_ct.update(nameSpace+"tournamentMatchEndUpdate", map);
	}
	public int endYN(Map<String,String> map) {
		return sqlSession_ct.selectOne(nameSpace+"endYN", map);
	}
	public ContestVO selectAteam(Map<String,String> map) {
		return sqlSession_ct.selectOne(nameSpace+"selectAteam", map);
	}
	public ContestVO selectBteam(Map<String,String> map) {
		return sqlSession_ct.selectOne(nameSpace+"selectBteam", map);
	}
	public ContestVO selectGroup_1st(Map<String,String> map) {
		return sqlSession_ct.selectOne(nameSpace+"selectGroup_1st", map);
	}
	
	public List<ContestVO> tournamentSelect(Map<String,String> map) {
		return sqlSession_ct.selectList(nameSpace+"tournamentSelect", map);
	}
}
