package com.techni.mgl.domain;

public class GTempTeamVO {
	
	private String aone_nm;				
	private String atwo_nm;				
	private String bone_nm;				
	private String btwo_nm;				
	
	private int temp_idx;					//	MGL_T_TEAMGROUP_IDX,
	private int c_idx;							//	MGL_CLUB_IDX,
	private int temp_cnt;					//	MGL_T_TEAMGROUP_CNT,
	
	private String temp_aone;					//	MGL_T_TEAMGROUP_AONE,
	private String temp_atwo;					//	MGL_T_TEAMGROUP_ATWO,
	private String temp_bone;					//	MGL_T_TEAMGROUP_BONE,
	private String temp_btwo;					//	MGL_T_TEAMGROUP_BTWO,
	private String temp_yn;					//	MGL_T_TEAMGROUP_TEMPYN,
	private int temp_rank;					//	MGL_T_TEAMGROUP_RANK,
	private String temp_coat;					// MGL_T_TEAMGROUP_COAT,
	private String temp_matchday;					//	MGL_T_TEAMGROUP_MATCHDAY,
	private String temp_regdate;					//	MGL_T_TEAMGROUP_REGDATE,
	private String temp_udate;					//	MGL_T_TEAMGROUP_UDATE,
	
	public String getTemp_coat() {
		return temp_coat;
	}
	public void setTemp_coat(String temp_coat) {
		this.temp_coat = temp_coat;
	}
	public String getAone_nm() {
		return aone_nm;
	}
	public void setAone_nm(String aone_nm) {
		this.aone_nm = aone_nm;
	}
	public String getAtwo_nm() {
		return atwo_nm;
	}
	public void setAtwo_nm(String atwo_nm) {
		this.atwo_nm = atwo_nm;
	}
	public String getBone_nm() {
		return bone_nm;
	}
	public void setBone_nm(String bone_nm) {
		this.bone_nm = bone_nm;
	}
	public String getBtwo_nm() {
		return btwo_nm;
	}
	public void setBtwo_nm(String btwo_nm) {
		this.btwo_nm = btwo_nm;
	}
	public int getTemp_idx() {
		return temp_idx;
	}
	public void setTemp_idx(int temp_idx) {
		this.temp_idx = temp_idx;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public int getTemp_cnt() {
		return temp_cnt;
	}
	public void setTemp_cnt(int temp_cnt) {
		this.temp_cnt = temp_cnt;
	}
	public String getTemp_aone() {
		return temp_aone;
	}
	public void setTemp_aone(String temp_aone) {
		this.temp_aone = temp_aone;
	}
	public String getTemp_atwo() {
		return temp_atwo;
	}
	public void setTemp_atwo(String temp_atwo) {
		this.temp_atwo = temp_atwo;
	}
	public String getTemp_bone() {
		return temp_bone;
	}
	public void setTemp_bone(String temp_bone) {
		this.temp_bone = temp_bone;
	}
	public String getTemp_btwo() {
		return temp_btwo;
	}
	public void setTemp_btwo(String temp_btwo) {
		this.temp_btwo = temp_btwo;
	}
	public String getTemp_yn() {
		return temp_yn;
	}
	public void setTemp_yn(String temp_yn) {
		this.temp_yn = temp_yn;
	}
	public int getTemp_rank() {
		return temp_rank;
	}
	public void setTemp_rank(int temp_rank) {
		this.temp_rank = temp_rank;
	}
	public String getTemp_matchday() {
		return temp_matchday;
	}
	public void setTemp_matchday(String temp_matchday) {
		this.temp_matchday = temp_matchday;
	}
	public String getTemp_regdate() {
		return temp_regdate;
	}
	public void setTemp_regdate(String temp_regdate) {
		this.temp_regdate = temp_regdate;
	}
	public String getTemp_udate() {
		return temp_udate;
	}
	public void setTemp_udate(String temp_udate) {
		this.temp_udate = temp_udate;
	}
	
	@Override
	public String toString() {
		return "GTempTeamVO [aone_nm=" + aone_nm + ", atwo_nm=" + atwo_nm + ", bone_nm=" + bone_nm + ", btwo_nm="
				+ btwo_nm + ", temp_idx=" + temp_idx + ", c_idx=" + c_idx + ", temp_cnt=" + temp_cnt + ", temp_aone="
				+ temp_aone + ", temp_atwo=" + temp_atwo + ", temp_bone=" + temp_bone + ", temp_btwo=" + temp_btwo
				+ ", temp_yn=" + temp_yn + ", temp_rank=" + temp_rank + ", temp_matchday=" + temp_matchday
				+ ", temp_regdate=" + temp_regdate + ", temp_udate=" + temp_udate + ", getAone_nm()=" + getAone_nm()
				+ ", getAtwo_nm()=" + getAtwo_nm() + ", getBone_nm()=" + getBone_nm() + ", getBtwo_nm()=" + getBtwo_nm()
				+ ", getTemp_idx()=" + getTemp_idx() + ", getC_idx()=" + getC_idx() + ", getTemp_cnt()=" + getTemp_cnt()
				+ ", getTemp_aone()=" + getTemp_aone() + ", getTemp_atwo()=" + getTemp_atwo() + ", getTemp_bone()="
				+ getTemp_bone() + ", getTemp_btwo()=" + getTemp_btwo() + ", getTemp_yn()=" + getTemp_yn()
				+ ", getTemp_rank()=" + getTemp_rank() + ", getTemp_matchday()=" + getTemp_matchday()
				+ ", getTemp_regdate()=" + getTemp_regdate() + ", getTemp_udate()=" + getTemp_udate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
