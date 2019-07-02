package com.techni.mgl.domain;

public class ContestVO {
	private String ct_idx;
	private String ct_start;
	private String ct_end;
	private String ct_startline;
	private String ct_deadline;
	private int ct_point;
	private int ct_time;
	private String ct_homepage;
	private String ct_nm;
	private String ct_host;
	private String ct_supervision;
	private String ct_support;
	private String ct_sponsor;
	private String ct_points;
	private String ct_attach;
	private String ct_inquiry;
	private int ct_court;
	private String ct_location;
	private String ct_match_yn;
	private String ct_yn;
	public String ct_host_user;
	public String ct_entry_fee;
	public String ct_account;
	public String ct_appeal;

	private String ct_k_idx;
	private String ct_k_nm;
	private String ct_k_kind;
	private int ct_k_num;
	private String ct_g_split;
	public int ct_k_count;

	private String ct_u_idx;
	private String ct_u_id;
	private String ct_u_nm;
	private String ct_u_photo;
	private String ct_u_birth;
	private String ct_u_sex;
	private String ct_u_gd;
	private String ct_club_nm;
	private String ct_u_rep_id;

	private String ct_t_idx;
	private String ct_g_idx;
	private String ct_t_user_a;
	private String ct_t_user_b;
	public String ct_t_nm;
	private String ct_or_img;
	private String ct_st_img;
	private String ct_u_nm1;
	private String ct_u_nm2;
	private String ct_u_gd1;
	private String ct_u_gd2;

	private int group_count;
	private int team_count;
	private int club_count;
	public int ct_hit;
	public int ct_g_num;
	public int ct_g_count;

	public String ct_t_a_nm;
	public String ct_t_a_age;
	public String ct_t_a_gd;
	public String ct_t_a_photo;
	public String ct_t_b_nm;
	public String ct_t_b_age;
	public String ct_t_b_gd;
	public String ct_t_b_photo;
	public String c_t_count;
	public String t_count;
	public String ct_match_list;
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
	public String ct_no;
	public String ct_status;
	public String team_a_nm;
	public String team_b_nm;
	public String team_a_idx;
	public String team_b_idx;
	public String ct_w_date;
	public String ct_order;
	public String ct_at_id1;
	public String ct_at_id2;
	public String ct_bt_id1;
	public String ct_bt_id2;
	public String ct_gidx;
	public String type_count;
	public String team_a_score;
	public String team_b_score;
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
	public String end;
	public String ct_date;
	public String ct_w_dat;
	public int ct_num;
	public int end_count;
	public int game_count;
	public int count;
	public String ct_gidx_gb;
	public int ct_ueffort;
	public int ct_total;
	public int ct_cnt;
	public String ct_referee;
	public String ct_kind;
	
	public String getCt_t_nm() {
		return ct_t_nm;
	}

	public void setCt_t_nm(String ct_t_nm) {
		this.ct_t_nm = ct_t_nm;
	}

	public String getCt_kind() {
		return ct_kind;
	}

	public void setCt_kind(String ct_kind) {
		this.ct_kind = ct_kind;
	}

	public int getCt_ueffort() {
		return ct_ueffort;
	}

	public void setCt_ueffort(int ct_ueffort) {
		this.ct_ueffort = ct_ueffort;
	}

	public int getCt_total() {
		return ct_total;
	}

	public void setCt_total(int ct_total) {
		this.ct_total = ct_total;
	}

	public int getCt_cnt() {
		return ct_cnt;
	}

	public void setCt_cnt(int ct_cnt) {
		this.ct_cnt = ct_cnt;
	}

	public String getCt_referee() {
		return ct_referee;
	}

	public void setCt_referee(String ct_referee) {
		this.ct_referee = ct_referee;
	}

	public String getCt_gidx_gb() {
		return ct_gidx_gb;
	}

	public void setCt_gidx_gb(String ct_gidx_gb) {
		this.ct_gidx_gb = ct_gidx_gb;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCt_g_num() {
		return ct_g_num;
	}

	public void setCt_g_num(int ct_g_num) {
		this.ct_g_num = ct_g_num;
	}

	public int getCt_g_count() {
		return ct_g_count;
	}

	public void setCt_g_count(int ct_g_count) {
		this.ct_g_count = ct_g_count;
	}

	public int getCt_hit() {
		return ct_hit;
	}

	public void setCt_hit(int ct_hit) {
		this.ct_hit = ct_hit;
	}

	public ContestVO() {
	}

	public ContestVO(String ct_idx, String ct_start, String ct_end, String ct_startline, String ct_deadline,
			int ct_point, int ct_time, String ct_homepage, String ct_nm, String ct_host, String ct_supervision,
			String ct_support, String ct_sponsor, String ct_points, String ct_attach, String ct_inquiry, int ct_court,
			String ct_location, String ct_match_yn, String ct_yn, String ct_k_idx, String ct_k_nm, String ct_k_kind,
			int ct_k_num, String ct_g_split, String ct_u_idx, String ct_u_id, String ct_u_nm, String ct_u_photo,
			String ct_u_birth, String ct_u_sex, String ct_u_gd, String ct_club_nm, String ct_u_rep_id, String ct_t_idx,
			String ct_g_idx, String ct_t_user_a, String ct_t_user_b, String ct_or_img, String ct_st_img,
			String ct_u_nm1, String ct_u_nm2, String ct_u_gd1, String ct_u_gd2, int group_count, int team_count,
			int club_count) {
		super();
		this.ct_idx = ct_idx;
		this.ct_start = ct_start;
		this.ct_end = ct_end;
		this.ct_startline = ct_startline;
		this.ct_deadline = ct_deadline;
		this.ct_point = ct_point;
		this.ct_time = ct_time;
		this.ct_homepage = ct_homepage;
		this.ct_nm = ct_nm;
		this.ct_host = ct_host;
		this.ct_supervision = ct_supervision;
		this.ct_support = ct_support;
		this.ct_sponsor = ct_sponsor;
		this.ct_points = ct_points;
		this.ct_attach = ct_attach;
		this.ct_inquiry = ct_inquiry;
		this.ct_court = ct_court;
		this.ct_location = ct_location;
		this.ct_match_yn = ct_match_yn;
		this.ct_yn = ct_yn;
		this.ct_k_idx = ct_k_idx;
		this.ct_k_nm = ct_k_nm;
		this.ct_k_kind = ct_k_kind;
		this.ct_k_num = ct_k_num;
		this.ct_g_split = ct_g_split;
		this.ct_u_idx = ct_u_idx;
		this.ct_u_id = ct_u_id;
		this.ct_u_nm = ct_u_nm;
		this.ct_u_photo = ct_u_photo;
		this.ct_u_birth = ct_u_birth;
		this.ct_u_sex = ct_u_sex;
		this.ct_u_gd = ct_u_gd;
		this.ct_club_nm = ct_club_nm;
		this.ct_u_rep_id = ct_u_rep_id;
		this.ct_t_idx = ct_t_idx;
		this.ct_g_idx = ct_g_idx;
		this.ct_t_user_a = ct_t_user_a;
		this.ct_t_user_b = ct_t_user_b;
		this.ct_or_img = ct_or_img;
		this.ct_st_img = ct_st_img;
		this.ct_u_nm1 = ct_u_nm1;
		this.ct_u_nm2 = ct_u_nm2;
		this.ct_u_gd1 = ct_u_gd1;
		this.ct_u_gd2 = ct_u_gd2;
		this.group_count = group_count;
		this.team_count = team_count;
		this.club_count = club_count;
	}

	public int getCt_k_count() {
		return ct_k_count;
	}

	public void setCt_k_count(int ct_k_count) {
		this.ct_k_count = ct_k_count;
	}

	public String getCt_appeal() {
		return ct_appeal;
	}

	public void setCt_appeal(String ct_appeal) {
		this.ct_appeal = ct_appeal;
	}

	public String getCt_host_user() {
		return ct_host_user;
	}

	public void setCt_host_user(String ct_host_user) {
		this.ct_host_user = ct_host_user;
	}

	public String getCt_entry_fee() {
		return ct_entry_fee;
	}

	public void setCt_entry_fee(String ct_entry_fee) {
		this.ct_entry_fee = ct_entry_fee;
	}

	public String getCt_account() {
		return ct_account;
	}

	public void setCt_account(String ct_account) {
		this.ct_account = ct_account;
	}

	public String getCt_idx() {
		return ct_idx;
	}

	public void setCt_idx(String ct_idx) {
		this.ct_idx = ct_idx;
	}

	public String getCt_start() {
		return ct_start;
	}

	public void setCt_start(String ct_start) {
		this.ct_start = ct_start;
	}

	public String getCt_end() {
		return ct_end;
	}

	public void setCt_end(String ct_end) {
		this.ct_end = ct_end;
	}

	public String getCt_startline() {
		return ct_startline;
	}

	public void setCt_startline(String ct_startline) {
		this.ct_startline = ct_startline;
	}

	public String getCt_deadline() {
		return ct_deadline;
	}

	public void setCt_deadline(String ct_deadline) {
		this.ct_deadline = ct_deadline;
	}

	public int getCt_point() {
		return ct_point;
	}

	public void setCt_point(int ct_point) {
		this.ct_point = ct_point;
	}

	public int getCt_time() {
		return ct_time;
	}

	public void setCt_time(int ct_time) {
		this.ct_time = ct_time;
	}

	public String getCt_homepage() {
		return ct_homepage;
	}

	public void setCt_homepage(String ct_homepage) {
		this.ct_homepage = ct_homepage;
	}

	public String getCt_nm() {
		return ct_nm;
	}

	public void setCt_nm(String ct_nm) {
		this.ct_nm = ct_nm;
	}

	public String getCt_host() {
		return ct_host;
	}

	public void setCt_host(String ct_host) {
		this.ct_host = ct_host;
	}

	public String getCt_supervision() {
		return ct_supervision;
	}

	public void setCt_supervision(String ct_supervision) {
		this.ct_supervision = ct_supervision;
	}

	public String getCt_support() {
		return ct_support;
	}

	public void setCt_support(String ct_support) {
		this.ct_support = ct_support;
	}

	public String getCt_sponsor() {
		return ct_sponsor;
	}

	public void setCt_sponsor(String ct_sponsor) {
		this.ct_sponsor = ct_sponsor;
	}

	public String getCt_points() {
		return ct_points;
	}

	public void setCt_points(String ct_points) {
		this.ct_points = ct_points;
	}

	public String getCt_attach() {
		return ct_attach;
	}

	public void setCt_attach(String ct_attach) {
		this.ct_attach = ct_attach;
	}

	public String getCt_inquiry() {
		return ct_inquiry;
	}

	public void setCt_inquiry(String ct_inquiry) {
		this.ct_inquiry = ct_inquiry;
	}

	public int getCt_court() {
		return ct_court;
	}

	public void setCt_court(int ct_court) {
		this.ct_court = ct_court;
	}

	public String getCt_location() {
		return ct_location;
	}

	public void setCt_location(String ct_location) {
		this.ct_location = ct_location;
	}

	public String getCt_match_yn() {
		return ct_match_yn;
	}

	public void setCt_match_yn(String ct_match_yn) {
		this.ct_match_yn = ct_match_yn;
	}

	public String getCt_yn() {
		return ct_yn;
	}

	public void setCt_yn(String ct_yn) {
		this.ct_yn = ct_yn;
	}

	public String getCt_k_idx() {
		return ct_k_idx;
	}

	public void setCt_k_idx(String ct_k_idx) {
		this.ct_k_idx = ct_k_idx;
	}

	public String getCt_k_nm() {
		return ct_k_nm;
	}

	public void setCt_k_nm(String ct_k_nm) {
		this.ct_k_nm = ct_k_nm;
	}

	public String getCt_k_kind() {
		return ct_k_kind;
	}

	public void setCt_k_kind(String ct_k_kind) {
		this.ct_k_kind = ct_k_kind;
	}

	public int getCt_k_num() {
		return ct_k_num;
	}

	public void setCt_k_num(int ct_k_num) {
		this.ct_k_num = ct_k_num;
	}

	public String getCt_g_split() {
		return ct_g_split;
	}

	public void setCt_g_split(String ct_g_split) {
		this.ct_g_split = ct_g_split;
	}

	public String getCt_u_idx() {
		return ct_u_idx;
	}

	public void setCt_u_idx(String ct_u_idx) {
		this.ct_u_idx = ct_u_idx;
	}

	public String getCt_u_id() {
		return ct_u_id;
	}

	public void setCt_u_id(String ct_u_id) {
		this.ct_u_id = ct_u_id;
	}

	public String getCt_u_nm() {
		return ct_u_nm;
	}

	public void setCt_u_nm(String ct_u_nm) {
		this.ct_u_nm = ct_u_nm;
	}

	public String getCt_u_photo() {
		return ct_u_photo;
	}

	public void setCt_u_photo(String ct_u_photo) {
		this.ct_u_photo = ct_u_photo;
	}

	public String getCt_u_birth() {
		return ct_u_birth;
	}

	public void setCt_u_birth(String ct_u_birth) {
		this.ct_u_birth = ct_u_birth;
	}

	public String getCt_u_sex() {
		return ct_u_sex;
	}

	public void setCt_u_sex(String ct_u_sex) {
		this.ct_u_sex = ct_u_sex;
	}

	public String getCt_u_gd() {
		return ct_u_gd;
	}

	public void setCt_u_gd(String ct_u_gd) {
		this.ct_u_gd = ct_u_gd;
	}

	public String getCt_club_nm() {
		return ct_club_nm;
	}

	public void setCt_club_nm(String ct_club_nm) {
		this.ct_club_nm = ct_club_nm;
	}

	public String getCt_u_rep_id() {
		return ct_u_rep_id;
	}

	public void setCt_u_rep_id(String ct_u_rep_id) {
		this.ct_u_rep_id = ct_u_rep_id;
	}

	public String getCt_t_idx() {
		return ct_t_idx;
	}

	public void setCt_t_idx(String ct_t_idx) {
		this.ct_t_idx = ct_t_idx;
	}

	public String getCt_g_idx() {
		return ct_g_idx;
	}

	public void setCt_g_idx(String ct_g_idx) {
		this.ct_g_idx = ct_g_idx;
	}

	public String getCt_t_user_a() {
		return ct_t_user_a;
	}

	public void setCt_t_user_a(String ct_t_user_a) {
		this.ct_t_user_a = ct_t_user_a;
	}

	public String getCt_t_user_b() {
		return ct_t_user_b;
	}

	public void setCt_t_user_b(String ct_t_user_b) {
		this.ct_t_user_b = ct_t_user_b;
	}

	public String getCt_or_img() {
		return ct_or_img;
	}

	public void setCt_or_img(String ct_or_img) {
		this.ct_or_img = ct_or_img;
	}

	public String getCt_st_img() {
		return ct_st_img;
	}

	public void setCt_st_img(String ct_st_img) {
		this.ct_st_img = ct_st_img;
	}

	public String getCt_u_nm1() {
		return ct_u_nm1;
	}

	public void setCt_u_nm1(String ct_u_nm1) {
		this.ct_u_nm1 = ct_u_nm1;
	}

	public String getCt_u_nm2() {
		return ct_u_nm2;
	}

	public void setCt_u_nm2(String ct_u_nm2) {
		this.ct_u_nm2 = ct_u_nm2;
	}

	public String getCt_u_gd1() {
		return ct_u_gd1;
	}

	public void setCt_u_gd1(String ct_u_gd1) {
		this.ct_u_gd1 = ct_u_gd1;
	}

	public String getCt_u_gd2() {
		return ct_u_gd2;
	}

	public void setCt_u_gd2(String ct_u_gd2) {
		this.ct_u_gd2 = ct_u_gd2;
	}

	public int getGroup_count() {
		return group_count;
	}

	public void setGroup_count(int group_count) {
		this.group_count = group_count;
	}

	public int getTeam_count() {
		return team_count;
	}

	public void setTeam_count(int team_count) {
		this.team_count = team_count;
	}

	public int getClub_count() {
		return club_count;
	}

	public void setClub_count(int club_count) {
		this.club_count = club_count;
	}

	public String getCt_t_a_nm() {
		return ct_t_a_nm;
	}

	public void setCt_t_a_nm(String ct_t_a_nm) {
		this.ct_t_a_nm = ct_t_a_nm;
	}

	public String getCt_t_a_age() {
		return ct_t_a_age;
	}

	public void setCt_t_a_age(String ct_t_a_age) {
		this.ct_t_a_age = ct_t_a_age;
	}

	public String getCt_t_a_gd() {
		return ct_t_a_gd;
	}

	public void setCt_t_a_gd(String ct_t_a_gd) {
		this.ct_t_a_gd = ct_t_a_gd;
	}

	public String getCt_t_a_photo() {
		return ct_t_a_photo;
	}

	public void setCt_t_a_photo(String ct_t_a_photo) {
		this.ct_t_a_photo = ct_t_a_photo;
	}

	public String getCt_t_b_nm() {
		return ct_t_b_nm;
	}

	public void setCt_t_b_nm(String ct_t_b_nm) {
		this.ct_t_b_nm = ct_t_b_nm;
	}

	public String getCt_t_b_age() {
		return ct_t_b_age;
	}

	public void setCt_t_b_age(String ct_t_b_age) {
		this.ct_t_b_age = ct_t_b_age;
	}

	public String getCt_t_b_gd() {
		return ct_t_b_gd;
	}

	public void setCt_t_b_gd(String ct_t_b_gd) {
		this.ct_t_b_gd = ct_t_b_gd;
	}

	public String getCt_t_b_photo() {
		return ct_t_b_photo;
	}

	public void setCt_t_b_photo(String ct_t_b_photo) {
		this.ct_t_b_photo = ct_t_b_photo;
	}

	public String getC_t_count() {
		return c_t_count;
	}

	public void setC_t_count(String c_t_count) {
		this.c_t_count = c_t_count;
	}

	public String getT_count() {
		return t_count;
	}

	public void setT_count(String t_count) {
		this.t_count = t_count;
	}

	public String getCt_match_list() {
		return ct_match_list;
	}

	public void setCt_match_list(String ct_match_list) {
		this.ct_match_list = ct_match_list;
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

	public String getCt_no() {
		return ct_no;
	}

	public void setCt_no(String ct_no) {
		this.ct_no = ct_no;
	}

	public String getCt_status() {
		return ct_status;
	}

	public void setCt_status(String ct_status) {
		this.ct_status = ct_status;
	}

	public String getTeam_a_nm() {
		return team_a_nm;
	}

	public void setTeam_a_nm(String team_a_nm) {
		this.team_a_nm = team_a_nm;
	}

	public String getTeam_b_nm() {
		return team_b_nm;
	}

	public void setTeam_b_nm(String team_b_nm) {
		this.team_b_nm = team_b_nm;
	}

	public String getCt_w_date() {
		return ct_w_date;
	}

	public void setCt_w_date(String ct_w_date) {
		this.ct_w_date = ct_w_date;
	}

	public String getCt_order() {
		return ct_order;
	}

	public void setCt_order(String ct_order) {
		this.ct_order = ct_order;
	}

	public String getCt_at_id1() {
		return ct_at_id1;
	}

	public void setCt_at_id1(String ct_at_id1) {
		this.ct_at_id1 = ct_at_id1;
	}

	public String getCt_at_id2() {
		return ct_at_id2;
	}

	public void setCt_at_id2(String ct_at_id2) {
		this.ct_at_id2 = ct_at_id2;
	}

	public String getCt_bt_id1() {
		return ct_bt_id1;
	}

	public void setCt_bt_id1(String ct_bt_id1) {
		this.ct_bt_id1 = ct_bt_id1;
	}

	public String getCt_bt_id2() {
		return ct_bt_id2;
	}

	public void setCt_bt_id2(String ct_bt_id2) {
		this.ct_bt_id2 = ct_bt_id2;
	}

	public String getCt_gidx() {
		return ct_gidx;
	}

	public void setCt_gidx(String ct_gidx) {
		this.ct_gidx = ct_gidx;
	}

	public String getType_count() {
		return type_count;
	}

	public void setType_count(String type_count) {
		this.type_count = type_count;
	}

	public String getTeam_a_score() {
		return team_a_score;
	}

	public void setTeam_a_score(String team_a_score) {
		this.team_a_score = team_a_score;
	}

	public String getTeam_b_score() {
		return team_b_score;
	}

	public void setTeam_b_score(String team_b_score) {
		this.team_b_score = team_b_score;
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

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getCt_date() {
		return ct_date;
	}

	public void setCt_date(String ct_date) {
		this.ct_date = ct_date;
	}

	public String getCt_w_dat() {
		return ct_w_dat;
	}

	public void setCt_w_dat(String ct_w_dat) {
		this.ct_w_dat = ct_w_dat;
	}

	public int getCt_num() {
		return ct_num;
	}

	public void setCt_num(int ct_num) {
		this.ct_num = ct_num;
	}

	public String getTeam_a_idx() {
		return team_a_idx;
	}

	public void setTeam_a_idx(String team_a_idx) {
		this.team_a_idx = team_a_idx;
	}

	public String getTeam_b_idx() {
		return team_b_idx;
	}

	public void setTeam_b_idx(String team_b_idx) {
		this.team_b_idx = team_b_idx;
	}

	public int getEnd_count() {
		return end_count;
	}

	public void setEnd_count(int end_count) {
		this.end_count = end_count;
	}

	public int getGame_count() {
		return game_count;
	}

	public void setGame_count(int game_count) {
		this.game_count = game_count;
	}

}
