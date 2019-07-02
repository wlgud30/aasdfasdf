package com.techni.mgl.service;

import java.util.ArrayList;
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
import org.springframework.ui.Model;

import com.techni.mgl.dao.ContestDAO;
import com.techni.mgl.dao.MemberDAO;
import com.techni.mgl.domain.CfightVO;
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
	public int createViewTable(Map<String,String> map){
		return ctDAO.createViewTable(map);
	}
	
	@Transactional
	public int createStaffTable(Map<String,String> map){
		return ctDAO.createStaffTable(map);
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
	public int ct_hit(String ct_idx) {
		return ctDAO.ct_hit(ct_idx);
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
		
		String birth_a =(String) json2.get("m_birth_A");
		String birth_b =(String) json2.get("m_birth_B");
		
		if(birth_a.length()==7) {
			if( Integer.parseInt(birth_a.substring(0, 2)) > 39) {
				birth_a = "19"+birth_a;
			}else {
				birth_a = "20"+birth_a;
			}
		}
		if(birth_b.length()==7) {
			if( Integer.parseInt(birth_b.substring(0, 2)) > 39) {
				birth_b = "19"+birth_b;
			}else {
				birth_b = "20"+birth_b;
			}
		}
		
		
		if(json2.get("m_tel_A").equals("")||equals(null)) {
			String u_nm_a = (String) json2.get("m_nm_A");
			map1.put("ct_u_nm", u_nm_a);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			System.out.println("count" + "count");
			if( count > 0) {
				u_nm_a = u_nm_a +count;
			}
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_nm(u_nm_a);
			cvo.setCt_u_birth(birth_a);
			cvo.setCt_u_sex((String) json2.get("m_sex_A"));
			cvo.setCt_u_gd((String) json2.get("kind_gd"));
			cvo.setCt_club_nm((String) json2.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			cvo.setCt_u_id(u_nm_a);
			
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
			String u_nm_a = (String) json2.get("m_nm_A");
			map1.put("ct_u_nm", u_nm_a);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			System.out.println("count" + "count");
			if( count > 0) {
				u_nm_a = u_nm_a +count;
			}
			mvo.setM_id((String) json2.get("m_tel_A"));
			mvo.setM_pw((String) json2.get("m_birth_A"));
			mvo.setM_sex((String) json2.get("m_sex_A"));
			mvo.setM_nm(u_nm_a);
			mvo.setM_tel((String) json2.get("m_tel_A"));
			mvo.setM_birth(birth_a);
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
			cvo.setCt_u_birth(birth_a);
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
			Map<String,String> map = new HashMap<String,String>();
			map.put("m_tel", (String) json2.get("m_tel_A"));
			map.put("m_birth",birth_a);
			int yn = mDAO.birthTelCheck(map);
			int yn2 = 0;
			if(yn == 0 ) {
				int res2 = mDAO.memberInsert(mvo);
				int s_res = mDAO.m_join_seq();
				if(res2>0&&s_res>0) {
					yn2=1;
				}
			}
			
			if(yn>0 || yn2>0){
				res_user_A = ctDAO.contestApplicationAct(cvo);
				user_id_A = cvo.getCt_u_id();
				res_user_seq_A = ctDAO.ct_user_seq(map1);
			}
		}
		
		if(json2.get("m_tel_B").equals("")||equals(null)) {
			String u_nm_b = (String) json2.get("m_nm_B");
			map1.put("ct_u_nm", u_nm_b);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			if( count > 0) {
				u_nm_b = u_nm_b +count;
			}
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_nm(u_nm_b);
			cvo.setCt_u_birth(birth_b);
			cvo.setCt_u_sex((String) json2.get("m_sex_B"));
			cvo.setCt_u_gd((String) json2.get("kind_gd"));
			cvo.setCt_club_nm((String) json2.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			cvo.setCt_u_id(u_nm_b);
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
			String u_nm_b = (String) json2.get("m_nm_B");
			map1.put("ct_u_nm", u_nm_b);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			if( count > 0) {
				u_nm_b = u_nm_b +count;
			}
			mvo.setM_id((String) json2.get("m_tel_B"));
			mvo.setM_pw((String) json2.get("m_birth_B"));
			mvo.setM_sex((String) json2.get("m_sex_B"));
			mvo.setM_nm(u_nm_b);
			mvo.setM_tel((String) json2.get("m_tel_B"));
			mvo.setM_birth(birth_b);
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
			cvo.setCt_u_birth(birth_b);
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
			
			Map<String,String> map = new HashMap<String,String>();
			map.put("m_tel", (String) json2.get("m_tel_B"));
			map.put("m_birth", birth_b);
			int yn = mDAO.birthTelCheck(map);
			int yn2 = 0;
			if(yn == 0 ) {
				int res2 = mDAO.memberInsert(mvo);
				int s_res = mDAO.m_join_seq();
				if(res2>0&&s_res>0) {
					yn2=1;
				}
			}
			
			if(yn>0 || yn2>0){
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
	
	

	
	@Transactional
	public List<ContestVO> selectCtKindName(Map<String,String> map){
		return ctDAO.selectCtKindName(map);
	}
	
	@Transactional
	public void contestEventPlayer(HttpSession session, Model model){
		String ct_idx = (String)session.getAttribute("ct_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		List<ContestVO> ct_k_idx = ctDAO.selectCtKindList(map);
		List<ContestVO> ct_club_nm = ctDAO.selectCtKindList2(map);
		model.addAttribute("ct_k_idx1", ct_k_idx);
		model.addAttribute("ct_club_nm1", ct_club_nm);
	}
	
	@Transactional
	public void contestGroupPlayer(HttpSession session, Model model){
		String ct_idx = (String)session.getAttribute("ct_idx");
		Map<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		List<ContestVO> ct_club_nm = ctDAO.selectCtClubList(map);
		List<ContestVO> ct_k_idx = ctDAO.selectCtClubList2(map);
		model.addAttribute("ct_k_idx2", ct_k_idx);
		model.addAttribute("ct_club_nm2", ct_club_nm);
	}
	
	@Transactional
	public List<ContestVO> selectCtTeamCount(Map<String,String> map){
		return ctDAO.selectCtTeamCount(map); //출전팀, 출전클럽수 가져오기 추가
	}
	
	@Transactional
	public List<ContestVO> feeTeamList(Map<String,String> map){
		return ctDAO.feeTeamList(map);
	}
	
	@Transactional
	public List<ContestVO> feeClubList(Map<String,String> map){
		return ctDAO.feeClubList(map);
	}	
	
	
	@Transactional
	public List<ContestVO> feeClubTeamList(Map<String,Object> map){
		return ctDAO.feeClubTeamList(map);
	}	
	//그룹을 인서트하고 팀에 그룹인덱스를 업데이트한다
	@Transactional
	public int teamGroupUpdate(Map<String,Object> map,Map<String,Object> map2){
		int res = 0;
		
		if(ctDAO.groupInsert(map)>0&&ctDAO.teamGroupUpdate(map2)>0){
			res=1;
		}
		
		return res;
	}
	//그룹인덱스와 그룹에 참여하고있는 팀수 를 리스트로 출력
	@Transactional
	public List<ContestVO> groupIdx(Map<String,String> map){
		return ctDAO.groupIdx(map);
	}
	//그룹인덱스로 사용자 리스트출력
	@Transactional
	public List<ContestVO> groupAll(Map<String,String> map){
		return ctDAO.groupAll(map);
	}
	//종목인덱스로 사용자 리스트출력
	@Transactional
	public List<ContestVO> typeAll(Map<String,String> map){
		return ctDAO.typeAll(map);
	}
	//대진표 인서트
	@Transactional
	public int gameInsert(Map<String,Object>map,Map<String,Object> map2){
		
		int res = ctDAO.gameInsert(map);
		int res2 = 0;
		int res3 = 0;
		int res4 = 0;
		if(res >0){
			res2  = ctDAO.matchListYN((String)map.get("ct_idx"));
		}
		if(res2 >0){
			res3=ctDAO.endGameInsert(map2);
		}
		if(res3>0) {
			res4 = ctDAO.viewInsert(map);
		}
		return res4;
	}
	//엑셀로 유저 인서트
	@Transactional
	public int excelUserInsert(Map<String,String> map) {
		
		Map<String, String> map1 = new HashMap<String, String>();
		MemberVO mvo = new MemberVO();
		ContestVO cvo = new ContestVO();
		String ct_idx = map.get("ct_idx");
		
		int res_user_A = 0;
		int res_user_B = 0;
		int res_user_seq_A = 0;
		int res_user_seq_B = 0;
		int total_res = 0;
		String user_id_A="";
		String user_id_B="";
		String rep_id = "";
		rep_id = map.get("req_id");
		map1.put("ct_idx", ct_idx);
		map1.put("ct_k_nm", map.get("kind_nm"));
		ContestVO ct_k_idx = ctDAO.selectCtTypeIdx(map1);
		
		String birth_a =map.get("m_birth_A");
		String birth_b =map.get("m_birth_B");
		
		if(birth_a.length()==7) {
			if( Integer.parseInt(birth_a.substring(0, 2)) > 39) {
				birth_a = "19"+birth_a;
			}else {
				birth_a = "20"+birth_a;
			}
		}
		if(birth_b.length()==7) {
			if( Integer.parseInt(birth_b.substring(0, 2)) > 39) {
				birth_b = "19"+birth_b;
			}else {
				birth_b = "20"+birth_b;
			}
		}
		
		
		if(map.get("tel_a")==null) {
			String u_nm_a = map.get("m_nm_A");
			map1.put("ct_u_nm", u_nm_a);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			System.out.println("count" + "count");
			if( count > 0) {
				u_nm_a = u_nm_a +count;
			}
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_nm(u_nm_a);
			cvo.setCt_u_birth(birth_a);
			cvo.setCt_u_sex(map.get("m_sex_A"));
			cvo.setCt_u_gd(map.get("kind_gd"));
			cvo.setCt_club_nm(map.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			cvo.setCt_u_id(u_nm_a);
			
			if(cvo.getCt_u_photo()==""){
				if(map.get("m_sex_A").contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			res_user_A = ctDAO.contestApplicationAct2(cvo);
			user_id_A = cvo.getCt_u_id();
			res_user_seq_A = ctDAO.ct_user_seq(map1);
		}else {
			String u_nm_a = map.get("m_nm_A");
			String tel_a = map.get("tel_a");
			map1.put("ct_u_nm", u_nm_a);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			System.out.println("count" + "count");
			if( count > 0) {
				u_nm_a = u_nm_a +count;
				tel_a = tel_a + "_"+count;
			}
			mvo.setM_id(map.get("tel_a"));
			mvo.setM_pw(map.get("m_birth_A"));
			mvo.setM_sex(map.get("m_sex_A"));
			mvo.setM_nm(u_nm_a);
			mvo.setM_tel(map.get("tel_a"));
			mvo.setM_birth(birth_a);
			mvo.setM_tsize("95");
			mvo.setM_photo("");
			mvo.setM_club_gd("무급");
			mvo.setM_city_gd("무급");
			mvo.setM_do_gd("무급");
			mvo.setM_con_gd("무급");
			mvo.setM_club_temp_nm(map.get("m_club_nm"));
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
			cvo.setCt_u_id(tel_a);
			cvo.setCt_u_nm(u_nm_a);
			cvo.setCt_u_birth(birth_a);
			cvo.setCt_u_sex(map.get("m_sex_A"));
			cvo.setCt_u_gd(map.get("kind_gd"));
			cvo.setCt_club_nm(map.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			if(cvo.getCt_u_photo()==""){
				if(cvo.getCt_u_sex().contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			Map<String,String> map2 = new HashMap<String,String>();
			map.put("m_tel", map.get("tel_a"));
			map.put("m_birth",birth_a);
			int yn = mDAO.birthTelCheck(map2);
			int yn2 = 0;
			if(yn == 0 ) {
				if(mDAO.idCheck(map.get("tel_a"))==0) {
					mDAO.memberInsert(mvo);
					mDAO.m_join_seq();
				}
				yn2=1;
			}
			
				res_user_A = ctDAO.contestApplicationAct(cvo);
				user_id_A = tel_a;
				res_user_seq_A = ctDAO.ct_user_seq(map1);
		}
		
		if(map.get("tel_b")==null) {
			String u_nm_b = map.get("m_nm_B");
			map1.put("ct_u_nm", u_nm_b);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			if( count > 0) {
				u_nm_b = u_nm_b +count;
			}
			cvo.setCt_idx(ct_idx);
			cvo.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo.setCt_u_nm(u_nm_b);
			cvo.setCt_u_birth(birth_b);
			cvo.setCt_u_sex(map.get("m_sex_B"));
			cvo.setCt_u_gd(map.get("kind_gd"));
			cvo.setCt_club_nm(map.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			cvo.setCt_u_id(u_nm_b);
			if(cvo.getCt_u_photo()==""){
				if(map.get("m_sex_B").contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			res_user_B = ctDAO.contestApplicationAct2(cvo);
			user_id_B = cvo.getCt_u_id();
			res_user_seq_B = ctDAO.ct_user_seq(map1);
		}else {
			String u_nm_b = map.get("m_nm_B");
			String tel_b = map.get("tel_b");
			map1.put("ct_u_nm", u_nm_b);
			map1.put("ct_k_idx", ct_k_idx.getCt_k_idx());
			int count = ctDAO.countSameName(map1);
			if( count > 0) {
				u_nm_b = u_nm_b +count;
				tel_b = tel_b+"_"+count;
			}
			mvo.setM_id(map.get("tel_b"));
			mvo.setM_pw(map.get("m_birth_B"));
			mvo.setM_sex(map.get("m_sex_B"));
			mvo.setM_nm(u_nm_b);
			mvo.setM_tel(map.get("tel_b"));
			mvo.setM_birth(birth_b);
			mvo.setM_tsize("95");
			mvo.setM_photo("");
			mvo.setM_club_gd("무급");
			mvo.setM_city_gd("무급");
			mvo.setM_do_gd("무급");
			mvo.setM_con_gd("무급");
			mvo.setM_club_temp_nm(map.get("m_club_nm"));
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
			cvo.setCt_u_id(tel_b);
			cvo.setCt_u_nm(u_nm_b);
			cvo.setCt_u_birth(birth_b);
			cvo.setCt_u_sex(map.get("m_sex_B"));
			cvo.setCt_u_gd(map.get("kind_gd"));
			cvo.setCt_club_nm(map.get("m_club_nm"));
			cvo.setCt_u_rep_id(rep_id);
			cvo.setCt_u_photo("");
			if(cvo.getCt_u_photo()==""){
				if(cvo.getCt_u_sex().contains("M")){
					cvo.setCt_u_photo("/resources/img/man_face.svg");
				}else{
					cvo.setCt_u_photo("/resources/img/woman_face.svg");
				}
			}
			
			Map<String,String> map2 = new HashMap<String,String>();
			map.put("m_tel", map.get("tel_b"));
			map.put("m_birth", birth_b);
			int yn = mDAO.birthTelCheck(map2);
			if(yn == 0 ) {
				if(mDAO.idCheck(map.get("tel_b"))==0) {
					mDAO.memberInsert(mvo);
					mDAO.m_join_seq();
				}
				
			}
			
			res_user_B = ctDAO.contestApplicationAct(cvo);
			user_id_B = tel_b;
			res_user_seq_B = ctDAO.ct_user_seq(map1);
			
		}
		if(res_user_A > 0 && res_user_B > 0 && res_user_seq_A > 0 && res_user_seq_B > 0) {
			ContestVO cvo2 = new ContestVO();
			cvo2.setCt_idx(ct_idx);
			cvo2.setCt_k_idx(ct_k_idx.getCt_k_idx());
			cvo2.setCt_g_idx(null);
			cvo2.setCt_club_nm(map.get("m_club_nm"));
			cvo2.setCt_t_user_a(user_id_A);
			cvo2.setCt_t_user_b(user_id_B);
			System.out.println(user_id_A);
			System.out.println(user_id_B);
			System.out.println(cvo2);
			int resTeaminsert = ctDAO.contestTeamInsert(cvo2);
			int resTeamSeq = ctDAO.ct_team_seq(map1);
			if(resTeaminsert > 0 && resTeamSeq > 0) {
				total_res = 1;
			}else {
				total_res = 0;
			}
		}
		return total_res;
	}
	//나의 대진표
	@Transactional
	public List<ContestVO> myMatchList(Map<String,String> map){
		return ctDAO.myMatchList(map);
	}
	//시간 리스트
	@Transactional
	public List<ContestVO> timeMatchList(Map<String,String> map){
		return ctDAO.timeMatchList(map);
	}
	//코트 리스트
	@Transactional
	public List<ContestVO> courtMatchList(Map<String,String> map){
		return ctDAO.courtMatchList(map);
	}
	//코트 매치리스트
	@Transactional
	public List<ContestVO> courtMatchList2(Map<String,String> map){
		return ctDAO.courtMatchList2(map);
	}
	//시간,코트별 대진표 리스트
	@Transactional
	public List<ContestVO> matchList(Map<String,String> map){
		return ctDAO.matchList(map);
	}
	//종목 리스트
	@Transactional
	public List<ContestVO> typeMatchList(Map<String,String> map){
		return ctDAO.typeMatchList(map);
	}
	//종목 디테일
	@Transactional
	public List<ContestVO> typeMatchDetail(Map<String,String> map){
		return ctDAO.typeMatchDetail(map);
	}
	//일정
	@Transactional
	public List<ContestVO> typeDetailList(Map<String,String> map){
		return ctDAO.typeDetailList(map);
	}
	//종목 디테일(랭킹)
	@Transactional
	public List<ContestVO> typeDetailRank(Map<String,String> map){
		return ctDAO.typeDetailRank(map);
	}
	//veiw셀렉트
	@Transactional
	public List<ContestVO> viewSelect(Map<String,String> map){
		return ctDAO.viewSelect(map);
	}
	//코트나시간리스트
	@Transactional
	public List<ContestVO> courtOrTimeList(Map<String,String> map){
		return ctDAO.courtOrTimeList(map);
	}
	//대회 상태 리스트
	@Transactional
	public List<ContestVO> statusList(Map<String,String> map){
		return ctDAO.statusList(map);
	}
	//대회카운트 종료게임 카운트
	@Transactional
	public ContestVO gameCount(Map<String,String>map){
		return ctDAO.gameCount(map);
	}
	//디테일화면 랭킹
	@Transactional
	public List<ContestVO> detailRank(Map<String,String> map){
		return ctDAO.detailRank(map);
	}
	//디테일화면 랭킹
	@Transactional
	public List<ContestVO> detailCalendar(Map<String,String> map){
		return ctDAO.detailCalendar(map);
	}
	//종목리스트
	@Transactional
	public List<ContestVO> selectCtKindList(Map<String,String> map){
		return ctDAO.selectCtKindList(map);
	}
	//그룹리스트
	@Transactional
	public List<ContestVO> groupList(Map<String,String> map){
		return ctDAO.groupList(map);
	}
	@Transactional
	public List<ContestVO> getCount(Map<String,String> map){
		return ctDAO.getCount(map);
	}
	@Transactional
	public List<ContestVO> randomGroupList(Map<String,String> map){
		return ctDAO.randomGroupList(map);
	}
	@Transactional
	public List<ContestVO> winGame(Map<String,String> map){
		return ctDAO.winGame(map);
	}
	@Transactional
	public int fUpdate(Map<String,Object> map1,Map<String,Object> map2) {
		int res =0;
		if(ctDAO.matchEndUpdate(map1) ==1) {
			if(ctDAO.waitUpdate(map2)==1) {
				res = ctDAO.viewUpdate(map2);
			}
		}
		return res;
	}
	@Transactional
	public int pointUpdate(Map<String,Object> map1) {
		int res =0;
		if(ctDAO.pointUpdate(map1) ==1) {
			if(ctDAO.statusUpdate(map1)==1) {
				res = ctDAO.viewScoreUpdate(map1);
			}
		}
		return res;
	}
	
	@Transactional
	public int tournamentUpdate(Map<String,Object> map1) {
		int res =0;
		if(ctDAO.tournamentWaitUpdate(map1) ==1) {
			System.out.println("여긴?");
			if(ctDAO.tournamentViewUpdate(map1)==1) {
				System.out.println("여긴?");
				res = ctDAO.tournamentMatchEndUpdate(map1);
				System.out.println(res);
			}
		}
		return res;
	}
	
	@Transactional
	public int endYn(Map<String,String>map) {
		return ctDAO.endYN(map);
	}
	
	@Transactional
	public ContestVO selectAteam(Map<String,String> map) {
		return ctDAO.selectAteam(map);
	}

	@Transactional
	public ContestVO selectBteam(Map<String,String> map) {
		return ctDAO.selectBteam(map);
	}

	@Transactional
	public ContestVO selectGroup_1st(Map<String,String> map) {
		return ctDAO.selectGroup_1st(map);
	}
	
	@Transactional
	public List<ContestVO> tournamentSelect(Map<String,String> map){
		return ctDAO.tournamentSelect(map);
	}
	
	@Transactional
	public List<ContestVO> courtView(Map<String,String> map){
		return ctDAO.courtView(map);
	}
	
	@Transactional
	public List<ContestVO> rankKindList(Map<String,String> map){
		return ctDAO.rankKindList(map);
	}
	
	@Transactional
	public int leagueEndYN (Map<String,String> map) {
		return ctDAO.leagueEndYN(map);
	}
	
	
	@Transactional
	public List<Object> leagueRank(Map<String,String> map){
		List<Object> List = new ArrayList<Object>();
		int count = ctDAO.leagueRank3st2(map);
		if(count>5&&count<9) {
			ContestVO cvo = ctDAO.leagueRank(map);
			Map<String,String> mapa = new HashMap<String,String>();
			Map<String,String> mapb = new HashMap<String,String>();
			Map<String,String> mapc = new HashMap<String,String>();
			if(Integer.parseInt(cvo.getTeam_a_score())>Integer.parseInt(cvo.getTeam_b_score())) {
				mapa.put("ct_t_nm", cvo.getTeam_a_nm());
				mapa.put("a1_nm", cvo.getA1_nm());
				mapa.put("b1_nm", cvo.getA2_nm());
				List.add(mapa);
				mapb.put("ct_t_nm", cvo.getTeam_b_nm());
				mapb.put("a1_nm", cvo.getB1_nm());
				mapb.put("b1_nm", cvo.getB2_nm());
				List.add(mapb);
				map.put("ct_t_idx", cvo.getTeam_a_idx());
				map.put("ct_g_idx", ctDAO.winGroup(map).getCt_g_idx());
				
				List<ContestVO> cvo3 = ctDAO.fullRank(map);
				mapc.put("ct_t_nm", cvo3.get(1).getCt_t_nm());
				mapc.put("a1_nm", cvo3.get(1).getA1_nm());
				mapc.put("b1_nm", cvo3.get(1).getB1_nm());
				List.add(mapc);
			}else if(Integer.parseInt(cvo.getTeam_a_score())<Integer.parseInt(cvo.getTeam_b_score())) {
				mapb.put("ct_t_nm", cvo.getTeam_b_nm());
				mapb.put("a1_nm", cvo.getB1_nm());
				mapb.put("b1_nm", cvo.getB2_nm());
				List.add(mapb);
				mapa.put("ct_t_nm", cvo.getTeam_a_nm());
				mapa.put("a1_nm", cvo.getA1_nm());
				mapa.put("b1_nm", cvo.getA2_nm());
				List.add(mapa);
				map.put("ct_t_idx", cvo.getTeam_b_idx());
				map.put("ct_g_idx", ctDAO.winGroup(map).getCt_g_idx());
				
				List<ContestVO> cvo3 = ctDAO.fullRank(map);
				mapc.put("ct_t_nm", cvo3.get(1).getCt_t_nm());
				mapc.put("a1_nm", cvo3.get(1).getA1_nm());
				mapc.put("b1_nm", cvo3.get(1).getB1_nm());
				List.add(mapc);
			}
			System.out.println("그룹2개");
		}else if(count>8&&count<12) {
			System.out.println("뽑기전");
			ContestVO cvo = ctDAO.leagueRank(map);
			System.out.println("뽑은후");
			Map<String,String> mapa = new HashMap<String,String>();
			Map<String,String> mapb = new HashMap<String,String>();
			Map<String,String> mapc = new HashMap<String,String>();
			if(Integer.parseInt(cvo.getTeam_a_score())>Integer.parseInt(cvo.getTeam_b_score())) {
				mapa.put("ct_t_nm", cvo.getTeam_a_nm());
				mapa.put("a1_nm", cvo.getA1_nm());
				mapa.put("b1_nm", cvo.getA2_nm());
				List.add(mapa);
				mapb.put("ct_t_nm", cvo.getTeam_b_nm());
				mapb.put("a1_nm", cvo.getB1_nm());
				mapb.put("b1_nm", cvo.getB2_nm());
				List.add(mapb);
				map.put("ct_t_idx", cvo.getTeam_a_idx());
				map.put("ct_t_idx2", cvo.getTeam_b_idx());
				ContestVO cvo3st = ctDAO.leagueRank3st3(map);
				if(cvo.getTeam_a_idx().equals(cvo3st.getTeam_a_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_b_nm());
					mapc.put("a1_nm", cvo3st.getB1_nm());
					mapc.put("b1_nm", cvo3st.getB2_nm());
				}else if(cvo.getTeam_a_idx().equals(cvo3st.getTeam_b_idx())){
					mapc.put("ct_t_nm", cvo3st.getTeam_a_nm());
					mapc.put("a1_nm", cvo3st.getA1_nm());
					mapc.put("b1_nm", cvo3st.getA2_nm());
				}else if(cvo.getTeam_b_idx().equals(cvo3st.getTeam_a_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_b_nm());
					mapc.put("a1_nm", cvo3st.getB1_nm());
					mapc.put("b1_nm", cvo3st.getB2_nm());
				}else if(cvo.getTeam_b_idx().equals(cvo3st.getTeam_b_idx())){
					mapc.put("ct_t_nm", cvo3st.getTeam_a_nm());
					mapc.put("a1_nm", cvo3st.getA1_nm());
					mapc.put("b1_nm", cvo3st.getA2_nm());
				}
				
				List.add(mapc);
				
			}else if(Integer.parseInt(cvo.getTeam_a_score())<Integer.parseInt(cvo.getTeam_b_score())) {
				mapb.put("ct_t_nm", cvo.getTeam_b_nm());
				mapb.put("a1_nm", cvo.getB1_nm());
				mapb.put("b1_nm", cvo.getB2_nm());
				List.add(mapb);
				mapa.put("ct_t_nm", cvo.getTeam_a_nm());
				mapa.put("a1_nm", cvo.getA1_nm());
				mapa.put("b1_nm", cvo.getA2_nm());
				List.add(mapa);
				map.put("ct_t_idx", cvo.getTeam_a_idx());
				map.put("ct_t_idx2", cvo.getTeam_b_idx());
				ContestVO cvo3st = ctDAO.leagueRank3st3(map);
				if(cvo.getTeam_b_idx().equals(cvo3st.getTeam_a_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_b_nm());
					mapc.put("a1_nm", cvo3st.getB1_nm());
					mapc.put("b1_nm", cvo3st.getB2_nm());
				}else if(cvo.getTeam_b_idx().equals(cvo3st.getTeam_b_idx())){
					mapc.put("ct_t_nm", cvo3st.getTeam_a_nm());
					mapc.put("a1_nm", cvo3st.getA1_nm());
					mapc.put("b1_nm", cvo3st.getA2_nm());
				}else if(cvo.getTeam_a_idx().equals(cvo3st.getTeam_a_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_b_nm());
					mapc.put("a1_nm", cvo3st.getB1_nm());
					mapc.put("b1_nm", cvo3st.getB2_nm());
				}else if(cvo.getTeam_a_idx().equals(cvo3st.getTeam_b_idx())){
					mapc.put("ct_t_nm", cvo3st.getTeam_a_nm());
					mapc.put("a1_nm", cvo3st.getA1_nm());
					mapc.put("b1_nm", cvo3st.getA2_nm());
				}
				List.add(mapc);
			}
			System.out.println("그룹3개");
		}else if(map.get("kind").equals("풀리그")) {
			List<ContestVO> list2 = ctDAO.fullRank(map);
			Map<String,String> mapa = new HashMap<String,String>();
			Map<String,String> mapb = new HashMap<String,String>();
			Map<String,String> mapc = new HashMap<String,String>();
			mapa.put("ct_t_nm", list2.get(0).getCt_t_nm());
			mapa.put("a1_nm", list2.get(0).getA1_nm());
			mapa.put("b1_nm", list2.get(0).getB1_nm());
			List.add(mapa);
			mapb.put("ct_t_nm", list2.get(1).getCt_t_nm());
			mapb.put("a1_nm", list2.get(1).getA1_nm());
			mapb.put("b1_nm", list2.get(1).getB1_nm());
			List.add(mapb);
			mapc.put("ct_t_nm", list2.get(2).getCt_t_nm());
			mapc.put("a1_nm", list2.get(2).getA1_nm());
			mapc.put("b1_nm", list2.get(2).getB1_nm());
			List.add(mapc);
		}else if(map.get("kind").equals("결승")) {
			System.out.println("뽑기전");
			ContestVO cvo = ctDAO.leagueRank(map);
			System.out.println("뽑은후");
			Map<String,String> mapa = new HashMap<String,String>();
			Map<String,String> mapb = new HashMap<String,String>();
			Map<String,String> mapc = new HashMap<String,String>();
			if(Integer.parseInt(cvo.getTeam_a_score())>Integer.parseInt(cvo.getTeam_b_score())) {
				mapa.put("ct_t_nm", cvo.getTeam_a_nm());
				mapa.put("a1_nm", cvo.getA1_nm());
				mapa.put("b1_nm", cvo.getA2_nm());
				List.add(mapa);
				mapb.put("ct_t_nm", cvo.getTeam_b_nm());
				mapb.put("a1_nm", cvo.getB1_nm());
				mapb.put("b1_nm", cvo.getB2_nm());
				List.add(mapb);
				map.put("ct_t_idx", cvo.getTeam_a_idx());
				ContestVO cvo3st = ctDAO.leagueRank3st(map);
				if(cvo3st.getTeam_a_idx().equals(cvo.getTeam_a_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_b_nm());
					mapc.put("a1_nm", cvo3st.getB1_nm());
					mapc.put("b1_nm", cvo3st.getB2_nm());
					List.add(mapc);
				}else if(cvo3st.getTeam_b_idx().equals(cvo.getTeam_a_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_a_nm());
					mapc.put("a1_nm", cvo3st.getA1_nm());
					mapc.put("b1_nm", cvo3st.getA2_nm());
					List.add(mapc);
				}
			}else if(Integer.parseInt(cvo.getTeam_a_score())<Integer.parseInt(cvo.getTeam_b_score())) {
				mapb.put("ct_t_nm", cvo.getTeam_b_nm());
				mapb.put("a1_nm", cvo.getB1_nm());
				mapb.put("b1_nm", cvo.getB2_nm());
				List.add(mapb);
				mapa.put("ct_t_nm", cvo.getTeam_a_nm());
				mapa.put("a1_nm", cvo.getA1_nm());
				mapa.put("b1_nm", cvo.getA2_nm());
				List.add(mapa);
				map.put("ct_t_idx", cvo.getTeam_b_idx());
				ContestVO cvo3st = ctDAO.leagueRank3st(map);
				if(cvo3st.getTeam_a_idx().equals(cvo.getTeam_b_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_b_nm());
					mapc.put("a1_nm", cvo3st.getB1_nm());
					mapc.put("b1_nm", cvo3st.getB2_nm());
					List.add(mapc);
				}else if(cvo3st.getTeam_b_idx().equals(cvo.getTeam_b_idx())) {
					mapc.put("ct_t_nm", cvo3st.getTeam_a_nm());
					mapc.put("a1_nm", cvo3st.getA1_nm());
					mapc.put("b1_nm", cvo3st.getA2_nm());
					List.add(mapc);
				}
			}
		}
		
		//필요한것 c_idx , 그룹인덱스(풀리그),그룹인덱스(본선리그),승리팀인덱스,종목이름
		
		
		return List;
	}
	//웹 확정 대진표
	@Transactional
	public List<ContestVO> selectDesideMatchList(Map<String, String> map) {
		
		return ctDAO.selectDesideMatchList(map);
	}
	
	//대회 상태별 대진표(대기 or 종료)
	@Transactional
	public List<ContestVO> selectStatusMatchList(Map<String, String> map) {
		
		return ctDAO.selectStatusMatchList(map);
	}

	public ContestVO selectGameInfo(Map<String, String> map) {
		
		return ctDAO.selectGameInfo(map);
	}	
	@Transactional
	public int leagueEndYN2 (Map<String,String> map) {
		return ctDAO.leagueEndYN2(map);
	}
}
