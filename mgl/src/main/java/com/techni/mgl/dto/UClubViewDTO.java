package com.techni.mgl.dto;

import java.util.List;

import com.techni.mgl.domain.CStadiumVO;

/*회원 클럽정보 상세보기*/
public class UClubViewDTO {
	/* UClub 테이블 관련*/
	private int c_idx;					//MGL_CLUB_IDX 			int
	private String c_nm;				//MGL_CLUB_NM 				string
	private String c_location;			//MGL_CLUB_LOCATION	string
	private String c_birth;				//MGL_CLUB_BIRTH			string
	private String c_time;				//MGL_CLUB_TIME 			string
	private String c_week;				//MGL_CLUB_WEEK 			string
	private String c_info;				//MGL_CLUB_INFO			string
	private String cst_idx;				//MGL_CSTADIUM_IDX		string
	
	/* Club 테이블 관련 */
	private int uc_idx;					//MGL_UCLUB_IDX 			int
	//private int c_idx;					//MGL_CLUB_IDX				int
	private String m_id;				//MGL_USER_ID				string
	private String uc_gcd;				//MGL_UCLUB_GRADE_CD string
	private String uc_mng;			//MGL_UCLUB_MNG			string
	
	private int m_cnt;					// 회원 수를 얻기 위한 변수
	
	public int getM_cnt() {
		return m_cnt;
	}
	public void setM_cnt(int m_cnt) {
		this.m_cnt = m_cnt;
	}
	/* Stadium 테이블 관련*/
	private List<CStadiumVO> stadiumList;
	
	public List<CStadiumVO> getStadiumList() {
		return stadiumList;
	}
	public void setStadiumList(List<CStadiumVO> stadiumList) {
		this.stadiumList = stadiumList;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
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
	public String getCst_idx() {
		return cst_idx;
	}
	public void setCst_idx(String cst_idx) {
		this.cst_idx = cst_idx;
	}
	public int getUc_idx() {
		return uc_idx;
	}
	public void setUc_idx(int uc_idx) {
		this.uc_idx = uc_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getUc_gcd() {
		return uc_gcd;
	}
	public void setUc_gcd(String uc_gcd) {
		this.uc_gcd = uc_gcd;
	}
	public String getUc_mng() {
		return uc_mng;
	}
	public void setUc_mng(String uc_mng) {
		this.uc_mng = uc_mng;
	}
}
