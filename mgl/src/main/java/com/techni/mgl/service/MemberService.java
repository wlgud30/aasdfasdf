package com.techni.mgl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.MemberDAO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.dto.LoginDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mDAO;
	
	//아이디 중복체크
	@Transactional
	public int idCheck(String m_id){
		return mDAO.idCheck(m_id);
	}
	
	//회원가입
	@Transactional
	public int memberInsert(MemberVO mVO){
		return mDAO.memberInsert(mVO);
	}
	
	//로그인
	@Transactional
	public MemberVO login(Map<String,String>map){
		return mDAO.login(map);
	}
	
	//시퀀스 증가
	@Transactional
	public int m_join_seq(){
		return mDAO.m_join_seq();
	}
	
	//생년월일 전화번호 체크
	@Transactional
	public int birthTelCheck(Map<String,String>map){
		return mDAO.birthTelCheck(map);
	}
	//아이디찾기
	@Transactional
	public MemberVO searchID(Map<String,String> map){
		return mDAO.searchID(map);
	}
	//푸쉬업데이트
	@Transactional
	public int pushUpdate(Map<String,String>map){
		return mDAO.pushUpdate(map);
	}
	
	public int getLogin(LoginDTO dto){
			
		return mDAO.getLogin(dto);
	}
	
//	public boolean getSessionSetting(int cnt, HttpSession session, LoginDTO dto){
//		boolean isLogin = false;
//		if(cnt == 0){
//		}else{
//			session.setMaxInactiveInterval(3600);
//			session.setAttribute("UID", dto.getM_id());
//			isLogin = true;
//		}
//		return isLogin;
//	}
	
	public ArrayList<ClubVO> getClubList(String lselect){
		return (ArrayList<ClubVO>) mDAO.getClubList(lselect);
	}
	
	public void setInsertMember(MemberVO mVO){
		mDAO.setInsertMember(mVO);
	}

/*	public ArrayList<MemberVO> getMemberList(HttpSession session) {
		HashMap map = new HashMap();
		
		String uId = (String) session.getAttribute("UID");		// user id
		String cidx = (String) session.getAttribute("CIDX");	// 클럽인덱스
		
		map.put("UID", uId);
		map.put("CIDX", cidx);
		return (ArrayList<MemberVO>) mDAO.getMemberList(map);
	}*/
	
}
