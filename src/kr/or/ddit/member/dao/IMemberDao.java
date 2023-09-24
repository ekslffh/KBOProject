package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.member.vo.MemberVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행하여 결과를 받아와 Service에 전달하는 DAO 인터페이스
 * @author PC-16
 */
public interface IMemberDao extends DaoIfs<MemberVO>{
	boolean checkMember(String memId);

	public String findIdChk(Map<String, Object> map) throws SQLException;

	MemberVO findByAdd(String memId);
}
