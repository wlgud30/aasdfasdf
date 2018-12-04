package com.techni.mgl.domain;

public class BoardVO {
	private String c_idx;						// MGL_CLUB_IDX

	private String filename;				// 아직 퀄럼을 생성안함(file 테이블 스키마 먼저 만들어야 함)
	private String c_nm;
	private String u_nm;					// MGL_USER_NM
	public String u_id;
	public String u_photo;
	public String cb_idx;
	public String cb_yn;
	public String cb_title;
	public String cb_content;
	public int cb_hit;
	public String cb_date;
	public String cb_ch;
	public int cr_cnt;					//댓글 갯수
	public String cr_idx;
	public String cr_content;
	public String cr_date;
	public String cr_ch;
	public String u_push;
	public String h_idx;
	public String h_cnt;
	public String h_chk;
	
	
	
	
	
	
	
	
	

	public String getH_chk() {
		return h_chk;
	}

	public void setH_chk(String h_chk) {
		this.h_chk = h_chk;
	}

	public String getH_cnt() {
		return h_cnt;
	}

	public void setH_cnt(String h_cnt) {
		this.h_cnt = h_cnt;
	}

	public String getH_idx() {
		return h_idx;
	}

	public void setH_idx(String h_idx) {
		this.h_idx = h_idx;
	}

	public String getU_push() {
		return u_push;
	}

	public void setU_push(String u_push) {
		this.u_push = u_push;
	}

	public String getU_photo() {
		return u_photo;
	}

	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}

	public void setU_nm(String u_nm) {
		this.u_nm = u_nm;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getCb_idx() {
		return cb_idx;
	}

	public void setCb_idx(String cb_idx) {
		this.cb_idx = cb_idx;
	}

	public String getCb_yn() {
		return cb_yn;
	}

	public void setCb_yn(String cb_yn) {
		this.cb_yn = cb_yn;
	}

	public String getCb_title() {
		return cb_title;
	}

	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}

	public String getCb_content() {
		return cb_content;
	}

	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}

	public int getCb_hit() {
		return cb_hit;
	}

	public void setCb_hit(int cb_hit) {
		this.cb_hit = cb_hit;
	}

	public String getCb_date() {
		return cb_date;
	}

	public void setCb_date(String cb_date) {
		this.cb_date = cb_date;
	}

	public String getCb_ch() {
		return cb_ch;
	}

	public void setCb_ch(String cb_ch) {
		this.cb_ch = cb_ch;
	}

	public int getCr_cnt() {
		return cr_cnt;
	}

	public void setCr_cnt(int cr_cnt) {
		this.cr_cnt = cr_cnt;
	}

	public String getCr_idx() {
		return cr_idx;
	}

	public void setCr_idx(String cr_idx) {
		this.cr_idx = cr_idx;
	}

	public String getCr_content() {
		return cr_content;
	}

	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}

	public String getCr_date() {
		return cr_date;
	}

	public void setCr_date(String cr_date) {
		this.cr_date = cr_date;
	}

	public String getCr_ch() {
		return cr_ch;
	}

	public void setCr_ch(String cr_ch) {
		this.cr_ch = cr_ch;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}


	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getC_nm() {
		return c_nm;
	}

	public void setC_nm(String c_nm) {
		this.c_nm = c_nm;
	}

	public String getU_nm() {
		return u_nm;
	}

	public void setU_um(String u_nm) {
		this.u_nm = u_nm;
	}

	@Override
	public String toString() {
		return "BoardVO [c_idx=" + c_idx + ", filename=" + filename + ", c_nm=" + c_nm + ", u_nm=" + u_nm + ", u_id="
				+ u_id + ", u_photo=" + u_photo + ", cb_idx=" + cb_idx + ", cb_yn=" + cb_yn + ", cb_title=" + cb_title
				+ ", cb_content=" + cb_content + ", cb_hit=" + cb_hit + ", cb_date=" + cb_date + ", cb_ch=" + cb_ch
				+ ", cr_cnt=" + cr_cnt + ", cr_idx=" + cr_idx + ", cr_content=" + cr_content + ", cr_date=" + cr_date
				+ ", cr_ch=" + cr_ch + ", u_push=" + u_push + ", h_idx=" + h_idx + ", h_cnt=" + h_cnt + "]";
	}
	
}
