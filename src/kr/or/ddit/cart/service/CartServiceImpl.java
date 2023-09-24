package kr.or.ddit.cart.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.dao.CartDaoImpl;
import kr.or.ddit.cart.dao.ICartDao;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.wishList.vo.WishListVO;

public class CartServiceImpl implements ICartService {

	private ICartDao cartDao;

	private static ICartService cartService;

	private CartServiceImpl() {
		cartDao = CartDaoImpl.getInstance();
	}

	public static ICartService getInstance() {
		if (cartService == null) {
			cartService = new CartServiceImpl();
		}
		return cartService;
	}
	

	@Override
	public int insert(CartVO cv) {
		return cartDao.insert(cv);
				
	}


	@Override
	public int update(CartVO cv) {
		return  cartDao.update(cv);
		
	}

	@Override
	public int delete(CartVO cv) {
		return  cartDao.delete(cv);
	}

	@Override
	public int findByCart(Map<String, String>cartMap) {
		int qty = 0;
		try {
			qty = cartDao.findByCart(cartMap);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  qty;
	}
	
	@Override
	public List<CartVO> findAll() {
		return cartDao.findAll();
	}

	@Override
	public CartVO findByProd(Map<String, String> cartMap) {
		return cartDao.findByProd(cartMap);
	}

}
