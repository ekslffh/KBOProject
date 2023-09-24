package kr.or.ddit.comm.dao;

import java.sql.SQLException;
import java.util.Map;

public interface ILoginDao {

	String loginChk(Map<String, Object> map) throws SQLException;

}
