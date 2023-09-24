package kr.or.ddit.club.dao;

import java.util.List;

import kr.or.ddit.cart.dao.CartDaoImpl;
import kr.or.ddit.cart.dao.ICartDao;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.club.vo.ClubVO;
import kr.or.ddit.comm.dao.MyBatisDao;

public class ClubDaoImpl extends MyBatisDao implements IClubDao {

	private static IClubDao clubDao;

	private ClubDaoImpl() {}

	public static IClubDao getInstance() {
		if (clubDao == null) {
			clubDao = new ClubDaoImpl();
		}
		return clubDao;
	}
	
	@Override
	public List<ClubVO> findAll() {
		return selectList("club.findAll");
	}

	@Override
	public ClubVO findById(String id) {
		return selectOne("club.findById", id);
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
