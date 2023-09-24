package kr.or.ddit.wishList.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;


import kr.or.ddit.wishList.dao.IWishListDao;
import kr.or.ddit.wishList.dao.WishListDaoImpl;
import kr.or.ddit.wishList.vo.WishListVO;

public class WishListServiceImpl implements IWishListService{

	
	private IWishListDao wishListDao;

	private static IWishListService wishListService;

	private WishListServiceImpl() {
		wishListDao = WishListDaoImpl.getInstance();
	}

	public static IWishListService getInstance() {
		if (wishListService == null) {
			wishListService = new WishListServiceImpl();
		}
		return wishListService;
	}
	
	@Override
	public int insert(WishListVO wv) {
		return wishListDao.insert(wv);	
	}

	@Override
	public int delete(WishListVO wv) {
		return wishListDao.delete(wv);
	}

	@Override
	public List<WishListVO> findAll() {
		return wishListDao.findAll();
	}

	@Override
	public Date findByWish(Map<String, String> wishMap) {
		Date date = new Date();
		try {
			date = wishListDao.findByWish(wishMap);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  date;
	}

	@Override
	public WishListVO findByProd(Map<String, String> wishMap) {
		return wishListDao.findByProd(wishMap);
	}

	

}
