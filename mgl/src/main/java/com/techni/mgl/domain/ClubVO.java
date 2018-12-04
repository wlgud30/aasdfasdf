package com.techni.mgl.domain;

public class ClubVO {
	private String c_idx;						// MGL_CLUB_IDX int not null,
	private String c_nm;					// MGL_CLUB_NM varchar(12),
	private String c_location;				// MGL_CLUB_LOCATION varchar(32),
	private String c_birth;					// MGL_CLUB_BIRTH varchar(10),
	private String c_time;					// MGL_CLUB_TIME varchar(18),
	private String c_week;					// MGL_CLUB_WEEK varchar(13),
	private String c_info;					// MGL_CLUB_INFO text,
	private String c_yn;						//MGL_CLUB_ORG_YN
	private int c_court;						//MGL_CLUB_COURT
	private String c_photo;					//MGL_CLUB_PHOTO
	private String u_mid;
	private String c_org;
	private String u_nm; 
	private String u_tel;
	private String u_mng;
	public String c_court_sa;
	public String c_court_su;
	public String ga;
	public String ga_nm;
	public String ga_tel;
	public int c_count;
	public String u_push;
	
	
	
	
	
	
	
	public String getU_push() {
		return u_push;
	}
	public void setU_push(String u_push) {
		this.u_push = u_push;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public String getGa() {
		return ga;
	}
	public void setGa(String ga) {
		this.ga = ga;
	}
	public String getGa_nm() {
		return ga_nm;
	}
	public void setGa_nm(String ga_nm) {
		this.ga_nm = ga_nm;
	}
	public String getGa_tel() {
		return ga_tel;
	}
	public void setGa_tel(String ga_tel) {
		this.ga_tel = ga_tel;
	}
	public String getC_court_sa() {
		return c_court_sa;
	}
	public void setC_court_sa(String c_court_sa) {
		this.c_court_sa = c_court_sa;
	}
	public String getC_court_su() {
		return c_court_su;
	}
	public void setC_court_su(String c_court_su) {
		this.c_court_su = c_court_su;
	}
	public String getU_mng() {
		return u_mng;
	}
	public void setU_mng(String u_mng) {
		this.u_mng = u_mng;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_nm() {
		return u_nm;
	}
	public void setU_nm(String u_nm) {
		this.u_nm = u_nm;
	}
	public String getU_mid() {
		return u_mid;
	}
	public void setU_mid(String u_mid) {
		this.u_mid = u_mid;
	}
	public String getC_org() {
		return c_org;
	}
	public void setC_org(String c_org) {
		this.c_org = c_org;
	}
	private String cst_nm;						// MGL_CSTADIUM_IDX int,
	
	private String uc_idx;						// 유저클럽인덱스 추가 for UClubDAO(getUClubList) 
	private String cu_cnt;						// 클럽의 회원수를 얻기 위해 추가
	
	
	
	public String getC_yn() {
		return c_yn;
	}
	public void setC_yn(String c_yn) {
		this.c_yn = c_yn;
	}
	public int getC_court() {
		return c_court;
	}
	public void setC_court(int c_court) {
		this.c_court = c_court;
	}
	public String getC_photo() {
		return c_photo;
	}
	public void setC_photo(String c_photo) {
		this.c_photo = c_photo;
	}
	public String getUc_idx() {
		return uc_idx;
	}
	public void setUc_idx(String uc_idx) {
		this.uc_idx = uc_idx;
	}
	public String getCu_cnt() {
		return cu_cnt;
	}
	public void setCu_cnt(String cu_cnt) {
		this.cu_cnt = cu_cnt;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_nm() {
		return c_nm;
	}
	public void setC_nm(String c_nm) {
		this.c_nm = c_nm;
	}
	public String getC_location() {
		return c_location;
	}
	public void setC_location(String c_location) {
		this.c_location = c_location;
	}
	public String getC_birth() {
		return c_birth;
	}
	public void setC_birth(String c_birth) {
		this.c_birth = c_birth;
	}
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	public String getC_week() {
		return c_week;
	}
	public void setC_week(String c_week) {
		this.c_week = c_week;
	}
	public String getC_info() {
		return c_info;
	}
	public void setC_info(String c_info) {
		this.c_info = c_info;
	}
	public String getCst_nm() {
		return cst_nm;
	}
	public void setCst_nm(String cst_nm) {
		this.cst_nm = cst_nm;
	}
	@Override
	public String toString() {
		return "push = " + u_push +" ClubVO [c_idx=" + c_idx + ", c_nm=" + c_nm + ", c_location=" + c_location + ", c_birth=" + c_birth
				+ ", c_time=" + c_time + ", c_week=" + c_week + ", c_info=" + c_info + ", c_yn=" + c_yn + ", c_court="
				+ c_court + ", c_photo=" + c_photo + ", u_mid=" + u_mid + ", c_org=" + c_org + ", u_nm=" + u_nm
				+ ", u_tel=" + u_tel + ", u_mng=" + u_mng + ", cst_nm=" + cst_nm + ", uc_idx=" + uc_idx + ", cu_cnt="
				+ cu_cnt + "]";
	}

	
	
	
}
