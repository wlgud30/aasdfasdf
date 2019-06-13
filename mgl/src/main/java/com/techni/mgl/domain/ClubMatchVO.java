package com.techni.mgl.domain;


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
	public String cs_idx;
	public String cs_location;
	public String cs_start;
	public String cs_end;
	public String cs_sTime;
	public String cs_eTime;
	public String cs_time;
	public String cs_point;
	public String cs_court;
	public String cs_kind;
	public String cs_content;
	public String cs_nm;
	public String cs_cnm;
	public String cs_k_idx;
	public String cs_k_nm;
	public int cs_k_num;
	public String cs_t_idx;
	public String cs_a_id;
	public String cs_a_nm;
	public String cs_a_photo;
	public String cs_a_grade;
	public String cs_a_age;
	public String cs_b_id;
	public String cs_b_nm;
	public String cs_b_photo;
	public String cs_b_grade;
	public String cs_b_age;
	public int c_t_count;
	public int c_count;
	public int cs_k_count;
	public String cs_t_bw;
	public String cs_match_list;
	public String cs_status;
	public String cs_w_date;
	public String cs_gidx;
	public int cs_no;
	public String a1_nm;
	public String a1_id;
	public String a1_age;
	public String a1_gd;
	public String a2_nm;
	public String a2_id;
	public String a2_age;
	public String a2_gd;
	public String b1_nm;
	public String b1_id;
	public String b1_age;
	public String b1_gd;
	public String b2_nm;
	public String b2_id;
	public String b2_age;
	public String b2_gd;
	public int team_a_score;
	public int team_b_score;
	public String kind_count;
	public int win_count;
	public int lose_count;
	public int total_sum;
	public int gap_sum;
	public String sum_aptn;
	public double ueffort;
	public int total;
	public int cnt_gap;
	public String win;
	public double gptn;
	public double vptn;
	public double pptn;
	public double aptn;
	public String token;
	public String group_count;
	public String cs_at_id1;
	public String cs_at_id2;
	public String cs_bt_id1;
	public String cs_bt_id2;
	public String a1;
	public String a2;
	public String b1;
	public String b2;
	public String cs_t_a_nm;
	public String cs_t_a_age;
	public String cs_t_a_gd;
	public String cs_t_a_photo;
	public String cs_t_b_nm;
	public String cs_t_b_age;
	public String cs_t_b_gd;
	public String cs_t_b_photo;
	
	
	public String getCs_t_a_nm() {
		return cs_t_a_nm;
	}

	public void setCs_t_a_nm(String cs_t_a_nm) {
		this.cs_t_a_nm = cs_t_a_nm;
	}

	public String getCs_t_a_age() {
		return cs_t_a_age;
	}

	public void setCs_t_a_age(String cs_t_a_age) {
		this.cs_t_a_age = cs_t_a_age;
	}

	public String getCs_t_a_gd() {
		return cs_t_a_gd;
	}

	public void setCs_t_a_gd(String cs_t_a_gd) {
		this.cs_t_a_gd = cs_t_a_gd;
	}

	public String getCs_t_a_photo() {
		return cs_t_a_photo;
	}

	public void setCs_t_a_photo(String cs_t_a_photo) {
		this.cs_t_a_photo = cs_t_a_photo;
	}

	public String getCs_t_b_nm() {
		return cs_t_b_nm;
	}

	public void setCs_t_b_nm(String cs_t_b_nm) {
		this.cs_t_b_nm = cs_t_b_nm;
	}

	public String getCs_t_b_age() {
		return cs_t_b_age;
	}

	public void setCs_t_b_age(String cs_t_b_age) {
		this.cs_t_b_age = cs_t_b_age;
	}

	public String getCs_t_b_gd() {
		return cs_t_b_gd;
	}

	public void setCs_t_b_gd(String cs_t_b_gd) {
		this.cs_t_b_gd = cs_t_b_gd;
	}

	public String getCs_t_b_photo() {
		return cs_t_b_photo;
	}

	public void setCs_t_b_photo(String cs_t_b_photo) {
		this.cs_t_b_photo = cs_t_b_photo;
	}

	public String getA1() {
		return a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

	public String getA2() {
		return a2;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}

	public String getB1() {
		return b1;
	}

	public void setB1(String b1) {
		this.b1 = b1;
	}

	public String getB2() {
		return b2;
	}

	public void setB2(String b2) {
		this.b2 = b2;
	}

	public String getCs_at_id1() {
		return cs_at_id1;
	}

	public void setCs_at_id1(String cs_at_id1) {
		this.cs_at_id1 = cs_at_id1;
	}

	public String getCs_at_id2() {
		return cs_at_id2;
	}

	public void setCs_at_id2(String cs_at_id2) {
		this.cs_at_id2 = cs_at_id2;
	}

	public String getCs_bt_id1() {
		return cs_bt_id1;
	}

	public void setCs_bt_id1(String cs_bt_id1) {
		this.cs_bt_id1 = cs_bt_id1;
	}

	public String getCs_bt_id2() {
		return cs_bt_id2;
	}

	public void setCs_bt_id2(String cs_bt_id2) {
		this.cs_bt_id2 = cs_bt_id2;
	}

	public String getGroup_count() {
		return group_count;
	}

	public void setGroup_count(String group_count) {
		this.group_count = group_count;
	}

	public int getWin_count() {
		return win_count;
	}

	public void setWin_count(int win_count) {
		this.win_count = win_count;
	}

	public int getLose_count() {
		return lose_count;
	}

	public void setLose_count(int lose_count) {
		this.lose_count = lose_count;
	}

	public int getTotal_sum() {
		return total_sum;
	}

	public void setTotal_sum(int total_sum) {
		this.total_sum = total_sum;
	}

	public int getGap_sum() {
		return gap_sum;
	}

	public void setGap_sum(int gap_sum) {
		this.gap_sum = gap_sum;
	}

	public String getSum_aptn() {
		return sum_aptn;
	}

	public void setSum_aptn(String sum_aptn) {
		this.sum_aptn = sum_aptn;
	}

	public double getUeffort() {
		return ueffort;
	}

	public void setUeffort(double ueffort) {
		this.ueffort = ueffort;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCnt_gap() {
		return cnt_gap;
	}

	public void setCnt_gap(int cnt_gap) {
		this.cnt_gap = cnt_gap;
	}

	public String getWin() {
		return win;
	}

	public void setWin(String win) {
		this.win = win;
	}

	public double getGptn() {
		return gptn;
	}

	public void setGptn(double gptn) {
		this.gptn = gptn;
	}

	public double getVptn() {
		return vptn;
	}

	public void setVptn(double vptn) {
		this.vptn = vptn;
	}

	public double getPptn() {
		return pptn;
	}

	public void setPptn(double pptn) {
		this.pptn = pptn;
	}

	public double getAptn() {
		return aptn;
	}

	public void setAptn(double aptn) {
		this.aptn = aptn;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getKind_count() {
		return kind_count;
	}

	public void setKind_count(String kind_count) {
		this.kind_count = kind_count;
	}

	public int getTeam_a_score() {
		return team_a_score;
	}

	public void setTeam_a_score(int team_a_score) {
		this.team_a_score = team_a_score;
	}

	public int getTeam_b_score() {
		return team_b_score;
	}

	public void setTeam_b_score(int team_b_score) {
		this.team_b_score = team_b_score;
	}

	public String getA1_nm() {
		return a1_nm;
	}

	public void setA1_nm(String a1_nm) {
		this.a1_nm = a1_nm;
	}

	public String getA1_id() {
		return a1_id;
	}

	public void setA1_id(String a1_id) {
		this.a1_id = a1_id;
	}

	public String getA1_age() {
		return a1_age;
	}

	public void setA1_age(String a1_age) {
		this.a1_age = a1_age;
	}

	public String getA1_gd() {
		return a1_gd;
	}

	public void setA1_gd(String a1_gd) {
		this.a1_gd = a1_gd;
	}

	public String getA2_nm() {
		return a2_nm;
	}

	public void setA2_nm(String a2_nm) {
		this.a2_nm = a2_nm;
	}

	public String getA2_id() {
		return a2_id;
	}

	public void setA2_id(String a2_id) {
		this.a2_id = a2_id;
	}

	public String getA2_age() {
		return a2_age;
	}

	public void setA2_age(String a2_age) {
		this.a2_age = a2_age;
	}

	public String getA2_gd() {
		return a2_gd;
	}

	public void setA2_gd(String a2_gd) {
		this.a2_gd = a2_gd;
	}

	public String getB1_nm() {
		return b1_nm;
	}

	public void setB1_nm(String b1_nm) {
		this.b1_nm = b1_nm;
	}

	public String getB1_id() {
		return b1_id;
	}

	public void setB1_id(String b1_id) {
		this.b1_id = b1_id;
	}

	public String getB1_age() {
		return b1_age;
	}

	public void setB1_age(String b1_age) {
		this.b1_age = b1_age;
	}

	public String getB1_gd() {
		return b1_gd;
	}

	public void setB1_gd(String b1_gd) {
		this.b1_gd = b1_gd;
	}

	public String getB2_nm() {
		return b2_nm;
	}

	public void setB2_nm(String b2_nm) {
		this.b2_nm = b2_nm;
	}

	public String getB2_id() {
		return b2_id;
	}

	public void setB2_id(String b2_id) {
		this.b2_id = b2_id;
	}

	public String getB2_age() {
		return b2_age;
	}

	public void setB2_age(String b2_age) {
		this.b2_age = b2_age;
	}

	public String getB2_gd() {
		return b2_gd;
	}

	public void setB2_gd(String b2_gd) {
		this.b2_gd = b2_gd;
	}

	public int getCs_no() {
		return cs_no;
	}

	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}

	public String getCs_gidx() {
		return cs_gidx;
	}

	public void setCs_gidx(String cs_gidx) {
		this.cs_gidx = cs_gidx;
	}

	public String getCs_w_date() {
		return cs_w_date;
	}

	public void setCs_w_date(String cs_w_date) {
		this.cs_w_date = cs_w_date;
	}

	public String getCs_status() {
		return cs_status;
	}

	public void setCs_status(String cs_status) {
		this.cs_status = cs_status;
	}

	public String getCs_match_list() {
		return cs_match_list;
	}

	public void setCs_match_list(String cs_match_list) {
		this.cs_match_list = cs_match_list;
	}

	public String getCs_t_bw() {
		return cs_t_bw;
	}

	public void setCs_t_bw(String cs_t_bw) {
		this.cs_t_bw = cs_t_bw;
	}

	public int getCs_k_count() {
		return cs_k_count;
	}

	public void setCs_k_count(int cs_k_count) {
		this.cs_k_count = cs_k_count;
	}

	public int getC_t_count() {
		return c_t_count;
	}

	public void setC_t_count(int c_t_count) {
		this.c_t_count = c_t_count;
	}

	public int getC_count() {
		return c_count;
	}

	public void setC_count(int c_count) {
		this.c_count = c_count;
	}

	public String getCs_a_nm() {
		return cs_a_nm;
	}

	public void setCs_a_nm(String cs_a_nm) {
		this.cs_a_nm = cs_a_nm;
	}

	public String getCs_a_photo() {
		return cs_a_photo;
	}

	public void setCs_a_photo(String cs_a_photo) {
		this.cs_a_photo = cs_a_photo;
	}

	public String getCs_a_grade() {
		return cs_a_grade;
	}

	public void setCs_a_grade(String cs_a_grade) {
		this.cs_a_grade = cs_a_grade;
	}

	public String getCs_a_age() {
		return cs_a_age;
	}

	public void setCs_a_age(String cs_a_age) {
		this.cs_a_age = cs_a_age;
	}

	public String getCs_b_nm() {
		return cs_b_nm;
	}

	public void setCs_b_nm(String cs_b_nm) {
		this.cs_b_nm = cs_b_nm;
	}

	public String getCs_b_photo() {
		return cs_b_photo;
	}

	public void setCs_b_photo(String cs_b_photo) {
		this.cs_b_photo = cs_b_photo;
	}

	public String getCs_b_grade() {
		return cs_b_grade;
	}

	public void setCs_b_grade(String cs_b_grade) {
		this.cs_b_grade = cs_b_grade;
	}

	public String getCs_b_age() {
		return cs_b_age;
	}

	public void setCs_b_age(String cs_b_age) {
		this.cs_b_age = cs_b_age;
	}

	public String getCs_k_idx() {
		return cs_k_idx;
	}

	public void setCs_k_idx(String cs_k_idx) {
		this.cs_k_idx = cs_k_idx;
	}

	public String getCs_k_nm() {
		return cs_k_nm;
	}

	public void setCs_k_nm(String cs_k_nm) {
		this.cs_k_nm = cs_k_nm;
	}

	public int getCs_k_num() {
		return cs_k_num;
	}

	public void setCs_k_num(int cs_k_num) {
		this.cs_k_num = cs_k_num;
	}

	public String getCs_t_idx() {
		return cs_t_idx;
	}

	public void setCs_t_idx(String cs_t_idx) {
		this.cs_t_idx = cs_t_idx;
	}

	public String getCs_a_id() {
		return cs_a_id;
	}

	public void setCs_a_id(String cs_a_id) {
		this.cs_a_id = cs_a_id;
	}

	public String getCs_b_id() {
		return cs_b_id;
	}

	public void setCs_b_id(String cs_b_id) {
		this.cs_b_id = cs_b_id;
	}

	public String getCs_idx() {
		return cs_idx;
	}

	public void setCs_idx(String cs_idx) {
		this.cs_idx = cs_idx;
	}

	public String getCs_location() {
		return cs_location;
	}

	public void setCs_location(String cs_location) {
		this.cs_location = cs_location;
	}

	public String getCs_start() {
		return cs_start;
	}

	public void setCs_start(String cs_start) {
		this.cs_start = cs_start;
	}

	public String getCs_end() {
		return cs_end;
	}

	public void setCs_end(String cs_end) {
		this.cs_end = cs_end;
	}

	public String getCs_sTime() {
		return cs_sTime;
	}

	public void setCs_sTime(String cs_sTime) {
		this.cs_sTime = cs_sTime;
	}

	public String getCs_eTime() {
		return cs_eTime;
	}

	public void setCs_eTime(String cs_eTime) {
		this.cs_eTime = cs_eTime;
	}

	public String getCs_time() {
		return cs_time;
	}

	public void setCs_time(String cs_time) {
		this.cs_time = cs_time;
	}

	public String getCs_point() {
		return cs_point;
	}

	public void setCs_point(String cs_point) {
		this.cs_point = cs_point;
	}

	public String getCs_court() {
		return cs_court;
	}

	public void setCs_court(String cs_court) {
		this.cs_court = cs_court;
	}

	public String getCs_kind() {
		return cs_kind;
	}

	public void setCs_kind(String cs_kind) {
		this.cs_kind = cs_kind;
	}

	public String getCs_content() {
		return cs_content;
	}

	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}

	public String getCs_nm() {
		return cs_nm;
	}

	public void setCs_nm(String cs_nm) {
		this.cs_nm = cs_nm;
	}

	public String getCs_cnm() {
		return cs_cnm;
	}

	public void setCs_cnm(String cs_cnm) {
		this.cs_cnm = cs_cnm;
	}

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
