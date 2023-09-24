package kr.or.ddit.cartProd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;

public class CartProdDaoImpl extends MyBatisDao implements ICartProdDao{

private static ICartProdDao cartProdDao;
	
	private CartProdDaoImpl() {}
	
	public static ICartProdDao getInstance() {
		if (cartProdDao == null) {
			cartProdDao = new CartProdDaoImpl();
		}
		return cartProdDao;
	}
	
	@Override
	public List<cartProdDto> getCartProdList(String memId) {
		
		return selectList("cartProd.getCartProdList", memId);
		
	}

	@Override
	public List<cartProdDto> findAll() {
		return selectList("cartProd.findAll");
	}

}
