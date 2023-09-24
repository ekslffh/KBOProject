package kr.or.ddit.club.service;

import java.util.List;

import kr.or.ddit.club.dao.ClubDaoImpl;
import kr.or.ddit.club.dao.IClubDao;
import kr.or.ddit.club.vo.ClubVO;
import kr.or.ddit.membership.dao.IMembershipDao;
import kr.or.ddit.membership.dao.MembershipDaoImpl;
import kr.or.ddit.membership.service.IMembershipService;
import kr.or.ddit.membership.service.MembershipServiceImpl;

public class ClubServiceImpl implements IClubService {
	
	private IClubDao clubDao;
	private static IClubService clubService;
	
	private ClubServiceImpl() {
		clubDao = ClubDaoImpl.getInstance();
	}
	
	public static IClubService getInstance() {
		if (clubService == null) {
			clubService = new ClubServiceImpl();
		}
		return clubService;
	}

	@Override
	public List<ClubVO> findAll() {
		return clubDao.findAll();
	}

	@Override
	public ClubVO findById(String id) {
		return clubDao.findById(id);
	}

	@Override
	public int insert(ClubVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ClubVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
