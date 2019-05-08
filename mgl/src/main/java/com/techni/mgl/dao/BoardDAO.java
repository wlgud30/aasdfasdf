package com.techni.mgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	@Resource(name="sqlSession")
	public SqlSessionTemplate sqlSession;
	private String nameSpace="mgl.Board.";
	
	public List<BoardVO> bbsList(Map<String,String> map){
		
		return sqlSession.selectList(nameSpace+"bbsList", map);
	}
	
	public BoardVO bbsDetail(String cb_idx){
		return sqlSession.selectOne(nameSpace+"bbsDetail", cb_idx);
	}
	
	public List<BoardVO> replyList(String cb_idx){
		return sqlSession.selectList(nameSpace+"replyList", cb_idx);
	}
	
	public int bbsInsert(BoardVO bvo){
		return sqlSession.insert(nameSpace+"bbsInsert", bvo);
	}
	
	public int replyInsert(BoardVO bvo){
		return sqlSession.insert(nameSpace+"replyInsert" , bvo);
	}
	
	public int bbsSeq(){
		return sqlSession.update(nameSpace+"bbsSeq");
	}
	
	public int replySeq(){
		return sqlSession.update(nameSpace+"replySeq");
	}
	
	public int bbsHit(){
		return sqlSession.update(nameSpace+"bbsHit");
	}
	
	public int bbsDel(String cb_idx){
		return sqlSession.update(nameSpace+"bbsDel",cb_idx);
	}
	
	public int replyDel(String cr_idx){
		return sqlSession.update(nameSpace+"replyDel", cr_idx);
	}
	
	public int bbsUpdate(BoardVO brdVO){
		return sqlSession.update(nameSpace+"bbsUpdate", brdVO);
	}

	public void setBoardWriteProc(BoardVO brdVO) {
		sqlSession.insert("mgl.Board.setBoardWriteObj", brdVO);
	}
	
	public List<BoardVO> pushList(String c_idx){
		return sqlSession.selectList(nameSpace+"pushList",c_idx);
	}
	
	public int hitInsert(Map<String,String> map){
		return sqlSession.insert(nameSpace+"hitInsert", map);
	}
	
	public int hitUser(Map<String,String> map){
		return sqlSession.selectOne(nameSpace+"hitUser", map);
	}

	public List<BoardVO> getBoardList(String idx, String noticeYn) {
		HashMap map = new HashMap();
		map.put("CIDX", idx);
		map.put("NOTIYN", noticeYn);
		return (List) sqlSession.selectList("mgl.Board.getBoardList", map);
	}

	public BoardVO getBoardDetail(String bIdx) {
		return sqlSession.selectOne("mgl.Board.getBoardDetail", bIdx);
	}
}
