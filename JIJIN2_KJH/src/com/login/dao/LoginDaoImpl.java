package com.login.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.login.dao.SqlMapConfig;
import com.login.dto.LoginDto;

public class LoginDaoImpl extends SqlMapConfig implements LoginDao {

	private String nameSpace = "com.login.userboard.";
	
	Connection con;
	
	public LoginDaoImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<LoginDto> selectAll() {
		List<LoginDto> res = new ArrayList<LoginDto>();
		
		SqlSession session =null;
		
		session=getSqlSessionFactory().openSession(true);
		res=session.selectList(nameSpace+"selectAll");
		return res;
	}

	@Override
	public LoginDto selectOne(int no) {
		LoginDto l = new LoginDto();
		SqlSession session = null;
		session=getSqlSessionFactory().openSession(true);
		
		l=session.selectOne(nameSpace+"selectOne",no);
		session.close();
		
		return l;
	}

	@Override
	public int insert(LoginDto dto) {
		int res = 0;
		SqlSession session =null;
		session = getSqlSessionFactory().openSession(true);
		
		res=session.insert(nameSpace+"insert",dto);
		
		
		return res;
		
	}

	@Override
	public int delete(int no) {
		return 0;
	}

	@Override
	public int update(LoginDto dto) {
		int res = 0;
		SqlSession session = null;
		session= getSqlSessionFactory().openSession(true);
		
		res=session.update(nameSpace+"update",dto);
		return res;
	}

	@Override
	public int updateOut(int no) {
		int res = 0;
		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		
		res=session.update(nameSpace+"updateOut",no);
		return res;
	}
	@Override
	public LoginDto selectLogin(String id, String pw) {
		LoginDto i = new LoginDto();
		SqlSession session = null;
		
		Map<String,String>map = new HashMap<>();
		map.put("pw", pw);
		map.put("id", id);
		System.out.println(map);
		session = getSqlSessionFactory().openSession(true);
		i = session.selectOne(nameSpace+"selectLogin",map);
		
		
		return i;
	}
	
	/*@Override
	public int updateGrade(String no[],String grade) {
		int res = 0;
		SqlSession session = null;
		
		Map<String,String[]>map=new HashMap<>();
		map.put("no", no);
		Map<String,String>map2=new HashMap<>();
		map2.put("grade", grade);
		
		
		
		session=getSqlSessionFactory().openSession(true);
		res = session.update(nameSpace+"updateGrade",map);
		
		return res;
	}*/
	public int updateGrade(String no, String grade) {
		int res = 0;
		SqlSession session = null;
		
		Map<String,String>map=new HashMap<>();
		map.put("no", no);
		map.put("grade", grade);
		session=getSqlSessionFactory().openSession(true);
		res = session.update(nameSpace+"updateGrade",map);
		
		return res;
		
		
	}
	public LoginDto idchk(String id) {
		LoginDto l = new LoginDto();
		SqlSession session = null;
		session=getSqlSessionFactory().openSession(true);
		
		l=session.selectOne(nameSpace+"idchk",id);
		session.close();
		
		return l;
	}
	public LoginDto nichk(String nikname) {
		LoginDto l = new LoginDto();
		SqlSession session = null;
		session=getSqlSessionFactory().openSession(true);
		
		l=session.selectOne(nameSpace+"nichk",nikname);
		session.close();
		
		return l;
	}
	@Override
	public LoginDto emailchk(String email) {
		LoginDto l = new LoginDto();
		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		
		l=session.selectOne(nameSpace+"emailchk",email);
		return l;
		
		
	}
	public LoginDto selectId(String name,String email) {
		LoginDto l = new LoginDto();
		SqlSession session= null;
		session=getSqlSessionFactory().openSession(true);
		
		
		Map<String,String>map =new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		
		l=session.selectOne(nameSpace+"selectId",map);
		session.close();
		return l;
	}
	public LoginDto selectPw(String id,String name,String email) {
		LoginDto l = new LoginDto();
		SqlSession session =null;
		session = getSqlSessionFactory().openSession(true);
		
		Map<String,String>map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		l=session.selectOne(nameSpace+"selectPw",map);
		session.close();
		return l;
	}
	
	

}
