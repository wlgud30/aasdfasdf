package com.login.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource = "DB/LoginConfig.xml";
		
		try {
			//Config.xml 파일 정보를 읽어 들이고
			Reader reader = Resources.getResourceAsReader(resource);
			//읽어들인 객체를 넣어서 SqlSessionFactory
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return sqlSessionFactory;
		
	}

}
