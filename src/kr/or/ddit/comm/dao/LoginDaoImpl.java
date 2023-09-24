package kr.or.ddit.comm.dao;

import java.sql.SQLException;
import java.util.Map;

public class LoginDaoImpl extends MyBatisDao implements ILoginDao{

	private static ILoginDao loginDao;
	
	private LoginDaoImpl() {}
	
	public static ILoginDao getInstance() {
		if(loginDao == null) loginDao = new LoginDaoImpl();
		return loginDao;
	}

	@Override
	public String loginChk(Map<String, Object> map) throws SQLException {
		
		return selectOne("member.loginChk", map);
	}
	
}
