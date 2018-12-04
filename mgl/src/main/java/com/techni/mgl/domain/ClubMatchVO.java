package com.techni.mgl.domain;

import java.util.List;

public class ClubMatchVO {

	private String cm_idx; // MLG_CLUB_MATCH_IDX 매치 인덱스
	private String c_idx; // MGL_CLUB_IDX 클럽 인덱스
	private int cm_cnt; // MGL_CLUB_MATCH_CNT 매치 회차
	private String cm_endyn; // MGL_CLUB_MATCH_ENDYN 종료여부
	private String s_coat; // MGL_STADIUM_COAT 경기장 사용코트
	private String u_id; // MGL_USER_ID 사용자 id
	private String cm_team_ab; // MGL_CLUB_TEAM_AB 배치된 팀
	private String cm_date; // MGL_CLUB_MATCH_DATE 경기 날짜
	private String uc_grade_cd; // MGL_UCLUB_GRADE_CD 사용자 급수
	private String cm_age_group; // MGL_CLUB_MATCH_AGE_GROUP 사용자 연령대
	private int cm_age_group_ptn; // MGL_CLUB_MATCH_AGE_GROUP_PTN 연령대별 포인트
	private float cm_ueffort; // MGL_CLUB_MATCH_UEFORT 개인 손실공력
	private float cm_teffort; // MGL_CLUB_MATCH_TEFFORT 팀 손실공력
	private float cm_gptn; // MGL_CLUB_MATCH_GPTN 게임 포인트
	private float cm_vptn; // MGL_CLUB_MATCH_VPTN 우승 포인트
	private float cm_pptn; // MGL_CLUB_MATCH_PPTN 점수 포인트
	private float cm_aptn; // MGL_CLUB_MATCH_APTN 적용 포인트
	private float cm_teamptn; // MGL_CLUB_MATCH_TEAMPTN 팀 포인트
	private String cm_win; // MGL_CLUB_MATCH_WIN 매치승패
	private String cm_start; // MGL_CLUB_MATCH_START 시작시간
	private String cm_end; // MGL_CLUB_MATCH_END 종료시간
	private int cm_total; // MGL_CLUB_MATCH_TOTAL 최종점수
	private String cm_regdate; // MGL_CLUB_MATCH_REGDATE 등록일
	public int cm_gc;
	public int cm_wc;
	public String c_court_sa;
	public int c_court_su;
	public String cm_a1_id;
	public String cm_a2_id;
	public String cm_b1_id;
	public String cm_b2_id;
	public String cm_a1_nm;
	public String cm_a2_nm;
	public String cm_b1_nm;
	public String cm_b2_nm;
	public int cm_order;
	public String cm_status;
	public String u_status;
	public String c_nm;
	public String c_gidx;
	public int u_age;
	public String u_ageG;
	public String u_sex;
	public String u_club_gd;
	public double u_gr;
	public String cm_match_date;
	public String teamAB;
	public String cs_coat;
	public int cm_sc_gap;
	public double cm_gp;
	public double cm_vp;
	public double cm_pp;
	public double cm_ap;
	public String cm_match_start;
	public String cm_match_end;
	public String u_nm;
	public String u_photo;
	public String cm_ymd;
	public String cm_a1_photo;
	public String cm_a2_photo;
	public String cm_b1_photo;
	public String cm_b2_photo;
	public String cm_gidx_c;
	
	

	public String getCm_gidx_c() {
		return cm_gidx_c;
	}

	public void setCm_gidx_c(String cm_gidx_c) {
		this.cm_gidx_c = cm_gidx_c;
	}

	public String getCm_a1_photo() {
		return cm_a1_photo;
	}

	public void setCm_a1_photo(String cm_a1_photo) {
		this.cm_a1_photo = cm_a1_photo;
	}

	public String getCm_a2_photo() {
		return cm_a2_photo;
	}

	public void setCm_a2_photo(String cm_a2_photo) {
		this.cm_a2_photo = cm_a2_photo;
	}

	public String getCm_b1_photo() {
		return cm_b1_photo;
	}

	public void setCm_b1_photo(String cm_b1_photo) {
		this.cm_b1_photo = cm_b1_photo;
	}

	public String getCm_b2_photo() {
		return cm_b2_photo;
	}

	public void setCm_b2_photo(String cm_b2_photo) {
		this.cm_b2_photo = cm_b2_photo;
	}

	public String getCm_ymd() {
		return cm_ymd;
	}

	public void setCm_ymd(String cm_ymd) {
		this.cm_ymd = cm_ymd;
	}

	public String getU_photo() {
		return u_photo;
	}

	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}

	public String getU_nm() {
		return u_nm;
	}

	public void setU_nm(String u_nm) {
		this.u_nm = u_nm;
	}

	public String getU_ageG() {
		return u_ageG;
	}

	public void setU_ageG(String u_ageG) {
		this.u_ageG = u_ageG;
	}

	public String getCm_match_date() {
		return cm_match_date;
	}

	public void setCm_match_date(String cm_match_date) {
		this.cm_match_date = cm_match_date;
	}

	public String getTeamAB() {
		return teamAB;
	}

	public void setTeamAB(String teamAB) {
		this.teamAB = teamAB;
	}

	public String getCs_coat() {
		return cs_coat;
	}

	public void setCs_coat(String cs_coat) {
		this.cs_coat = cs_coat;
	}

	public int getCm_sc_gap() {
		return cm_sc_gap;
	}

	public void setCm_sc_gap(int cm_sc_gap) {
		this.cm_sc_gap = cm_sc_gap;
	}

	public double getCm_gp() {
		return cm_gp;
	}

	public void setCm_gp(double cm_gp) {
		this.cm_gp = cm_gp;
	}

	public double getCm_vp() {
		return cm_vp;
	}

	public void setCm_vp(double cm_vp) {
		this.cm_vp = cm_vp;
	}

	public double getCm_pp() {
		return cm_pp;
	}

	public void setCm_pp(double cm_pp) {
		this.cm_pp = cm_pp;
	}

	public double getCm_ap() {
		return cm_ap;
	}

	public void setCm_ap(double cm_ap) {
		this.cm_ap = cm_ap;
	}

	public String getCm_match_start() {
		return cm_match_start;
	}

	public void setCm_match_start(String cm_match_start) {
		this.cm_match_start = cm_match_start;
	}

	public String getCm_match_end() {
		return cm_match_end;
	}

	public void setCm_match_end(String cm_match_end) {
		this.cm_match_end = cm_match_end;
	}

	public double getU_gr() {
		return u_gr;
	}

	public void setU_gr(double u_gr) {
		this.u_gr = u_gr;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getU_age() {
		return u_age;
	}

	public void setU_age(int u_age) {
		this.u_age = u_age;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public String getU_club_gd() {
		return u_club_gd;
	}

	public void setU_club_gd(String u_club_gd) {
		this.u_club_gd = u_club_gd;
	}

	public String getC_gidx() {
		return c_gidx;
	}

	public void setC_gidx(String c_gidx) {
		this.c_gidx = c_gidx;
	}

	public String getC_nm() {
		return c_nm;
	}

	public void setC_nm(String c_nm) {
		this.c_nm = c_nm;
	}

	public String getCm_a1_nm() {
		return cm_a1_nm;
	}

	public void setCm_a1_nm(String cm_a1_nm) {
		this.cm_a1_nm = cm_a1_nm;
	}

	public String getCm_a2_nm() {
		return cm_a2_nm;
	}

	public void setCm_a2_nm(String cm_a2_nm) {
		this.cm_a2_nm = cm_a2_nm;
	}

	public String getCm_b1_nm() {
		return cm_b1_nm;
	}

	public void setCm_b1_nm(String cm_b1_nm) {
		this.cm_b1_nm = cm_b1_nm;
	}

	public String getCm_b2_nm() {
		return cm_b2_nm;
	}

	public void setCm_b2_nm(String cm_b2_nm) {
		this.cm_b2_nm = cm_b2_nm;
	}

	public String getU_status() {
		return u_status;
	}

	public void setU_status(String u_status) {
		this.u_status = u_status;
	}

	public int getCm_order() {
		return cm_order;
	}

	public void setCm_order(int cm_order) {
		this.cm_order = cm_order;
	}

	public String getCm_status() {
		return cm_status;
	}

	public void setCm_status(String cm_status) {
		this.cm_status = cm_status;
	}

	public String getCm_a1_id() {
		return cm_a1_id;
	}

	public void setCm_a1_id(String cm_a1_id) {
		this.cm_a1_id = cm_a1_id;
	}

	public String getCm_a2_id() {
		return cm_a2_id;
	}

	public void setCm_a2_id(String cm_a2_id) {
		this.cm_a2_id = cm_a2_id;
	}

	public String getCm_b1_id() {
		return cm_b1_id;
	}

	public void setCm_b1_id(String cm_b1_id) {
		this.cm_b1_id = cm_b1_id;
	}

	public String getCm_b2_id() {
		return cm_b2_id;
	}

	public void setCm_b2_id(String cm_b2_id) {
		this.cm_b2_id = cm_b2_id;
	}

	public int getCm_gc() {
		return cm_gc;
	}

	public void setCm_gc(int cm_gc) {
		this.cm_gc = cm_gc;
	}

	public int getCm_wc() {
		return cm_wc;
	}

	public void setCm_wc(int cm_wc) {
		this.cm_wc = cm_wc;
	}

	public String getC_court_sa() {
		return c_court_sa;
	}

	public void setC_court_sa(String c_court_sa) {
		this.c_court_sa = c_court_sa;
	}

	public int getC_court_su() {
		return c_court_su;
	}

	public void setC_court_su(int c_court_su) {
		this.c_court_su = c_court_su;
	}

	private int m_idx; // MGL_USER_IDX 사용자인덱스
	private String m_nm; // MGL_USER_NM 사용자 이름

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_nm() {
		return m_nm;
	}

	public void setM_nm(String m_nm) {
		this.m_nm = m_nm;
	}

	public String getCm_idx() {
		return cm_idx;
	}

	public void setCm_idx(String cm_idx) {
		this.cm_idx = cm_idx;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public int getCm_cnt() {
		return cm_cnt;
	}

	public void setCm_cnt(int cm_cnt) {
		this.cm_cnt = cm_cnt;
	}

	public String getCm_endyn() {
		return cm_endyn;
	}

	public void setCm_endyn(String cm_endyn) {
		this.cm_endyn = cm_endyn;
	}

	public String getS_coat() {
		return s_coat;
	}

	public void setS_coat(String s_coat) {
		this.s_coat = s_coat;
	}

	public String getM_id() {
		return u_id;
	}

	public void setM_id(String u_id) {
		this.u_id = u_id;
	}

	public String getCm_team_ab() {
		return cm_team_ab;
	}

	public void setCm_team_ab(String cm_team_ab) {
		this.cm_team_ab = cm_team_ab;
	}

	public String getCm_date() {
		return cm_date;
	}

	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}

	public String getUc_grade_cd() {
		return uc_grade_cd;
	}

	public void setUc_grade_cd(String uc_grade_cd) {
		this.uc_grade_cd = uc_grade_cd;
	}

	public String getCm_age_group() {
		return cm_age_group;
	}

	public void setCm_age_group(String cm_age_group) {
		this.cm_age_group = cm_age_group;
	}

	public int getCm_age_group_ptn() {
		return cm_age_group_ptn;
	}

	public void setCm_age_group_ptn(int cm_age_group_ptn) {
		this.cm_age_group_ptn = cm_age_group_ptn;
	}

	public float getCm_ueffort() {
		return cm_ueffort;
	}

	public void setCm_ueffort(float cm_ueffort) {
		this.cm_ueffort = cm_ueffort;
	}

	public float getCm_teffort() {
		return cm_teffort;
	}

	public void setCm_teffort(float cm_teffort) {
		this.cm_teffort = cm_teffort;
	}

	public float getCm_gptn() {
		return cm_gptn;
	}

	public void setCm_gptn(float cm_gptn) {
		this.cm_gptn = cm_gptn;
	}

	public float getCm_vptn() {
		return cm_vptn;
	}

	public void setCm_vptn(float cm_vptn) {
		this.cm_vptn = cm_vptn;
	}

	public float getCm_pptn() {
		return cm_pptn;
	}

	public void setCm_pptn(float cm_pptn) {
		this.cm_pptn = cm_pptn;
	}

	public float getCm_aptn() {
		return cm_aptn;
	}

	public void setCm_aptn(float cm_aptn) {
		this.cm_aptn = cm_aptn;
	}

	public float getCm_teamptn() {
		return cm_teamptn;
	}

	public void setCm_teamptn(float cm_teamptn) {
		this.cm_teamptn = cm_teamptn;
	}

	public String getCm_win() {
		return cm_win;
	}

	public void setCm_win(String cm_win) {
		this.cm_win = cm_win;
	}

	public String getCm_start() {
		return cm_start;
	}

	public void setCm_start(String cm_start) {
		this.cm_start = cm_start;
	}

	public String getCm_end() {
		return cm_end;
	}

	public void setCm_end(String cm_end) {
		this.cm_end = cm_end;
	}

	public int getCm_total() {
		return cm_total;
	}

	public void setCm_total(int cm_total) {
		this.cm_total = cm_total;
	}

	public String getCm_regdate() {
		return cm_regdate;
	}

	public void setCm_regdate(String cm_regdate) {
		this.cm_regdate = cm_regdate;
	}

	@Override
	public String toString() {
		return "ClubMatchVO [ teamAB= " + teamAB + ", u_id=" + u_id + ", uc_grade_cd=" + uc_grade_cd + ", cm_a1_id="
				+ cm_a1_id + ", cm_a2_id=" + cm_a2_id + ", cm_b1_id=" + cm_b1_id + ", cm_b2_id=" + cm_b2_id
				+ ", cm_a1_nm=" + cm_a1_nm + ", cm_a2_nm=" + cm_a2_nm + ", cm_b1_nm=" + cm_b1_nm + ", cm_b2_nm="
				+ cm_b2_nm + ", cm_order=" + cm_order + ", cm_status=" + cm_status + ", u_status=" + u_status
				+ ", c_nm=" + c_nm + ", c_gidx=" + c_gidx + ", u_age=" + u_age + ", u_sex=" + u_sex + ", u_club_gd="
				+ u_club_gd + "u_gr" + u_gr + "]";
	}

}
