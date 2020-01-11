package com.lhj.controller;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class) //컴파일할때 스프링에서만든 클래스도 같이 실행 시켜라
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //context 환경설정이 어디에있는지 인식 시켜주기위해
public class ConnectionPoolTest {
	@Autowired //찾아봐 root-context에 bean id = dataSource 해준걸 찾아주는듯?? 
	//DataSource dataSource = new DataSource();
	private DataSource dataSource;
	
	
	@Autowired 
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnetion() {
		try (
				SqlSession session = sqlSessionFactory.openSession();
				Connection con = dataSource.getConnection()) {
			System.out.println("session="+session);
			
			
			System.out.println("con="+con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
