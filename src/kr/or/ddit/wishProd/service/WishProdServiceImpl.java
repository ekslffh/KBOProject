package kr.or.ddit.wishProd.service;

import java.util.List;

import kr.or.ddit.cartProd.dao.CartProdDaoImpl;
import kr.or.ddit.cartProd.dao.ICartProdDao;
import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.wishProd.dao.IWishProdDao;
import kr.or.ddit.wishProd.dao.WishProdDaoImpl;
import kr.or.ddit.wishProd.dto.wishProdDto;

public class WishProdServiceImpl implements IWishProdService{
private IWishProdDao wishProdDao;
	
	private static IWishProdService wishProdService;
	
	private WishProdServiceImpl() {
		wishProdDao = WishProdDaoImpl.getInstance();
	}
	
	public static IWishProdService getInstance() {
		if (wishProdService == null) {
			wishProdService = new WishProdServiceImpl();
		}
		return wishProdService;
	}

	@Override
	public List<wishProdDto> getWishProdList(String memId) {
		return wishProdDao.getWishProdList(memId);
	}
}
