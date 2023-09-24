package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.vo.MemberVO;

public class MemberDaoImpl extends MyBatisDao implements IMemberDao {

	private static IMemberDao memDao;
	
	private MemberDaoImpl() {}
	
	public static IMemberDao getInstance() {
		if (memDao == null) {
			memDao = new MemberDaoImpl();
		}
		return memDao;
	}

	@Override
	public boolean checkMember(String memId) {
		
		int cnt = selectOne("member.check", memId);
		
		boolean isExist = false;
		
		if (cnt > 0) {
			isExist = true;
		}
		
		return isExist;
	}

	@Override
	public List<MemberVO> findAll() {
		List<MemberVO> memList = selectList("member.findAll");
		return memList;
	}

	@Override
	public MemberVO findById(String memId) {
		MemberVO mv = selectOne("member.findById", memId);
		return mv;
	}

	@Override
	public int insert(MemberVO mv) {
		int cnt = insert("member.insert", mv);
		return cnt;
	}

	@Override
	public int update(MemberVO mv) {
		int cnt = update("member.update", mv);
		return cnt;
	}

	@Override
	public int deleteById(String memId) {
		int cnt = delete("member.deleteById", memId);
		return cnt;
	}
	
	@Override
	public String findIdChk(Map<String, Object> map) throws SQLException {
		
		return selectOne("member.findIdChk", map);
	}

	@Override
	public MemberVO findByAdd(String memId) {
		MemberVO mv = selectOne("member.findByAdd", memId);
		return mv;
	}

}
