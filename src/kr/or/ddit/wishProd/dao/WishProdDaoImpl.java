package kr.or.ddit.wishProd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.wishProd.dto.wishProdDto;

public class WishProdDaoImpl extends MyBatisDao implements IWishProdDao{

private static IWishProdDao wishProdDao;
	
	private WishProdDaoImpl() {}
	
	public static IWishProdDao getInstance() {
		if (wishProdDao == null) {
			wishProdDao = new WishProdDaoImpl();
		}
		return wishProdDao;
	}
	
	@Override
	public List<wishProdDto> getWishProdList(String memId) {
		
		return selectList("wishProd.getWishProdList", memId);
		
	}

}
