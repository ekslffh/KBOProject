package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private IMemberDao memDao;
	
	private static IMemberService memService;
	
	private MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if (memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}
	
	@Override
	public List<MemberVO> findAll() {
		return memDao.findAll();
	}

	@Override
	public MemberVO findById(String memId) {
		return memDao.findById(memId);
	}

	@Override
	public int insert(MemberVO mv) {
		int cnt = memDao.insert(mv);
		// 회원 등록 완료 메일 발송 기능 호출....
		return cnt;
	}

	@Override
	public int update(MemberVO mv) {
		return memDao.update(mv);
	}

	@Override
	public int deleteById(String memId) {
		return memDao.deleteById(memId);
	}
	
	@Override
	public boolean checkMember(String memId) {
		return memDao.checkMember(memId);
	}
	
	@Override
	public String findIdChk(Map<String, Object> map) {
				String findIdChk = "";
				try {
					findIdChk = memDao.findIdChk(map);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return findIdChk;
	}

	@Override
	public MemberVO findByAdd(String memId) {
		return memDao.findById(memId);
	}

}
