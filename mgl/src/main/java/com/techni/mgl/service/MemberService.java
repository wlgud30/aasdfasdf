package com.techni.mgl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;

import com.techni.mgl.controller.MemberController;
import com.techni.mgl.dao.MemberDAO;
import com.techni.mgl.domain.MemberVO;
import com.techni.mgl.domain.BoardVO;
import com.techni.mgl.domain.ClubVO;
import com.techni.mgl.dto.LoginDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mDAO;
	@Autowired
	UClubService ucService;
	@Transactional
	public void alarmInsert(HttpSession session, @RequestBody Map<String, Object> param) {

		Map<String, String> map2 = new HashMap<String, String>();

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		System.out.println("먼데");

		String al_division = (String) param.get("al_division");
		String al_send = mvo.getM_id();
		String al_url = (String) param.get("al_url");
		String c_idx = (String) param.get("c_idx");
		String cb_idx = "";
		if (param.get("cb_idx") != null) {
			cb_idx = param.get("cb_idx").toString();
		}
		String cf_idx = "";
		if (param.get("cf_idx") != null) {
			cf_idx = param.get("cf_idx").toString();
		}

		map2.put("al_division", al_division);
		map2.put("al_send", al_send);
		map2.put("al_url", al_url);
		map2.put("c_idx", c_idx);
		map2.put("cb_idx", cb_idx);
		map2.put("cf_idx", cf_idx);

		System.out.println(al_division);

		MemberController mc = new MemberController();
		MultiValueMap<String, String> param1 = new LinkedMultiValueMap<>();

		if (al_division.equals("공지")) {
			List<BoardVO> list = (List<BoardVO>) param.get("list");

			for (BoardVO bvo : list) {
				if (!bvo.getU_id().equals(mvo.getM_id())) {
					map2.put("al_msg", "[" + bvo.getC_nm() + " - 공지] 새로운 글이 등록되었습니다.");
					map2.put("al_receive", bvo.getU_id());
					alarmInsert(map2);
/*
					param1.clear();
					param1.add("sendtype", "push");
					param1.add("appcode", "techni_mglb");
					param1.add("notitype", "noti");
					param1.add("oscode", "a");
					param1.add("token", bvo.getU_push());
					param1.add("title", "민턴in");
					param1.add("desc", "[" + bvo.getC_nm() + " - 공지] 새로운 글이 등록되었습니다.");
					param1.add("dataval",
							"http://mgl.techni.co.kr:8081/Member/PushController.techni?al_idx=" + map2.get("al_idx"));
					mc.token(param1);*/
				}
			}
		} else if (al_division.equals("주요공지")) {
			System.out.println(c_idx);
			List<MemberVO> list = pushList(c_idx);

			for (MemberVO bvo : list) {
				if (!bvo.getM_id().equals(mvo.getM_id())) {
					map2.put("al_msg", "[" + bvo.getC_nm() + "-주요공지] 새로운 글이 등록되었습니다.");
					map2.put("al_receive", bvo.getM_id());
					alarmInsert(map2);

/*					param1.clear();
					param1.add("sendtype", "push");
					param1.add("appcode", "techni_mglb");
					param1.add("notitype", "noti");
					param1.add("oscode", "a");
					param1.add("token", bvo.getM_push());
					param1.add("title", "민턴in");
					param1.add("desc", "[" + bvo.getC_nm() + "-주요공지] 새로운 글이 등록되었습니다.");
					param1.add("dataval",
							"http://mgl.techni.co.kr:8081/Member/PushController.techni?al_idx=" + map2.get("al_idx"));
					System.out.println(map2.get("al_idx"));
					mc.token(param1);*/
				}
			}
		} else if (al_division.equals("클럽게임") || al_division == "클럽게임") {
			List<String> list = (List<String>) param.get("list");
			System.out.println(list);
			System.out.println(param.get("list").toString());
			for (int i = 0; i < list.size(); i++) {
				map2.put("al_msg", "[" + param.get("c_nm") + "-게임] 게임이 등록되었습니다.");
				map2.put("al_receive", list.get(i));
				alarmInsert(map2);
				/*param1.clear();
				param1.add("sendtype", "push");
				param1.add("appcode", "techni_mglb");
				param1.add("notitype", "noti");
				param1.add("oscode", "a");
				param1.add("token", map2.get("u_push"));
				param1.add("title", "민턴in");
				param1.add("desc", "[" + param.get("c_nm") + "-게임] 게임이 등록되었습니다.");
				param1.add("dataval",
						"http://mgl.techni.co.kr:8081/Member/PushController.techni?al_idx=" + map2.get("al_idx"));
				if (param1.get("token").equals("null") || param1.get("token") == null) {

				} else {
					mc.token(param1);
				}*/

			}
		} else if (al_division.equals("채팅")) {

		} else if (al_division.equals("가입대기")) {
			map2.put("al_msg", "[" + ucService.club_nm(c_idx) + "-가입신청] 새로운 가입신청이 있습니다.");
			map2.put("al_receive", param.get("u_id").toString());
			alarmInsert(map2);

			param1.clear();
			param1.add("sendtype", "push");
			param1.add("appcode", "techni_mglb");
			param1.add("notitype", "noti");
			param1.add("oscode", "a");
			param1.add("token", map2.get("u_push"));
			param1.add("title", "민턴in");
			param1.add("desc", "[" + ucService.club_nm(c_idx) + "-가입신청] 새로운 가입신청이 있습니다.");
			param1.add("dataval",
					"http://mgl.techni.co.kr:8081/Member/PushController.techni?al_idx=" + map2.get("al_idx"));
			mc.token(param1);

		} else if (al_division.equals("가입승인")) {
			map2.put("al_msg", "[" + ucService.club_nm(c_idx) + "-가입승인] 클럽에 가입승인 되었습니다.");
			map2.put("al_receive", param.get("u_id").toString());
			alarmInsert(map2);

			param1.clear();
			param1.add("sendtype", "push");
			param1.add("appcode", "techni_mglb");
			param1.add("notitype", "noti");
			param1.add("oscode", "a");
			param1.add("token", map2.get("u_push"));
			param1.add("title", "민턴in");
			param1.add("desc", "[" + param.get("c_nm") + "-가입승인] 클럽에 가입승인 되었습니다.");
			param1.add("dataval","http://mgl.techni.co.kr:8081/Member/PushController.techni?al_idx=" + map2.get("al_idx"));
			mc.token(param1);

			/*List<MemberVO> list = pushList(c_idx);

			for (MemberVO bvo : list) {
				if (!bvo.getM_id().equals(mvo.getM_id())||!bvo.getM_id().equals(param.get("u_id").toString())) {
					map2.put("al_msg", "[" + bvo.getC_nm() + "-공지] 새로운 글이 등록되었습니다.");
					map2.put("al_receive", bvo.getM_id());
					alarmInsert(map2);

					param1.clear();
					param1.add("sendtype", "push");
					param1.add("appcode", "techni_mglb");
					param1.add("notitype", "noti");
					param1.add("oscode", "a");
					param1.add("token", bvo.getM_push());
					param1.add("title", "민턴in");
					param1.add("desc", "[" + bvo.getC_nm() + "-공지] 새로운 글이 등록되었습니다.");
					param1.add("dataval","http://mgl.techni.co.kr:8081/Member/PushController.techni?al_idx=" + map2.get("al_idx"));
					System.out.println(map2.get("al_idx"));
					mc.token(param1);
				}
			}*/
		}

	}

	@Transactional
	public List<MemberVO> pushList(String c_idx) {
		return mDAO.pushList(c_idx);
	}

	// 아이디 중복체크
	@Transactional
	public int idCheck(String m_id) {
		return mDAO.idCheck(m_id);
	}

	// 회원가입
	@Transactional
	public int memberInsert(MemberVO mVO) {
		return mDAO.memberInsert(mVO);
	}

	// 로그인
	@Transactional
	public MemberVO login(Map<String, String> map) {
		return mDAO.login(map);
	}

	// 푸시로그인
	@Transactional
	public MemberVO pushLogin(String m_push) {
		return mDAO.pushLogin(m_push);
	}

	// 시퀀스 증가
	@Transactional
	public int m_join_seq() {
		return mDAO.m_join_seq();
	}

	// 생년월일 전화번호 체크
	@Transactional
	public int birthTelCheck(Map<String, String> map) {
		return mDAO.birthTelCheck(map);
	}

	// 아이디찾기
	@Transactional
	public MemberVO searchID(Map<String, String> map) {
		return mDAO.searchID(map);
	}

	// 푸쉬업데이트
	@Transactional
	public int pushUpdate(Map<String, String> map) {
		return mDAO.pushUpdate(map);
	}

	@Transactional
	public int todayLogin(String m_id) {
		return mDAO.todayLogin(m_id);
	}

	@Transactional
	public int todayLoginInsert(String m_id) {
		return mDAO.todayLoginInsert(m_id);
	}

	@Transactional
	public int guestInsert(Map<String, String> map) {
		if (mDAO.guestInsert(map) > 0) {
			if (mDAO.guestSeq() > 0) {
				return mDAO.m_join_seq();
			}
		}
		return 0;
	}

	public int getLogin(LoginDTO dto) {

		return mDAO.getLogin(dto);
	}

	@Transactional
	public List<MemberVO> clubUpdate() {
		return mDAO.clubupdate();
	}

	@Transactional
	public int clubUpdate2(Map<String, String> map) {
		return mDAO.clubupdate2(map);
	}

	@Transactional
	public MemberVO represent(String u_id) {
		return mDAO.represent(u_id);
	}

	@Transactional
	public int pwReset(String u_id) {
		return mDAO.pwReset(u_id);
	}
	// public boolean getSessionSetting(int cnt, HttpSession session, LoginDTO dto){
	// boolean isLogin = false;
	// if(cnt == 0){
	// }else{
	// session.setMaxInactiveInterval(3600);
	// session.setAttribute("UID", dto.getM_id());
	// isLogin = true;
	// }
	// return isLogin;
	// }

	public ArrayList<ClubVO> getClubList(String lselect) {
		return (ArrayList<ClubVO>) mDAO.getClubList(lselect);
	}

	public void setInsertMember(MemberVO mVO) {
		mDAO.setInsertMember(mVO);
	}

	/*
	 * public ArrayList<MemberVO> getMemberList(HttpSession session) { HashMap map =
	 * new HashMap();
	 * 
	 * String uId = (String) session.getAttribute("UID"); // user id String cidx =
	 * (String) session.getAttribute("CIDX"); // 클럽인덱스
	 * 
	 * map.put("UID", uId); map.put("CIDX", cidx); return (ArrayList<MemberVO>)
	 * mDAO.getMemberList(map); }
	 */

	@Transactional
	public int alarmInsert(Map<String, String> map) {

		int res = mDAO.alarmInsert(map);
		int res2 = 0;

		if (res > 0) {
			res2 = mDAO.alarmSeq();
		}
		return res2;
	}

	@Transactional
	public int alarmYNUpdate(String al_idx) {
		return mDAO.alarmYNUpdate(al_idx);
	}

	@Transactional
	public MemberVO alarmSelect(String al_idx) {
		return mDAO.alarmSelect(al_idx);
	}

	@Transactional
	public List<MemberVO> alarmList(String u_id) {
		return mDAO.alarmList(u_id);
	}

	@Transactional
	public int alarmDel(String al_idx) {
		return mDAO.alarmDel(al_idx);
	}

	@Transactional
	public int alarmDelAll(String u_id) {
		return mDAO.alarmDelAll(u_id);
	}

	@Transactional
	public int alarmCount(String u_id) {
		return mDAO.alarmCount(u_id);
	}
}
