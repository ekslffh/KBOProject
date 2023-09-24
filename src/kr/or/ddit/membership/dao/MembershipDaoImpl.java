package kr.or.ddit.membership.dao;

import java.util.List;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.membership.vo.MembershipVO;

public class MembershipDaoImpl extends MyBatisDao implements IMembershipDao {

	private static IMembershipDao membershipDao;
	
	private MembershipDaoImpl() {}
	
	public static IMembershipDao getInstance() {
		if (membershipDao == null) {
			membershipDao = new MembershipDaoImpl();
		}
		return membershipDao;
	}
	
	@Override
	public List<MembershipVO> findAll() {
		return selectList("membership.findAll");
	}

	@Override
	public MembershipVO findById(String msName) {
		return selectOne("membership.findById", msName);
	}
	
	@Override
	public MembershipVO findByMemId(String memId) {
		return selectOne("membership.findByMemId", memId);
	}

	@Override
	public int insert(MembershipVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MembershipVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
