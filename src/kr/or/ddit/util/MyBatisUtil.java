package kr.or.ddit.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	
	private static SqlSessionFactory sessionFactory;
	
	static {
		try {
			// 1-1. 설정파일 읽어오기
			Charset charset = Charset.forName("UTF-8"); // 한글처리를 위해서...
			Resources.setCharset(charset);
			
			Reader rd = Resources
					.getResourceAsReader("config/mybatis-config.xml");
			
			// 1-2. 위에서 생성한 Reader객체를 사용하여 sqlSessionFactory객체 생성하기
			sessionFactory = new SqlSessionFactoryBuilder().build(rd);
			
			// 1-3. 다 사용한 Read객체 반납
			rd.close();
			
		} catch (IOException ex) {
			ex.printStackTrace();
		} 
	}
	
	/**
	 * SqlSession 객체를 제공하는 팩토리 메서드
	 * @return SqlSesion 객체
	 */
	public static SqlSession getInstance() {
		return sessionFactory.openSession(); // 기본값은 autocommit : false
	}
	
	/**
	 * SqlSession 객체를 제공하는 팩토리 메서드
	 * @param autoCommit 오토커밋 여부
	 * @return SqlSesion 객체
	 */
	public static SqlSession getInstance(boolean autoCommit) {
		return sessionFactory.openSession(autoCommit);
	}
	
}
