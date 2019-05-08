package com.techni.mgl.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.CfightVO;

@Repository
public class CfightDAO {
	@Autowired
	@Resource(name="sqlSession")
	public SqlSessionTemplate sqlSession;
	private String nameSpace="mgl.Cfight.";
	
	public List<CfightVO> cFightList(String c_idx){
		return sqlSession.selectList(nameSpace+"cFightList", c_idx);
	}
	public CfightVO selectCidx(String c_nm){
		return sqlSession.selectOne(nameSpace+"selectCidx", c_nm);
	}
	
	public int cFightInsert(Map<String,String> map){
		return sqlSession.insert(nameSpace+"cFightInsert",map);
	}
	
	public int cFightSeq(){
		return sqlSession.insert(nameSpace+"cFightSeq");
	}
	
	public int cFightYnInsert(Map<String,String> map){
		return sqlSession.insert(nameSpace+"cFightYnInsert", map);
	}
	
	public int cFightYnSeq(){
		return sqlSession.insert(nameSpace+"cFightYnSeq");
	}
	
	public int cFightTypeInsert(Map<String,String> map){
		return sqlSession.insert(nameSpace+"cFightTypeInsert", map);
	}
	
	public int cFightTypeSeq(){
		return sqlSession.insert(nameSpace+"cFightTypeSeq");
	}
	//대항전내용과 참여클럽 리스트
	public List<CfightVO> cFightJoinClub(String cf_idx){
		return sqlSession.selectList(nameSpace+"cFightJoinClub", cf_idx);
	}
	//주최클럽과 종목 리스트
	public List<CfightVO> cFightTypeList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"cFightTypeList", map);
	}
	//대회 참석/불참 업데이트
	public int ynChk(Map<String,String> map){
		return sqlSession.update(nameSpace+"ynChk", map);
	}
	//참석하지않은 유저 리스트
	public List<CfightVO> cFightUserList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"cFightUserList", map);
	}
	//참석한 유저 리스트
	public List<CfightVO> cFightJoinUserList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"cFightJoinUserList", map);
	}
	//유저 참석
	public int cFightUserInsert(Map<String,Object> map){
		return sqlSession.insert(nameSpace+"cFightUserInsert", map);
	}
	//참석 취소
	public int cFightUserDelete(Map<String,Object> map){
		return sqlSession.delete(nameSpace+"cFightUserDelete", map);
	}
	//팀선택 유저 리스트
	public List<CfightVO> teamUser(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"teamUser", map);
	}
	//종목별 팀 리스트
	public List<CfightVO> typeTeam(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"typeTeam", map);
	}
	//팀 생성
	public int teamInsert(Map<String,String> map){
		return sqlSession.insert(nameSpace+"teamInsert", map);
	}
	//팀시퀀스
	public int cFightTeamSeq(){
		return sqlSession.update(nameSpace+"cFightTeamSeq");
	}
	//팀 삭제
	public int teamDeleta(String cf_team_idx){
		return sqlSession.delete(nameSpace+"teamDelete", cf_team_idx);
	}
	//팀 리스트
	public List<CfightVO> teamList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"teamList", map);
	}
	//유저 팀체크
	public List<CfightVO> teamUserChk(Map<String,Object> map){
		return sqlSession.selectList(nameSpace+"teamUserChk", map);
	}
	//그룹 설정화면
	public List<CfightVO> typeList(String cf_idx){
		return sqlSession.selectList(nameSpace+"typeList", cf_idx);
	}
	//팀리스트 클럽별로 번갈아출력
	public List<CfightVO> clubTeamList(Map<String,String> map)	{
		return sqlSession.selectList(nameSpace+"clubTeamList", map);
	}
	//대항전에 참가한 클럽인덱스 리스트
	public List<CfightVO> clubList(String cf_idx){
		return sqlSession.selectList(nameSpace+"clubList", cf_idx);
	}
	//그룹 인서트
	public int groupInsert(Map<String,Object> map){
		return sqlSession.insert(nameSpace+"groupInsert", map);
	}
	//팀 그룹 업데이트
	public int teamGroupUpdate(Map<String,Object> map){
		return sqlSession.update(nameSpace+"teamGroupUpdate", map);
	}
	//그룹인덱스
	public List<CfightVO> groupIdx(String cf_idx){
		return sqlSession.selectList(nameSpace+"groupIdx", cf_idx);
	}
	//그룹올
	public List<CfightVO> groupAll(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"groupAll", map);
	}
	//게임당 시간 시작시간 코트수
	public CfightVO gameDetail(String cf_idx){
		return sqlSession.selectOne(nameSpace+"gameDetail", cf_idx);
	}
	//대진표 인서트
	public int gameInsert(Map<String,Object> map){
		return sqlSession.insert(nameSpace+"gameInsert", map);
	}
	//대진표 생성 업데이트
	public int matchListYN(String cf_idx){
		return sqlSession.update(nameSpace+"matchListYN", cf_idx);
	}
	//나의 대진표
	public List<CfightVO> myMatchList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"myMatchList", map);
	}
	//시간 리스트
	public List<CfightVO> timeMatchList(String cf_idx){
		return sqlSession.selectList(nameSpace+"timeMatchList", cf_idx);
	}
	//코트 리스트
	public List<CfightVO> courtMatchList(String cf_idx){
		return sqlSession.selectList(nameSpace+"courtMatchList", cf_idx);
	}
	//시간,코트별 리스트
	public List<CfightVO> matchList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"matchList", map);
	}
	//종목 리스트
	public List<CfightVO> typeMatchList(String cf_idx){
		return sqlSession.selectList(nameSpace+"typeMatchList", cf_idx);
	}
	//종목 디테일
	public List<CfightVO> typeMatchDetail(String cf_g_idx){
		return sqlSession.selectList(nameSpace+"typeMatchDetail", cf_g_idx);
	}
	//참가자 보기(종목리스트)
	public List<CfightVO> entryTypeList(String cf_idx){
		return sqlSession.selectList(nameSpace+"entryTypeList", cf_idx);
	}
	//참가자 보기 (종목디테일)
	public List<CfightVO> entryTypeDetail(String cf_idx){
		return sqlSession.selectList(nameSpace+"entryTypeDetail", cf_idx);
	}
	//참가자 보기(클럽리스트)
	public List<CfightVO> entryClubList(String cf_idx){
		return sqlSession.selectList(nameSpace+"entryClubList", cf_idx);
	}
	//참가자 보기(클럽디테일)
	public List<CfightVO> entryClubDetail(String cf_idx){
		return sqlSession.selectList(nameSpace+"entryClubDetail", cf_idx);
	}
	//일정
	public List<CfightVO> typeDetailList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"typeDetailList", map);
	}
	//엔드게임 인서트
	public int endGameInsert(Map<String,Object> map){
		return sqlSession.insert(nameSpace+"endGameInsert", map);
	}
	//종목 디테일 랭킹
	public List<CfightVO> typeDetailRank(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"typeDetailRank", map);
	}
	//코트갯수
	public int courtCount(String cf_idx){
		return sqlSession.selectOne(nameSpace+"courtCount", cf_idx);
	}
	//심판화면
	public List<CfightVO> referee(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"referee", map);
	}
	//나의순위
	public List<CfightVO> myRank(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"myRank", map);
	}
	//내종목리스트
	public List<CfightVO> myTypeList(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"myTypeList", map);
	}
	//대항전 종목리스트
	public List<CfightVO> cfTypeList(String cf_idx){
		return sqlSession.selectList(nameSpace+"cfTypeList", cf_idx);
	}
	//대항전 종목 순위
	public List<CfightVO> cfTypeRank(String cf_idx){
		return sqlSession.selectList(nameSpace+"cfTypeRank", cf_idx);
	}
	//점수입력을 위한 유저정보
	public List<CfightVO> pointUser(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"pointUser", map);
	}
	//점수 계산후 업데이트
	public int pointUpdate(Map<String,Object> map){
		return sqlSession.update(nameSpace+"pointUpdate", map);
	}
	//게임 종료 업데이트
	public int endUpdate(String cf_gidx){
		return sqlSession.update(nameSpace+"endUpdate", cf_gidx);
	}
	//클럽별 순위
	public List<CfightVO> clubRank(String cf_idx){
		return sqlSession.selectList(nameSpace+"clubRank", cf_idx);
	}
	//pushid
	public List<CfightVO> push(Map<String,String> map){
		return sqlSession.selectList(nameSpace+"push", map);
	}
	//올매치
	public List<CfightVO> all_court(String cf_idx){
		return sqlSession.selectList(nameSpace+"all_court", cf_idx);
	}
	public List<CfightVO> all_dat(String cf_idx){
		return sqlSession.selectList(nameSpace+"all_dat", cf_idx);
	}
	public List<CfightVO> all_match(String cf_idx){
		return sqlSession.selectList(nameSpace+"all_match", cf_idx);
	}
	//대항전 이름
	public List<CfightVO> cf_nm(String cf_idx){
		return sqlSession.selectList(nameSpace+"cf_nm", cf_idx);
	}
	//대항전삭제
	public int cFightDelete(String cf_idx) {
		return sqlSession.update(nameSpace+"cFightDelete", cf_idx);
	}
}
