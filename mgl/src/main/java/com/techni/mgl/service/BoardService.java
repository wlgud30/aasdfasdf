package com.techni.mgl.service;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.BoardDAO;
import com.techni.mgl.domain.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	public BoardDAO brdDAO; 
	
	//게시글리스트
	@Transactional
	public List<BoardVO> bbsList(Map<String,String> map){
		return brdDAO.bbsList(map);
	}
	
	//게시글 디테일(조회수증가)
	@Transactional
	public BoardVO bbsDetail(String cb_idx){
				/*brdDAO.bbsHit(cb_idx);*/
			return brdDAO.bbsDetail(cb_idx);
	}
	
	//댓글리스트
	@Transactional
	public List<BoardVO> replyList(String cb_idx){
		return brdDAO.replyList(cb_idx);
	}
	
	//게시글 생성
	@Transactional
	public int bbsInsert(BoardVO bvo){
		int res = brdDAO.bbsInsert(bvo);
		int res2 = 0;
		if(res > 0){
			res2 = brdDAO.bbsSeq();
		}
		return res2;
	}
	
	//댓글 생성
	@Transactional
	public int replyInsert(BoardVO bvo){
		int res = brdDAO.replyInsert(bvo);
		int res2 = 0;
		if(res > 0){
			res2 = brdDAO.replySeq();
		}
		return res2;
	}
	
	//게시글삭제
	@Transactional
	public int bbsDel(String cb_idx){
		return brdDAO.bbsDel(cb_idx);
	}
	
	//댓글삭제
	@Transactional
	public int replyDel(String cr_idx){
		return brdDAO.replyDel(cr_idx);
	}
	
	//게시글 수정
	@Transactional
	public int bbsUpdate(BoardVO brdVO){
		return brdDAO.bbsUpdate(brdVO);
	}
	
	//푸쉬리스트
	@Transactional
	public List<BoardVO> pushList(String c_idx){
		return brdDAO.pushList(c_idx);
	}
	
	//조회수 게시판에 인서트
	@Transactional
	public int hitInsert(Map<String,String> map){
		brdDAO.bbsHit();
		return brdDAO.hitInsert(map);
	}
	//내가 해당게시글을 봤는지 확인하는 쿼리
	@Transactional
	public int hitUser(Map<String,String> map){
		return brdDAO.hitUser(map);
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
	
	public void setBoardWriteProc(HttpSession session, BoardVO brdVO) {
		brdDAO.setBoardWriteProc(brdVO);
	}
	
	public List<BoardVO> getBoardList(String idx,  String noticeYn) {
		return (List<BoardVO>) brdDAO.getBoardList(idx, noticeYn);
	}
	
	public BoardVO getBoardDetail(String bIdx) {
		return brdDAO.getBoardDetail(bIdx);
	}
	
}