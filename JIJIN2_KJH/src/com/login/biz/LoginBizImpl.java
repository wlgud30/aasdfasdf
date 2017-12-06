package com.login.biz;

import java.sql.Connection;
import java.util.List;

import com.login.dao.LoginDaoImpl;
import com.login.dto.LoginDto;

public class LoginBizImpl implements LoginBiz {
	Connection con;
	LoginDaoImpl LoginDao = new LoginDaoImpl();
	
	@Override
	public List<LoginDto> selectAll() {
		return LoginDao.selectAll();
	}

	@Override
	public LoginDto selectOne(int no) {
		return LoginDao.selectOne(no);
	}

	@Override
	public int insert(LoginDto dto) {
		return LoginDao.insert(dto);
	}

	@Override
	public int delete(int n) {
		return 0;
	}

	@Override
	public int update(LoginDto dto) {
		return LoginDao.update(dto);
	}

	@Override
	public int updateOut(int no) {
		return LoginDao.updateOut(no);
	}

	@Override
	public LoginDto selectLogin(String id, String pw) {
		return LoginDao.selectLogin(id, pw);
	}

	@Override
	public int updateGrade(String no,String grade) {
		return LoginDao.updateGrade(no, grade);
	}

	@Override
	public LoginDto idchk(String id) {
		return LoginDao.idchk(id);
	}

	@Override
	public LoginDto nichk(String nikname) {
		return LoginDao.nichk(nikname);
	}

	@Override
	public LoginDto selectId(String name, String email) {
		return LoginDao.selectId(name,email);
	}

	@Override
	public LoginDto selectPw(String id, String name, String email) {
		return LoginDao.selectPw(id,name,email);
	}

	@Override
	public LoginDto emailchk(String email) {
		// TODO Auto-generated method stub
		return LoginDao.emailchk(email);
	}

}
