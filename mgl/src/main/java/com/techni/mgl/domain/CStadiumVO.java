package com.techni.mgl.domain;

import java.util.List;

public class CStadiumVO {
	private int cst_idx;							//MGL_CSTADIUM_IDX int not null,
	private int c_idx;							//MGL_CLUB_IDX int,
	private String cst_info;					//MGL_CSTADIUM_INFO text,
	private String cst_coat;					//MGL_CSTADIUM_COAT varchar(6)
	private String cst_date;					//MGL_CSTADIUM_DATE datetime
	
	private String st_coatYn;					//MGL_STADIUM_COAT_YN
	
	private GTempTeamVO gttVO;			// 하나의 객체를 통째로 SET/GET 하기 위해서
	
	public GTempTeamVO getGttVO() {
		return gttVO;
	}

	public void setGttVO(GTempTeamVO gttVO) {
		this.gttVO = gttVO;
	}

	public int getCst_idx() {
		return cst_idx;
	}

	public void setCst_idx(int cst_idx) {
		this.cst_idx = cst_idx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getCst_info() {
		return cst_info;
	}

	public void setCst_info(String cst_info) {
		this.cst_info = cst_info;
	}

	public String getCst_coat() {
		return cst_coat;
	}

	public void setCst_coat(String cst_coat) {
		this.cst_coat = cst_coat;
	}

	public String getCst_date() {
		return cst_date;
	}

	public void setCst_date(String cst_date) {
		this.cst_date = cst_date;
	}

	public String getSt_coatYn() {
		return st_coatYn;
	}

	public void setSt_coatYn(String st_coatYn) {
		this.st_coatYn = st_coatYn;
	}

	@Override
	public String toString() {
		return "CStadiumVO [cst_idx=" + cst_idx + ", c_idx=" + c_idx + ", cst_info=" + cst_info + ", cst_coat="
				+ cst_coat + ", cst_date=" + cst_date + ", st_coatYn=" + st_coatYn + ", gttVO=" + gttVO + "]";
	}
}
