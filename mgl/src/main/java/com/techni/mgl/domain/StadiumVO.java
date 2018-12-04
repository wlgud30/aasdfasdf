package com.techni.mgl.domain;

public class StadiumVO {
	private int	s_idx;						//MGL_STADIUM_IDX int not null,
	private String s_cd;						//MGL_STADIUM_CD varchar(4),
	private String s_nm;					//MGL_STADIUM_NM varchar(32),
	private String s_addr;					//MGL_STADIUM_ADDR varchar(32),
	private String s_coat;					//MGL_STADIUM_COAT varchar(6),
	private String s_coat_yn;				//MGL_STADIUM_COAT_YN varchar(1)
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public String getS_cd() {
		return s_cd;
	}
	public void setS_cd(String s_cd) {
		this.s_cd = s_cd;
	}
	public String getS_nm() {
		return s_nm;
	}
	public void setS_nm(String s_nm) {
		this.s_nm = s_nm;
	}
	public String getS_addr() {
		return s_addr;
	}
	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public String getS_coat() {
		return s_coat;
	}
	public void setS_coat(String s_coat) {
		this.s_coat = s_coat;
	}
	public String getS_coat_yn() {
		return s_coat_yn;
	}
	public void setS_coat_yn(String s_coat_yn) {
		this.s_coat_yn = s_coat_yn;
	}
}
