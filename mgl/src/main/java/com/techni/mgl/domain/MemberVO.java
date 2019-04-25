package com.techni.mgl.domain;

public class MemberVO {
	private String m_idx;				// MGL_USER_IDX int;
	private String m_id;				// MGL_USER_ID	varchar(16)			
	private String m_pw;				//MGL_USER_PW VARCHAR(16)
	private String m_nm;				//MGL_USER_NM VARCHAR(12)
	private String m_al;				//MGL_USER_AL VARCHAR(16)
	public String m_sex;				//MGL_USER_SEX VARCHAR(1)
	private String m_tsize;			//MGL_USER_TSIZE VARCHAR(3)
	private String m_birth;			//MGL_USER_BIRTH VARCHAR(8)
	private String m_tel;				//MGL_USER_TEL VARCHAR(11)
	private String m_email;			//MGL_USER_EMAIL VARCHAR(16)
	private String m_joinDate;		//MGL_USER_JOINDATE	timestamp
	private String m_photo;			//MGL_USER_PHOTO
	private String m_club_gd;
	private String m_city_gd;
	private String m_do_gd;
	private String m_con_gd;
	private String m_chk;		//MGL_USER_LOGINDATE	timestamp
	private String m_outDate;		//MGL_USER_DROPDATE	timestamp
	private String m_push;		//MGL_USER_PUSH_TOKEN
	private String m_agent;	 			//MGL_USER_AGENT
	private String m_represent;
	public String al_idx;
	public String al_send;
	public String al_receive;
	public String al_url;
	public String al_date;
	public String al_msg;
	public String al_division;
	public String al_read;
	public String cb_idx;
	public String cf_idx;
	public String c_nm;
	public String m_user_temp_yn;
	public String m_club_temp_nm;
	
	
	
	
	public String getM_user_temp_yn() {
		return m_user_temp_yn;
	}

	public void setM_user_temp_yn(String m_user_temp_yn) {
		this.m_user_temp_yn = m_user_temp_yn;
	}

	public String getM_club_temp_nm() {
		return m_club_temp_nm;
	}

	public void setM_club_temp_nm(String m_club_temp_nm) {
		this.m_club_temp_nm = m_club_temp_nm;
	}

	public String getC_nm() {
		return c_nm;
	}

	public void setC_nm(String c_nm) {
		this.c_nm = c_nm;
	}

	public String getCb_idx() {
		return cb_idx;
	}

	public void setCb_idx(String cb_idx) {
		this.cb_idx = cb_idx;
	}

	public String getCf_idx() {
		return cf_idx;
	}

	public void setCf_idx(String cf_idx) {
		this.cf_idx = cf_idx;
	}

	public String getAl_idx() {
		return al_idx;
	}

	public void setAl_idx(String al_idx) {
		this.al_idx = al_idx;
	}

	public String getAl_send() {
		return al_send;
	}

	public void setAl_send(String al_send) {
		this.al_send = al_send;
	}

	public String getAl_receive() {
		return al_receive;
	}

	public void setAl_receive(String al_receive) {
		this.al_receive = al_receive;
	}

	public String getAl_url() {
		return al_url;
	}

	public void setAl_url(String al_url) {
		this.al_url = al_url;
	}

	public String getAl_date() {
		return al_date;
	}

	public void setAl_date(String al_date) {
		this.al_date = al_date;
	}

	public String getAl_msg() {
		return al_msg;
	}

	public void setAl_msg(String al_msg) {
		this.al_msg = al_msg;
	}

	public String getAl_division() {
		return al_division;
	}

	public void setAl_division(String al_division) {
		this.al_division = al_division;
	}

	public String getAl_read() {
		return al_read;
	}

	public void setAl_read(String al_read) {
		this.al_read = al_read;
	}

	public String getM_represent() {
		return m_represent;
	}

	public void setM_represent(String m_represent) {
		this.m_represent = m_represent;
	}

	public String getM_loginTime() {
		return m_loginTime;
	}

	public void setM_loginTime(String m_loginTime) {
		this.m_loginTime = m_loginTime;
	}

	public int getM_joinYN() {
		return m_joinYN;
	}

	public void setM_joinYN(int m_joinYN) {
		this.m_joinYN = m_joinYN;
	}
	public String m_loginTime;
	public int m_joinYN;
	private int m_join_seq;
	
	
	
	public String getM_chk() {
		return m_chk;
	}

	public void setM_chk(String m_chk) {
		this.m_chk = m_chk;
	}

	public String getM_outDate() {
		return m_outDate;
	}

	public void setM_outDate(String m_outDate) {
		this.m_outDate = m_outDate;
	}

	public String getM_push() {
		return m_push;
	}

	public void setM_push(String m_push) {
		this.m_push = m_push;
	}

	public String getM_agent() {
		return m_agent;
	}

	public void setM_agent(String m_agent) {
		this.m_agent = m_agent;
	}

	public int getM_join_seq() {
		return m_join_seq;
	}

	public void setM_join_seq(int m_join_seq) {
		this.m_join_seq = m_join_seq;
	}

	

	public String getM_al() {
		return m_al;
	}

	public void setM_al(String m_al) {
		this.m_al = m_al;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}


	public String getM_club_gd() {
		return m_club_gd;
	}

	public void setM_club_gd(String m_club_gd) {
		this.m_club_gd = m_club_gd;
	}

	public String getM_city_gd() {
		return m_city_gd;
	}

	public void setM_city_gd(String m_city_gd) {
		this.m_city_gd = m_city_gd;
	}

	public String getM_do_gd() {
		return m_do_gd;
	}

	public void setM_do_gd(String m_do_gd) {
		this.m_do_gd = m_do_gd;
	}

	public String getM_con_gd() {
		return m_con_gd;
	}

	public void setM_con_gd(String m_con_gd) {
		this.m_con_gd = m_con_gd;
	}


	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}
	private String uc_idx;				//MGL_UCLUB_IDX
	private String c_idx;				//MGL_CLUB_IDX
	private String uc_grade_cd;		//MGL_UCLUB_GRADE_CD
	private String uc_mng;			//MGL_UCLUB_MNG
	private String uc_regidate;		//MGL_UCLUB_REGIDATE
	
	private int age;							//회원 나이를 얻기 위한 변수
	private String ageGroup;				//회원의 나이대를 얻기 위한 변수
	private String gameStatus;
	
	
	
	public MemberVO() {
		super();
	}

	public MemberVO(String m_id, String m_pw) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
	}
	
	public MemberVO(String m_idx, String m_id, String m_pw, String m_nm, String m_sex, String m_tsize, String m_birth,
			String m_tel, String m_email, String m_loginDate, String m_dropDate, String m_joinDate) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_nm = m_nm;
		this.m_sex = m_sex;
		this.m_tsize = m_tsize;
		this.m_birth = m_birth;
		this.m_tel = m_tel;
		this.m_email = m_email;
		this.m_joinDate = m_joinDate;
	}



	public String getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(String gameStatus) {
		this.gameStatus = gameStatus;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}
	public String getM_idx() {
		return m_idx;
	}

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_nm() {
		return m_nm;
	}
	public void setM_nm(String m_nm) {
		this.m_nm = m_nm;
	}
	public String getM_sex() {
		return m_sex;
	}
	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}
	public String getM_tsize() {
		return m_tsize;
	}
	public void setM_tsize(String m_tsize) {
		this.m_tsize = m_tsize;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_joinDate() {
		return m_joinDate;
	}
	public void setM_joinDate(String m_joinDate) {
		this.m_joinDate = m_joinDate;
	}
	public String getUc_idx() {
		return uc_idx;
	}
	public void setUc_idx(String uc_idx) {
		this.uc_idx = uc_idx;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getUc_grade_cd() {
		return uc_grade_cd;
	}
	public void setUc_grade_cd(String uc_grade_cd) {
		this.uc_grade_cd = uc_grade_cd;
	}
	public String getUc_mng() {
		return uc_mng;
	}
	public void setUc_mng(String uc_mng) {
		this.uc_mng = uc_mng;
	}
	public String getUc_regidate() {
		return uc_regidate;
	}
	public void setUc_regidate(String uc_regidate) {
		this.uc_regidate = uc_regidate;
	}

	@Override
	public String toString() {
		return "MemberVO [m_idx=" + m_idx + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_nm=" + m_nm + ", m_al=" + m_al
				+ ", m_sex=" + m_sex + ", m_tsize=" + m_tsize + ", m_birth=" + m_birth + ", m_tel=" + m_tel
				+ ", m_email=" + m_email + ", m_joinDate=" + m_joinDate + ", m_photo=" + m_photo + ", m_club_gd="
				+ m_club_gd + ", m_city_gd=" + m_city_gd + ", m_do_gd=" + m_do_gd + ", m_con_gd=" + m_con_gd
				+ ", m_chk=" + m_chk + ", m_outDate=" + m_outDate + ", m_push=" + m_push + ", m_agent=" + m_agent
				+ ", m_join_seq=" + m_join_seq + ", uc_idx=" + uc_idx + ", c_idx=" + c_idx + ", uc_grade_cd="
				+ uc_grade_cd + ", uc_mng=" + uc_mng + ", uc_regidate=" + uc_regidate + ", age=" + age + ", ageGroup="
				+ ageGroup + ", gameStatus=" + gameStatus + "]";
	}

}


