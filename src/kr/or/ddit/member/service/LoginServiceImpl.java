package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.comm.dao.ILoginDao;
import kr.or.ddit.comm.dao.LoginDaoImpl;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;

public class LoginServiceImpl implements ILoginService{
	private ILoginDao loginDao;
	private static ILoginService loginService;
	
	private LoginServiceImpl() {
		loginDao = LoginDaoImpl.getInstance();
	}
	
	public static ILoginService getInstance() {
		
		if(loginService == null) loginService = new LoginServiceImpl();
		return loginService;
	}
	

	@Override
	public String loginChk(Map<String, Object> map) {
		String loginChk = "";
		
		try {
			loginChk = loginDao.loginChk(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return loginChk;
	}
	
}
