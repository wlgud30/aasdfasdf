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
	
	private String ct_k_idx;
	private String ct_k_nm;
	private String ct_k_kind;
	private int ct_k_num;
	private String ct_g_split;
	
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
	
	public ContestVO() {}


	public ContestVO(String ct_idx, String ct_start, String ct_end, String ct_startline, String ct_deadline,
			int ct_point, int ct_time, String ct_homepage, String ct_nm, String ct_host, String ct_supervision,
			String ct_support, String ct_sponsor, String ct_points, String ct_attach, String ct_inquiry, int ct_court,
			String ct_location, String ct_match_yn, String ct_yn, String ct_k_idx, String ct_k_nm, String ct_k_kind,
			int ct_k_num, String ct_g_split, String ct_u_idx, String ct_u_id, String ct_u_nm, String ct_u_photo,
			String ct_u_birth, String ct_u_sex, String ct_u_gd, String ct_club_nm, String ct_u_rep_id, String ct_t_idx,
			String ct_g_idx, String ct_t_user_a, String ct_t_user_b) {
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
	
	
}
