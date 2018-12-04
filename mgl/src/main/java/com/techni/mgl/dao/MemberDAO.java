package com.techni.mgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.dto.LoginDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	private String nameSpace="mgl.Member.";
	
	//아이디 중복체크
	public int idCheck(String m_id){
		
		int res = sqlSession.selectOne(nameSpace+ "idCheck", m_id);
		
		return res;
	}
	
	//맴버 시퀀스 증가
	public int m_join_seq(){
		int res=sqlSession.update(nameSpace+"m_joinSeq");
		
		return res;
	}
	
	//회원가입
	public int memberInsert(MemberVO mVO){
		
		int res = sqlSession.insert(nameSpace+ "insert", mVO);
		
		return res;
	}
	//생년월일 전화번호 체크
	public int birthTelCheck(Map<String,String> map){
		return sqlSession.selectOne(nameSpace+"birthTelCheck", map);
	}
	//아이디찾기
	public MemberVO searchID(Map<String,String> map){
		return sqlSession.selectOne(nameSpace+"searchID", map);
	}
	//푸쉬업데이트
	public int pushUpdate(Map<String,String>map){
		return sqlSession.update(nameSpace+"pushUpdate", map);
	}
	
	public MemberVO login(Map<String,String> map){
		MemberVO res = sqlSession.selectOne(nameSpace+"login", map);
		return res;
	}
	
	public int getLogin(LoginDTO dto){
			return sqlSession.selectOne("mgl.Member.getLogin", dto);
	}
	
	public void setInsertMember(MemberVO mVO){
		sqlSession.insert("mgl.Member.setInsertMember", mVO);
	}
	
	public ArrayList<ClubVO> getClubList(String lselect){
		return (ArrayList) sqlSession.selectList("mgl.Member.getClubList", lselect);
	}

	public ArrayList getMemberList(HashMap map) {
		return (ArrayList) sqlSession.selectList("mgl.Member.getMemberList", map);
	}
}
