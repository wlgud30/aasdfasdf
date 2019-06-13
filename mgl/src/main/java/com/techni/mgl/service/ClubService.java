package com.techni.mgl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.ClubDAO;
import com.techni.mgl.domain.ClubVO;

@Service
public class ClubService {

	@Autowired
	public ClubDAO dao;
	
	
	//클럽생성
	@Transactional
	public int clubInsert(ClubVO cvo){
		return dao.insert(cvo);
	}
	//클럽 디테일
	@Transactional
	public List<ClubVO> selectOne(Map<String,String> map){
		return dao.selectOne(map);
	}
	//디테일초이스
	@Transactional
	public int detailChoice(Map<String,String> map){
		return dao.detailChoice(map);
	}
	//클럽업데이트 화면
	@Transactional
	public ClubVO selectOneClub(String c_idx){
		return dao.selectOneClub(c_idx);
	}
	//클럽 삭제
	@Transactional
	public int clubDel(String c_idx){
		return dao.clubDel(c_idx);
	}
	//클럽중복체크
	@Transactional
	public int clubChcek(String c_nm) {
		return dao.clubCheck(c_nm);
	}
}
