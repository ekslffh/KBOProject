package kr.or.ddit.cartProd.service;

import java.util.List;

import kr.or.ddit.cartProd.dao.CartProdDaoImpl;
import kr.or.ddit.cartProd.dao.ICartProdDao;
import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

public class CartProdServiceImpl implements ICartProdService{
private ICartProdDao cartProdDao;
	
	private static ICartProdService cartProdService;
	
	private CartProdServiceImpl() {
		cartProdDao = CartProdDaoImpl.getInstance();
	}
	
	public static ICartProdService getInstance() {
		if (cartProdService == null) {
			cartProdService = new CartProdServiceImpl();
		}
		return cartProdService;
	}

	@Override
	public List<cartProdDto> getCartProdList(String memId) {
		return cartProdDao.getCartProdList(memId);
	}

	@Override
	public List<cartProdDto> findAll() {
		return cartProdDao.findAll();
	}
}
