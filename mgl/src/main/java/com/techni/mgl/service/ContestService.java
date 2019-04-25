package com.techni.mgl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.ContestDAO;
import com.techni.mgl.dao.MemberDAO;
import com.techni.mgl.domain.ContestVO;
import com.techni.mgl.domain.MemberVO;

@Service
public class ContestService {
	
	@Autowired
	public ContestDAO ctDAO;
	@Autowired
	public MemberDAO mDAO;
	
	@Transactional
	public int contestInsert(Map<String,String> map1){
		
		int res = 0; 
		if(ctDAO.contestInsert(map1) > 0){
			res = ctDAO.ct_seq();
		}
		return res;
	}
	
	@Transactional
	public int createKindTable(Map<String,String> map){
		return ctDAO.createKindTable(map);
	}
	
	@Transactional
	public int createGroupTable(Map<String,String> map){
		return ctDAO.createGroupTable(map);
	}
	
	@Transactional
	public int createTeamTable(Map<String,String> map){
		return ctDAO.createTeamTable(map);
	}
	
	@Transactional
	public int createUserTable(Map<String,String> map){
		return ctDAO.createUserTable(map);
	}
	
	@Transactional
	public int createWaitTable(Map<String,String> map){
		return ctDAO.createWaitTable(map);
	}
	
	@Transactional
	public int createMatchEndTable(Map<String,String> map){
		return ctDAO.createMatchEndTable(map);
	}
	
	@Transactional
	public int createSeqTable(Map<String,String> map){
		return ctDAO.createMatchEndTable(map);
	}
	
	@Transactional
	public int contestKindInsert(Map<String, Object> map){
		return ctDAO.contestKindInsert(map);
	}
	
	@Transactional
	public int insertSeq(Map<String, Object> map){
		return ctDAO.insertSeq(map);
	}
	
	@Transactional
	public ContestVO selectCt(String ct_idx){
		return ctDAO.selectCt(ct_idx);
	}
	
	@Transactional
	public List<ContestVO> selectCtIngList(){
		return ctDAO.selectCtIngList();
	}
	
	@Transactional
	public List<ContestVO> selectCtPreList(){
		return ctDAO.selectCtPreList();
	}
	
	@Transactional
	public List<ContestVO> selectCtLastList(){
		return ctDAO.selectCtLastList();
	}
	
	@Transactional
	public int contestApplicationAct(HttpSession session, String json) throws ParseException{
		JSONParser parser = new JSONParser();
		JSONObject json2 = (JSONObject) parser.parse(json);
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		Map<String, String> map3 = new HashMap<String, String>();
		MemberVO mvo = new MemberVO();
		ContestVO cvo = new ContestVO();
		String ct_idx = (String)session.getAttribute("ct_idx");
		MemberVO login = (MemberVO) session.getAttribute("login");
		int res_user_A = 0;
		int res_user_B = 0;
		int res_user_seq_A = 0;
		int res_user_seq_B = 0;
		int total_res = 0;
		String user_id_A="";
		String user_id_B="";
		String rep_id = "";
		if(login != null) {
			rep_id = login.getM_id();
		}
		map1.put("ct_idx", ct_idx);
		map1.put("ct_k_nm", (String)json2.get("kind_nm"));
		ContestVO ct_k_idx = ctDAO.selectCtTypeIdx(map1);
		
		map2.put("m_tel", (String)json2.get("m_tel_A"));
        map2.put("m_birth", (String)json2.get("m_birth_A"));
        int res = mDAO.birthTelCheck(map2);
        if(res > 0) {
			return total_res = 2;
		}
        map3.put("m_tel", (String)json2.get("m_tel_B"));
        map3.put("m_birth", (String)json2.get("m_birth_B"));
		int res1 = mDAO.birthTelCheck(map3);
		if(res1 > 0) {
			return total_res = 3;
		}
		
		if(json2.get("m_tel_A").equals("")||equals(null)) {
			String u_nm_a = (String) json2.get("m_nm_A");
			int count = ctDAO.countSameName(u_nm_a);
			if( count > 0) {
				u_nm_a = u_nm_a +count;
			}
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_nm(u_nm_a);
			cvo.setCt_u_birth((String) json2.get("m_birth_A"));
			cvo.setCt_u_sex((String) json2.get("m_sex_A"));
			cvo.setCt_u_gd((String) json2.get("kind_gd"));
			cvo.setCt_club_nm((String) json2.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			if(cvo.getCt_u_photo()==""){
				if(cvo.getCt_u_sex().contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			res_user_A = ctDAO.contestApplicationAct2(cvo);
			user_id_A = cvo.getCt_u_id();
			res_user_seq_A = ctDAO.ct_user_seq(map1);
		}else {
			mvo.setM_id((String) json2.get("m_tel_A"));
			mvo.setM_pw((String) json2.get("m_birth_A"));
			mvo.setM_sex((String) json2.get("m_sex_A"));
			mvo.setM_nm((String) json2.get("m_nm_A"));
			mvo.setM_tel((String) json2.get("m_tel_A"));
			mvo.setM_birth((String) json2.get("m_birth_A"));
			mvo.setM_tsize("95");
			mvo.setM_photo("");
			mvo.setM_club_gd("무급");
			mvo.setM_city_gd("무급");
			mvo.setM_do_gd("무급");
			mvo.setM_con_gd("무급");
			mvo.setM_club_temp_nm((String) json2.get("m_club_nm"));
			mvo.setM_user_temp_yn("Y");
			if(mvo.getM_photo()==""){
				if(mvo.getM_sex().contains("M")){
					mvo.setM_photo("/resources/img/man_face.svg");
				}else{
					mvo.setM_photo("/resources/img/woman_face.svg");
				}
			}
			
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_id((String) json2.get("m_tel_A"));
			cvo.setCt_u_nm((String) json2.get("m_nm_A"));
			cvo.setCt_u_birth((String) json2.get("m_birth_A"));
			cvo.setCt_u_sex((String) json2.get("m_sex_A"));
			cvo.setCt_u_gd((String) json2.get("kind_gd"));
			cvo.setCt_club_nm((String) json2.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			if(cvo.getCt_u_photo()==""){
				if(cvo.getCt_u_sex().contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			int res2 = mDAO.memberInsert(mvo);
			int s_res = mDAO.m_join_seq();
			if(res2 > 0 && s_res > 0){
				res_user_A = ctDAO.contestApplicationAct(cvo);
				user_id_A = cvo.getCt_u_id();
				res_user_seq_A = ctDAO.ct_user_seq(map1);
			}
		}
		
		if(json2.get("m_tel_B").equals("")||equals(null)) {
			String u_nm_b = (String) json2.get("m_nm_B");
			int count = ctDAO.countSameName(u_nm_b);
			if( count > 0) {
				u_nm_b = u_nm_b +count;
			}
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_nm(u_nm_b);
			cvo.setCt_u_birth((String) json2.get("m_birth_B"));
			cvo.setCt_u_sex((String) json2.get("m_sex_B"));
			cvo.setCt_u_gd((String) json2.get("kind_gd"));
			cvo.setCt_club_nm((String) json2.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			if(cvo.getCt_u_photo()==""){
				if(cvo.getCt_u_sex().contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			res_user_B = ctDAO.contestApplicationAct2(cvo);
			user_id_B = cvo.getCt_u_id();
			res_user_seq_B = ctDAO.ct_user_seq(map1);
		}else {
			mvo.setM_id((String) json2.get("m_tel_B"));
			mvo.setM_pw((String) json2.get("m_birth_B"));
			mvo.setM_sex((String) json2.get("m_sex_B"));
			mvo.setM_nm((String) json2.get("m_nm_B"));
			mvo.setM_tel((String) json2.get("m_tel_B"));
			mvo.setM_birth((String) json2.get("m_birth_B"));
			mvo.setM_tsize("95");
			mvo.setM_photo("");
			mvo.setM_club_gd("무급");
			mvo.setM_city_gd("무급");
			mvo.setM_do_gd("무급");
			mvo.setM_con_gd("무급");
			mvo.setM_club_temp_nm((String) json2.get("m_club_nm"));
			mvo.setM_user_temp_yn("Y");
			if(mvo.getM_photo()==""){
				if(mvo.getM_sex().contains("M")){
					mvo.setM_photo("/resources/img/man_face.svg");
				}else{
					mvo.setM_photo("/resources/img/woman_face.svg");
				}
			}
			
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_id((String) json2.get("m_tel_B"));
			cvo.setCt_u_nm((String) json2.get("m_nm_B"));
			cvo.setCt_u_birth((String) json2.get("m_birth_B"));
			cvo.setCt_u_sex((String) json2.get("m_sex_B"));
			cvo.setCt_u_gd((String) json2.get("kind_gd"));
			cvo.setCt_club_nm((String) json2.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			if(cvo.getCt_u_photo()==""){
				if(cvo.getCt_u_sex().contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			int res2 = mDAO.memberInsert(mvo);
			int s_res = mDAO.m_join_seq();
			if(res2 > 0 && s_res > 0){
				res_user_B = ctDAO.contestApplicationAct(cvo);
				user_id_B = cvo.getCt_u_id();
				res_user_seq_B = ctDAO.ct_user_seq(map1);
			}
			
		}
		if(res_user_A > 0 && res_user_B > 0 && res_user_seq_A > 0 && res_user_seq_B > 0) {
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_g_idx(null);
			cvo.setCt_club_nm((String)json2.get("m_club_nm"));
			cvo.setCt_t_user_a(user_id_A);
			cvo.setCt_t_user_b(user_id_B);
			int resTeaminsert = ctDAO.contestTeamInsert(cvo);
			int resTeamSeq = ctDAO.ct_team_seq(map1);
			if(resTeaminsert > 0 && resTeamSeq > 0) {
				total_res = 1;
			}else {
				total_res = 0;
			}
		}
		return total_res;
	}
	
	//광고리스트
	public List<ContestVO> contestAdList(){
		return ctDAO.contestAdList();
	}
	
}
