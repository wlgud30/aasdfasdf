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
	public int countSameName(String ct_u_nm) {
		return sqlSession_ct.selectOne(nameSpace+"countSameName", ct_u_nm);
	}
	
	public List<ContestVO> contestAdList(){
		return sqlSession_ct.selectList(nameSpace+"contestAdList");
	}
}
