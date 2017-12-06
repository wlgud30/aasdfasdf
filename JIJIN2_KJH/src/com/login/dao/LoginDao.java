package com.login.dao;

import java.util.List;

import com.login.dto.LoginDto;

public interface LoginDao {
	
	public List<LoginDto> selectAll();
	public LoginDto selectOne(int no);
	public int insert(LoginDto dto);
	public int delete(int no);
	public int update(LoginDto dto);
	public int updateOut(int no);
	public LoginDto selectLogin(String id,String pw);
	public int updateGrade(String no,String grade);
	/*public int updateGrade(String no, String grade);*/
	public LoginDto idchk(String id);
	public LoginDto nichk(String nikname);
	public LoginDto selectId(String name,String email);
	public LoginDto selectPw(String id,String name,String email);
	public LoginDto emailchk(String email);


}
