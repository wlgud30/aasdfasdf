package com.techni.mgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.domain.UClubVO;
import com.techni.mgl.dto.UClubViewDTO;

@Repository
public class UClubDAO {

	@Autowired
	public SqlSessionTemplate sqlSession;

	public List<ClubVO> selectList(String m_id) {
		return sqlSession.selectList("mgl.UClub.uClubList", m_id);
	}

	public List<ClubVO> searchList(Map<String, String> map) {
		return sqlSession.selectList("mgl.UClub.UClubSearch", map);
	}

	// 클럽생성
	public int insert(UClubVO uVO) {
		return sqlSession.insert("mgl.UClub.insert", uVO);
	}

	// 유저 클럽가입
	public int user_insert(UClubVO uVO) {
		return sqlSession.insert("mgl.UClub.user_insert", uVO);
	}

	// 클럽시퀀스
	public int c_seq() {
		int res = sqlSession.update("mgl.UClub.c_seq");

		return res;
	}

	// 유저클럽 시퀀스
	public int uc_seq() {
		int res = sqlSession.update("mgl.UClub.uc_seq");
		return res;
	}

	// 클럽 가입 판단
	public int selectYN(Map<String, String> map) {
		int res = sqlSession.selectOne("mgl.UClub.selectYN", map);
		return res;
	}

	// 클럽 유저 리스트
	public List<UClubVO> selectUClubUser(Map<String, String> map) {

		return sqlSession.selectList("mgl.UClub.selectUClubUser", map);
	}

	// 클럽 남자 유저 리스트
	public List<UClubVO> selectUClubM(Map<String, String> map) {

		return sqlSession.selectList("mgl.UClub.selectUClubM", map);
	}

	// 클럽 여자 유저 리스트
	public List<UClubVO> selectUClubF(Map<String, String> map) {

		return sqlSession.selectList("mgl.UClub.selectUClubF", map);
	}

	// 매니저가 보는 클럽 유저 리스트
	public List<UClubVO> UClubMList(String c_idx) {
		return sqlSession.selectList("mgl.UClub.UClubMList", c_idx);
	}

	// 매니저가 보는 클럽 가입대기 유저 리스트
	public List<UClubVO> UClubJoinWaitList(String c_idx) {
		return sqlSession.selectList("mgl.UClub.UClubJoinWaitList", c_idx);
	}

	// 매니저가 보는 클럽 탈퇴대기 유저 리스트
	public List<UClubVO> UClubOutWaitList(String c_idx) {
		return sqlSession.selectList("mgl.UClub.UClubOutWaitList", c_idx);
	}

	// 매니저가 보는 가입대기 디테일화면
	public UClubVO UClubJoinWaitDetail(Map<String, String> map) {
		return sqlSession.selectOne("mgl.UClub.UClubJoinWaitDetail", map);
	}

	// 매니저가 가입 승인
	public int cJoinOK(Map<String, String> map) {
		int res = sqlSession.update("mgl.UClub.cJoinOK", map);
		return res;
	}

	// 매니저가 가입 거절
	public int cJoinNO(Map<String, String> map) {
		int res = sqlSession.delete("mgl.UClub.cJoinNO", map);
		return res;
	}

	// 출석하지 않은회원 리스트
	public List<UClubVO> attend(String c_idx) {
		return sqlSession.selectList("mgl.UClub.attend", c_idx);
	}

	// 출석한 않은회원 리스트
	public List<UClubVO> attendY(String c_idx) {
		return sqlSession.selectList("mgl.UClub.attendY", c_idx);
	}

	// 출석 등록 하기
	public int attendInsert(UClubVO uvo) {
		return sqlSession.insert("mgl.UClub.attendInsert", uvo);
	}

	// 퇴실 하기
	public int attendOut(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.attendOut", map);
	}

	// 다중 출석 등록
	public int multiAttend(Map<String, Object> map) {
		return sqlSession.insert("mgl.UClub.multiAttend", map);
	}

	// 현재 게임가능한 회원 출력
	public List<UClubVO> gameOKList(String c_idx) {
		return sqlSession.selectList("mgl.UClub.gameOKList", c_idx);
	}

	// 개인정보수정 화면 출력
	public UClubVO selectOne(Map<String, String> map) {
		return sqlSession.selectOne("mgl.UClub.userUpdate", map);
	}

	// 클럽 유저리스트
	public List<UClubVO> clubUserList(String c_idx) {
		return sqlSession.selectList("mgl.UClub.clubUserList", c_idx);
	}

	// 비교
	public UClubVO meAndYou(Map<String, String> map) {
		return sqlSession.selectOne("mgl.UClub.meAndYou", map);
	}

	// 클럽 업데이트(vo때문에 uclub에서 작업)
	public int clubUpdate(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.clubUpdate", map);
	}

	// 유저 업데이트
	public int userUpdat(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.userUpdat", map);
	}

	// 월별게임수
	public List<UClubVO> gameCount(Map<String, String> map) {
		return sqlSession.selectList("mgl.UClub.gameCount", map);
	}

	// 유저 디테일
	public UClubVO userOne(Map<String, String> map) {
		return sqlSession.selectOne("mgl.UClub.userOne", map);
	}

	// 직급 급수 업데이트
	public int userMngGd(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.userMngGd", map);
	}
	// 급수 업데이트
	public int userGd(Map<String,String> map) {
		return sqlSession.update("mgl.UClub.userGd", map);
	}

	// 클럽탈퇴
	public int clubOut(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.clubOut", map);
	}

	// 매니저양도
	public int manUpdate(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.manUpdate", map);
	}

	public int manCUpdate(Map<String, String> map) {
		return sqlSession.update("mgl.UClub.manCUpdate", map);
	}

	// 개인순위
	public List<UClubVO> todayRank(Map<String, String> map) {
		return sqlSession.selectList("mgl.UClub.todayRank", map);
	}

	// 푸쉬테이블 인서트
	public int pushInsert(Map<String, String> map) {
		return sqlSession.insert("mgl.UClub.pushInsert", map);
	}

	// 대기카운트 종료카운트
	public List<UClubVO> count(Map<String, String> map) {
		return sqlSession.selectList("mgl.UClub.GameOKListGuest", map);
	}

	// 해당클럽의 회원등급
	public UClubVO userMng(Map<String, String> map) {
		return sqlSession.selectOne("mgl.UClub.userMng", map);
	}

	// 해당클럽의 총인원수
	public int clubCount(String c_idx) {
		return sqlSession.selectOne("mgl.UClub.clubCount", c_idx);
	}
	//개인화면 월별게임
	public List<UClubVO> monthGame(String u_id){
		return sqlSession.selectList("mgl.UClub.monthGame", u_id);
	}
	
	public int representCheck(String u_id) {
		return sqlSession.selectOne("mgl.UClub.representCheck", u_id);
	}
	//대항전 개인순위
	public List<UClubVO> competitionRank(String u_id){
		return sqlSession.selectList("mgl.UClub.competitionRank", u_id);
	}
	//전국 같은급수 개인순위
	public List<UClubVO> sameAllGdRank(String u_id){
		return sqlSession.selectList("mgl.UClub.sameAllGdRank", u_id);
	}
	//전국 같은급수 연령별 개인순위
	public List<UClubVO> sameAgeGdRank(String u_id){
		return sqlSession.selectList("mgl.UClub.sameAgeGdRank", u_id);
	}	
	//전국 같은급수 성별 개인순위
	public List<UClubVO> sameSexGdRank(String u_id){
		return sqlSession.selectList("mgl.UClub.sameSexGdRank", u_id);
	}	
	//클럽 같은급수 개인순위
	public List<UClubVO> sameClubGdRank(String u_id){
		return sqlSession.selectList("mgl.UClub.sameClubGdRank", u_id);
	}	
	
	
	
	
	
	

	public ArrayList<ClubVO> getUClubList(String id) {
		return (ArrayList) sqlSession.selectList("mgl.UClub.getUClubList", id);
	}

	public UClubViewDTO getUClubDetaill(HashMap map) {
		return (UClubViewDTO) sqlSession.selectOne("mgl.UClub.getUClubDetaill", map);
	}
}