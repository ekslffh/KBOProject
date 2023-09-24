package kr.or.ddit.membership.service;

import java.util.List;

import kr.or.ddit.membership.dao.IMembershipDao;
import kr.or.ddit.membership.dao.MembershipDaoImpl;
import kr.or.ddit.membership.vo.MembershipVO;

public class MembershipServiceImpl implements IMembershipService {

	private IMembershipDao membershipDao;
	private static IMembershipService membershipService;
	
	private MembershipServiceImpl() {
		membershipDao = MembershipDaoImpl.getInstance();
	}
	
	public static IMembershipService getInstance() {
		if (membershipService == null) {
			membershipService = new MembershipServiceImpl();
		}
		return membershipService;
	}
	
	@Override
	public List<MembershipVO> findAll() {
		return membershipDao.findAll();
	}

	@Override
	public MembershipVO findById(String msName) {
		return membershipDao.findById(msName);
	}
	
	@Override
	public MembershipVO findByMemId(String memId) {
		return membershipDao.findByMemId(memId);
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
