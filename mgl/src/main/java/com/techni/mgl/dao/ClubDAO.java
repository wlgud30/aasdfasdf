package com.techni.mgl.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techni.mgl.domain.ClubVO;

@Repository
public class ClubDAO {
	

	@Autowired
	public SqlSessionTemplate sqlSession;
	private String nameSpace="mgl.Club.";
	
	//클럽 생성
	public int insert(ClubVO cvo){
		int res = sqlSession.insert(nameSpace+"insert", cvo);
		return res;
		
	}
	//디테일
	public List<ClubVO> selectOne(Map<String,String> map){
		List<ClubVO> cvo = sqlSession.selectList(nameSpace+"selectOne",map);
		return cvo;
	}
	//디테일초이스
	public int detailChoice(Map<String,String> map){
		int res = sqlSession.selectOne(nameSpace+"detailChoice", map);
		return res;
	}
	//클럽업데이트 페이지
	public ClubVO selectOneClub(String c_idx){
		return sqlSession.selectOne(nameSpace+"selectOneClub",c_idx);
	}
	//클럽삭제
	public int clubDel(String c_idx){
		return sqlSession.update(nameSpace+"clubDel",c_idx);
	}
	

}
